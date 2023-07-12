proc merge[T](keys: var openArray[T], first, mid, last: int): int =
  let left = keys[first..mid]
  let right = keys[mid + 1..last]
  var (i, j, k, inversions) = (0, 0, first, 0)
  while i < left.len and j < right.len:
    if left[i] <= right[j]:
      keys[k] = left[i]
      inc i
    else:
      keys[k] = right[j]
      inc j
      inversions += left.len - i
    inc k

  for l in left[i..^1]:
    keys[k] = l
    inc k

  for r in right[j..^1]:
    keys[k] = r
    inc k

  inversions

proc countInversionsInternal[T](keys: var openArray[T], first, last: int): int =
  if first >= last:
    return 0
  let mid = (first + last) /% 2
  keys.countInversionsInternal(first, mid) + 
  keys.countInversionsInternal(mid + 1, last) +
  keys.merge(first, mid, last)

proc countInversions*[T](keys: openArray[T]): int =
  var keys = keys[0..^1]
  keys.countInversionsInternal(keys.low, keys.high)

when isMainModule:
  import std/sequtils

  var input: seq[int]
  doAssert countInversions(input) == 0

  doAssert countInversions(@[-1]) == 0

  doAssert countInversions(@[-1, -2]) == 1

  doAssert countInversions(@[-1, -1]) == 0

  doAssert countInversions(@[3, 2, 1]) == 3

  doAssert countInversions(@[-1, -2, 4, 1, 5, 7, 6, 9, 0, 10, -111]) == 19

