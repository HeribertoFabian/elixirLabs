defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.at(0)
  end

  def initial(name) do
    name
    |> first_letter()
    |> Kernel.<>(".")
    |> String.upcase()
  end

  def initials(full_name) do
    full_name
    |> String.split(" ")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&HighSchoolSweetheart.initial/1)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    {first, second} = {initials(full_name1), initials(full_name2)}

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{first}  +  #{second}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
