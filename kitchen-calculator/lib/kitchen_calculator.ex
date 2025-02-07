defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_, numeric} = volume_pair
    numeric
  end

  # :cup, :fluid_ounce, :teaspoon, :tablespoon, uknown
  def to_milliliter({:cup, qty}), do: {:milliliter, qty * 240}
  def to_milliliter({:fluid_ounce, qty}), do: {:milliliter, qty * 30}
  def to_milliliter({:teaspoon, qty}), do: {:milliliter, qty * 5}
  def to_milliliter({:tablespoon, qty}), do: {:milliliter, qty * 15}
  def to_milliliter({:milliliter, qty}), do: {:milliliter, qty}

  # :cup, :fluid_ounce, :teaspoon, :tablespoon, uknown
  def from_milliliter({:milliliter, qty}, :cup), do: {:cup, qty / 240}
  def from_milliliter({:milliliter, qty}, :fluid_ounce), do: {:fluid_ounce, qty / 30}
  def from_milliliter({:milliliter, qty}, :teaspoon), do: {:teaspoon, qty / 5}
  def from_milliliter({:milliliter, qty}, :tablespoon), do: {:tablespoon, qty / 15}
  def from_milliliter({:milliliter, qty}, :milliliter), do: {:milliliter, qty}

  def convert(volume_pair, unit) do
    # Convertir a mililitros
    #    volume_in_ml =
    #      case volume_pair do
    #        {:cup, qty} -> get_volume(to_milliliter({:cup, qty}))
    #        {:fluid_ounce, qty} -> get_volume(to_milliliter({:fluid_ounce, qty}))
    #        {:teaspoon, qty} -> get_volume(to_milliliter({:teaspoon, qty}))
    #        {:tablespoon, qty} -> get_volume(to_milliliter({:tablespoon, qty}))
    #        {:milliliter, qty} -> get_volume(to_milliliter({:milliliter, qty}))
    #        _ -> 0
    #      end
    #
    #    from_milliliter({:milliliter, volume_in_ml}, unit)

    # REFACTORIZANDO
    volume_pair |> to_milliliter() |> from_milliliter(unit)
  end
end
