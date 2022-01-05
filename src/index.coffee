#!/usr/bin/env coffee

# enter point
{ program } = require 'commander'

# cmd handler fn
{ init } = require './handlers'

# expose all useable command line interface here
cmds = [
  {
    n: 'init',
    msg: 'complete initial by answer questions steply.',
    args: [
      {n: '[template]', msg: 'template you want use'},
      {n: '[project]', msg: 'project name'},
    ],
    fn: init,
    isDefault: true
  }
]

# config each cmd
cmds.forEach ({n, msg, args, fn, isDefault }) -> 
  cmd = program.command n, { isDefault }
    .description msg
    .action fn
  if args
    args.forEach ({n, msg}) ->
      cmd.argument n, msg

# install commands
program.parse()

