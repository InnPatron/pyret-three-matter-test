import global as G
import js-file("bindings/pythree") as THREE
import js-file("bindings/pymatter") as MATTER
import js-file("animate") as A

scene = THREE.scene()
camera = THREE.perspective-camera-default()
renderer = THREE.web-gl-renderer-default()

box-geom = THREE.box-geom(1, 1, 1)
box-mat = THREE.simple-mesh-basic-mat(65280)
cube = THREE.cube(box-geom, box-mat)

THREE.scene-add(scene, cube)

THREE.set-pos-z(camera, 5)

A.animate(renderer, scene, camera)
