$ ->
  ### モジュールのソート ###
  $("#sortable").sortable()
  $("#sortable").disableSelection()

  ### 記事タイトルの文字カウント ###
  $("#entryTitle").keyup ->
    counter = $(this).val().length
    $("#countUp").text counter
    $("#countUp").text "0"  if counter is 0

  ### 見出し箇所のlocalStorage ###
  # Save ボタンでフォームのvalueをlocalStorageにセット
  $("#save_h").click ->
    # 見出しの値とラジオボタンの値を変数にセット
    midashi_content = $("#midashi").val()
    midashi_type =  $("input[name=midashi_type]:checked").val()

    # localStorageに値を保存
    localStorage.setItem "midashi", midashi_content
    localStorage.setItem "midashi_type", midashi_type
    # localStorage.setItem "midashi" [
    #   midashi_content: midashi_content
    #   midashi_type: midashi_type
    # ]

    # D&Dエリアに要素をアペンド♥
    $(".sortarea").append ('<div class="well3 ui-state-default"><'+midashi_type+'>'+midashi_content+'</'+midashi_type+'></div>')
    # console.log localStorage.getItem("midashi_type") # console.logに出力

  # Cancel ボタンでlocalStorageの中身と、フォームのvalueを削除
  $("#cancel_h").click ->
    $("#midashi").val ""
    localStorage.removeItem "midashi"

  # 読み込み時localStorageの中身を見出しにセットする
  ( ->
      $("#midashi").val localStorage.getItem("midashi") if localStorage.getItem("midashi")
      # ここにradioボタンの値もセットしたい
  )()

  ### 自動保存の数字を出すところ、1分毎に保存 ###
  (autoSave = ->
    d = new Date()
    $("#save_message_h").text d.getHours()
    $("#save_message_m").text d.getMinutes()
    $("#save_message_s").text d.getSeconds()
    setTimeout autoSave, 60000
  )()