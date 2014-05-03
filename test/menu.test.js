// Generated by CoffeeScript 1.7.1
(function() {
  var MenuBuilder;

  MenuBuilder = require('../index');

  exports.MenuTest = {
    'Test Bread crumb': function(test) {
      var bread, root;
      root = new MenuBuilder();
      root.menu('Santé').subM('comparaison-cmu-lamal', 'CMU ou Lamal');
      bread = root.breadCrumb('comparason-cmu-lamal');
      test.equal(bread, 'Accueil / Santé / CMU ou Lamal');
      console.log(root);
      return test.done();
    },
    'Test générer menu': function(test) {
      var html, root;
      root = new MenuBuilder();
      root.menu('Santé').subM('comparaison-cmu-lamal', 'CMU ou Lamal').subM('cmu-lamal', 'CMU et Lamal');
      html = root.asHtml();
      console.log(html);
      return test.done();
    },
    'Mapping des pages': function(test) {
      var mappings, mb;
      mb = new MenuBuilder();
      mb.menu('contact', 'Contact');
      mappings = mb.mappings();
      test.equals({
        url: 'contact',
        title: 'Contact'
      }, mappings);
      return test.done();
    },
    'Construction menu': function(test) {
      var menu;
      menu = m('H1', '/', []);
      console.log(menu);
      return test.done();
    }
  };

}).call(this);

//# sourceMappingURL=menu.test.map
