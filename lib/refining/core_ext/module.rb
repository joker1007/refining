class Module
  def refining(topic, &block)
    raise "refining needs block" unless block

    klass = self
    const_set topic, Module.new {
      refine klass do
        module_eval(&block)
      end
    }
  end
end
