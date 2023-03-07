

function setup() {
    createCanvas(1200, 1700)
    // noLoop()
}

let time = 0

function draw() {

  let red = g.rgbColor(.95, 0.33333, 0.31373, 1.0)
  let blue = g.rgbColor(0.19216, 0.44706, 0.67451, 1.0)

  background(233, 227, 213)

  let circleMain = g.ellipse({x: 390, y: 800}, 700, 700);
  circleMain.fill = red

  let mainRect = g.rect({x: 735, y: 800}, 300, 600);
  mainRect.fill = red;
  let union = g.compound(circleMain, mainRect, 'difference')

  let roundedRect = g.rect({x: 300, y: 550}, 150, 600, 55)
  roundedRect.fill = blue
  union = g.compound(union, roundedRect, 'difference')

  let roundedRect2 = g.rect({x: 535, y: 1100}, 250, 600, 55)
  roundedRect2.fill = blue
  union = g.compound(union, roundedRect2, 'difference')
  
  let roundRect3 = g.rect({x: 535, y: 900}, 250, 600, 55)
  roundRect3.fill = blue
  let roundedPart = g.compound(union, roundRect3, 'intersection')

  let circleSmall = g.ellipse({x: 490, y: 688}, 242, 242);
  circleSmall.fill = blue
  let circleSmallCuttingPiece = g.rect({x: 490, y: 500}, 230, 500)
  circleSmallCuttingPiece.fill = blue
  let cuttingPiece1 = g.compound(circleSmallCuttingPiece, circleSmall, 'difference')
  cuttingPiece1.fill = blue

  union = g.compound(union, cuttingPiece1, 'difference')

  let additionalCirclePart = g.compound(circleSmall, union, 'difference')
  additionalCirclePart.fill = blue
  let cleanupPiece = g.rect({x: 380, y:700}, 30, 150)
  additionalCirclePart = g.compound(additionalCirclePart, cleanupPiece, 'difference')

  union = g.compound(union, additionalCirclePart, 'union')
  
  cleanupPiece = g.rect({x: 550, y:800}, 200, 200)
  cleanupPiece = g.compound(cleanupPiece, circleSmall, 'difference')

  union = g.compound(union, cleanupPiece, 'difference')

  // RECUT initial rounded rect
  fillingRect =  g.rect({x: 400, y: 730}, 50, 150)
  finalLeftPiece = g.compound(union, fillingRect, 'union')

  finalRightPiece = g.compound(circleMain, finalLeftPiece, 'difference')

  finalRightPiece = g.translate(finalRightPiece, {x:220, y:-100})
  finalLeftPiece = g.translate(finalLeftPiece, {x:0, y:195})

  finalLeftPiece.fill = red
  finalLeftPiece.draw(drawingContext)
  finalRightPiece.fill = blue
  finalRightPiece.draw(drawingContext)

  // TODO : animate curves according to sin function

  leftPiecePoints = g.toPoints(finalLeftPiece)

  // stroke(255, 0, 0)
  for (let i=0; i<leftPiecePoints.length; i++) {
    // find slope
    let pt = leftPiecePoints[i]
    // noStroke()
    // fill(0, 0, 0)
    // ellipse(pt.x, pt.y, 5, 5)
  }
  // TODO: text, and animation of boolean operations

  time += .01

  if (time >= 1) {
    time = 0
  }


  noStroke()
  fill(75, 68, 67)
  // color()
  textFont('Arial')
  select('canvas').elt.style.letterSpacing = "-1.5px"
  textSize(60)
  text('Technology', 40, 100)

  textSize(60)
  text('Policy Program at MIT', 420, 100)

  stroke(75, 68, 67)
  strokeCap(SQUARE)
  strokeWeight(5)
  line(370, 60, 370, 100)
  line(350, 80, 390, 80)

  noStroke()
  fill(213, 207, 193)
  rect(230, 160, 180, 475)

  rect(460, 1130, 180, 495)

}