import { exec } from 'child_process';
import { mkdirSync, readFileSync, writeFileSync } from 'fs';
import prince from 'prince';

import CSS from '../../public/global.css?raw';
import HTML from '../app.html?raw';

export async function POST({ request, url }: any) {
  const body = await request.json();

  const component = await import(
    `../${url.searchParams.get('target')}/page.svelte`
  );
  const ssg = component.default.render({ data: body.data });

  let tailwindcss = '';
  if (body.options.use_tailwindcss == true) {
    await exec('bunx tailwindcss -i ./src/app.css -o ./dist/tailwind.css');
    tailwindcss = (await import('../../dist/tailwind.css?raw')).default;
  }

  const finalHtml = HTML.replace(
    '%sveltekit.head%',
    `<style>${CSS}\n${ssg.css.code}\n${tailwindcss}</style>`
  ).replace('%sveltekit.body%', ssg.html);
  mkdirSync('dist', { recursive: true });
  writeFileSync('dist/index.html', finalHtml);

  await prince()
    .cwd('dist')
    .inputs('index.html')
    .output('output.pdf')
    .execute();

  return new Response(readFileSync('dist/output.pdf'), {
    headers: {
      'Content-Type': 'application/pdf',
    },
  });
}
