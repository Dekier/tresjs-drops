<template>
  <TresCanvas ref="aucanvas" clear-color="#ccc" v-bind="gl" window-size preset="realistic">
    <StatsGl />
    <!-- <Environment ref="environmentTexture" files="images/metro.hdr" :blur="1" /> -->
    <TresPerspectiveCamera :position="[0, 0, 15]" :args="[45, 1, 0.1, 1000]" />
    <OrbitControls />
    <TresDirectionalLight
      :intensity="0.4"
      :position="[30, 20, 10]"
      :color="0xffffff"
      :bias="-0.0001"
    />
    <TresDirectionalLight
      :intensity="0.4"
      :position="[-30, -20, 40]"
      :color="0xffffff"
      :bias="-0.0001"
      castShadow
    />
    <TresHemisphereLight :intensity="1" :color="0xffffff" :ground-color="0xffffff" />
    >
    <!-- <TresPointLight
      ref="pointLight"
      :intensity="200"
      :position="[5, 4, 5]"
      :castShadow="true"
      :color="0xffffff"
      :decay="2"
    /> -->
    <!-- <Model /> -->
    <Icosahedron ref="coneRef" :args="[4, 150]" :position="[0, 0, 0]" :rotation="[Math.PI, 0, 0]">
    </Icosahedron>
    <!-- <Plane ref="planeRef" :args="[100, 100]" :position="[0, 0, -30]" :rotation="[0, 0, 0]"> </Plane> -->
    <!-- <Precipitation
      :position="[0, 0, -10]"
      :area="[100, 50, 10]"
      :randomness="0"
      :speed="0"
      :count="250"
      :size="0.5"
      :color="0x000"
    /> -->
  </TresCanvas>
</template>

<script lang="ts" setup>
import { ref, shallowRef, watch } from 'vue'
import Model from './Model.vue'
import { TresCanvas, useRenderLoop } from '@tresjs/core'
import {
  OrbitControls,
  Icosahedron,
  StatsGl,
  Precipitation,
  Environment,
  Plane
} from '@tresjs/cientos'
const { onLoop } = useRenderLoop()
import {
  MeshPhysicalMaterial,
  Color,
  PCFSoftShadowMap,
  SRGBColorSpace,
  AgXToneMapping
} from 'three'
import { useControls, TresLeches } from '@tresjs/leches'
import '@tresjs/leches/dist/style.css'

const planeRef = ref()
watch(planeRef, (value) => {
  value.value.material = new MeshPhysicalMaterial({
    color: '#121212',
    metalness: 0,
    roughness: 1,
    // thickness: 3.5,
    envMapIntensity: 0.0
    // ior: 1.0,
    // dispersion: 4.0,
    // clearcoat: 3.0,
    // clearcoatRoughness: 0.0
    // envMap: scene.value.environment
  })
})

const { value: colorValue } = useControls({
  color: '#121212'
})

watch(colorValue, () => {
  planeRef.value.value.material.color = new Color(colorValue.value)
})

const gl = {
  // alfa: true,
  shadows: true,
  physicallyCorrectLights: true,
  gammaFactor: 2.2,
  gammaOutput: true,
  outputColorSpace: SRGBColorSpace,
  toneMapping: AgXToneMapping,
  toneMappingExposure: 2.2,
  shadowMapType: PCFSoftShadowMap,
  powerPreference: 'high-performance',
  // stencil: false,
  antialias: true
}
</script>

<style lang="scss">
.aucanvas {
  // z-index: 1 !important;
  // position: absolute !important;
  // left: 50% !important;
  // top: 50% !important;
  // transform: translate(-50%, -50%) !important;
}
</style>
