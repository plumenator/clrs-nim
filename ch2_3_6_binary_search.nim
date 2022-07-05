import std/options

func binarySearchInternal[T](haystack: openArray[T], needle: proc (value: T): bool {.noSideEffect.}, first, last: int): Option[int] =
  if first > last:
    return none(int)
  if first == last:
    if needle(haystack[first]):
      return some(first)
    else:
      return none(int)
  let mid = (first + last) /% 2
  let left = haystack.binarySearchInternal(needle, mid + 1, last)
  let right = haystack.binarySearchInternal(needle, first, mid)
  if left.is_some:
    left
  else:
    right

func binarySearch*[T](haystack: openArray[T], needle: proc (value: T): bool {.noSideEffect.}): Option[int] =
  haystack.binarySearchInternal(needle, 0, haystack.len - 1)
