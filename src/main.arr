import global as G
import js-file("bindings/pythree") as THREE
import js-file("bindings/pymatter") as MATTER
import js-file("animate") as A
import js-file("helpers") as H

scene = THREE.scene()
camera = THREE.perspective-camera-default()
renderer = THREE.web-gl-renderer-default()

box-geom = THREE.box-geom(1, 1, 1)
box-mat = THREE.simple-mesh-basic-mat(65280)
cube = THREE.cube(box-geom, box-mat)

ground-geom = THREE.box-geom(10, 1, 1)
ground-mat = THREE.simple-mesh-basic-mat(65280)
ground = THREE.cube(ground-geom, ground-mat)

THREE.scene-add(scene, cube)
THREE.scene-add(scene, ground)

THREE.set-pos-y(ground, -2)
THREE.set-pos-z(camera, 5)

context = { cube: cube }
animator = lam(shadow context):
  block:
    nothing
  end
end

A.animate(renderer, scene, camera, animator, context)
