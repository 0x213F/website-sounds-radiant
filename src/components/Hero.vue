<template>
  <section class="hero">
    <div class="container">
      <h1>{{ currentContent.heroTitle }}</h1>
      <p class="subtitle">{{ currentContent.heroSubtitle }}</p>
    </div>
  </section>
</template>

<script setup>
import { useTheme } from '../composables/useTheme'

const { currentContent } = useTheme()
</script>

<style scoped>
.hero {
  padding: 6rem 2rem;
  text-align: center;
}

.hero h1 {
  font-size: 3.5rem;
  font-weight: 700;
  margin-bottom: 1rem;
  letter-spacing: -0.02em;
  font-family: var(--font-family);
}

/* Theme-specific hero styles */
.theme-veganLeather .hero h1 {
  font-weight: 600;
  font-style: italic;
  letter-spacing: 0;
}

.theme-programmer .hero h1 {
  letter-spacing: -0.05em;
  font-weight: 500;
}

.theme-retro .hero h1 {
  letter-spacing: 0;
  font-weight: 700;
  text-decoration: underline;
}

.hero .subtitle {
  font-size: 1.5rem;
  color: var(--text-secondary);
  font-weight: 300;
  margin-bottom: 3rem;
}

@media (max-width: 768px) {
  .hero {
    padding: 4rem 1.5rem;
  }

  .hero h1 {
    font-size: 2.5rem;
  }

  .hero .subtitle {
    font-size: 1.25rem;
  }
}

@media (max-width: 480px) {
  .hero h1 {
    font-size: 2rem;
  }

  .hero .subtitle {
    font-size: 1.1rem;
  }
}
</style>
