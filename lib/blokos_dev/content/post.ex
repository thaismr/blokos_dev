defmodule BlokosDev.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias BlokosDev.Content.Topic

  schema "posts" do
    field :body_html, :string
    field :body_md, :string
    field :is_published, :boolean, default: false
    field :title, :string

    belongs_to :topic, Topic

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body_md, :body_html, :is_published])
    |> validate_required([:title, :body_md, :body_html, :is_published])
    |> unique_constraint(:title)
  end
end
