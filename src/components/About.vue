<template>
  <section class="about" id="about">
    <div class="container">
      <h2>About</h2>

      <!-- Music Profile (Vegan Leather Theme) -->
      <div v-if="currentTheme === 'veganLeather'" class="highlight">
        <p>
          Best known for his delicate percussive style and his <a href="#" @click.prevent="showMarkTreeModal = true" class="mark-tree-link">mark tree</a> performances, he brings honest and enjoyable music to your ears. He has had 100s of performances across diverse local venues including:
        </p>
        <div class="venue-cloud-wrapper">
          <!-- Row 1: Slow, big venues -->
          <div class="venue-cloud-row">
            <div class="venue-cloud" style="animation-duration: 70s;">
              <span class="venue" data-weight="2">Belle Cora</span>
              <span class="venue" data-weight="1">Winters Tavern</span>
              <span class="venue" data-weight="1">Brisbane Inn</span>
              <span class="venue" data-weight="3">Mercury Cafe</span>
              <span class="venue" data-weight="2">Fort Mason Center</span>
              <span class="venue" data-weight="1">The Lost Church</span>
            </div>
            <div class="venue-cloud" aria-hidden="true" style="animation-duration: 70s;">
              <span class="venue" data-weight="2">Belle Cora</span>
              <span class="venue" data-weight="1">Winters Tavern</span>
              <span class="venue" data-weight="1">Brisbane Inn</span>
              <span class="venue" data-weight="3">Mercury Cafe</span>
              <span class="venue" data-weight="2">Fort Mason Center</span>
              <span class="venue" data-weight="1">The Lost Church</span>
            </div>
          </div>

          <!-- Row 2: Medium speed, medium venues -->
          <div class="venue-cloud-row">
            <div class="venue-cloud" style="animation-duration: 50s; animation-direction: reverse;">
              <span class="venue" data-weight="1">Arsicault Bakery</span>
              <span class="venue" data-weight="2">Sheba Jazz Lounge</span>
              <span class="venue" data-weight="1">Golden Gate Park</span>
              <span class="venue" data-weight="3">Precita Park</span>
              <span class="venue" data-weight="2">Hila Gelato Caffè</span>
              <span class="venue" data-weight="1">Make-Out Room</span>
              <span class="venue" data-weight="2">Paris 75</span>
            </div>
            <div class="venue-cloud" aria-hidden="true" style="animation-duration: 50s; animation-direction: reverse;">
              <span class="venue" data-weight="1">Arsicault Bakery</span>
              <span class="venue" data-weight="2">Sheba Jazz Lounge</span>
              <span class="venue" data-weight="1">Golden Gate Park</span>
              <span class="venue" data-weight="3">Precita Park</span>
              <span class="venue" data-weight="2">Hila Gelato Caffè</span>
              <span class="venue" data-weight="1">Make-Out Room</span>
              <span class="venue" data-weight="2">Paris 75</span>
            </div>
          </div>

          <!-- Row 3: Fast, smaller venues -->
          <div class="venue-cloud-row">
            <div class="venue-cloud" style="animation-duration: 40s;">
              <a href="https://sfpinkdoor.com" target="_blank" class="venue-link"><span class="venue" data-weight="3">Pink Door</span></a>
              <span class="venue" data-weight="1">Ivy Park at Cathedral Hill</span>
              <span class="venue" data-weight="2">Adobe Books & Arts Cooperative</span>
              <span class="venue" data-weight="3">Street Festivals</span>
              <span class="venue" data-weight="1">Originals Vinyl</span>
              <span class="venue" data-weight="2">Simple Pleasures Cafe</span>
              <span class="venue" data-weight="1">Music City Starfactory</span>
            </div>
            <div class="venue-cloud" aria-hidden="true" style="animation-duration: 40s;">
              <a href="https://sfpinkdoor.com" target="_blank" class="venue-link"><span class="venue" data-weight="3">Pink Door</span></a>
              <span class="venue" data-weight="1">Ivy Park at Cathedral Hill</span>
              <span class="venue" data-weight="2">Adobe Books & Arts Cooperative</span>
              <span class="venue" data-weight="3">Street Festivals</span>
              <span class="venue" data-weight="1">Originals Vinyl</span>
              <span class="venue" data-weight="2">Simple Pleasures Cafe</span>
              <span class="venue" data-weight="1">Music City Starfactory</span>
            </div>
          </div>

          <!-- Row 4: Medium-slow, mixed sizes -->
          <div class="venue-cloud-row">
            <div class="venue-cloud" style="animation-duration: 60s; animation-direction: reverse;">
              <span class="venue" data-weight="2">Italian Athletic Club</span>
              <span class="venue" data-weight="1">Union Station Dispensary</span>
              <span class="venue standout" data-weight="2">Private Events</span>
              <span class="venue" data-weight="2">Market Street Arts</span>
              <span class="venue" data-weight="2">Amelie</span>
              <span class="venue" data-weight="2">Ula Restaurant & Tapas Bar</span>
              <span class="venue" data-weight="3">Art Galleries</span>
            </div>
            <div class="venue-cloud" aria-hidden="true" style="animation-duration: 60s; animation-direction: reverse;">
              <span class="venue" data-weight="2">Italian Athletic Club</span>
              <span class="venue" data-weight="1">Union Station Dispensary</span>
              <span class="venue standout" data-weight="2">Private Events</span>
              <span class="venue" data-weight="2">Market Street Arts</span>
              <span class="venue" data-weight="2">Amelie</span>
              <span class="venue" data-weight="2">Ula Restaurant & Tapas Bar</span>
              <span class="venue" data-weight="3">Art Galleries</span>
            </div>
          </div>
        </div>
        <p>
          Side-man and bandleader, Josh Schultheiss performs regularly across the Bay Area.
        </p>
      </div>
      <p v-if="currentTheme === 'veganLeather'" class="instagram-cta">
        Follow on Instagram
        <a href="https://www.instagram.com/soundsradiant/" target="_blank" class="instagram-link">@soundsradiant</a>
        for little bites.
      </p>

      <!-- Developer Profile (Programmer Theme) -->
      <div v-if="currentTheme === 'programmer'" class="highlight">
        <p>
          Full-stack software developer based in San Francisco with expertise in modern consumer software.
        </p>
        <p>
          Passionate about solving problems with elegant solutions.
        </p>
        <div class="tech-cloud-wrapper">
          <!-- Row 1 -->
          <div class="tech-cloud-row">
            <div class="tech-cloud" style="animation-duration: 70s;">
              <span class="tech" data-weight="1">JavaScript</span>
              <span class="tech" data-weight="3">Mobile Applications</span>
              <span class="tech" data-weight="1">Vue.js</span>
              <span class="tech" data-weight="1">Django</span>
              <span class="tech" data-weight="1">Lambda</span>
              <span class="tech" data-weight="3">Web Applications</span>
              <span class="tech" data-weight="1">Supabase</span>
              <span class="tech" data-weight="1">EC2</span>
              <span class="tech" data-weight="1">PostgreSQL</span>
            </div>
            <div class="tech-cloud" aria-hidden="true" style="animation-duration: 70s;">
              <span class="tech" data-weight="1">JavaScript</span>
              <span class="tech" data-weight="3">Mobile Applications</span>
              <span class="tech" data-weight="1">Vue.js</span>
              <span class="tech" data-weight="1">Django</span>
              <span class="tech" data-weight="1">Lambda</span>
              <span class="tech" data-weight="3">Web Applications</span>
              <span class="tech" data-weight="1">Supabase</span>
              <span class="tech" data-weight="1">EC2</span>
              <span class="tech" data-weight="1">PostgreSQL</span>
            </div>
          </div>

          <!-- Row 2 -->
          <div class="tech-cloud-row">
            <div class="tech-cloud" style="animation-duration: 50s; animation-direction: reverse;">
              <span class="tech" data-weight="1">TypeScript</span>
              <span class="tech" data-weight="1">Python</span>
              <span class="tech" data-weight="1">FastAPI</span>
              <span class="tech" data-weight="1">Celery</span>
              <span class="tech" data-weight="1">Expo</span>
              <span class="tech" data-weight="3">Automations</span>
              <span class="tech" data-weight="1">GCS</span>
              <span class="tech" data-weight="1">RDS</span>
            </div>
            <div class="tech-cloud" aria-hidden="true" style="animation-duration: 50s; animation-direction: reverse;">
              <span class="tech" data-weight="1">TypeScript</span>
              <span class="tech" data-weight="1">Python</span>
              <span class="tech" data-weight="1">FastAPI</span>
              <span class="tech" data-weight="1">Celery</span>
              <span class="tech" data-weight="1">Expo</span>
              <span class="tech" data-weight="3">Automations</span>
              <span class="tech" data-weight="1">GCS</span>
              <span class="tech" data-weight="1">RDS</span>
            </div>
          </div>

          <!-- Row 3 -->
          <div class="tech-cloud-row">
            <div class="tech-cloud" style="animation-duration: 60s;">
              <span class="tech" data-weight="1">React</span>
              <span class="tech" data-weight="3">Websites</span>
              <span class="tech" data-weight="1">Docker</span>
              <span class="tech" data-weight="1">Node.js</span>
              <span class="tech" data-weight="1">AWS</span>
              <span class="tech" data-weight="3">Embedded Systems</span>
              <span class="tech" data-weight="1">DynamoDB</span>
              <span class="tech" data-weight="1">Flower</span>
              <span class="tech" data-weight="1">Boto3</span>
            </div>
            <div class="tech-cloud" aria-hidden="true" style="animation-duration: 60s;">
              <span class="tech" data-weight="1">React</span>
              <span class="tech" data-weight="3">Websites</span>
              <span class="tech" data-weight="1">Docker</span>
              <span class="tech" data-weight="1">Node.js</span>
              <span class="tech" data-weight="1">AWS</span>
              <span class="tech" data-weight="3">Embedded Systems</span>
              <span class="tech" data-weight="1">DynamoDB</span>
              <span class="tech" data-weight="1">Flower</span>
              <span class="tech" data-weight="1">Boto3</span>
            </div>
          </div>

          <!-- Row 4 -->
          <div class="tech-cloud-row">
            <div class="tech-cloud" style="animation-duration: 55s; animation-direction: reverse;">
              <span class="tech" data-weight="1">Railway</span>
              <span class="tech" data-weight="1">ACR</span>
              <span class="tech" data-weight="3">AI Workflows</span>
              <span class="tech" data-weight="1">Git</span>
              <span class="tech" data-weight="1">React Native</span>
              <span class="tech" data-weight="1">DigitalOcean</span>
              <span class="tech" data-weight="1">REST APIs</span>
            </div>
            <div class="tech-cloud" aria-hidden="true" style="animation-duration: 55s; animation-direction: reverse;">
              <span class="tech" data-weight="1">Railway</span>
              <span class="tech" data-weight="1">ACR</span>
              <span class="tech" data-weight="3">AI Workflows</span>
              <span class="tech" data-weight="1">Git</span>
              <span class="tech" data-weight="1">React Native</span>
              <span class="tech" data-weight="1">DigitalOcean</span>
              <span class="tech" data-weight="1">REST APIs</span>
            </div>
          </div>
        </div>
      </div>

      <!-- Personal Profile (Retro Theme) -->
      <div v-if="currentTheme === 'retro'" class="highlight">
        <p>
          Welcome to my personal homepage! I'm Josh, a multi-faceted human being living in San Francisco.
        </p>
        <p>
          When I'm not making music or writing code, you'll find me exploring the city, trying new restaurants, hiking in nature, or capturing moments through photography.
        </p>
        <p>
          Life is about experiences, connections, and continuous growth. This space is a collection of moments that matter to me.
        </p>
      </div>
      <p v-if="currentTheme === 'retro'" class="instagram-cta">
        Follow my adventures on
        <a href="https://www.instagram.com/soundsradiant/" target="_blank" class="instagram-link">Instagram</a>
        for photos and updates.
      </p>
    </div>

    <!-- Mark Tree Modal -->
    <div v-if="showMarkTreeModal" class="modal-overlay" @click="showMarkTreeModal = false">
      <div class="modal-content" @click.stop>
        <button class="modal-close" @click="showMarkTreeModal = false">&times;</button>
        <h3>Mark Tree</h3>
        <div class="mark-tree-image-container">
          <img src="/assets/mark-tree.jpg" alt="Mark Tree percussion instrument" class="mark-tree-image" />
        </div>
        <p>
          A mark tree is a percussion instrument used primarily for <span class="gradient-text">musical color</span>. It consists of many small chimes—typically cylinders of solid aluminum or brass tubing about 3/8" in diameter—of varying lengths, hung from a bar. They are played by sweeping a finger or stick through the length of the hanging chimes.
        </p>
        <a href="https://en.wikipedia.org/wiki/Mark_tree" target="_blank" class="wiki-link">Read more on Wikipedia →</a>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import { useTheme } from '../composables/useTheme'

