<template>
  <div class="background-overlay" :style="{ backgroundImage: `url(${backgroundImage})` }"></div>
  <Navigation />
  <Hero />
  <About />
  <AudioSection />
  <Footer />
</template>

<script setup>
import { useBackground } from './composables/useBackground'
import { useTheme } from './composables/useTheme'
import Navigation from './components/Navigation.vue'
import Hero from './components/Hero.vue'
import About from './components/About.vue'
import AudioSection from './components/AudioSection.vue'
import Footer from './components/Footer.vue'

const { backgroundImage } = useBackground()
const { applyTheme } = useTheme()

applyTheme()
</script>
