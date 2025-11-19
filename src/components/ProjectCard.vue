<template>
  <div class="project-card">
    <span class="category">{{ category }}</span>
    <h3>{{ title }}</h3>
    <p class="description">{{ description }}</p>
    <LinkButton :url="url" />
  </div>
</template>

<script setup>
import LinkButton from './LinkButton.vue'

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
  },
  url: {
    type: String,
    required: true
  }
})
</script>

<style scoped>
.project-card {
  background: var(--bg-secondary);
  padding: 2rem;
  border-radius: var(--border-radius);
  box-shadow: var(--shadow-style);
  transition: all 0.3s ease;
  display: flex;
  flex-direction: column;
  min-height: 280px;
}

/* Theme-specific card styles */
.theme-retro .project-card {
  border: 2px solid var(--border);
  box-shadow: var(--shadow-style);
}

.project-card h3 {
  font-size: 1.25rem;
  margin-bottom: 0.75rem;
  font-weight: 600;
}

.category {
  display: inline-block;
  align-self: flex-start;
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
}

/* Theme-specific badge styles */
.theme-retro .category {
  border: 2px outset var(--accent);
  box-shadow: none;
  backdrop-filter: none;
  font-family: var(--font-body);
}

.theme-programmer .category {
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

@media (max-width: 480px) {
  .project-card {
    padding: 1.5rem;
  }
}
</style>
