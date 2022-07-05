import std/options

import ch2_3_6_binary_search

func twoSum*[T](values: openArray[T], sum: T): Option[(T, T)] =
  for i, first in values:
    let second = values.binarySearch(proc (x: T): bool = x == sum - first)
    if second.is_some:
      let j = second.get
      if j != i:
        return some((first, values[j]))
  return none((T, T))
