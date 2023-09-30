import { defineConfig } from 'vite';
import { svelte, vitePreprocess } from '@sveltejs/vite-plugin-svelte';

export default defineConfig({
  build: {
    rollupOptions: {
      input: {
        app: 'src/app.html',
        ssr: 'src/lib/ssr.ts',
      },
    },
  },
  plugins: [
    svelte({
      preprocess: vitePreprocess(),
    }),
  ],
  publicDir: 'public',
});
