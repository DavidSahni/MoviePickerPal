<script lang="ts">
  import StandardTextButton from "./buttons/standardTextButton.svelte";
  import { CheckIfWhitespace } from "$lib/utils/stringUtils";
	interface Props {
		onClick: (arg: string) => void;
	}

	let { onClick, ...others }: Props = $props();
	let input: string = $state('');
  let handleSubmit = (e : Event) => {
    e.preventDefault();
    if (!CheckIfWhitespace(input)){
      onClick(input);
      input='';
    }
  }
</script>

<form onsubmit={handleSubmit}>
  <div class="flex items-center justify-center gap-2">
      <div>
        <input type="text" placeholder="Enter movie name here..." bind:value={input} />
      </div>
      <div>
          <!-- <button
            class="rounded-full border bg-blue-300 px-6 py-1 hover:cursor-pointer hover:bg-blue-200"
          >
            Submit
        </button> -->
        <StandardTextButton text="Submit" onClick={null}/>
      </div>
  </div>
</form>

