proc merge[T](keys: var openArray[T], first, mid, last: int) =
  let left = keys[first..mid]
  let right = keys[mid + 1..last]
  var (i, j, k) = (0, 0, first)
  while i < left.len and j < right.len:
    if left[i] < right[j]:
      keys[k] = left[i]
      inc i
    else:
      keys[k] = right[j]
      inc j
    inc k
  keys[k..] = left[i..^1]
  keys[k + left.len - i..] = right[j..^1]

proc mergeSortInternal[T](keys: var openArray[T], first, last: int) =
  if first >= last:
    return
  let mid = (first + last) /% 2
  keys.mergeSortInternal(first, mid)
  keys.mergeSortInternal(mid + 1, last)
  keys.merge(first, mid, last)

proc mergeSort*[T](keys: var openArray[T]) =
  keys.mergeSortInternal(0, keys.len - 1)
