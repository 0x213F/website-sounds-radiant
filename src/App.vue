<template>
  <div class="background-overlay" :style="{ backgroundImage: `url(${backgroundImage})` }"></div>
  <Navigation />
  <Hero />
  <About />
  <AudioSection v-if="currentContent.showAudio" />
  <ProjectSection v-if="currentTheme === 'programmer'" />
  <Footer />
  <ThemeSelector />
</template>

<script setup>
import { useBackground } from './composables/useBackground'
import { useTheme } from './composables/useTheme'
import Navigation from './components/Navigation.vue'
import Hero from './components/Hero.vue'
import About from './components/About.vue'
import AudioSection from './components/AudioSection.vue'
import ProjectSection from './components/ProjectSection.vue'
import Footer from './components/Footer.vue'
import ThemeSelector from './components/ThemeSelector.vue'

const { backgroundImage } = useBackground()
const { currentContent, currentTheme, applyTheme } = useTheme()

// Initialize theme - set to vegan leather theme
applyTheme('veganLeather')
</script>
