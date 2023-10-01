<script lang="ts">
  export let title: string;
  export let details: string;
</script>

<div>
  <div class="title">{title}</div>
  {#if details}
    <div>{details}</div>
  {/if}
</div>

<style>
  .title {
    font-size: var(--fzf-h3);
    font-weight: bold;
  }
</style>
