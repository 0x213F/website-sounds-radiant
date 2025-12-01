<template>
  <div class="play-button-container">
    <!-- Play/Pause Button -->
    <button
      class="play-pause-btn"
      @click="togglePlay"
      :class="{ playing: isPlaying }"
    >
      <svg v-if="!isPlaying" class="play-icon" viewBox="0 0 24 24" fill="currentColor">
        <path d="M8 5v14l11-7z"/>
      </svg>
      <svg v-else class="pause-icon" viewBox="0 0 24 24" fill="currentColor">
        <path d="M6 4h4v16H6V4zm8 0h4v16h-4V4z"/>
      </svg>
    </button>

    <!-- Visualizer Bars -->
    <div class="visualizer">
      <div
        class="bar"
        :class="{ active: isPlaying }"
        :style="{ animationDelay: '0s' }"
      ></div>
      <div
        class="bar"
        :class="{ active: isPlaying }"
        :style="{ animationDelay: '0.15s' }"
      ></div>
      <div
        class="bar"
        :class="{ active: isPlaying }"
        :style="{ animationDelay: '0.3s' }"
      ></div>
    </div>

    <!-- Text that reveals after 8 seconds -->
    <div class="reveal-text" :class="{ revealed: textRevealed }">
      {{ revealMessage }}
    </div>

    <!-- Hidden audio element -->
    <audio
      ref="audioRef"
      :src="audioSrc"
      @play="onPlay"
      @pause="onPause"
      @ended="onEnded"
      @timeupdate="onTimeUpdate"
    ></audio>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { useAudioPlayer } from '../composables/useAudioPlayer'

const props = defineProps({
  audioSrc: {
    type: String,
    required: true
  },
  revealMessage: {
    type: String,
    default: 'Thanks for listening! 🎵'
  }
})

const audioRef = ref(null)
const isPlaying = ref(false)
const textRevealed = ref(false)
const hasRevealed = ref(false) // Track if text has been revealed once

// Generate unique player ID
const playerId = `player-${Math.random().toString(36).substr(2, 9)}`
const { registerPlayer } = useAudioPlayer()
const playerControls = ref(null)

const togglePlay = () => {
  if (!audioRef.value) return

  if (isPlaying.value) {
    audioRef.value.pause()
  } else {
    audioRef.value.play()
  }
}

const onPlay = () => {
  isPlaying.value = true
  // Notify other players to pause
  if (playerControls.value) {
    playerControls.value.play()
  }
}

const onPause = () => {
  isPlaying.value = false
  if (playerControls.value) {
    playerControls.value.pause()
  }
}

const onEnded = () => {
  isPlaying.value = false
  if (playerControls.value) {
    playerControls.value.pause()
  }
}

const onTimeUpdate = () => {
  if (!audioRef.value || hasRevealed.value) return

  // Reveal text after 8 seconds
  if (audioRef.value.currentTime >= 8 && !textRevealed.value) {
    textRevealed.value = true
    hasRevealed.value = true // Lock it so it stays revealed
  }
}

// Listen for pause events from other players
const handleAudioPlayerChange = (event) => {
  if (event.detail.playerId === playerId && audioRef.value) {
    audioRef.value.pause()
  }
}

onMounted(() => {
  playerControls.value = registerPlayer(playerId, audioRef.value)
  window.addEventListener('audio-player-change', handleAudioPlayerChange)
})

// Cleanup
onUnmounted(() => {
  if (audioRef.value) {
    audioRef.value.pause()
  }
  window.removeEventListener('audio-player-change', handleAudioPlayerChange)
})
</script>

<style scoped>
.play-button-container {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 1rem;
  flex-wrap: nowrap;
}

/* Play/Pause Button */
.play-pause-btn {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  border: none;
  background: var(--accent);
  color: white;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
}

/* Theme-specific button styles */
.theme-retro .play-pause-btn {
  border-radius: 0;
  border: 2px outset var(--accent);
  box-shadow: var(--shadow-style);
}

.theme-programmer .play-pause-btn {
  border-radius: var(--border-radius-small);
  border: 1px solid var(--accent);
  background: var(--bg-secondary);
  color: var(--accent);
}

.play-pause-btn:hover {
  transform: scale(1.05);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.play-pause-btn:active {
  transform: scale(1.0);
}

.play-icon,
.pause-icon {
  width: 20px;
  height: 20px;
  transition: transform 0.2s ease;
}

.play-pause-btn:hover .play-icon,
.play-pause-btn:hover .pause-icon {
  transform: scale(1.4);
}

.play-icon {
  margin-left: 2px; /* Center the play triangle better */
}

/* Visualizer */
.visualizer {
  display: flex;
  align-items: center;
  gap: 4px;
  height: 32px;
}

.bar {
  width: 4px;
  height: 8px;
  background: var(--text-light);
  border-radius: 2px;
  transition: background 0.3s ease;
  opacity: var(--accent-opacity);
}

.bar.active {
  background: var(--accent);
  opacity: var(--accent-opacity);
  animation: bounce-bar 0.6s ease-in-out infinite;
}

@keyframes bounce-bar {
  0%, 100% {
    height: 8px;
  }
  50% {
    height: 24px;
  }
}

/* Reveal Text */
.reveal-text {
  font-size: 0.95rem;
  color: var(--text-secondary);
  font-style: italic;
  opacity: 0;
  transform: translateX(-10px);
  transition: all 0.5s ease;
  pointer-events: none;
  white-space: nowrap;
  min-width: 0;
  flex-shrink: 1;
}

.reveal-text.revealed {
  opacity: 1;
  transform: translateX(0);
  pointer-events: auto;
}

/* Responsive adjustments */
@media (max-width: 480px) {
  .play-pause-btn {
    width: 40px;
    height: 40px;
  }

  .play-icon,
  .pause-icon {
    width: 16px;
    height: 16px;
  }

  .visualizer {
    height: 28px;
  }

  .bar.active {
    animation: bounce-bar-mobile 0.6s ease-in-out infinite;
  }

  @keyframes bounce-bar-mobile {
    0%, 100% {
      height: 6px;
    }
    50% {
      height: 20px;
    }
  }
}
</style>
