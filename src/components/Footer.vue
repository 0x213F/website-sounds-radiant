<template>
  <footer id="contact">
    <div class="container">
      <!-- Music Profile (Vegan Leather Theme) -->
      <template v-if="currentTheme === 'veganLeather'">
        <p>
          Interested in booking?
          <button class="email-button" @click="copyEmail">
            {{ copied ? 'Copied!' : 'Email' }}
          </button>
        </p>
        <p>
          Interested in collaborating?
          <a href="https://www.instagram.com/soundsradiant/" target="_blank">Instagram</a>
        </p>
      </template>

      <!-- Developer Profile (Programmer Theme) -->
      <template v-if="currentTheme === 'programmer'">
        <p>
          Interested in connecting?
          <a href="https://www.linkedin.com/in/joshschultheiss/" target="_blank">LinkedIn</a>
        </p>
      </template>

      <!-- Personal Profile (Retro Theme) -->
      <template v-if="currentTheme === 'retro'">
        <p>
          Interested in connecting?
          <a href="https://www.instagram.com/soundsradiant/" target="_blank">Instagram</a>
        </p>
      </template>
    </div>
  </footer>
</template>

<script setup>
import { ref } from 'vue'
import { useTheme } from '../composables/useTheme'

const { currentTheme } = useTheme()

const email = 'josh@schultheiss.io'
const copied = ref(false)

const copyEmail = async () => {
  try {
    await navigator.clipboard.writeText(email)
    copied.value = true
    setTimeout(() => {
      copied.value = false
    }, 2000)
  } catch (err) {
    console.error('Failed to copy:', err)
  }
}
</script>

<style scoped>
footer {
  background: var(--bg-secondary);
  padding: 3rem 2rem;
  text-align: center;
  border-top: 1px solid var(--border);
}

footer p {
  color: var(--text-secondary);
  margin-bottom: 1rem;
}

footer a {
  color: var(--accent);
  font-weight: 500;
  text-decoration: underline;
}

footer a:hover {
  opacity: 0.8;
}

.email-button {
  background: none;
  border: none;
  color: var(--accent);
  font-weight: 500;
  font-size: inherit;
  font-family: inherit;
  cursor: pointer;
  padding: 0;
  text-decoration: underline;
  transition: all 0.3s ease;
}

.email-button:hover {
  opacity: 0.8;
}

.email-button:active {
  transform: scale(0.98);
}
</style>
