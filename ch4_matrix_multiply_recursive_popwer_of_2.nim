import std/math

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

proc matrixMultiply(a, b: Matrix, c: var Matrix) =
  doAssert(a.len.isPowerOfTwo and
           a.len == b.len and
           a[0].len == b[0].len and
           b.len == c.len and
           b[0].len == c[0].len)
  matrixMultiplyInternal(a, b, c, 0, 0, 0, 0, 0, 0, a.len)

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
    @[1, 2],
    @[3, 4]
  ]
  b = @[
    @[5, 6],
    @[7, 8]
  ]
  c = @[
    @[0, 0],
    @[0, 0]
  ]
  matrixMultiply(a, b, c)
  doAssert(c == @[
    @[19, 22],
    @[43, 50]
  ])

  a = @[
    @[1, 1, 2, 0],
    @[1, 1, 4, 0],
    @[1, 2, 3, 0],
    @[0, 0, 0, 0]
  ]
  b = @[
    @[1, 1, 5, 0],
    @[1, 1, 6, 0],
    @[2, 1, 7, 0],
    @[0, 0, 0, 0]
  ]
  c = @[
    @[0, 1, 0, 0],
    @[0, 1, 0, 0],
    @[0, 1, 0, 0],
    @[0, 0, 0, 0]
  ]
  matrixMultiply(a, b, c)
  doAssert(c == @[
    @[6, 5, 25, 0],
    @[10, 7, 39, 0],
    @[9, 7, 38, 0],
    @[0, 0, 0, 0]
  ])
