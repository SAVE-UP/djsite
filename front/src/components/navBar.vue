<template>
  <nav class="navbar is-fixed-top" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
      <router-link class="navbar-item" to="/">
        <img src="../assets/logo.png" alt="logo" id="logo"/>
      </router-link>

      <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </a>
    </div>

    <div id="navbarBasicExample" class="navbar-menu">
      <div class="navbar-start">
        <div class="buttons">
          <router-link class="button is-rounded is-medium is-success" to="/">
            Home
          </router-link>
        </div>
      </div>
    </div>

    <div class="navbar-end">
      <div class="navbar-item">
        <div class="buttons">
          <button class="button is-rounded is-medium is-success" @click="showModal('ContactInfo')">
            <strong>Contact information</strong>
          </button>
        </div>
      </div>
      <Modal :isShowArg="modalIsShow" :childArg="modalContentName" @changeModalContentName="modalContentName = $event" @changeModalIsShow="modalIsShow = $event"></Modal>
    </div>

  </nav>
</template>

<script>
  import Modal from '../Modals/modal'

  export default {
    name: 'NavBar',
    data () {
      return {
        modalIsShow: false,
        modalContentName: null
      }
    },
    components: {
      Modal
    },
    methods: {
      /**
       *  showModal show the Modal
       *
       * @param ContentName it's the name of component child that the Modal must choose (ref in Modal.vue)
       */
      showModal (ContentName) {
        this.modalIsShow = true
        this.modalContentName = ContentName
      },

    },
    created () {


      document.addEventListener('DOMContentLoaded', () => {

        // Get all "navbar-burger" elements
        const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

        // Check if there are any navbar burgers
        if ($navbarBurgers.length > 0) {

          // Add a click event on each of them
          $navbarBurgers.forEach( el => {
            el.addEventListener('click', () => {

              // Get the target from the "data-target" attribute
              const target = el.dataset.target;
              const $target = document.getElementById(target);

              // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
              el.classList.toggle('is-active');
              $target.classList.toggle('is-active');

            });
          });
        }

      });

    }
  }
</script>

<style>
  /* #class-new-notif {
    background: red;
    border-radius: 50%;
    height: 20px;
    width: 20px;
    font-size: small;
    position: relative;
    top: -7px;
    left: -2px;
  } */

  #div-notifs {
    height: 50vh;
    width: 21vh;
    overflow: auto;
  }

  #logo {
    min-height: 70px;
    min-width: 70px;
  }

</style>
