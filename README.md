# Josh Schultheiss - Portfolio Website

Professional portfolio website for percussionist and musical artist Josh Schultheiss (Sounds Radiant).

## Technology Stack

- **Vue 3** - Modern JavaScript framework with Composition API
- **Vite** - Fast build tool and dev server
- **DigitalOcean App Platform** - Hosting and deployment

## Getting Started

### Prerequisites

- Node.js 20.x or higher
- npm (comes with Node.js)

### Installation

```bash
# Install dependencies
npm install
```

### Development

```bash
# Start development server with hot reload
npm run dev
```

Visit `http://localhost:5173` to view the site locally.

### Build

```bash
# Build for production
npm run build

# Preview production build
npm run preview
```

The build output will be in the `dist/` directory.

## Project Structure

```
├── src/
│   ├── components/          # Vue components
│   │   ├── Navigation.vue   # Sticky navigation header
│   │   ├── Hero.vue        # Hero section
│   │   ├── About.vue       # About section
│   │   ├── AudioCard.vue   # Reusable audio player card
│   │   ├── AudioSection.vue # Audio section with grid
│   │   └── Footer.vue      # Footer with contact info
│   ├── composables/         # Reusable Vue composables
│   │   └── useBackground.js # Background image logic
│   ├── App.vue             # Root component
│   ├── main.js             # Application entry
│   └── style.css           # Global styles
├── public/
│   └── assets/             # Static assets (images, audio)
├── .github/workflows/       # CI/CD workflows
└── .do/                    # DigitalOcean config

```

## Adding Audio Files

1. Place MP3 files in `public/assets/audio/`
2. Edit `src/components/AudioSection.vue`
3. Update the `tracks` array with your audio file details

## Deployment

The site automatically deploys to DigitalOcean App Platform when you push to the `main` branch.

### Manual Deployment

If you need to manually trigger a deployment, push your changes to the `main` branch:

```bash
git add .
git commit -m "Your commit message"
git push origin main
```

## Design Customization

- **Colors**: Edit CSS variables in `src/style.css`
- **Typography**: Change font in `index.html` and update `src/style.css`
- **Content**: Edit individual Vue components in `src/components/`

## License

Private project for Josh Schultheiss.
