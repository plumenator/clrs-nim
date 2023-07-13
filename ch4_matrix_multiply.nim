type Matrix = seq[seq[int]]

proc matrixMultiply(a, b: Matrix, c: var Matrix) =

  doAssert(a.len == b.len and
           a[0].len == b[0].len and
           b.len == c.len and
           b[0].len == c[0].len)

  for i in 0..a.high:
    for j in 0..a.high:
      for k in 0..a.high:
        c[i][j] += a[i][k] * b[k][j]

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
