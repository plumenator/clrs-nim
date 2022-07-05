proc insertSorted[T](keys: var openArray[T], last: int) =
  # Insert keys[last] into sorted subarray keys[0..last-1]
  let key = keys[last]
  var j = last - 1
  while j >= 0 and keys[j] > key:
    keys[j + 1] = keys[j]
    j = j - 1
  keys[j + 1] = key

proc recursiveInsertionSortInternal[T](keys: var openArray[T], last: int) =
  if last == 0:
    return
  keys.recursiveInsertionSortInternal(last - 1)
  keys.insertSorted(last)

proc recursiveInsertionSort*[T](keys: var openArray[T]) =
  recursiveInsertionSortInternal(keys, keys.len - 1)

