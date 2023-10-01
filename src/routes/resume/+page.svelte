<script lang="ts">
  import data from '../../../dist/resume-data.json';

  import Header from '../../lib/header.svelte';
  import Skills from './skills.svelte';
  import Work from './work.svelte';
  import Achieve from './acheievements.svelte';
  import Contact from './contacts.svelte';
  import Education from './education.svelte';
  import Section from './section.svelte';
</script>

<div class="app">
  <Header name={data.personal.name} />

  <div class="cols">
    <div class="c0">
      <Section name="Experience">
        {#each data.work_exp as work}
          <Work {...work} />
        {/each}
      </Section>

      <Section name="Projects">
        {#each data.projects as w}
          <Work {...w} />
        {/each}
      </Section>
    </div>

    <div class="c1">
      <Section name="Contact">
        <Contact data={data.personal.socials} />
      </Section>
      <Section name="Education">
        {#each data.education as e}
          <Education {...e} />
        {/each}
      </Section>
      <Section name="Skills">
        {#each data.skill_groups as sg}
          <Skills {...sg} />
        {/each}
      </Section>
      <Section name="Achievements">
        {#each data.achievements as a}
          <Achieve {...a} />
        {/each}
      </Section>
    </div>
  </div>
  {#if data.hidden_text != undefined}
    <div class="hidden-text">{data.hidden_text}</div>
  {/if}
</div>

<style>
  .app {
    box-sizing: border-box;
    /* letter size */
    max-width: 8.5in;
    font-family: 'Arial';
    font-size: var(--fsz-normal);
    color: var(--fg);
    line-height: 1.4;
    margin: 0 auto;
    background-color: #fff;
  }

  @page {
    margin: 0.5in 0.7in;
  }

  @media not print {
    .app {
      padding: 20px;
    }
  }

  @media print, (min-width: 8in) {
    .c1 {
      flex: 0 0 35%;
      margin-left: 25pt;
    }
    .c0 {
      flex: 0 0 calc(65% - 25pt);
    }
  }
  @media screen and (max-width: 8in) {
    .app {
      max-width: 5in;
    }
    .cols {
      flex-direction: column;
    }
    .c0 {
      margin-top: 20pt;
    }
  }

  .cols {
    display: flex;
    /* gap: 20pt; */
  }
  .hidden-text {
    font-size: 0.01px;
  }
</style>
