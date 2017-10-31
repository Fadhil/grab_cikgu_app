defmodule GrabCikgu.Tutorial.Class do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikgu.Tutorial.Class


  schema "tutorial_classes" do
    field :subject, :string

    timestamps()
  end

  @doc false
  def changeset(%Class{} = class, attrs) do
    class
    |> cast(attrs, [:subject])
    |> validate_required([:subject])
  end
end
