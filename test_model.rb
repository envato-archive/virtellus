BENCH_COUNT = 10_000

require_relative 'lib/virtellus'
require 'benchmark'
require 'virtus'

class SomeModel
  include Virtellus.model

  attribute :name, String
  attribute :age, Integer
  attribute :dob, Date
end

class SomeVModel
  include Virtus.model

  attribute :name, String
  attribute :age, Integer
  attribute :dob, Date
end

class SomeModelStruct < Struct.new(:name, :age, :dob)
end


Benchmark.bm do |bm|
  bm.report "Virtellus" do
    BENCH_COUNT.times do |x|
      SomeModel.new(name: "Sean", age: x, dob: Time.now)
    end
  end

  bm.report "Virtus   " do
    BENCH_COUNT.times do |x|
      SomeVModel.new(name: "Sean", age: x, dob: Time.now)
    end
  end

  bm.report "Struct   " do
    BENCH_COUNT.times do |x|
      SomeModelStruct.new(name: "Sean", age: x, dob: Time.now)
    end
  end
end
