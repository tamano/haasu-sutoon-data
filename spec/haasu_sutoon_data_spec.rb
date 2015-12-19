require 'spec_helper'

describe HaasuSutoonData do
  subject(:hsd) { HaasuSutoonData }

  describe 'version' do
    subject { hsd::VERSION }
    it { expect(subject).not_to be_nil }
  end

end
