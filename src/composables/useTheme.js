import { computed } from 'vue'

// Single music-focused theme. The theme selector and the alternate
// profiles (programmer / retro / heartthrob) were removed.
const theme = {
  name: 'Vegan Leather',
  textPrimary: '#e4d5c1',
  textSecondary: '#c4ae94',
  textLight: '#9d8770',
  bgPrimary: '#1a1108',
  bgSecondary: '#2f2419',
  accent: '#a8845f',
  border: '#3d2f22',
  // Typography
  fontFamily: '"Playfair Display", serif',
  fontBody: '"Inter", sans-serif',
  // Style properties
  borderRadius: '12px',
  borderRadiusSmall: '8px',
  shadowStyle: '0 8px 24px rgba(0, 0, 0, 0.4)',
  // Content
  content: {
    heroTitle: 'Josh Schultheiss',
    heroSubtitle: 'Music Performance'
  }
}

export function useTheme() {
  const applyTheme = () => {
    const root = document.documentElement

    // Colors
    root.style.setProperty('--text-primary', theme.textPrimary)
    root.style.setProperty('--text-secondary', theme.textSecondary)
    root.style.setProperty('--text-light', theme.textLight)
    root.style.setProperty('--bg-primary', theme.bgPrimary)
    root.style.setProperty('--bg-secondary', theme.bgSecondary)
    root.style.setProperty('--accent', theme.accent)
    root.style.setProperty('--border', theme.border)

    // Typography
    root.style.setProperty('--font-family', theme.fontFamily)
    root.style.setProperty('--font-body', theme.fontBody)

    // Style properties
    root.style.setProperty('--border-radius', theme.borderRadius)
    root.style.setProperty('--border-radius-small', theme.borderRadiusSmall)
    root.style.setProperty('--shadow-style', theme.shadowStyle)

    document.body.className = 'theme-veganLeather'
  }

  const currentContent = computed(() => theme.content)

  return {
    currentContent,
    applyTheme
  }
}
