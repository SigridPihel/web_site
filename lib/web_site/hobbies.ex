defmodule WebSite.Hobbies do
  def list_hobbies do
  [
      %{
        id: 1,
        text: "Fitness - runnning 🏃‍♀️, boxing 🥊, gym 💪"
      },
      %{
        id: 2,
        text: "Teaching programming 👩‍🏫"
      },
      %{
        id: 3,
        text: "Building my business 👩‍💻"
      }
    ]
  end

  def get_hobby(id) when is_integer(id) do
    Enum.find(list_hobbies(), fn t -> t.id == id end)
  end

  def get_hobby(id) when is_binary(id) do
    id |> String.to_integer() |> get_hobby()
  end
end
