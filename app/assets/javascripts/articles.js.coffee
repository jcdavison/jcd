$ ->
  $(".delete_tag").click ->
    console.log $(this).attr("data-tag-id")
    $.ajax
      type: "POST"
      url: "/remove_tag"
      data: {
        tag_id: $(this).attr("data-tag-id")
        article_id: $("[data-article-id]").attr("data-article-id")
      }
      success: (json_data) ->
        $("li[data-tag-id=#{json_data.tag_id}]").remove()

  $("#add_tags").click ->
    $.ajax
      type: "POST"
      url: "/add_tags"
      data: {
        tags: $("#new_tags").val()
        article_id: $("[data-article-id]").attr("data-article-id")
      }
      success: (json_data) ->
        $("#tag_list").replaceWith(json_data.tags)
