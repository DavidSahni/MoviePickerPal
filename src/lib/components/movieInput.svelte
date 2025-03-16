<script lang="ts">
  interface Props {
    onClick : (arg : string) => void
  }

  let {onClick, ...others} : Props = $props();
  let input :string = $state('');
</script>

<div class="flex justify-center items-center gap-2">
  <div>
    <input type="text" placeholder="Enter movie name here..." bind:value={input}/>
  </div>
  <div>
    <button onclick={() => {
      onClick(input)
      input = '';
      }} class="bg-blue-300 border px-6 py-1 rounded-full hover:cursor-pointer hover:bg-blue-200">
      Submit
    </button>
  </div>
</div>