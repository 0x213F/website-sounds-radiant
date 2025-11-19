<template>
  <div class="theme-selector">
    <button class="theme-toggle" @click="toggleSelector">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="12" cy="12" r="5"/>
        <line x1="12" y1="1" x2="12" y2="3"/>
        <line x1="12" y1="21" x2="12" y2="23"/>
        <line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/>
        <line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/>
        <line x1="1" y1="12" x2="3" y2="12"/>
        <line x1="21" y1="12" x2="23" y2="12"/>
        <line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/>
        <line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/>
      </svg>
      Themes
    </button>

    <div v-if="showSelector" class="theme-dropdown">
      <h4>Choose a Theme</h4>
      <div class="theme-grid">
        <button
          v-for="(theme, key) in availableThemes"
          :key="key"
          class="theme-option"
          :class="{ active: currentTheme === key }"
          @click="selectTheme(key)"
        >
          <div class="theme-preview">
            <div class="color-swatch" :style="{ background: theme.accent }"></div>
            <div class="color-swatch" :style="{ background: theme.bgSecondary }"></div>
            <div class="color-swatch" :style="{ background: theme.textPrimary }"></div>
          </div>
          <span class="theme-name">{{ theme.name }}</span>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useTheme } from '../composables/useTheme'

const { currentTheme, themes, setTheme } = useTheme()
const showSelector = ref(false)

// Filter out retro theme for now
const availableThemes = computed(() => {
  const filtered = {}
  for (const [key, value] of Object.entries(themes)) {
    if (key !== 'retro') {
      filtered[key] = value
    }
  }
  return filtered
})

const toggleSelector = () => {
  showSelector.value = !showSelector.value
}

const selectTheme = (themeName) => {
  setTheme(themeName)
  showSelector.value = false
}

// Close selector when clicking outside
if (typeof window !== 'undefined') {
  document.addEventListener('click', (e) => {
    const selector = document.querySelector('.theme-selector')
    if (selector && !selector.contains(e.target)) {
      showSelector.value = false
    }
  })
}
</script>

<style scoped>
.theme-selector {
  position: fixed;
  bottom: 2rem;
  right: 2rem;
  z-index: 1000;
}

.theme-toggle {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem 1.25rem;
  background: var(--accent);
  color: white;
  border: none;
  border-radius: 50px;
  font-weight: 600;
  font-size: 0.95rem;
  cursor: pointer;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  transition: all 0.3s ease;
  font-family: var(--font-body);
}

/* Theme-specific toggle button styles */
.theme-retro .theme-toggle {
  border-radius: 0;
  border: 2px outset var(--accent);
}

.theme-programmer .theme-toggle {
  border-radius: var(--border-radius-small);
  border: 1px solid var(--accent);
  background: var(--bg-secondary);
  color: var(--accent);
}

.theme-toggle:hover {
  background: color-mix(in srgb, var(--accent) 90%, white);
}

.theme-programmer .theme-toggle:hover {
  background: color-mix(in srgb, var(--bg-secondary) 85%, var(--accent) 15%);
  border-color: color-mix(in srgb, var(--accent) 80%, white);
}

.theme-toggle svg {
  width: 20px;
  height: 20px;
}

.theme-dropdown {
  position: absolute;
  bottom: 100%;
  right: 0;
  margin-bottom: 1rem;
  background: var(--bg-primary);
  border: 1px solid var(--border);
  border-radius: 12px;
  padding: 1.5rem;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
  min-width: 320px;
}

.theme-dropdown h4 {
  margin: 0 0 1rem 0;
  color: var(--text-primary);
  font-size: 1rem;
  font-weight: 600;
}

.theme-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 0.75rem;
}

.theme-option {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 0.75rem;
  background: var(--bg-secondary);
  border: 2px solid transparent;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.2s ease;
  text-align: left;
}

.theme-option:hover {
  border-color: var(--accent);
}

.theme-option.active {
  border-color: var(--accent);
  background: var(--accent);
}

.theme-option.active .theme-name {
  color: white;
  font-weight: 700;
}

.theme-preview {
  display: flex;
  gap: 4px;
}

.color-swatch {
  width: 24px;
  height: 24px;
  border-radius: 4px;
  border: 1px solid rgba(0, 0, 0, 0.1);
}

.theme-name {
  color: var(--text-primary);
  font-weight: 600;
  font-size: 0.9rem;
}

@media (max-width: 768px) {
  .theme-selector {
    bottom: 1rem;
    right: 1rem;
  }

  .theme-dropdown {
    min-width: 280px;
  }

  .theme-toggle {
    padding: 0.65rem 1rem;
    font-size: 0.85rem;
  }
}
</style>
