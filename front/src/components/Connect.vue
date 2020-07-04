<template>
  <section id="connectSection" class="section">
    <div class="container">
      <h1 id="titleConnect" class="title">Qui suis-je ?</h1>
      <div id="buttonConnect" class="columns">
        <div class="column">
          <a class="button is-large is-warning">
            <router-link to="/student">UN STUDENT</router-link>
          </a>
        </div>
        <div class="column">
          <a class="button is-large is-warning">
            <router-link to="/asso">UNE ASSOCIATION</router-link>
          </a>
        </div>
        <div class="column">
          <a class="button is-large is-warning">
            <router-link to="/habitant">UN HABITANT DU QUARTIER</router-link>
          </a>
        </div>
      </div>
	  <div class="column">
          <a class="button is-large is-warning" href="https://youtu.be/PurM7HSuNG8">
            VIDEO
          </a>
        </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'Connect'
}
</script>

<style>
#buttonConnect {
  flex-direction: column;
}
#titleConnect {
  margin-bottom: 50px;
}
</style>
