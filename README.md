# createIndexExports.js
### index.js exports generator

I use this structure for react components and other things:

```zsh
  Components\
    AwesomeButton\
      AwesomeButton.js
      index.js
    NicyHeader\
    SexyDrawer\
    SomeOther\
```

Also i use absolute paths and imports like:

```js 
  import { AwesomeButton, NicyHeader, SexyDrawer } from 'Components'
```

Importing this way require index.js file in Components folder, that route all exports right way.
if i run:

```zsh
  $ node ./createIndexExports.js ./Components
```

It will create index.js file with all exports:

```jsx
  import AwesomeButton from './AwesomeButton'
  import NicyHeader from './NicyHeader'
  ...
  export {
    AwesomeButton,
    NicyHeader,
    ...
  }

```

It can be useful with other tools. For example, i have dumb script, that automaticly adds an empty component with given name. like:

```zsh
# component.sh
component="import React, { Component } from 'react'

export default class $1 extends Component {
  render () {
    return (<div />)
  }
}"

index="import $1 from './$1'

export default $1"

mkdir ./src/Components/$1
printf '%s\n' "$component" >> ./src/Components/$1/$1.js
printf '%s\n' "$index" >> ./src/Components/$1/index.js

node ./tools/createIndexExports.js ./src/Components
```

I run:

```zsh
  $ ./component.sh SomeComponent
```

Then i have new import-ready component. Magic!