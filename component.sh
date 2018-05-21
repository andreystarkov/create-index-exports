#!/bin/bash
projectSrc='./src'

component="import React, { Component } from 'react'

export default class $1 extends Component {
  render () {
    return (<div />)
  }
}"

style=""

index="import $1 from './$1'

export default $1"

echo "Creating component $1"
mkdir ./src/Components/$1
printf '%s\n' "$component" >> ./$projectSrc/Components/$1/$1.js
# printf '%s\n' "$style" >> ./src/Components/$1/$1.css
printf '%s\n' "$index" >> ./$projectSrc/Components/$1/index.js
node ./createIndexExports.js ./$projectSrc/Components
