import global as G
import list as L
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

THREE.set-pos-y(cube, 2)
THREE.set-pos-y(ground, -5)

THREE.set-pos-z(camera, 20)

engine = MATTER.create-engine()

# Create colliders
cubeCollider = MATTER.rectangle(0, -2, 1, 1, false)
MATTER.set-restitution(cubeCollider, 0)

groundCollider = MATTER.rectangle(0, 5, 10, 3/2, true)
MATTER.set-restitution(groundCollider, 0)

MATTER.add-to-world(engine, [L.list: cubeCollider, groundCollider])
MATTER.run-engine(engine)

context = { cube: cube, cubeCollider: cubeCollider }
animator = lam(shadow context):
  block:
    new-pos = MATTER.get-pos(context.cubeCollider)
    THREE.set-pos-x(context.cube, new-pos.x)
    THREE.set-pos-y(context.cube, 0 - new-pos.y)
    
    nothing
  end
end

A.animate(renderer, scene, camera, animator, context)
