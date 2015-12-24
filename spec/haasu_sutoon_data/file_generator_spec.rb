require 'spec_helper'

describe HaasuSutoonData do
  subject(:hsd) { HaasuSutoonData }

  describe 'create_dictonary' do
    subject { hsd.create_dictonary(from, to) }

    context 'with MiniTest file' do
      let(:from) do
        JSON.parse(File.read('spec/fixtures/MiniTest.json'))
      end

      let(:to) do
        JSON.parse(File.read('spec/fixtures/MiniTest.jaJP.json'))
      end

      it { expect(subject.size).to eq(4) }

      it do
        result = File.read('spec/fixtures/MiniTestResult.json')
        expect(subject.to_json.to_s).to eq(result.strip)
      end
    end
  end

  describe 'create_id_name_hash' do
    subject { hsd.create_id_name_hash(json) }

    context 'with MiniTest.json' do
      let(:json) do
        JSON.parse(File.read('spec/fixtures/MiniTest.json'))
      end

      it { expect(subject.size).to eq(4) }

      it { expect(subject['EX1_066']).to eq('Acidic Swamp Ooze') }
      it { expect(subject['GAME_004']).to eq('AFK') }
      it { expect(subject['BRMA15_4']).to eq('Aberration') }
      it { expect(subject['BRMA14_2H']).to eq('Activate Arcanotron') }
    end
  end
end
