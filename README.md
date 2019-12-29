Haskell-IDE-Engine
--------------------
* There are some steps you need to be aware of to have a seemless hie
  experience:

  - you need to have a new(ish) version of `nvim` and `node`. To do that, just
    following the *appimage* instructions on nvim's README. For node, just use
    `nvm` and get the latest.

  - Another annoying thing is that `hie` looks for `ghc` on your path. So, if
    you're using stack you obviously didn't install GHC globally. Even if you
    did, it would be annoying to sync versions with the local project you have
    stack managing for you. So to fix this, make sure that your stack packages
    path (I think the default is `~/.local/bin`) is available. Then you need to
    make sure that the following is in your `CocConfig`:

```json
"languageserver": {
  "haskell": {
    "command": "stack",
      "args": ["exec", "hie-wrapper"]
  }
}
```
