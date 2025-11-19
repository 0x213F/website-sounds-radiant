import { ref, onMounted } from 'vue'

const BACKGROUND_IMAGES = [
  'autumnal-peach.png',
  'blushing-fire.png',
  'bright-rain.png',
  'floss.png',
  'good-vibes.png',
]

export function useBackground() {
  const backgroundImage = ref('')

  onMounted(() => {
    let selectedImage = localStorage.getItem('backgroundImage')

    if (!selectedImage) {
      selectedImage = BACKGROUND_IMAGES[Math.floor(Math.random() * BACKGROUND_IMAGES.length)]
      localStorage.setItem('backgroundImage', selectedImage)
    }

    backgroundImage.value = `/assets/${selectedImage}`
  })

  return {
    backgroundImage
  }
}
