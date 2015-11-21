noteBook.controller 'homeCtrl', ($scope)->
  console.log 'Run homeCtrl'
  $scope.notes = []
  $scope.noteId = 0

  note =
    id: $scope.noteId++
    text: "Запуск сервера в фхаусе: vagrant ssh"
    date: new Date().toLocaleString()
  $scope.notes.push note
  note = 
    id: $scope.noteId++
    text: "Текст заметки из контроллера 2"
    date: new Date().toLocaleString()
  $scope.notes.push note

  # Create new note
  newNoteInput = angular.element document.getElementById "new-note-input"
  $scope.createNote = ->
    newNoteText = newNoteInput.val()
    if newNoteText
      note = 
        id: $scope.noteId++
        text: newNoteText
        date: new Date().toLocaleString()
      $scope.notes.push note
      newNoteInput.val ""


  $scope.removeNote = ($event)->
    currentNote = angular.element($event.currentTarget).closest("content-list_item") 
    currentNote.remove()
    return
    
