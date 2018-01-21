defmodule Math do

  defdelegate log2(n), to: :math

  @doc """
  Computes lg*(n)

  ## Examples

      iex> Math.log2_star(2)
      1
      iex> Math.log2_star(4)
      2
      iex> Math.log2_star(16)
      3
      iex> 2 |> :math.pow(16) |>  Math.log2_star()
      4
  """
  def log2_star(n, count \\ 0)
  def log2_star(n, count) when n <= 1, do: count
  def log2_star(n, count) do
    n
    |> log2
    |> log2_star(count + 1)
  end
end
