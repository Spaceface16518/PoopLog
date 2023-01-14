defmodule PoopLog.AttributesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PoopLog.Attributes` context.
  """

  @doc """
  Generate a condition.
  """
  def condition_fixture(attrs \\ %{}) do
    {:ok, condition} =
      attrs
      |> Enum.into(%{

      })
      |> PoopLog.Attributes.create_condition()

    condition
  end

  @doc """
  Generate a irritant.
  """
  def irritant_fixture(attrs \\ %{}) do
    {:ok, irritant} =
      attrs
      |> Enum.into(%{

      })
      |> PoopLog.Attributes.create_irritant()

    irritant
  end
end
