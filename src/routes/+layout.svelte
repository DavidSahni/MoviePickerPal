<script lang="ts">
	import '../app.css';
	let { children } = $props();
</script>

<div class="bg-bluegray h-dvh">
	<div class="bg-oxford-blue flex h-16 w-screen flex-col justify-center p-1.5 shadow shadow-black">
		<div class="pl-8"><p class="prose text-2xl text-gray-300">MoviePickerPal</p></div>
	</div>

	{@render children()}
</div>
