defmodule GrabCikgu.Tutorial.Subject do
  use GrabCikgu.Web, :model
  alias GrabCikgu.Repo

  schema "subjects" do
    field :name, :string
    field :grade, :string
  end

  def all do
    Repo.all(__MODULE__)
  end
end
