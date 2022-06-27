defmodule BlokosDev.ContentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BlokosDev.Content` context.
  """

  @doc """
  Generate a unique topic name.
  """
  def unique_topic_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a topic.
  """
  def topic_fixture(attrs \\ %{}) do
    {:ok, topic} =
      attrs
      |> Enum.into(%{
        name: unique_topic_name()
      })
      |> BlokosDev.Content.create_topic()

    topic
  end

  @doc """
  Generate a unique post title.
  """
  def unique_post_title, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body_html: "some body_html",
        body_md: "some body_md",
        is_published: true,
        title: unique_post_title()
      })
      |> BlokosDev.Content.create_post()

    post
  end
end
