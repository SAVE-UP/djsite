<template>
  <section class="section">

    <div class="tile is-ancestor">

      <div id="tileHabitantProfile" class="tile is-4 card">

        <div id="globalHabitant" class="column">
          <div id="infoHabitant" class="columns">
            <figure class="image column">
              <div id="pictureHabitant" :style="{ 'background-image': 'url(' + studentPicture + ')' }"></div>
            </figure>
            <h2 id="nameHabitant" class="title is-4 column">{{ studentName }}</h2>
          </div>
        </div>

        <div class="column">
          <div id="profileNoc" class="container">
            <h4 class="title is-4"><abbr title="Not Only Coin">NOC</abbr> : {{ nbNoc }}</h4>
            <router-link to="/">Utiliser mes <abbr title="Not Only Coin">NOC</abbr></router-link>
          </div>
          <div class="container">
            <div class="columns">
              <div id="studentStat" class="column">
                <h5 class="title is-5">MES STATS :</h5>
                <p class="subtitle is-5">Nombre de missions effectuées dans le mois : <h6 class="title is-6">{{ nbMission }}</h6></p>
                <p class="subtitle is-5">Nombre d'heures effectuées dans le mois : <h6 class="title is-6">{{ nbHour }}</h6></p>
                <p class="subtitle is-5">Centre d'intérêt préféré : <h6 class="title is-6">{{ bestCat }}</h6></p>
              </div>
              <div id="studentSuggest" class="column">
                <h5 class="title is-5">SUGGESTIONS :</h5>
                <p class="subtitle is-5">Association qui pourrait vous intéresser : <h6 class="title is-6">{{ suggestAsso }}</h6></p>
                <p class="subtitle is-5">Mission à venir dans le thème {{ bestCat }} : <h6 class="title is-6">{{ nextDate }}</h6></p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div id="agendaEvent" class="tile is-8 card">
        <div class="container">
          <full-calendar :config="config" :events="events"/>
        </div>
      </div>

    </div>
    <div class="container">
      <h1 class="title">MA PROCHAINE MISSION :</h1>
      <p id="titleNextMission" class="subtitle is-3">{{ studentNextMissionTitle }} {{ studentNextMissionDate }}</p>
      <p id="descriptionNextMission" class="subtitle is-4">{{ studentNextMissionDes }}</p>
    </div>

    <div class="modal" :class="{'is-active':showModal}">
      <div class="modal-background"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">{{ modalEventTitle }}</p>
          <button class="delete" aria-label="close" @click="close"></button>
        </header>
        <section class="modal-card-body">
          <p ref="desMission" class="subtile is-4">{{ modalEventDate }}</p>
          <p ref="desMission" class="subtile is-4">{{ modalEventDes }}</p>
        </section>
        <footer class="modal-card-foot">
          <button class="button is-warning" @click="suscribe">S'inscrire</button>
          <button class="button" @click="close">Annuler</button>
        </footer>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'Habitant',
  data() {
    return {
      studentName: 'Jean Ducoin',
      studentPicture: 'https://placekitten.com/131/175',
      nbNoc: 42,
      nbMission: 1,
      nbHour: 2,
      bestCat: "Mécanique",
      nextDate: '14 Juillet 2019 de 18h à 22h',
      suggestAsso: 'Recyclerie Sportive',
      studentNextMissionTitle: "",
      studentNextMissionDate: "",
      studentNextMissionDes: "Je n'ai pas de mission prévue",
      events: this.$allEvents,
      modalEventTitle: null,
      modalEventDes: null,
      modalEventDate: null,
      showModal: false,
      config: {
        defaultView: 'agendaWeek',
        locale: 'fr',
        firstDay: 1,
        slotDuration: "01:00",
        allDaySlot: false,
        eventClick: this.eClick
      }
    }
  },
  methods: {
    eClick(allEvent, jsEvent, view) {
      this.modalEventTitle = allEvent.title;
      this.modalEventDes = allEvent.description;
      this.modalEventDate = allEvent.start;
      this.showModal = true;
      jsEvent = null;
      view = null;
    },
    close() {
      this.showModal = false;
    },
    suscribe() {
      this.studentNextMissionTitle = this.modalEventTitle;
      this.studentNextMissionDate = this.modalEventDate;
      this.studentNextMissionDes = this.modalEventDes;
      this.showModal = false;
    }
  }
}
</script>

<style>
#agendaEvent {
  padding: 21px;
  border-radius: 0% 10px 10px 0%;
}
#infoHabitant {
  /*justify-content: center;*/
  /*flex-flow: column;*/
  align-items: center;
  text-align: start;
}
#pictureHabitant {
  background: center no-repeat;
  border-radius: 50%;
  height: 128px;
  width: 128px;
}
#nameHabitant {
  width: 100%;
  margin-top: 21px;
}
#profileNoc {
  margin: 20px 0;
}
#studentStat p {
  margin-top: 10px;
}
#studentSuggest p {
  margin-top: 10px;
}
#tileHabitantProfile {
  flex-flow: column;
  justify-content: center;
  border-radius: 10px 0% 0% 10px;

}
#globalHabitant {
  max-height: 150px;
}
#descriptionNextMission {
  margin-top: 50px;
}
.tile {
  padding: 21px;
}
</style>
