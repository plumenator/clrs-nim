func sum*[T](values: openArray[T]): T =
  for value in values:
    result += value
