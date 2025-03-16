<script lang="ts">
	interface Props {
		onClick: (arg: string) => void;
	}

	let { onClick, ...others }: Props = $props();
	let input: string = $state('');
</script>

<div class="flex items-center justify-center gap-2">
	<div>
		<input type="text" placeholder="Enter movie name here..." bind:value={input} />
	</div>
	<div>
		<button
			onclick={() => {
				onClick(input);
				input = '';
			}}
			class="rounded-full border bg-blue-300 px-6 py-1 hover:cursor-pointer hover:bg-blue-200"
		>
			Submit
		</button>
	</div>
</div>
