# coc.nvim tsserver bug

Inside this repo run:

```
docker build --no-cache --target linux -t linux .
docker run -it linux

```

Then, in the docker container run `vim` and inside vim run `:CocInstall coc-tsserver`

Quit vim and restart it with `vim -u mini.vim`

Create a `test.ts` file and create and correct errors without saving.
