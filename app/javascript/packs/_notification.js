import Vue from 'vue/dist/vue.js'

const app = new Vue({
  el: '#vueApp',
  data: {
    windowStatus: {
      visibility: 'visible',
      opacity: 1
    }
  },
  methods: {
    closeWindow() {
      this.windowStatus = {
        visibility: 'hidden',
        opacity: 0
      }
    }
  }
})
console.log(app)
