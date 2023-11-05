<script lang="ts">
  import Markdown from '../lib/markdown.svelte';

  export let questions: Array<{
    contents: Array<{ text: string; image: string; prompt: string }>;
    marks: string | number;
  }>;
</script>

<table class="w-full">
  <tbody>
    {#each questions as question, number}
      {#each question.contents as content, index}
        {#if index > 0}
          <tr>
            <td />
            <td><p class="text-center">OR</p></td>
            <td />
          </tr>
        {/if}

        <tr>
          <td class="align-top">
            Q{number + 1}.
          </td>

          <td>
            <Markdown source={content.text} />

            {#if content.image}
              <br />
              <img
                alt="some dynamic asset that didn't load."
                class="mx-auto"
                height="384"
                width="384"
                src={content.image}
              />
              <br />
            {/if}

            {#if content.prompt}
              <p class="text-right">[ {content.prompt} ]</p>
            {/if}
          </td>

          <td class="align-top text-center">
            {question.marks}
          </td>
        </tr>
      {/each}
    {/each}
  </tbody>
</table>

<style>
  table,
  td {
    border: 1px black solid;
    padding: 0.5rem 0.75rem;
  }
</style>
