defmodule PoopLog.LogsTest do
  use PoopLog.DataCase

  alias PoopLog.Logs

  describe "meals" do
    alias PoopLog.Logs.Food

    import PoopLog.LogsFixtures

    @invalid_attrs %{description: nil, notes: nil}

    test "list_meals/0 returns all meals" do
      food = food_fixture()
      assert Logs.list_meals() == [food]
    end

    test "get_food!/1 returns the food with given id" do
      food = food_fixture()
      assert Logs.get_food!(food.id) == food
    end

    test "create_food/1 with valid data creates a food" do
      valid_attrs = %{description: "some description", notes: "some notes"}

      assert {:ok, %Food{} = food} = Logs.create_food(valid_attrs)
      assert food.description == "some description"
      assert food.notes == "some notes"
    end

    test "create_food/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logs.create_food(@invalid_attrs)
    end

    test "update_food/2 with valid data updates the food" do
      food = food_fixture()
      update_attrs = %{description: "some updated description", notes: "some updated notes"}

      assert {:ok, %Food{} = food} = Logs.update_food(food, update_attrs)
      assert food.description == "some updated description"
      assert food.notes == "some updated notes"
    end

    test "update_food/2 with invalid data returns error changeset" do
      food = food_fixture()
      assert {:error, %Ecto.Changeset{}} = Logs.update_food(food, @invalid_attrs)
      assert food == Logs.get_food!(food.id)
    end

    test "delete_food/1 deletes the food" do
      food = food_fixture()
      assert {:ok, %Food{}} = Logs.delete_food(food)
      assert_raise Ecto.NoResultsError, fn -> Logs.get_food!(food.id) end
    end

    test "change_food/1 returns a food changeset" do
      food = food_fixture()
      assert %Ecto.Changeset{} = Logs.change_food(food)
    end
  end

  describe "poops" do
    alias PoopLog.Logs.Poop

    import PoopLog.LogsFixtures

    @invalid_attrs %{}

    test "list_poops/0 returns all poops" do
      poop = poop_fixture()
      assert Logs.list_poops() == [poop]
    end

    test "get_poop!/1 returns the poop with given id" do
      poop = poop_fixture()
      assert Logs.get_poop!(poop.id) == poop
    end

    test "create_poop/1 with valid data creates a poop" do
      valid_attrs = %{}

      assert {:ok, %Poop{} = poop} = Logs.create_poop(valid_attrs)
    end

    test "create_poop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logs.create_poop(@invalid_attrs)
    end

    test "update_poop/2 with valid data updates the poop" do
      poop = poop_fixture()
      update_attrs = %{}

      assert {:ok, %Poop{} = poop} = Logs.update_poop(poop, update_attrs)
    end

    test "update_poop/2 with invalid data returns error changeset" do
      poop = poop_fixture()
      assert {:error, %Ecto.Changeset{}} = Logs.update_poop(poop, @invalid_attrs)
      assert poop == Logs.get_poop!(poop.id)
    end

    test "delete_poop/1 deletes the poop" do
      poop = poop_fixture()
      assert {:ok, %Poop{}} = Logs.delete_poop(poop)
      assert_raise Ecto.NoResultsError, fn -> Logs.get_poop!(poop.id) end
    end

    test "change_poop/1 returns a poop changeset" do
      poop = poop_fixture()
      assert %Ecto.Changeset{} = Logs.change_poop(poop)
    end
  end
end
