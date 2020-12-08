import Vue from 'vue/dist/vue.js'

const app = new Vue({
  el: '.header__userWrapper',
  methods: {
    toggle_dropdown_style: function () {
      this.dropdown_style.display = (this.dropdown_style.display == 'none') ? 'block' : 'none'
    }
  },
  data: {
    dropdown_style: {
      display: 'none'
    }
  }
})
console.log(app)
