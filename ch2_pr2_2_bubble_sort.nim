proc bubbleSort*[T](keys: var openArray[T]) =
  for i in 0..keys.high:
    for j in countdown(keys.high, i + 1):
      if keys[j] < keys[j - 1]:
        swap(keys[j], keys[j - 1])

when isMainModule:
  import std/sequtils

  var input = "mrjocktvquizphdbagsfewlynx".items.toSeq
  bubbleSort(input)
  var expected = "abcdefghijklmnopqrstuvwxyz".items.toSeq
  doAssert input == expected

  input = "abcdefghijklmnopqrstuvwxyz".items.toSeq
  input.bubbleSort
  expected = "abcdefghijklmnopqrstuvwxyz".items.toSeq
  doAssert input == expected


  input = "aquickbrownfoxjumpedoverthelazydog".items.toSeq
  bubbleSort(input)
  expected = "aabcddeeefghijklmnoooopqrrtuuvwxyz".items.toSeq
  doAssert input == expected

  input = "".items.toSeq
  bubbleSort(input)
  expected = "".items.toSeq
  doAssert input == expected

  var input_int_array = [-1, -2, 4, 1, 5, 7, 6, 9, 0, 10, -111]
  bubbleSort(input_int_array)
  var expected_int_array = [-111, -2, -1, 0, 1, 4, 5, 6, 7, 9, 10]
  doAssert input_int_array == expected_int_array

  var input_int_seq = @[-1, -2, 4, 1, 5, 7, 6, 9, 0, 10, -111]
  bubbleSort(input_int_seq)
  var expected_int_seq = @[-111, -2, -1, 0, 1, 4, 5, 6, 7, 9, 10]
  doAssert input_int_seq == expected_int_seq

  input_int_seq = @[-1]
  bubbleSort(input_int_seq)
  expected_int_seq = @[-1]
  doAssert input_int_seq == expected_int_seq

  var input_float_seq = @[-1.23, -2.2, 4, 1, 5.2, 7, 6.012, 9, 0, 10, -111]
  bubbleSort(input_float_seq)
  var expected_float_seq = @[-111.0, -2.2, -1.23, 0, 1, 4, 5.2, 6.012, 7, 9, 10]
  doAssert input_float_seq == expected_float_seq

  import std/random
  input_float_seq = @[-111.0, -2.2, -1.23, 0, 1, 4, 5.2, 6.012, 7, 9, 10]
  expected_float_seq = @[-111.0, -2.2, -1.23, 0, 1, 4, 5.2, 6.012, 7, 9, 10]
  shuffle(input_float_seq)
  bubbleSort(input_float_seq)
  doAssert input_float_seq == expected_float_seq
