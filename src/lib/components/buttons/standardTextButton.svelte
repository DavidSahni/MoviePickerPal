<script lang="ts">
	interface Props {
		text: string;
		onClick: any | null;
	}
	let { text, onClick = null }: Props = $props();
</script>

<button
	class="rounded-full border bg-blue-300 px-6 py-1 hover:cursor-pointer hover:bg-blue-200"
	onclick={onClick}
>
	{text}
</button>
