<template>
  <div class="memory-card">
    <div class="memory-header">
      <span class="memory-category">{{ category }}</span>
    </div>
    <h3 class="memory-title">{{ title }}</h3>
    <p class="memory-description">{{ description }}</p>
    <button class="view-photo-btn" @click="$emit('view-photo')">
      View Photo
    </button>
  </div>
</template>

<script setup>
defineProps({
  category: {
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
  }
})

defineEmits(['view-photo'])
</script>

<style scoped>
.memory-card {
  background: var(--bg-primary);
  border-radius: var(--border-radius, 12px);
  padding: 2rem;
  border: 1px solid var(--border);
  display: flex;
  flex-direction: column;
}

.memory-header {
  margin-bottom: 1rem;
}

.memory-category {
  display: inline-block;
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 1px;
  color: var(--accent);
  font-weight: 600;
  padding: 0.25rem 0.75rem;
  border-radius: var(--border-radius-small, 6px);
  border: 1px solid var(--accent);
}

.memory-title {
  font-size: 1.5rem;
  margin-bottom: 1rem;
  font-weight: 600;
  color: var(--text-primary);
  font-family: var(--font-family, 'Inter', sans-serif);
}

.memory-description {
  color: var(--text-secondary);
  line-height: 1.6;
  margin-bottom: 1.5rem;
  flex-grow: 1;
}

.view-photo-btn {
  background: var(--accent);
  color: var(--bg-primary);
  border: none;
  padding: 0.75rem 1.5rem;
  border-radius: var(--border-radius-small, 6px);
  font-weight: 600;
  cursor: pointer;
  transition: opacity 0.2s, transform 0.2s;
  font-family: var(--font-body, 'Inter', sans-serif);
  font-size: 0.95rem;
}

.view-photo-btn:hover {
  opacity: 0.9;
  transform: scale(1.02);
}

.view-photo-btn:active {
  transform: scale(0.98);
}

/* Theme-specific styles */
:global(.theme-programmer) .memory-category {
  border: 2px solid var(--accent);
}

:global(.theme-retro) .memory-category {
  border: 3px solid var(--accent);
  box-shadow: inset 2px 2px 0px var(--text-light);
}
</style>
