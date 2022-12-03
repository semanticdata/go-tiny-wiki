module github.com/xilapa/go-tiny-projects/order-processor

go 1.19

require (
	github.com/mattn/go-sqlite3 v1.14.16
	github.com/xilapa/go-tiny-projects/test-assertions v0.0.0-00010101000000-000000000000
)

require github.com/google/go-cmp v0.5.9 // indirect

replace github.com/xilapa/go-tiny-projects/test-assertions => ../test-assertions
