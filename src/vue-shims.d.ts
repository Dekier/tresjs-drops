import { Gsap } from 'gsap'

declare module '@vue/runtime-core' {
  interface ComponentCustomProperties {
    $gsap: typeof Gsap
  }
}
