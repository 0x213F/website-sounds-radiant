<template>
  <section class="audio-section" id="audio">
    <div class="container">
      <h2>Listen</h2>
      <p class="section-subtitle">Explore a selection of performances across different styles</p>

      <div class="audio-grid">
        <AudioCard
          v-for="track in tracks"
          :key="track.title"
          :genre="track.genre"
          :title="track.title"
          :description="track.description"
          :audio-src="track.audioSrc"
          :reveal-message="track.revealMessage"
        />
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import AudioCard from './AudioCard.vue'

const tracks = ref([
  {
    genre: 'Live Music',
    title: 'Club Jazz',
    description: 'Heady jazz for first-timers and connoisseurs alike',
    audioSrc: '/assets/audio/footprints.mp3',
    revealMessage: 'Live at an evening-time cafe'
  },
  {
    genre: 'Live Music',
    title: 'Reception Jazz',
    description: 'For the casual occasion, such as a wedding or corporate event',
    audioSrc: '/assets/audio/living-room.mp3',
    revealMessage: 'Live in a living room'
  },
  {
    genre: 'Live Music',
    title: 'Political Jazz',
    description: 'Paying homage to jazz\'s roots',
    audioSrc: '/assets/audio/colors.mp3',
    revealMessage: 'Live at a forum'
  },
  {
    genre: 'Live Music',
    title: 'Funk',
    description: 'Organ Trio playing jazz-and-pop cannon from the 80s and 90s',
    audioSrc: '/assets/audio/do-for-love.m4a',
    revealMessage: 'Live at a bar & restaurant'
  },
  {
    genre: 'Live Music',
    title: 'Italian',
    description: 'Playing timeless Italian music from the 60s and 70s',
    audioSrc: '/assets/audio/mina.mp3',
    revealMessage: 'Live at a gelado shop'
  },
  {
    genre: 'Live Music',
    title: 'Jam Band',
    description: 'Where the musicians crawl to have a good time',
    audioSrc: '/assets/audio/toms-diner.mp3',
    revealMessage: 'Live at a secret venue'
  }
])
</script>

<style scoped>
.audio-section {
  padding: 6rem 2rem;
}

.audio-section h2 {
  font-size: 2.5rem;
  margin-bottom: 1rem;
  font-weight: 700;
  text-align: center;
}

.section-subtitle {
  text-align: center;
  color: var(--text-secondary);
  font-size: 1.125rem;
  margin-bottom: 4rem;
}

.audio-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  max-width: 1200px;
  margin: 0 auto;
}

@media (max-width: 768px) {
  .audio-section {
    padding: 3rem 1.5rem;
  }

  .audio-section h2 {
    font-size: 2rem;
  }

  .audio-grid {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
}
</style>
