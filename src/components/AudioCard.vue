<template>
  <div class="audio-card">
    <span class="genre">{{ genre }}</span>
    <h3>{{ title }}</h3>
    <p class="description">{{ description }}</p>
    <PlayButton :audio-src="audioSrc" :reveal-message="revealMessage" />
  </div>
</template>

<script setup>
import PlayButton from './PlayButton.vue'

defineProps({
  genre: {
    type: String,
    required: true
  },
  title: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: true
  },
  audioSrc: {
    type: String,
    required: true
  },
  revealMessage: {
    type: String,
    default: 'Thanks for listening! 🎵'
  }
})
</script>

<style scoped>
.audio-card {
  background: var(--bg-secondary);
  padding: 2rem;
  border-radius: var(--border-radius);
  box-shadow: var(--shadow-style);
  transition: all 0.3s ease;
  display: flex;
  flex-direction: column;
  min-height: 100%;
}

/* Theme-specific card styles */
.theme-retro .audio-card {
  border: 2px solid var(--border);
  box-shadow: var(--shadow-style);
}

.audio-card h3 {
  font-size: 1.25rem;
  margin-bottom: 0.75rem;
  font-weight: 600;
}

.genre {
  display: inline-block;
  background: var(--accent);
  color: white;
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  margin-bottom: 1rem;
  padding: 0.4rem 0.8rem;
  border-radius: var(--border-radius-small);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);
  opacity: var(--accent-opacity);
  backdrop-filter: blur(2px);
  align-self: flex-start;
}

/* Theme-specific badge styles */
.theme-retro .genre {
  border: 2px outset var(--accent);
  box-shadow: none;
  backdrop-filter: none;
  font-family: var(--font-body);
}

.theme-programmer .genre {
  border: 1px solid var(--accent);
  background: transparent;
  color: var(--accent);
  opacity: 1;
  font-family: var(--font-body);
  letter-spacing: 0.1em;
}

.description {
  color: var(--text-light);
  font-size: 0.95rem;
  margin-bottom: 1.5rem;
  line-height: 1.6;
  flex-grow: 1;
}

/* Removed default audio styles - now using custom PlayButton component */

@media (max-width: 480px) {
  .audio-card {
    padding: 1.5rem;
  }
}
</style>
