<script lang="ts">
  export let data: { link?: string; display?: string; name: string }[];
</script>

<div class="socials">
  {#each data as s}
    <a href={s.link} data-platform={s.name}>
      {s.display}
    </a>
  {/each}
</div>

<style>
  .socials {
    display: flex;
    flex-direction: column;
  }

  a::before {
    display: inline-block;
    text-align: center;
    width: 12px;
    margin-right: 4px;
    position: relative;
    bottom: -2px;
  }

  a[data-platform='linkedin']::before {
    content: url('../public/icons/linkedin.svg');
  }
  a[data-platform='github']::before {
    content: url('../public/icons/github.svg');
  }
  a[data-platform='phone']::before {
    content: url('../public/icons/phone.svg');
  }
  a[data-platform='address']::before {
    content: url('../public/icons/location.svg');
  }
  a[data-platform='email']::before {
    content: url('../public/icons/email.svg');
  }
</style>
