# Go Tiny Wiki

A simple wiki server that store pages on a txt file. If the page doesn't exists, user is redirect to the edit page.

To start the wiki go to go-wiki and run: `go run .`

The wiki make use of the below **lfu-cache** to keep the most accessed pages in memory. These pages are listed at `localhost:8080`.

## lfu-cache

A in-memory cache with Least Frequently Used (LFU) eviction algorithm with O(1) time complexity. The algorithm is inspired on [this paper](https://www.researchgate.net/publication/355493987_An_O1_algorithm_for_implementing_the_LFU_cache_eviction_scheme), that proposes the use of a linked list of linked lists to store the cache items frequency.

On this package, instead of using linked list of linked lists, a map with linked lists and one variable is used to keep track of items usage frequency. Linked lists of cache items keys, are stored on the map, having the frequency as key. The lower usage frequency is stored on a variable.

A custom linked list of strings is used on this package to gain ~30% on execution time and reduce one allocation when removing the lfu item, the performance gain measured with go official benchmark tool is shown below:

```
goos: linux
goarch: amd64
pkg: github.com/xilapa/go-tiny-projects/lfu-cache
cpu: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz

│ untyped_linked_list.txt │    typed_linked_list.txt     │
__________________________________________________________
│         sec/op          │   sec/op     vs base         │
│      464.2n ± 32%       │ 304.4n ± 0%  -34.42% (n=100) │
__________________________________________________________
│          B/op           │    B/op     vs base          │
│       120.0 ± 0%        │  104.0 ± 0%  -13.33% (n=100) │
__________________________________________________________
│        allocs/op        │ allocs/op   vs base          │
│       5.000 ± 0%        │  4.000 ± 0%  -20.00% (n=100) │
```

## Inspirations

This project is based on [xilapa/go-tiny-projects](https://github.com/xilapa/go-tiny-projects) which itself is based/inspired on the following contents:

- Wesley Willians lessons from [Full Cycle Youtube channel](https://www.youtube.com/c/FullCycle/).
- Table Driven Tests from [Golang Wiki](https://github.com/golang/go/wiki/TableDrivenTests).
- Writing Web Applications from [Go Blog](https://go.dev/doc/articles/wiki/).
- Mastering Go HTML Templates from [Philipp Tanlak](https://philipptanlak.com/mastering-html-templates-in-go-the-fundamentals/).

It also follows some guidelines from [Uber Go Style Guide](https://github.com/uber-go/guide/blob/master/style.md), like the interface compliance at compile time, function grouping and ordering.

## Other Tiny Go Projects

This project used to include a few other tiny go projects and can be found in another [branch](https://github.com/semanticdata/go-tiny-wiki/tree/bak/2024-11-27). These other projects were removed from the main branch as I am only interested in tinkering with their wiki implementation.
