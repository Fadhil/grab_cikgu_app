defmodule GrabCikgu.Fixtures do
  alias GrabCikgu.Account.{User, Role}
  alias GrabCikgu.Repo

  def fixture(fixture_name, params \\ %{})

  def fixture(:user, params) do
    user = %User{ name: "User 1", username: "user1"}
    user
    |> Map.merge(params)
    |> Repo.insert!
  end

  def fixture(:tutor, params) do
    role = fixture(:role, %{name: "Tutor"})
    user = %User{name: "Tutor 1", username: "tutor1", role_id: role.id}
    user
    |> Map.merge(params)
    |> Repo.insert!
  end

  def fixture(:student, params) do
    role = fixture(:role, %{name: "Student"})
    user = %User{name: "Student 1", username: "student1", role_id: role.id}
    user
    |> Map.merge(params)
    |> Repo.insert!
  end

  def fixture(:role, %{name: name}=params) do
    role = case Repo.get_by(Role, %{name: name}) do
      nil ->
        %Role{name: name}
        |> Repo.insert!
      role ->
        role
    end
  end
end
