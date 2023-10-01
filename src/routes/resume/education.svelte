<script lang="ts">
  import Columnar from '../../lib/columnar.svelte';

  export let school: string;
  export let duration: string;
  export let course: string | undefined;
  export let score: string;
</script>

<div>
  <div class="title">{school}</div>
  {#if course}
    {course}
  {/if}
  <Columnar>
    <span>{duration}</span>
    <span>{score}</span>
  </Columnar>
</div>

<style>
  .title {
    font-size: var(--fzf-h3);
    font-weight: bold;
  }
</style>
