<script lang="ts">
	import '../app.css';
	let { children } = $props();
</script>
<div class="h-dvh bg-bluegray">
  <div class="flex flex-col justify-center w-screen h-16 p-1.5 bg-oxford-blue shadow shadow-black">
    <div class="pl-8"><p class="prose text-2xl text-gray-300">MoviePickerPal</p></div>
  </div>

  {@render children()}
</div>
