noteBook.controller 'homeCtrl', ($q, $scope, articlesApi)->
  console.log 'Run homeCtrl'

  $q.when(articlesApi.getArticles().$promise).then (data)->
    $scope.notes = data

    # Create new note
    newNoteInput = angular.element document.getElementById "new-note-input"
    $scope.createNote = ->
      newNoteText = newNoteInput.val()
      if newNoteText
        note =
          author: "me"
          title: "testtitle"
          note: newNoteText
          modified: new Date().toLocaleString()
        $scope.notes.push note
        newNoteInput.val ""
        articlesApi.postArticle note


    $scope.removeNote = ($event)->
      currentNote = angular.element($event.currentTarget).closest("content-list_item")
      currentNoteId = currentNote.attr "data-noteid"
      $q.when(articlesApi.deleteArticle(id: currentNoteId).$promise).then ->
        currentNote.remove()
        return

