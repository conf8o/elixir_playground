# [1, 2, 3] は糖衣構文
IO.puts [1, 2, 3] == [1 | [2, 3]]

# いつものリスト
IO.puts [1, 2, 3] == [1 | [2 | [3 | []]]]

[x | [y | rest]] = [1, 2, 3]
IO.inspect [x, y, rest]

IO.inspect {1}
