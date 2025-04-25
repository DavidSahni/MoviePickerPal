<script lang="ts">
	interface Props {
		text: string;
		onClick: any | null;
		disabled?: boolean;
	}
	let { text, onClick = null, disabled = false }: Props = $props();
</script>

<button
	class="rounded-full border bg-blue-300 px-6 py-1
		{disabled ? '' : 'hover:cursor-pointer hover:bg-blue-200'}"
	onclick={onClick}
	{disabled}
>
	{text}
</button>
