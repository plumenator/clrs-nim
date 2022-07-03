proc insertionSort*[T](keys: var openArray[T]) =
  for i, key in keys:
    # Insert keys[i] into sorted subarray keys[0..i-1]
    var j = i - 1
    while j >= 0 and keys[j] > key:
      keys[j + 1] = keys[j]
      j = j - 1
    keys[j + 1] = key
