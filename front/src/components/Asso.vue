<template>

  <div id="assoProfile" class="section">

    <div class="container">
      <div id="bandAsso" class="columns card">
        <figure id="picAssoFig" class="column image">
          <div id="pictureAsso" :style="{'background-image': 'url('+assoPicturePath+')'}" :alt="assoName"></div>
        </figure>
        <h1 id="assoName" class="column title is-1">{{ assoName }}</h1>
      </div>
    </div>

    <div id="assoContent" class="tile is-ancestor">

      <div class="tile is-3 card">
        <div id="assoDes" class="columns">
          <h4 class="title is-5 column">DESCRIPTION :</h4>
          <p id="assoDescrip" class="is-medium column">{{ assoDescription }}</p>
          <button id="addAssoEvent" @click="launch" class="button is-warning column">
            Proposer une mission
          </button>
        </div>
      </div>

      <div class="tile is-1"></div>

      <div class="tile is-8 card">
        <div class="container">
          <full-calendar :config="config" :events="events"/>
        </div>
      </div>

    </div>
    <div class="modal" :class="{'is-active':showModal}">
      <div class="modal-background"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">PROPOSER UNE MISSION :</p>
          <button @click="close" class="delete" aria-label="close"></button>
        </header>
        <section class="modal-card-body">
          <form id="addEvent" action="submit">
            <div class="field">
              <label class="label">Nom de la mission :</label>
              <div class="control">
                <input ref="titleEvent" class="input" type="text" placeholder="Mission...">
              </div>
            </div>

            <div class="field">
              <label class="label">Description de la mission :</label>
              <div class="control">
                <input ref="desEvent" class="input" type="text" placeholder="Description...">
              </div>
            </div>

            <div class="field">
              <label class="label">Nombre de bénévoles :</label>
              <div class="control">
                <input ref="nbUserEvent" class="input" type="number" placeholder="Nombre...">
              </div>
            </div>

            <div class="field">
              <label class="label">Heure de début :</label>
              <div class="control">
                <input ref="startEvent" class="input" type="datetime-local" placeholder="">
              </div>
            </div>

            <div class="field">
              <label class="label">Heure de fin :</label>
              <div class="control">
                <input ref="endEvent" class="input" type="datetime-local" placeholder="">
              </div>
            </div>
          </form>
        </section>
        <footer class="modal-card-foot">
          <button class="button is-warning" @click.prevent="submit">Créer</button>
          <button class="button" @click="close">Annuler</button>
        </footer>
      </div>
    </div>
  </div>
</template>

<script>
import Modal from './modal.vue';

export default {
  name: 'AssoProfile',
  component: Modal,
  data () {
    return {
      assoName: 'Passerelles 17',
      assoPicturePath: 'https://raw.githubusercontent.com/cpieri/site/born2hack/front/src/assets/passerelles17.png',
      assoDescription: "Passerelles 17 est une association locale et entreprise d’insertion qui agit pour améliorer le cadre de vie du quartier. Fresques participatives, jardins partagés, végétalisation de l’espace public, cabane à livres, … Nous développons de nombreux projets conviviaux avec et pour les habitants pour embellir le quartier et favoriser les rencontres.",
      events: this.$allEvents,
      config: {
        defaultView: 'agendaWeek',
        locale: 'fr',
        firstDay: 1,
        slotDuration: "01:00",
        allDaySlot: false,
        eventClick: this.eClick
      },
      showModal: false
    }
  },
  methods: {
    eClick(callEvent, jsEvent, view) {
      this.showModal = true;
    	this.$refs.titleEvent.value = callEvent.title;
    	this.$refs.desEvent.value = callEvent.description;
      this.$refs.nbUserEvent.value = callEvent.nb;
      this.$refs.startEvent.value = callEvent.start;
    	this.$refs.endEvent.value = callEvent.end;
      jsEvent = null;
      view = null;
    },
    launch() {
      this.showModal = true;
    },
    close() {
      this.showModal = false;
    },
    submit() {
      let titleE = this.$refs.titleEvent.value;
      let desE = this.$refs.desEvent.value;
      let nbE = this.$refs.nbUserEvent.value;
      let startE = this.$refs.startEvent.value;
      let endE = this.$refs.endEvent.value;
      let dataE = {
        asso: this.assoName,
        title: titleE,
        description: desE,
        nb: nbE,
        start: startE,
        end: endE
      };
      this.$allEvents.push(dataE);
      this.showModal = false;
    }
  },
  mounted () {
    console.log(this.event);
  }
}
</script>

<style>
#assoProfile .card {
  border-radius: 10px;
}
#bandAsso {
  padding: 21px;
  border-radius: 10px;
  align-items: center;
  justify-content: center;
}
#picAssoFig {
  max-width: min-content;
}
#pictureAsso {
  width: 150px;
  height: 150px;
  background: no-repeat center;
  border-radius: 50%;
}
#assoName {
  min-width: max-content;
}
#assoContent {
  margin-top: 10px;
}
#assoDes {
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
}
#assoDescrip {
  max-height: min-content;
}
#addAssoEvent {
  margin-top: 15px;
  max-height: min-content;
}
</style>
