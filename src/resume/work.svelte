<script lang="ts">
  import Columnar from '../lib/columnar.svelte';
  import Markdown from '../lib/markdown.svelte';
  export let title: string;
  export let duration: string;
  export let company: string | undefined;
  export let summary: string | undefined;
  export let link: string | undefined;
  export let details: string;
</script>

<div class="work">
  <Columnar>
    <span class="title">{title}</span>
    {#if duration}
      <span>{duration}</span>
    {/if}
  </Columnar>
  {#if company}
    <div class="company">{company}</div>
  {/if}
  {#if summary}
    <div class="summary">{summary}</div>
  {/if}
  {#if link}
    <a href={link}>{link}</a>
  {/if}
  {#if details}
    <Markdown source={details} />
  {/if}
</div>

<style>
  /* .work {
    background: #eee;
    padding: 5px 10px;
  } */
  .title {
    font-size: var(--fsz-h2);
    color: var(--fg-dark);
    font-weight: bold;
  }

  .company,
  .summary {
    font-size: var(--fsz-h3);
  }
</style>
