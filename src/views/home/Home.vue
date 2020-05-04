<template>
    <div class="home">
        <img alt="Vue logo" src="../../assets/images/logo.png" />
        <HelloWorld msg="兔宝宝项目初始化，请开始你的表演" />
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
