function animate(renderer, scene, camera) {
  function innerAnimation(time) {
    requestAnimationFrame( innerAnimation );
    renderer.render(scene, camera);
  }

  innerAnimation();
}

module.exports = {
  'animate': animate,
};
