<template>
  <section class="memories-section" id="memories">
    <div class="container">
      <h2>Memories</h2>
      <p class="section-subtitle">Moments captured and cherished</p>

      <div class="memories-grid">
        <MemoryCard
          v-for="memory in memories"
          :key="memory.title"
          :category="memory.category"
          :title="memory.title"
          :description="memory.description"
          @view-photo="openPhotoModal(memory)"
        />
      </div>
    </div>

    <!-- Photo Modal -->
    <div v-if="selectedMemory" class="modal-overlay" @click="closePhotoModal">
      <div class="modal-content" @click.stop>
        <button class="modal-close" @click="closePhotoModal">&times;</button>
        <h3>{{ selectedMemory.title }}</h3>
        <div class="photo-container">
          <img :src="selectedMemory.photoSrc" :alt="selectedMemory.title" class="memory-photo" />
        </div>
        <p class="photo-caption">{{ selectedMemory.description }}</p>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import MemoryCard from './MemoryCard.vue'

const memories = ref([
  {
    category: 'Adventure',
    title: 'Golden Gate Sunrise',
    description: 'That perfect morning when the fog rolled in just right and the bridge glowed golden.',
    photoSrc: '/assets/memories/placeholder-1.jpg'
  },
  {
    category: 'Connection',
    title: 'Rooftop Sessions',
    description: 'Late-night conversations under the stars, where time stands still and hearts open up.',
    photoSrc: '/assets/memories/placeholder-2.jpg'
  },
  {
    category: 'Journey',
    title: 'Highway One',
    description: 'The spontaneous road trip that reminded me why California feels like home.',
    photoSrc: '/assets/memories/placeholder-3.jpg'
  },
  {
    category: 'Joy',
    title: 'Sunday Market',
    description: 'Fresh flowers, good coffee, and the kind of simple happiness that makes life beautiful.',
    photoSrc: '/assets/memories/placeholder-4.jpg'
  },
  {
    category: 'Peace',
    title: 'Ocean Therapy',
    description: 'When the waves are the only therapy you need and salt air clears everything.',
    photoSrc: '/assets/memories/placeholder-5.jpg'
  },
  {
    category: 'Magic',
    title: 'Golden Hour',
    description: 'That fleeting moment when everything is bathed in warm light and feels infinite.',
    photoSrc: '/assets/memories/placeholder-6.jpg'
  }
])

const selectedMemory = ref(null)

const openPhotoModal = (memory) => {
  selectedMemory.value = memory
}

const closePhotoModal = () => {
  selectedMemory.value = null
}
</script>

<style scoped>
.memories-section {
  padding: 6rem 2rem;
}

.memories-section h2 {
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

.memories-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  max-width: 1200px;
  margin: 0 auto;
}

/* Modal Styles */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.85);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
  padding: 1rem;
}

.modal-content {
  background: var(--bg-primary);
  padding: 2.5rem;
  border-radius: var(--border-radius, 12px);
  max-width: 900px;
  width: 100%;
  max-height: 90vh;
  overflow-y: auto;
  position: relative;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
}

.modal-close {
  position: absolute;
  top: 1rem;
  right: 1rem;
  background: none;
  border: none;
  font-size: 2rem;
  color: var(--text-secondary);
  cursor: pointer;
  padding: 0.5rem;
  line-height: 1;
  transition: color 0.2s;
  z-index: 1;
}

.modal-close:hover {
  color: var(--text-primary);
}

.modal-content h3 {
  font-size: 1.75rem;
  margin-bottom: 1.5rem;
  color: var(--text-primary);
  font-family: var(--font-family, 'Inter', sans-serif);
  padding-right: 2rem;
}

.photo-container {
  background: #000;
  border-radius: var(--border-radius-small, 8px);
  margin-bottom: 1.5rem;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
}

.memory-photo {
  max-width: 100%;
  height: auto;
  display: block;
  object-fit: contain;
  max-height: 60vh;
}

.photo-caption {
  font-size: 1.125rem;
  line-height: 1.8;
  color: var(--text-secondary);
  text-align: center;
  font-style: italic;
}

@media (max-width: 768px) {
  .memories-section {
    padding: 3rem 1.5rem;
  }

  .memories-section h2 {
    font-size: 2rem;
  }

  .memories-grid {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }

  .modal-content {
    padding: 2rem;
  }

  .modal-content h3 {
    font-size: 1.5rem;
  }

  .photo-caption {
    font-size: 1rem;
  }
}
</style>
