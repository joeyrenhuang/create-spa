###
- web
  -  webpack / vite / rollup
  -  vue / react / angular
  -  coffeescript ?
  -  pug stylus ?
  -  jsex ?
  -  theme support ?
###
Q = [
  {
    k: 'tool'
    q: 'Choose a tool for building your app.'
    opt: ['vite', 'webpack', 'rollup']
  },
  {
    k: 'lib'
    q: 'Choose a engine for boot your app.'
    opt: ['vue', 'react', 'angular']
  },
  {
    t: 'checkbox',
    k: 'more'
    q: 'Add addtion configs to initial your app.'
    opt: [
      {
        value: 'coffee'
        name: 'coffee: use coffeescript'
      }
      {
        value: 'pug/stylus'
        name: 'pug/stylus: use pug html engine and stylus css enginer.'
      }
      {
        value: 'theme'
        name: 'theme: add skin support for your app'
      }
      {
        value: 'jsex'
        name: 'jsex: extend js prototype.'
      }
    ]
  },
  {
    t: 'input'
    r: true
    k: 'app'
    q: 'Enter your app name.'
  }
]
inquirer = require 'inquirer'
module.exports = () ->
  console.log 'cfging project steply.'
  inquirer.prompt Q.map ({ t, r, k, q, opt, multiple}) ->
                    {
                      type: t or 'list'
                      name: k
                      message: q
                      choices: opt
                      validate: (v, vs) ->
                        !r || !!v 
                    }
          .then cfging
cfging = (cfg) ->
  # console.log """Your config is #{JSON.stringify(cfg, null, 2)}"""
  console.log('Not implemented!')
