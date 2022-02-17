cfging = require './cfging'
module.exports = (tpl, app) ->
  if !tpl then return cfging()
  create tpl, app || """#{tpl}-app"""


create = (tpl, app) ->
  console.log """
    Project name: #{app}, base on Template: #{tpl}
    Creating...
  """
  # use degit or git clone --depth 1
  # use git clone
  tpls = require './tpls'
  if tpl of tpls
    clone tpls[tpl], app
  else
    console.log """Template #{tpl} not found"""
    console.log """Available Templates list: #{Object.keys(tpls)}"""

clone = (url, app) ->
  shell = require 'shelljs' 
  if (url.endsWith '.git') is no
    dir = url.match(/\.git\/(.*)/)[1]
    url = url.match(/(.*\.git)/)[1]
  if (shell.exec """git clone --depth=1 #{url} #{app}""").code is 0
    shell.cd app
    if dir
      shell.exec("""FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch --prune-empty --subdirectory-filter #{dir} HEAD""")
    shell.rm '-rf', """./.git"""
    # addons: add initial css / jsex
    if (app.indexOf 'src') is -1 
      create 'jsex', 'src/jsex'
      create 'css', 'src/css'
    else
      return shell.cd '../..'
    console.log 'Initial your app success.'
    shell.exit 0
  else shell.exit 1
