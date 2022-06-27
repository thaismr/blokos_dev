defmodule BlokosDev.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body_md, :text
      add :body_html, :text
      add :is_published, :boolean, default: false, null: false
      add :topic_id, references(:topics, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:posts, [:title])
    create index(:posts, [:topic_id])
  end
end