const { currentTheme } = useTheme()
const showMarkTreeModal = ref(false)
</script>

<style scoped>
.about {
  padding: 4rem 2rem;
  background: var(--bg-secondary);
}

.about .container {
  max-width: 800px;
}

.about h2 {
  font-size: 2rem;
  margin-bottom: 2rem;
  font-weight: 600;
}

.about p {
  font-size: 1.125rem;
  color: var(--text-secondary);
  margin-bottom: 1.5rem;
  line-height: 1.8;
}

.highlight {
  background: var(--bg-primary);
  padding: 2rem;
  border-radius: 8px;
  margin-top: 2rem;
}

.highlight p {
  margin: 0 0 2rem 0;
}

.highlight p:last-child {
  margin-bottom: 0;
}

.venue-cloud-wrapper,
.tech-cloud-wrapper {
  overflow: hidden;
  margin: 1.5rem 0 0 0;
  padding: 1rem 0;
  position: relative;
  mask-image: linear-gradient(to right, transparent, black 10%, black 90%, transparent);
  -webkit-mask-image: linear-gradient(to right, transparent, black 10%, black 90%, transparent);
}

.venue-cloud-row,
.tech-cloud-row {
  overflow: hidden;
  margin-bottom: 1rem;
  white-space: nowrap;
}

