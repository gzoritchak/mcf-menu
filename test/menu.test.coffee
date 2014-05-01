# test/calculator.test.coffee

Menu = require '../index'

exports.MenuTest =

  'Test Bread crumb': (test) ->
    root = new Menu()
    root
      .menu 'Santé'
        .subM('comparaison-cmu-lamal', 'CMU ou Lamal')

    bread = root.breadCrumb ('comparason-cmu-lamal')
    test.equal(bread, 'Accueil / Santé / CMU ou Lamal')
    console.log root
    test.done()


  'Test générer menu': (test) ->
    root = new Menu()
    root
      .menu 'Santé'
        .subM 'comparaison-cmu-lamal' , 'CMU ou Lamal'
        .subM 'cmu-lamal' , 'CMU et Lamal'

    html = root.asHtml()
    console.log html
    test.done()

