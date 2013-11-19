module ImplicitLayout
  def read_yaml(*args)
    super
    self.data['layout'] ||= 'clanek'
  end
end

Jekyll::Post.send(:include, ImplicitLayout)
