defmodule BlokosDev.ContentTest do
  use BlokosDev.DataCase

  alias BlokosDev.Content

  describe "topics" do
    alias BlokosDev.Content.Topic

    import BlokosDev.ContentFixtures

    @invalid_attrs %{name: nil}

    test "list_topics/0 returns all topics" do
      topic = topic_fixture()
      assert Content.list_topics() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert Content.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Topic{} = topic} = Content.create_topic(valid_attrs)
      assert topic.name == "some name"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Topic{} = topic} = Content.update_topic(topic, update_attrs)
      assert topic.name == "some updated name"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_topic(topic, @invalid_attrs)
      assert topic == Content.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = Content.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> Content.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = Content.change_topic(topic)
    end
  end

  describe "posts" do
    alias BlokosDev.Content.Post

    import BlokosDev.ContentFixtures

    @invalid_attrs %{body_html: nil, body_md: nil, is_published: nil, title: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Content.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Content.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{body_html: "some body_html", body_md: "some body_md", is_published: true, title: "some title"}

      assert {:ok, %Post{} = post} = Content.create_post(valid_attrs)
      assert post.body_html == "some body_html"
      assert post.body_md == "some body_md"
      assert post.is_published == true
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{body_html: "some updated body_html", body_md: "some updated body_md", is_published: false, title: "some updated title"}

      assert {:ok, %Post{} = post} = Content.update_post(post, update_attrs)
      assert post.body_html == "some updated body_html"
      assert post.body_md == "some updated body_md"
      assert post.is_published == false
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_post(post, @invalid_attrs)
      assert post == Content.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Content.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Content.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Content.change_post(post)
    end
  end
end
