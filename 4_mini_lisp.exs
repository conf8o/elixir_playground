defmodule SExp do
  def eval([{:function, f} | args]) do
    raw_args =
      args
      |> SExp.eval_args()
      |> Enum.map(&raw_val/1)
    {Kernel.apply(f, raw_args)}
  end

  def eval([{:special, special} | args]) do
    Kernel.apply(special, args)
  end

  def eval(obj) do
    obj
  end

  def raw_val({val}) do
    val
  end

  def raw_val({_, val}) do
    val
  end

  def eval_args(args) do
    Enum.map(args, &eval/1)
  end
end

defmodule Special do
  def if_(pred, t, f) do
    if SExp.raw_val(SExp.eval(pred)) do
      SExp.eval(t)
    else
      SExp.eval(f)
    end
  end
end

x = SExp.eval(
  [
    {:special, &Special.if_/3},
    [{:function, &Kernel.==/2}, {1}, {2}],
    [{:function, &Kernel.*/2}, {100}, {2}],
    [{:function, &Kernel.+/2}, {100}, {2}]
  ]
)

IO.inspect x
