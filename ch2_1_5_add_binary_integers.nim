func addBinaryInternal(s: openArray[bool], l: openArray[bool]): seq[bool] =
  let minLen = s.len
  let maxLen = l.len
  let diff = maxLen - minLen
  var sum = newSeq[bool](maxLen + 1)
  var carry = false
  for i in countdown(minLen-1, 0):
    let a = s[i]
    let b = l[i + diff]
    let isSet = a xor b
    sum[i + diff + 1] = isSet xor carry
    carry = (a and b) or (carry and isSet)
  if diff > 0:
    for i in countdown(diff-1, 0):
      sum[i + 1] = l[i] xor carry
      carry = carry and l[i]
  sum[0] = carry
  return sum

func addBinaryIntegers*(a: openArray[bool], b: openArray[bool]): seq[bool] =
  if a.len < b.len:
    return addBinaryInternal(a, b)
  else:
    return addBinaryInternal(b, a)

