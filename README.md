# Virtellus

A small, faster, less powerful Virtus.

# Usage

Right now Virtellus only supports very basic Virtus usage of models:

``` ruby
class SomeModel
  include Virtellus.model

  attribute :name, String
  attribute :age, Integer
  attribute :dob, Date
end
```

This is exactly the same as Virtus:

``` ruby
class SomeVirtusModel
  include Virtus.model

  attribute :name, String
  attribute :age, Integer
  attribute :dob, Date
end
```

But faster:

```
ruby test_model.rb                                                                                                                                                                               2.1.3
             user     system      total        real
Virtellus  0.110000   0.000000   0.110000 (  0.113313)
Virtus     0.210000   0.000000   0.210000 (  0.210946)
Struct     0.020000   0.000000   0.020000 (  0.025170)
```
