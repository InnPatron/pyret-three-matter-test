var MATTER = require('matter-js');


module.exports = {
  'create-engine': function() {
    return MATTER.Engine.create();
  },

  'rectangle': function(x, y, width, height, staticBody) {
    return MATTER.Bodies.rectangle(x, y, width, height, { isStatic: staticBody });
  },

  'set-restitution': function(body, restitution) {
    body.restitution = restitution;
  },

  'add-to-world': function(engine, bodies) {
    MATTER.World.add(engine.world, bodies);
  },

  'run-engine': function(engine) {
    MATTER.Engine.run(engine);
  },

  'get-pos': function(body) {
    return MATTER.Vector.clone(body.position);
  },
};
