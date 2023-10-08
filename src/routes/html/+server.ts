import { generateHTML } from '../../lib/generate';

export async function POST({ request, url }: any) {
  const body = await request.json();
  const target = url.searchParams.get('target');
  const html = await generateHTML(body.data, body.options, target);

  return new Response(html, {
    headers: {
      'Content-Type': 'text/html',
    },
  });
}
