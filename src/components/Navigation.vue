<template>
  <nav>
    <div class="container">
      <h1>Josh Schultheiss</h1>
      <ul class="nav-links">
        <li><a href="#about" @click.prevent="scrollTo('about')">About</a></li>
        <li v-if="currentContent.showAudio"><a href="#audio" @click.prevent="scrollTo('audio')">Listen</a></li>
        <li v-if="currentTheme === 'programmer'"><a href="#projects" @click.prevent="scrollTo('projects')">Projects</a></li>
        <li><a href="#contact" @click.prevent="scrollTo('contact')">Contact</a></li>
      </ul>
    </div>
  </nav>
</template>

<script setup>
import { useTheme } from '../composables/useTheme'

const { currentContent, currentTheme } = useTheme()

const scrollTo = (id) => {
  const element = document.getElementById(id)
  if (element) {
    element.scrollIntoView({ behavior: 'smooth', block: 'start' })
  }
}
</script>

<style scoped>
nav {
  position: sticky;
  top: 0;
  background: var(--bg-primary);
  background: color-mix(in srgb, var(--bg-primary) 95%, transparent);
  backdrop-filter: blur(10px);
  border-bottom: 1px solid var(--border);
  padding: 1rem 2rem;
  z-index: 100;
}

nav .container {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

nav h1 {
  font-size: 1.5rem;
  font-weight: 700;
  color: var(--text-primary);
  font-family: var(--font-family);
}

/* Theme-specific nav styles */
.theme-retro nav {
  border-bottom: 4px ridge var(--border);
}

.theme-programmer nav {
  border-bottom: 1px solid var(--accent);
}

.nav-links {
  display: flex;
  gap: 2rem;
  list-style: none;
}

.nav-links a {
  color: var(--text-secondary);
  font-weight: 500;
  transition: color 0.3s ease;
  cursor: pointer;
}

.nav-links a:hover {
  color: var(--accent);
}

@media (max-width: 768px) {
  nav h1 {
    font-size: 1.25rem;
  }

  .nav-links {
    gap: 1rem;
    font-size: 0.9rem;
  }

  nav .container {
    padding: 0;
  }
}

@media (max-width: 480px) {
  .nav-links {
    gap: 0.75rem;
  }
}
</style>
