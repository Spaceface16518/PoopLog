# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PoopLog.Repo.insert!(%PoopLog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PoopLog.Repo

alias PoopLog.Attributes.Condition
alias PoopLog.Attributes.Irritant

timestamp =
  NaiveDateTime.utc_now()
  |> NaiveDateTime.truncate(:second)

placeholders = %{timestamp: timestamp}
fields = for f <- [:inserted_at, :updated_at], into: %{}, do: {f, {:placeholder, :timestamp}}
with_placeholder = &Map.merge(&1, fields)
with_placeholders = &Enum.map(&1, with_placeholder)

conditions =
  [
    %{name: "Normal", description: "Normal poop"},
    %{name: "Hard", description: "Hard poop"},
    %{name: "Soft", description: "Soft poop"}
  ]
  |> with_placeholders.()

Repo.insert_all(Condition, conditions, placeholders: placeholders)

irritants =
  [
    %{name: "Dairy", description: "Dairy"},
    %{name: "Gluten", description: "Gluten"},
    %{name: "Soy", description: "Soy"},
    %{name: "Corn", description: "Corn"},
    %{name: "Eggs", description: "Eggs"},
    %{name: "Fruit", description: "Fruit"}
  ]
  |> with_placeholders.()

Repo.insert_all(Irritant, irritants, placeholders: placeholders)