.venue-cloud-row:last-child,
.tech-cloud-row:last-child {
  margin-bottom: 0;
}

.venue-cloud,
.tech-cloud {
  display: inline-flex;
  flex-wrap: nowrap;
  gap: 1.5rem;
  align-items: center;
  animation: scroll 60s linear infinite;
  white-space: nowrap;
  padding-right: 1.5rem;
}

@keyframes scroll {
  0% {
    transform: translateX(0);
  }
  100% {
    transform: translateX(-50%);
  }
}

.venue,
.tech {
  color: var(--text-secondary);
  font-weight: 500;
  cursor: default;
  line-height: 1.4;
}

.venue-link {
  text-decoration: none;
  cursor: pointer;
}

.venue-link .venue {
  text-decoration: underline;
}

.venue-link:hover .venue {
  color: var(--accent);
}

/* Weight-based sizing */
.venue[data-weight="1"],
.tech[data-weight="1"] {
  font-size: 0.75rem;
  opacity: 0.6;
}

.venue[data-weight="2"],
.tech[data-weight="2"] {
  font-size: 0.95rem;
  opacity: 0.75;
}

.venue[data-weight="3"],
.tech[data-weight="3"] {
  font-size: 1.35rem;
  font-weight: 600;
  opacity: 0.9;
}

