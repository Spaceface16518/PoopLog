defmodule PoopLog.AttributesTest do
  use PoopLog.DataCase

  alias PoopLog.Attributes

  describe "condition" do
    alias PoopLog.Attributes.Condition

    import PoopLog.AttributesFixtures

    @invalid_attrs %{}

    test "list_condition/0 returns all condition" do
      condition = condition_fixture()
      assert Attributes.list_condition() == [condition]
    end

    test "get_condition!/1 returns the condition with given id" do
      condition = condition_fixture()
      assert Attributes.get_condition!(condition.id) == condition
    end

    test "create_condition/1 with valid data creates a condition" do
      valid_attrs = %{}

      assert {:ok, %Condition{} = condition} = Attributes.create_condition(valid_attrs)
    end

    test "create_condition/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attributes.create_condition(@invalid_attrs)
    end

    test "update_condition/2 with valid data updates the condition" do
      condition = condition_fixture()
      update_attrs = %{}

      assert {:ok, %Condition{} = condition} = Attributes.update_condition(condition, update_attrs)
    end

    test "update_condition/2 with invalid data returns error changeset" do
      condition = condition_fixture()
      assert {:error, %Ecto.Changeset{}} = Attributes.update_condition(condition, @invalid_attrs)
      assert condition == Attributes.get_condition!(condition.id)
    end

    test "delete_condition/1 deletes the condition" do
      condition = condition_fixture()
      assert {:ok, %Condition{}} = Attributes.delete_condition(condition)
      assert_raise Ecto.NoResultsError, fn -> Attributes.get_condition!(condition.id) end
    end

    test "change_condition/1 returns a condition changeset" do
      condition = condition_fixture()
      assert %Ecto.Changeset{} = Attributes.change_condition(condition)
    end
  end

  describe "irritant" do
    alias PoopLog.Attributes.Irritant

    import PoopLog.AttributesFixtures

    @invalid_attrs %{}

    test "list_irritant/0 returns all irritant" do
      irritant = irritant_fixture()
      assert Attributes.list_irritant() == [irritant]
    end

    test "get_irritant!/1 returns the irritant with given id" do
      irritant = irritant_fixture()
      assert Attributes.get_irritant!(irritant.id) == irritant
    end

    test "create_irritant/1 with valid data creates a irritant" do
      valid_attrs = %{}

      assert {:ok, %Irritant{} = irritant} = Attributes.create_irritant(valid_attrs)
    end

    test "create_irritant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attributes.create_irritant(@invalid_attrs)
    end

    test "update_irritant/2 with valid data updates the irritant" do
      irritant = irritant_fixture()
      update_attrs = %{}

      assert {:ok, %Irritant{} = irritant} = Attributes.update_irritant(irritant, update_attrs)
    end

    test "update_irritant/2 with invalid data returns error changeset" do
      irritant = irritant_fixture()
      assert {:error, %Ecto.Changeset{}} = Attributes.update_irritant(irritant, @invalid_attrs)
      assert irritant == Attributes.get_irritant!(irritant.id)
    end

    test "delete_irritant/1 deletes the irritant" do
      irritant = irritant_fixture()
      assert {:ok, %Irritant{}} = Attributes.delete_irritant(irritant)
      assert_raise Ecto.NoResultsError, fn -> Attributes.get_irritant!(irritant.id) end
    end

    test "change_irritant/1 returns a irritant changeset" do
      irritant = irritant_fixture()
      assert %Ecto.Changeset{} = Attributes.change_irritant(irritant)
    end
  end
end
