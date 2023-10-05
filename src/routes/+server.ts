export async function POST({ request, cookies }: any) {
  const { data } = await request.json();

  return new Response(JSON.stringify(data), {
    headers: {
      'Content-Type': 'application/json',
    },
  });
}
