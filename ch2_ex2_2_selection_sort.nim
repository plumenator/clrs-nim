proc selectionSort*[T](keys: var openArray[T]) =
  for i, key in keys:
    var minVal = keys[i]
    var minIdx = i
    for j in i..keys.len-1:
      let key2 = keys[j]
      if minVal > key2:
        minVal = key2
        minIdx = j
    let orig = keys[i]
    keys[i] = minval
    keys[minIdx] = orig
