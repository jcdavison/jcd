$ ->
  delete_tag = ->
    $(".delete_tag").click ->
      console.log("fizzbam!")
      $.ajax
        type: "POST"
        url: "/remove_tag"
        data: {
          tag_id: $(this).attr("data-tag-id")
          article_id: $("[data-article-id]").attr("data-article-id")
        }
        success: (json_data) ->
          $("li[data-tag-id=#{json_data.tag_id}]").remove()

  add_tag = ->
    $("#add_tags").click ->
      $.ajax
        type: "POST"
        url: "/add_tags"
        data: {
          tags: $("#new_tags").val()
          article_id: $("[data-article-id]").attr("data-article-id")
        }
        success: (json_data) ->
          $("#tag_list").replaceWith(json_data.tags).bind( delete_tag() ) 
  delete_tag()
  add_tag()
