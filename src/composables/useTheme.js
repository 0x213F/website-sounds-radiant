import { ref, computed, watch, onMounted } from 'vue'

const themes = {
  // Vegan Leather theme - Music Profile
  veganLeather: {
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
    badgeStyle: 'rounded',
    buttonStyle: 'rounded',
    // Content
    content: {
      heroTitle: 'Josh Schultheiss',
      heroSubtitle: 'Music Performance',
      showAudio: true,
      navSections: ['about', 'music']
    }
  },

  // Programmer/terminal theme - Developer Profile
  programmer: {
    name: 'Cold Metal',
    textPrimary: '#d4d4d4',
    textSecondary: '#9cdcfe',
    textLight: '#808080',
    bgPrimary: '#1e1e1e',
    bgSecondary: '#252526',
    accent: '#4ec9b0',
    border: '#3e3e42',
    // Typography
    fontFamily: '"JetBrains Mono", monospace',
    fontBody: '"JetBrains Mono", monospace',
    // Style properties
    borderRadius: '4px',
    borderRadiusSmall: '2px',
    shadowStyle: '0 2px 8px rgba(0, 0, 0, 0.6)',
    badgeStyle: 'sharp',
    buttonStyle: 'sharp',
    // Content
    content: {
      heroTitle: 'Josh Schultheiss',
      heroSubtitle: 'Software Development',
      showAudio: false,
      navSections: ['about', 'projects']
    }
  },

  // Retro theme - Personal Profile (Photos, Life)
  retro: {
    name: 'Retro',
    textPrimary: '#000000',
    textSecondary: '#0000ff',
    textLight: '#009900',
    bgPrimary: '#ffff66',
    bgSecondary: '#ffcccc',
    accent: '#ff0000',
    border: '#0000ff',
    // Typography
    fontFamily: '"Courier Prime", monospace',
    fontBody: '"Courier Prime", monospace',
    // Style properties
    borderRadius: '0px',
    borderRadiusSmall: '0px',
    shadowStyle: 'inset 2px 2px 0px #ffff00, inset -2px -2px 0px #ff0000',
    badgeStyle: 'retro',
    buttonStyle: 'retro',
    // Content
    content: {
      heroTitle: 'Josh Schultheiss',
      heroSubtitle: 'Human Being',
      showAudio: false,
      navSections: ['about', 'photos']
    }
  },

  // Heartthrob theme - Personal/Romantic Profile
  heartthrob: {
    name: 'Heartthrob',
    textPrimary: '#fce7e7',
    textSecondary: '#e8b4b8',
    textLight: '#c99195',
    bgPrimary: '#2d1618',
    bgSecondary: '#3d2224',
    accent: '#d4878d',
    border: '#5a3639',
    // Typography - Option 1: Pacifico + Poppins (Romantic Script)
    fontFamily: '"Pacifico", cursive',
    fontBody: '"Poppins", sans-serif',
    // Typography - Option 2: Cormorant Garamond + Montserrat (Elegant & Soft)
    // fontFamily: '"Cormorant Garamond", serif',
    // fontBody: '"Montserrat", sans-serif',
    // Typography - Option 3: Lora + Raleway (Modern Romantic)
    // fontFamily: '"Lora", serif',
    // fontBody: '"Raleway", sans-serif',
    // Typography - Option 4: Crimson Text + Source Sans Pro (Classic Love Letter)
    // fontFamily: '"Crimson Text", serif',
    // fontBody: '"Source Sans Pro", sans-serif',
    // Style properties
    borderRadius: '16px',
    borderRadiusSmall: '10px',
    shadowStyle: '0 10px 30px rgba(212, 135, 141, 0.15)',
    badgeStyle: 'rounded',
    buttonStyle: 'rounded',
    // Content
    content: {
      heroTitle: 'Josh Schultheiss',
      heroSubtitle: 'Personal Life',
      showAudio: false,
      navSections: ['about', 'moments']
    }
  }
}

const currentTheme = ref('veganLeather')

export function useTheme() {
  const applyTheme = (themeName) => {
    const theme = themes[themeName]
    if (!theme) return

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

    // Set theme class on body for conditional styling
    document.body.className = `theme-${themeName}`
  }

  const setTheme = (themeName) => {
    currentTheme.value = themeName
    applyTheme(themeName)
    localStorage.setItem('selectedTheme', themeName)
  }

  // Load saved theme on mount
  onMounted(() => {
    const savedTheme = localStorage.getItem('selectedTheme') || 'veganLeather'
    currentTheme.value = savedTheme
    applyTheme(savedTheme)
  })

  // Computed property to get current theme object
  const currentThemeData = computed(() => themes[currentTheme.value])

  // Computed property to get current theme content
  const currentContent = computed(() => themes[currentTheme.value]?.content || {})

  return {
    currentTheme,
    currentThemeData,
    currentContent,
    themes,
    setTheme,
    applyTheme
  }
}
