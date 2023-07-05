import std/options

func linearSearch*[T](haystack: openArray[T], needle: T): Option[int] =
  for i, n in haystack:
    if n == needle:
      return some(i)
  return none(int)
