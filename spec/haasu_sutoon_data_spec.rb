require 'spec_helper'

describe HaasuSutoonData do
  subject(:hsd) { HaasuSutoonData }

  describe 'version' do
    subject { hsd::VERSION }
    it { expect(subject).not_to be_nil }
  end

  describe 'file_id' do
    subject { hsd.file_id }

    before do
      stub_const("#{hsd}::VERSION", '9.9.9')
      allow(Time).to receive(:now).and_return(Time.local(2015, 12, 19, 19, 35, 12))
    end

    it { expect(subject).to eq('9.9.9/20151219193512') }
  end
end
