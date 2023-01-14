defmodule PoopLogWeb.FoodController do
  use PoopLogWeb, :controller

  alias PoopLog.Logs
  alias PoopLog.Logs.Food

  def index(conn, _params) do
    meals = Logs.list_meals()
    render(conn, "index.html", meals: meals)
  end

  def new(conn, _params) do
    changeset = Logs.change_food(%Food{irritants: []})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"food" => food_params}) do
    case Logs.create_food(food_params) do
      {:ok, food} ->
        conn
        |> put_flash(:info, "Food created successfully.")
        |> redirect(to: Routes.food_path(conn, :show, food))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    food = Logs.get_food!(id)
    render(conn, "show.html", food: food)
  end

  def edit(conn, %{"id" => id}) do
    food = Logs.get_food!(id)
    changeset = Logs.change_food(food)
    render(conn, "edit.html", food: food, changeset: changeset)
  end

  def update(conn, %{"id" => id, "food" => food_params}) do
    food = Logs.get_food!(id)

    case Logs.update_food(food, food_params) do
      {:ok, food} ->
        conn
        |> put_flash(:info, "Food updated successfully.")
        |> redirect(to: Routes.food_path(conn, :show, food))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", food: food, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    food = Logs.get_food!(id)
    {:ok, _food} = Logs.delete_food(food)

    conn
    |> put_flash(:info, "Food deleted successfully.")
    |> redirect(to: Routes.food_path(conn, :index))
  end
end
