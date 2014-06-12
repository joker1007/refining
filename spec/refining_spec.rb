require 'spec_helper'

class Foo
  refining :HasName do
    def name
      "foo"
    end
  end
end

describe Foo do
  context "Using Foo::HasName" do
    using Foo::HasName

    subject { Foo.new.name }

    it { is_expected.to eq "foo" }
  end

  context "no Using" do
    subject { Foo.new.name }

    it { expect{ subject }.to raise_error(NoMethodError) }
  end
end
