#!/bin/bash
#author: Louise Pieri (aka Delay)

command -v brew > /dev/null;
check_brew=$?;
if [ $check_brew -eq 0 ]; then
	echo "\033[032mBrew is good installed !!\033[0m";
	echo "\033[33mUpdate of Brew starts...\033[0m";
	brew update > /dev/null;
	echo "\033[032mBrew is good updated !!\033[0m";
else
	echo "\033[031mBrew is not installed !\033[0m";
	echo "\033[33mBrew installation starts...\033[0m";
	rm -rf $HOME/.brew > /dev/null;
	git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew > /dev/null;
	echo 'export PATH=$HOME/.brew/bin:$PATH' >> $HOME/.zshrc > /dev/null;
	source $HOME/.zshrc;
	brew update > /dev/null;
	echo "\033[032mBrew is good installed and updated !!\033[0m";
fi
echo "\033[38;5;206m---------------------------\033[0m";
command -v npm > /dev/null;
check_npm=$?;
if [ $check_npm -eq 0 ]; then
	echo "\033[032mNpm is good installed !!\033[0m";
	echo "\033[33mUpdate of Npm starts...\033[0m";
	npm update > /dev/null;
	echo "\033[032mNpm is good updated !!\033[0m";
else
	echo "\033[31mNpm is not installed !!\033[0m";
	echo "\033[33mNpm installation starts...\033[0m";
	brew install npm > /dev/null;
	npm update > /dev/null;
	echo "\033[032mNpm is good installed and updated !!\033[0m";
fi
echo "\033[38;5;206m---------------------------\033[0m";
command -v vue > /dev/null;
check_vue=$?;
if [ $check_vue -eq 0 ]; then
	echo "\033[032mVue-js is good installed !!\033[0m";
else
	echo "\033[31mVue-js is not installed !!\033[0m";
	echo "\033[33mVue-js installation starts...\033[0m";
	npm install -g vue-cli > /dev/null;
	npm install -g @vue/cli > /de/null;
	echo "\033[032mVue-js is good installed and updated !!\033[0m";
fi
echo "\033[38;5;206m---------------------------\033[0m";
echo "\033[33mCreating a 'front' directory...\033[0m";
vue create front -d > /dev/null;
cd ./front > /dev/null;
echo "\033[032mDirectory 'front' is good created !!\033[0m";
echo "\033[38;5;206m---------------------------\033[0m";
echo "\033[33mInstall dep...\033[0m";
npm install --save vue-router vue-loader vue-template-compilateur vue-style-loader > /dev/null;
npm install --save-dev webpack webpack-cli webpack-dev-server html-webpack-plugin > /dev/null;
npm install --save-dev image-webpack-loader file-loader > /dev/null;
npm install --save-dev bulma css-loader extract-text-webpack-plugin@next node-sass sass-loader style-loader > /dev/null;
