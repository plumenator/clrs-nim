import std/math

func naivePolynomial(coefficients: openArray[int], x: int): int =
  for i, c in coefficients:
    result += c * x ^ i
