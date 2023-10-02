<script lang="ts">
  import Markdown from '../../lib/markdown.svelte';

  export let questions: Array<{
    contents: Array<{ text: string; image: string; prompt: string }>;
    marks: number;
  }>;
</script>

<table>
  <tbody>
    {#each questions as question, number}
      <tr>
        <td class="align-top px-3 py-2">Q{number + 1}.</td>
        <td class="p-2">
          {#each question.contents as content, index}
            {#if index > 0}
              <br />
              <p class="text-center">OR</p>
              <br />
            {/if}

            <Markdown source={content.text} />

            {#if content.image}
              <br />
              <img
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
          {/each}
        </td>
        <td class="align-top px-3 py-2">{question.marks}</td>
      </tr>
    {/each}
  </tbody>
</table>

<style>
  table,
  th,
  td {
    border: 1px black solid;
  }
</style>
