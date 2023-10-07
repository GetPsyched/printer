import { mkdirSync, readFileSync, writeFileSync } from 'fs';
import prince from 'prince';

import TAILWINDCSS from '../../../dist/tailwind.css?raw';
import CSS from '../../../public/global.css?raw';
import HTML from '../../app.html?raw';

export async function POST({ request, url }: any) {
  const body = await request.json();
  const target = url.searchParams.get('target');

  const component = await import(`../../${target}/page.svelte`);
  const ssg = component.default.render({ data: body.data });

  let cssFiles = [CSS, ssg.css.code];
  if (body.options.use_tailwindcss == true) {
    cssFiles.push(TAILWINDCSS);
  }

  const finalHtml = HTML.replace(
    '%sveltekit.head%',
    `<style>${cssFiles.join('\n')}</style>`
  ).replace('%sveltekit.body%', ssg.html);
  mkdirSync('dist', { recursive: true });
  writeFileSync(`dist/${target}.html`, finalHtml);

  await prince()
    .license('./prince-license.xml')
    .inputs(`dist/${target}.html`)
    .output('dist/output.pdf')
    .execute();

  return new Response(readFileSync('dist/output.pdf'), {
    headers: {
      'Content-Type': 'application/pdf',
    },
  });
}
