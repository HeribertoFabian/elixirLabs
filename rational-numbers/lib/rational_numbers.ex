defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) when b1 != 0 and b2 != 0 do
    {a1 * b2 + a2 * b1, b1 * b2}
    |> reduce()
  end

  def add({_, b1}, {_, b2}) when b1 == 0 or b2 == 0 do
    raise ArgumentError, "Denominator cannot be zero"
  end

  def gcd(a, b) when b == 0, do: a
  def gcd(a, b), do: gcd(b, rem(a, b))

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    {a1 * b2 - a2 * b1, b1 * b2}
    |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    {a1 * a2, b1 * b2}
    |> reduce()
  end

  @doc """
  Divide two rational numbers {-1, 2}, {-2, 3}
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    {a1 * b2, a2 * b1}
    |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    {if(a < 0, do: a * -1, else: a), if(b < 0, do: b * -1, else: b)}
    |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({x, y}, n) when n < 0 do
    n = Kernel.abs(n)

    {:math.pow(y, n) |> round, :math.pow(x, n) |> round}
    |> reduce()
  end

  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({x, y}, n) do
    {:math.pow(x, n) |> round, :math.pow(y, n) |> round}
    |> reduce()
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    exponente = :math.pow(x, a)
    :math.pow(exponente, 1.0 / b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational

  def reduce({numerator, denominator}) when denominator < 0 do
    reduce({-numerator, -denominator})
  end

  def reduce({numerator, denominator}) do
    mcd = RationalNumbers.gcd(numerator, denominator) |> Kernel.abs()
    num_red = div(numerator, mcd)
    den_red = div(denominator, mcd)

    {num_red, den_red}
  end
end
