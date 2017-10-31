defmodule GrabCikgu.Fixtures do
  alias GrabCikgu.Account.User
  alias GrabCikgu.Repo

  def fixture(:user, params \\ %{}) do
    user = %User{ name: "User 1", username: "user1"}
    user
    |> Map.merge(params)
    |> Repo.insert!
  end
end
