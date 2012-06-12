## Version 1.0

* initial release

## Version 1.0.1

* add default presenter methods for `created_at` and `updated_at`

## Version 1.0.2

* add rails generators
* allow to change timestamps format

## Version 1.1

* fix `present` helper to return presenter instance if no block is given (test braking change - release new minor version)
* RSpec inspired way to define short and consise methods

## Version 1.1.1

* allow to scope variable when calling #present helper `present [:admin, @article]`

## Version 1.1.2

* bugfix: scoping variable was causing errors (passed object was an array)
* integrate ViewHelper with Cells/Apotomo if it's installed

## Version 1.1.3

* bugfix: wrong filename :/

## Version 1.1.4

* allow to pass Array as object (klass must be given!)