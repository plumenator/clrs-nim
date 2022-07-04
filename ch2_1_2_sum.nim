func sum*[T](values: openArray[T]): T =
  var result = 0
  for value in values:
    result += value
  return result
