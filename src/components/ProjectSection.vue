<template>
  <section class="project-section" id="projects">
    <div class="container">
      <h2>Projects</h2>
      <p class="section-subtitle">Explore a selection of my work</p>

      <div class="project-grid">
        <ProjectCard
          v-for="project in projects"
          :key="project.title"
          :category="project.category"
          :title="project.title"
          :description="project.description"
          :url="project.url"
        />
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import ProjectCard from './ProjectCard.vue'

const projects = ref([
  {
    category: 'Marketing Website',
    title: 'Why Life Sucks',
    description: 'Marketing website for a personal brand. Showcasing content and establishing online presence.',
    url: 'https://whylifesucks.com'
  },
  {
    category: 'Web App',
    title: 'Voice Controlla',
    description: 'A vocal toolkit for never-before-heard sounds and a suite of AI music empowerment tools.',
    url: 'https://voice.controlla.xyz'
  },
  {
    category: 'Web App',
    title: 'Right Work',
    description: 'AI-powered labor optimization software: Accurately forecast and reduce labor costs, gain operational efficiencies in your business, and empower your workforce.',
    url: 'https://right.work'
  }
])
</script>

<style scoped>
.project-section {
  padding: 6rem 2rem;
}

.project-section h2 {
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

.project-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  max-width: 1200px;
  margin: 0 auto;
}

@media (max-width: 768px) {
  .project-section {
    padding: 3rem 1.5rem;
  }

  .project-section h2 {
    font-size: 2rem;
  }

  .project-grid {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
}
</style>