.venue[data-weight="4"],
.tech[data-weight="4"] {
  font-size: 1.85rem;
  font-weight: 700;
  opacity: 1;
}

/* Standout venue styling */
.venue.standout {
  color: var(--accent);
  font-style: italic;
  opacity: 1;
}

.mark-tree-link {
  color: var(--accent);
  font-weight: 600;
  text-decoration: underline;
}

.instagram-cta {
  margin-top: 3rem;
}

.instagram-link {
  color: var(--accent);
  font-weight: 600;
}

/* Modal Styles */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.7);
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
  max-width: 600px;
  width: 100%;
  position: relative;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
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
}

.modal-close:hover {
  color: var(--text-primary);
}

.modal-content h3 {
  font-size: 1.75rem;
  margin-bottom: 1rem;
  color: var(--text-primary);
  font-family: var(--font-family, 'Inter', sans-serif);
}

.mark-tree-image-container {
  background: #ffffff;
  padding: 1.5rem;
  border-radius: var(--border-radius-small, 8px);
  margin-bottom: 1.5rem;
  display: flex;
  justify-content: center;
  align-items: center;
}

.mark-tree-image {
  max-width: 150px;
  width: 100%;
  height: auto;
  display: block;
}

.modal-content p {
  font-size: 1.125rem;
  line-height: 1.8;
  color: var(--text-secondary);
  margin-bottom: 1.5rem;
}

.gradient-text {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 25%, #f093fb 50%, #4facfe 75%, #00f2fe 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  font-weight: 600;
  background-size: 200% 200%;
  animation: gradient-shift 3s ease infinite;
}

@keyframes gradient-shift {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

.wiki-link {
  display: inline-block;
  color: var(--accent);
  font-weight: 600;
  text-decoration: none;
  transition: opacity 0.2s;
}

.wiki-link:hover {
  opacity: 0.8;
}

@media (max-width: 768px) {
  .about {
    padding: 3rem 1.5rem;
  }

  .modal-content {
    padding: 2rem;
  }

  .modal-content h3 {
    font-size: 1.5rem;
  }

  .mark-tree-image-container {
    padding: 1rem;
  }

  .mark-tree-image {
    max-width: 100px;
  }

  .modal-content p {
    font-size: 1rem;
  }
}
</style>
