func horner(coefficients: openArray[int], x: int): int =
  var p = 0
  for i in countdown(coefficients.high, 0):
    p = coefficients[i] + x * p
  return p
