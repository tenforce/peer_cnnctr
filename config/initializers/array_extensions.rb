class Array

  ## Returns a new array containing all elements of the Array without
  ## the supplied element.
  def without( *items )
    self.reject { |o| items.include? o }
  end

  ## Alters the current array so it does not contain the supplied
  ## element.
  def without!( *items )
    self.reject! { |o| items.include? o }
  end

end
