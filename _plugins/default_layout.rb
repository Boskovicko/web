module ImplicitLayout
  def read_yaml(*args)
    super
    self.data['layout'] ||= 'article'
  end
end

Jekyll::Post.send(:include, ImplicitLayout)
