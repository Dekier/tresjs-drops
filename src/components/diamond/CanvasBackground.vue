<template>
  <TresCanvas ref="aucanvas" clear-color="#ccc" v-bind="gl" window-size preset="realistic">
    <StatsGl />
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
    <Icosahedron ref="coneRef" :args="[4, 150]" :position="[0, 0, 0]" :rotation="[Math.PI, 0, 0]">
    </Icosahedron>
  </TresCanvas>
</template>

<script lang="ts" setup>
import { TresCanvas, useRenderLoop } from '@tresjs/core'
import { OrbitControls, Icosahedron, StatsGl } from '@tresjs/cientos'
const { onLoop } = useRenderLoop()
import {
  MeshPhysicalMaterial,
  Color,
  PCFSoftShadowMap,
  SRGBColorSpace,
  AgXToneMapping
} from 'three'

const gl = {
  shadows: true,
  physicallyCorrectLights: true,
  gammaFactor: 2.2,
  gammaOutput: true,
  outputColorSpace: SRGBColorSpace,
  toneMapping: AgXToneMapping,
  toneMappingExposure: 2.2,
  shadowMapType: PCFSoftShadowMap,
  powerPreference: 'high-performance',
  antialias: true
}
</script>
