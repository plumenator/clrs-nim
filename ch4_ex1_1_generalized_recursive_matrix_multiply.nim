import std/[math, sequtils]

type Matrix = seq[seq[int]]

proc matrixMultiplyInternal(a, b: Matrix, c: var Matrix, ai, aj, bi, bj, ci, cj, n: int) =
  if n == 1:
    c[ci][cj] += a[ai][aj] * b[bi][bj]
    return

  let m = n div 2

  matrixMultiplyInternal(a, b, c, ai + 0, aj + 0, bi + 0, bj + 0, ci + 0, cj + 0, m)
  matrixMultiplyInternal(a, b, c, ai + 0, aj + 0, bi + 0, bj + m, ci + 0, cj + m, m)
  matrixMultiplyInternal(a, b, c, ai + m, aj + 0, bi + 0, bj + 0, ci + m, cj + 0, m)
  matrixMultiplyInternal(a, b, c, ai + m, aj + 0, bi + 0, bj + m, ci + m, cj + m, m)
  matrixMultiplyInternal(a, b, c, ai + 0, aj + m, bi + m, bj + 0, ci + 0, cj + 0, m)
  matrixMultiplyInternal(a, b, c, ai + 0, aj + m, bi + m, bj + m, ci + 0, cj + m, m)
  matrixMultiplyInternal(a, b, c, ai + m, aj + m, bi + m, bj + 0, ci + m, cj + 0, m)
  matrixMultiplyInternal(a, b, c, ai + m, aj + m, bi + m, bj + m, ci + m, cj + m, m)

func zeroPadded(a: Matrix, n: int): Matrix =
  doAssert(a.len == a[0].len)
  result = 0.repeat(n).repeat(n)
  for i, row in a:
    result[i][0..a.high] = row[0..a.high]

func stripped(a: Matrix, n: int): Matrix =
  a[0..<n].mapIt(it[0..<n])

proc matrixMultiply(a, b: Matrix, c: var Matrix) =
  doAssert(a.len == b.len and
           a[0].len == b[0].len and
           b.len == c.len and
           b[0].len == c[0].len)
  if a.len.isPowerOfTwo:
    matrixMultiplyInternal(a, b, c, 0, 0, 0, 0, 0, 0, a.len)
  else:
    let n = a.len.nextPowerOfTwo
    c = c.zeroPadded(n)
    matrixMultiplyInternal(a.zeroPadded(n), b.zeroPadded(n), c, 0, 0, 0, 0, 0, 0, n)
    c = c.stripped(a.len)

when isMainModule:

  var a = @[
    @[1, 1],
    @[1, 1]
  ]
  var b = @[
    @[1, 1],
    @[1, 1]
  ]
  var c = @[
    @[0, 0],
    @[0, 0]
  ]
  matrixMultiply(a, b, c)
  doAssert(c == @[
    @[2, 2],
    @[2, 2]
  ])

  a = @[
    @[1, 1, 2],
    @[1, 1, 4],
    @[1, 2, 3]
  ]
  b = @[
    @[1, 1, 5],
    @[1, 1, 6],
    @[2, 1, 7]
  ]
  c = @[
    @[0, 1, 0],
    @[0, 1, 0],
    @[0, 1, 0]
  ]
  matrixMultiply(a, b, c)
  doAssert(c == @[
    @[6, 5, 25],
    @[10, 7, 39],
    @[9, 7, 38]
  ])
