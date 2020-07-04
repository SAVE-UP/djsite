<template>
<section class="particles full-height">
  <div class="card overlay card-index">
    <figure class="image is-square">
      <img src="../assets/logo.png" alt="logo" id="logo"/>
    </figure>
  </div>
  <vue-particles color="#E0CBF0" linesColor="#E0CBF0" shapeType="polygon" class="full-height"></vue-particles>
</section>
</template>

<script>
export default {
	name: 'Index',
}
</script>

<style>
  .card-index {
    padding: 21px;
    min-width: 21vh;
    max-height: 42vh;
    max-width: 42vh;
    margin: -10.5vh 0 0 -10.5vh;
  }
</style>
