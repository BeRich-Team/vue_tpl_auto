<template>
    <div class="home">
        <img alt="Vue logo" src="../../assets/images/logo.png" />
        <HelloWorld msg="vue模板项目，不允许写任何业务，只谈架构" />
    </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/demo/HelloWorld.vue'

export default {
    name: 'Home',
    components: {
        HelloWorld,
    },
}
</script>
