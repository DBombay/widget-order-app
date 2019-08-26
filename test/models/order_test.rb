require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  order_params= {widget_type: 'Widget', color: 'red', quantity: 2, need_by: 2.weeks.from_now}

  test "should not save if there is no widget type" do
    o = Order.new(order_params)
    o.widget_type = nil

    assert_not o.save, "Saved the order without a widget type"
    assert_not o.errors.empty?
  end

  test "should not save if there is not a valid widget type" do
    o = Order.new(order_params)
    o.widget_type = "Super Widget"

    assert_not o.save, "Saved the order with an invalid widget type"
    assert_not o.errors.empty?
  end

  test "should not save if there is no color" do
    o = Order.new(order_params)
    o.color = nil
    assert_not o.save, "Saved the order without a color"
    assert_not o.errors.empty?
  end

  test "should not save if there is an invalid color" do
    o = Order.new(order_params)
    o.color = "purple"
    assert_not o.save, "Saved the order with an invalid color"
    assert_not o.errors.empty?
  end

  test "should not save if there is no quantity" do
    o = Order.new(order_params)
    o.quantity = nil
    assert_not o.save, "Saved the order without a quantity specified"
  end

  test "should not save if there is a 0 quantity" do
    o = Order.new(order_params)
    o.quantity = 0
    assert_not o.save, "Saved the order with 0 quantity"
  end

  test "should not save if there is a negative quantity" do
    o = Order.new(order_params)
    o.quantity = -1
    assert_not o.save, "Saved the order with a negative quantity"
  end

  test "should not save if quantity is a float" do
    o = Order.new(order_params)
    o.quantity = 1.2
    assert_not o.save, "Saved the order with a float value for quantity"
  end

  test "should not save if there is no need_by date" do
    o = Order.new(order_params)
    o.need_by = ""
    assert_not o.save, "Saved the order without a need_by specified"
  end

  test "should not save if need_by is less than a week from now" do
    o = Order.new(order_params)
    o.need_by = 5.days.from_now
    assert_not o.save, "Saved the order with an invalid need_by date"
  end

  test "should save if given valid attributes" do
    o = Order.create(order_params)
    assert o.save, "Valid order was not saved"
  end
end
