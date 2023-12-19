# keyword list
l = [{:a, 1} | [a: 2, b: 3]]
IO.inspect l

x = 2

# 構文解析っぽさがあって最高
# 遅延評価はどうしてる？それとも全部遅延評価？
wow = if(x == 2, [{:do, 2 + 3}, {:else, 10 + 5}])
IO.inspect wow
