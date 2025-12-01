import { ref } from 'vue'

// Global state to track which audio is currently playing
const currentlyPlayingId = ref(null)

export function useAudioPlayer() {
  const registerPlayer = (playerId, audioElement) => {
    // When a player starts, pause all others
    const play = () => {
      // If another player is playing, pause it first
      if (currentlyPlayingId.value && currentlyPlayingId.value !== playerId) {
        // Trigger pause event for the currently playing audio
        window.dispatchEvent(new CustomEvent('audio-player-change', {
          detail: { playerId: currentlyPlayingId.value }
        }))
      }
      currentlyPlayingId.value = playerId
    }

    const pause = () => {
      if (currentlyPlayingId.value === playerId) {
        currentlyPlayingId.value = null
      }
    }

    return { play, pause }
  }

  return {
    currentlyPlayingId,
    registerPlayer
  }
}
