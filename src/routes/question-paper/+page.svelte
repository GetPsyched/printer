<script lang="ts">
  import { title, subtitle, questions } from '../../../dist/data.json';

  import Information from './information.svelte';
  import Questions from './questions.svelte';
</script>

<main class="box-border flex flex-col max-w-[8.5in]">
  <hgroup>
    <h1 class="font-bold text-center text-md">{title}</h1>
    <p class="font-bold text-center text-md">{subtitle}</p>
  </hgroup>

  <br />
  <Information />
  <br />

  <br />
  <Questions {questions} />
</main>
