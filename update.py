#!/usr/bin/env python3

from os import getenv as os_getenv
from subprocess import run as run_subp

from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlparse
import json

import base64
import hmac
import string
from hashlib import sha1

def create_hex_hmac(secret, message):
    new_hmac = hmac.new(bytes(secret, 'utf-8'), digestmod=sha1)
    new_hmac.update(bytes(message, 'utf-8'))
    return new_hmac.hexdigest()

class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(501)
        self.end_headers()
    def do_POST(self):
        content_len = int(self.headers.get('content-length'))
        post_body = self.rfile.read(content_len)

        header_hash = self.headers.get('X-Hub-Signature')
        computed_hash = 'sha1=' + create_hex_hmac(os_getenv('SECRET', ''),
                                                  post_body.decode("utf-8"))

        if header_hash != computed_hash :
            print('Wrong hash')
            self.send_response(403)
            self.end_headers()
            return

        else :
            print('Wright hash')
            self.send_response(200)
            self.end_headers()
            data = json.loads(post_body.decode("utf-8"))
            if (data.get('ref', '') == 'refs/heads/master') :
                print('Updating noc42 website…')
                run_subp(['git', 'fetch', 'origin', 'master'])
                run_subp(['git', 'checkout', 'origin/master'])
                run_subp(['npm', 'install'])
                run_subp(['npm', 'run-script', 'build'])
            return

if __name__ == '__main__':
    server = HTTPServer(('localhost', 21902), RequestHandler)
    print('Starting server at http://localhost:21902')
server.serve_forever()
