# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Professional portfolio website for Josh Schultheiss, a percussionist and musical artist (performing as "Sounds Radiant"). Built with Vue 3 and Vite, deployed on DigitalOcean App Platform with automatic builds from the `main` branch.

## Technology Stack

- **Framework**: Vue 3 (Composition API with `<script setup>`)
- **Build Tool**: Vite 6.x
- **Styling**: Scoped CSS in Vue components + global CSS variables
- **Deployment**: DigitalOcean App Platform with GitHub Actions CI

## Architecture

**Component-Based Structure**: The application is split into reusable Vue components in `src/components/`:
- `Navigation.vue` - Sticky header with smooth scroll navigation
- `Hero.vue` - Main landing section with name and title
- `About.vue` - Biography and Instagram link
- `PlayButton.vue` - Custom audio player with play/pause button, 3-bar visualizer, and timed text reveal
- `AudioCard.vue` - Reusable component for individual audio tracks, uses PlayButton
- `AudioSection.vue` - Grid of audio tracks, uses AudioCard component
- `Footer.vue` - Contact information and social links
- `ThemeSelector.vue` - Floating theme switcher button with dropdown selector

**Composables**: Reusable logic in `src/composables/`:
- `useBackground.js` - Manages random background image selection and localStorage persistence
- `useTheme.js` - Programmatic theme system with 7 pre-defined color schemes

**Responsive Design**: Mobile-first approach with breakpoints at 768px and 480px. Uses CSS Grid for audio cards and Flexbox for navigation.

**Dynamic Background System**: The background image is randomly selected from a predefined list on first visit and stored in localStorage for consistency across sessions. Background is displayed at very low opacity (0.08) as a subtle overlay.

## Development Commands

```bash
# Install dependencies
npm install

# Start development server (hot reload at http://localhost:5173)
npm run dev

# Build for production
npm run build

# Preview production build locally
npm run preview
```

## File Structure

```
├── src/
│   ├── components/          # Vue components
│   │   ├── Navigation.vue
│   │   ├── Hero.vue
│   │   ├── About.vue
│   │   ├── AudioCard.vue
│   │   ├── AudioSection.vue
│   │   └── Footer.vue
│   ├── composables/         # Reusable composition functions
│   │   └── useBackground.js
│   ├── App.vue             # Root component
│   ├── main.js             # Application entry point
│   └── style.css           # Global styles and CSS variables
├── public/
│   └── assets/             # Static assets (images, audio files)
├── .github/workflows/       # GitHub Actions CI/CD
├── .do/                    # DigitalOcean configuration
├── index.html              # HTML entry point
├── vite.config.js          # Vite configuration
└── package.json            # Dependencies and scripts
```

## Design System

**Theming System**: The site uses a comprehensive orchestrated theme system with 3 distinct themed palettes. Each theme changes not just colors, but fonts, border styles, shadows, and component aesthetics:

1. **Vegan Leather** (default)
   - Font: Playfair Display (serif) for headings, Inter for body
   - Style: Rounded corners, warm shadows, elegant and sophisticated
   - Colors: Rich brown leather tones with warm tan accents

2. **Programmer**
   - Font: JetBrains Mono (monospace) for everything
   - Style: Sharp corners, minimal shadows, outlined badges/buttons
   - Colors: Dark VS Code-inspired with cyan/teal accents

3. **Retro**
   - Font: Courier Prime (monospace)
   - Style: No rounded corners, 3D inset/outset borders, underlined headings
   - Colors: Classic 90s gray (#c0c0c0) with blue hyperlinks

**Theme Variables** (CSS custom properties set dynamically):
- **Colors**: `--text-primary`, `--text-secondary`, `--text-light`, `--bg-primary`, `--bg-secondary`, `--accent`, `--border`
- **Typography**: `--font-family` (headings), `--font-body` (body text)
- **Styles**: `--border-radius`, `--border-radius-small`, `--shadow-style`
- **Theme Class**: Body gets class `theme-{name}` for conditional styling

**Fonts Loaded**: Inter, Playfair Display, JetBrains Mono, Courier Prime, Roboto

**Switching Themes**:
- Click the floating "Themes" button in the bottom-right corner
- Select any theme from the dropdown
- Theme preference is saved to localStorage
- Components automatically adapt fonts, borders, shadows, and styles

**Adding New Themes**:
Edit `src/composables/useTheme.js` and add to the `themes` object with color, typography, and style properties. Components will automatically use theme-specific CSS classes for conditional styling.

## Audio Files

Audio tracks are defined in `src/components/AudioSection.vue` as a reactive array. To add or modify tracks:

1. Add MP3 files to `public/assets/audio/`
2. Update the `tracks` array in AudioSection.vue with:
   - `genre`: Genre label (displayed in uppercase)
   - `title`: Track title
   - `description`: Track description
   - `audioSrc`: Path to audio file (e.g., `/assets/audio/filename.mp3`)

Current placeholder tracks: jazz-fusion-sample.mp3, funk-groove-sample.mp3, bossa-nova-sample.mp3, jam-band-sample.mp3, samba-sample.mp3, rock-sample.mp3

## Deployment

**Platform**: DigitalOcean App Platform

**Build Configuration**:
- Build command: `npm run build`
- Output directory: `dist`
- Auto-deploy on push to `main` branch

**Repository**: 0x213F/website-sounds-radiant

The build process is configured in `.do/app.yaml` and will automatically:
1. Install dependencies
2. Run the Vite build
3. Deploy the `dist` folder as a static site

## Component Development

When creating new components:
- Use Composition API with `<script setup>`
- Define props with `defineProps()` for type safety
- Use scoped styles to avoid CSS conflicts
- Access CSS variables from global scope via `var(--variable-name)`
- Follow the existing naming conventions and structure

## Key Implementation Details

**Background Image Selection** (src/composables/useBackground.js): Uses Vue's `onMounted` lifecycle hook to set background from localStorage or random selection.

**Smooth Scrolling** (src/components/Navigation.vue): Click handlers prevent default anchor behavior and use `scrollIntoView()` for smooth navigation.

**Custom Audio Player** (src/components/PlayButton.vue):
- Custom styled play/pause button with bounce animation on hover
- 3-bar animated visualizer that activates when music plays (Apple-style bars)
- Text reveal mechanism: After 8 seconds of playback, hidden message appears and stays visible
- Uses Vue's `ref` and `onTimeUpdate` event to track playback time
- Text stays revealed across replays until page refresh

**Audio Player Animation**: Play button grows on hover with bounce effect. Visualizer bars animate up/down while playing using staggered CSS animations (0s, 0.15s, 0.3s delays).
