<script lang="ts">
  import Information from './information.svelte';
  import Questions from './questions.svelte';

  export let data: {
    title: string;
    subtitle: string;
    date: { day: number; month: string; year: number };
    programme: string;
    course: { name: string; code: string };
    semester: number;
    pages: number;
    time: string;
    note: string;
    'attempt-any': number;
    questions: Array<{
      contents: Array<{ text: string; image: string; prompt: string }>;
      marks: string | number;
    }>;
  };

  if (data['attempt-any']) {
    if (data.note) {
      console.warn('Existing note is being overwritten by `attempt-any`');
    }
    data.note = `Attempt any ${data['attempt-any']} questions.`;
  }
</script>

<main class="box-border mt-12 mx-auto max-w-[8.5in]">
  <hgroup>
    <h1 class="font-bold text-center text-md">{data.title}</h1>
    <p class="font-bold text-center text-md">{data.subtitle}</p>
  </hgroup>

  <br />
  <Information questionPaper={data} />
  <br />

  {#if data.note}
    <p><strong>Note:</strong> {data.note}</p>
  {/if}

  <br />
  <Questions questions={data.questions} />
</main>
