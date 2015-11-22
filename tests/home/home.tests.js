'use strict';

describe('[[--  Notes changes  --]]', function() {

  describe('<<Notes changes with model>>', function(){

    beforeEach(module('noteBook'));

    it('-> should create model notes with 3 items <-', inject(function($controller) {
      var scope = {},
        ctrl = $controller('homeCtrl', {$scope:scope});
      
      expect(scope.notes.length).toBe(3);
      
      // expect(scope.notes).not.toBeEmpty;

      
    }));

  });
});