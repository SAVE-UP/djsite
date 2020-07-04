<template>
  <!--<div class="section">-->
	<nav id="NavBar" class="navbar is-transparent" role="navigation" aria-label="main navigation">
		<div class="navbar-brand">

			<a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
			<span aria-hidden="true"></span>
			<span aria-hidden="true"></span>
			<span aria-hidden="true"></span>
			</a>
		</div>

		<div id="NavBarContent" class="navbar-menu">
			<a class="navbar-item">
        <router-link to="/">Home</router-link>
			</a>
    </div>
	</nav>
  <!--</div>-->
</template>

<script>
export default {
	name: 'NavBar',
}
</script>

<style>
#NavBarContent {
	justify-content: center;
}
</style>
