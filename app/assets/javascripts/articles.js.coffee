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

