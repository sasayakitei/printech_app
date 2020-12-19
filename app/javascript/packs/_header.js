import Vue from 'vue/dist/vue.js'

const app = new Vue({
  el: '.header',
  data: {
    isSticky: false
  },
  methods: {
    handleScroll() {
      if (window.scrollY < 20) {
        this.isSticky = false
      } else {
        this.isSticky = true
      }
    }
  },
  mounted() {
    window.addEventListener('scroll', this.handleScroll);
  }
})
console.log(app)
