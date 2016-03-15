noteBook.controller 'homeCtrl', ($q, $scope, articlesApi)->
  console.log 'Run homeCtrl'

  $q.when(articlesApi.getArticles().$promise).then (data)->
    $scope.notes = data
    console.log $scope.notes


    # $scope.noteId = 0
    # $scope.test = 1



    # note =
    #   id: $scope.noteId++
    #   text: "Текст заметки из контроллера 2"
    #   date: new Date().toLocaleString()
    # $scope.notes.push note

    # note =
    #   id: $scope.noteId++
    #   text: "Еще одна третья заметка, которая покроет тест."
    #   date: new Date().toLocaleString()
    # $scope.notes.push note



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
      currentNote.remove()
      return

