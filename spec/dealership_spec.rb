require('rspec')
require('dealership')
require('pry')

describe(Dealership) do
  before() do
    Dealership.clear()
  end

  describe('#name') do
    it("returns the name of the dealership") do
      test_dealership = Dealership.new("Used Cars")
      expect(test_dealership.name()).to(eq("Used Cars"))
    end
  end

  describe('#id') do
    it("returns the id of the dealership") do
      test_dealership = Dealership.new("Used Cars")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe('#save') do
    it("adds a dealership to the array of saved dealerships") do
      test_dealership = Dealership.new("Used Cars")
      test_dealership.save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved dealerships") do
      Dealership.new("Used Cars").save()
      Dealership.clear()
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a dealership by its id number") do
      test_dealership = Dealership.new("Used Cars")
      test_dealership.save()
      test_dealership2 = Dealership.new("Used Cars Plus")
      test_dealership2.save
      expect(Dealership.find(test_dealership.id())).to(eq(test_dealership))
    end
  end
end
