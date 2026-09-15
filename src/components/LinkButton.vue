<template>
  <a :href="url" target="_blank" class="link-button-container">
    <div class="link-button">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="link-icon">
        <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path>
        <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path>
      </svg>
      <span class="link-text">Visit Site</span>
    </div>
  </a>
</template>

<script setup>
defineProps({
  url: {
    type: String,
    required: true
  }
})
</script>

<style scoped>
.link-button-container {
  display: inline-flex;
  text-decoration: none;
}

.link-button {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  background: var(--accent);
  color: white;
  padding: 0.75rem 1.5rem;
  border-radius: var(--border-radius-small);
  cursor: pointer;
  transition: all 0.3s ease;
  font-weight: 600;
  font-size: 0.95rem;
  width: auto;
}

.link-button:hover {
  opacity: 0.85;
}

.link-icon {
  width: 18px;
  height: 18px;
}

/* Theme-specific button styles */
</style>
