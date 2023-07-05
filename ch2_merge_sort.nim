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

  for l in left[i..^1]:
    keys[k] = l
    inc k

  for r in right[j..^1]:
    keys[k] = r
    inc k

proc mergeSortInternal[T](keys: var openArray[T], first, last: int) =
  if first >= last:
    return
  let mid = (first + last) /% 2
  keys.mergeSortInternal(first, mid)
  keys.mergeSortInternal(mid + 1, last)
  keys.merge(first, mid, last)

proc mergeSort*[T](keys: var openArray[T]) =
  keys.mergeSortInternal(keys.low, keys.high)

when isMainModule:
  import std/sequtils

  var input = "mrjocktvquizphdbagsfewlynx".items.toSeq
  mergeSort(input)
  var expected = "abcdefghijklmnopqrstuvwxyz".items.toSeq
  doAssert input == expected

  input = "abcdefghijklmnopqrstuvwxyz".items.toSeq
  input.mergeSort
  expected = "abcdefghijklmnopqrstuvwxyz".items.toSeq
  doAssert input == expected


  input = "aquickbrownfoxjumpedoverthelazydog".items.toSeq
  mergeSort(input)
  expected = "aabcddeeefghijklmnoooopqrrtuuvwxyz".items.toSeq
  doAssert input == expected

  input = "".items.toSeq
  mergeSort(input)
  expected = "".items.toSeq
  doAssert input == expected

  var input_int_array = [-1, -2, 4, 1, 5, 7, 6, 9, 0, 10, -111]
  mergeSort(input_int_array)
  var expected_int_array = [-111, -2, -1, 0, 1, 4, 5, 6, 7, 9, 10]
  doAssert input_int_array == expected_int_array

  var input_int_seq = @[-1, -2, 4, 1, 5, 7, 6, 9, 0, 10, -111]
  mergeSort(input_int_seq)
  var expected_int_seq = @[-111, -2, -1, 0, 1, 4, 5, 6, 7, 9, 10]
  doAssert input_int_seq == expected_int_seq

  input_int_seq = @[-1]
  mergeSort(input_int_seq)
  expected_int_seq = @[-1]
  doAssert input_int_seq == expected_int_seq

  var input_float_seq = @[-1.23, -2.2, 4, 1, 5.2, 7, 6.012, 9, 0, 10, -111]
  mergeSort(input_float_seq)
  var expected_float_seq = @[-111.0, -2.2, -1.23, 0, 1, 4, 5.2, 6.012, 7, 9, 10]
  doAssert input_float_seq == expected_float_seq

  import std/random
  input_float_seq = @[-111.0, -2.2, -1.23, 0, 1, 4, 5.2, 6.012, 7, 9, 10]
  expected_float_seq = @[-111.0, -2.2, -1.23, 0, 1, 4, 5.2, 6.012, 7, 9, 10]
  shuffle(input_float_seq)
  mergeSort(input_float_seq)
  doAssert input_float_seq == expected_float_seq
