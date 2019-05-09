RSpec.describe Recurrence do
  describe "VERSION" do
    it { expect(Recurrence::VERSION).not_to be nil }
  end

  describe '.for' do
    subject(:event) { Recurrence.for(opts) }
    context 'with no arguments' do
      it { expect(Recurrence.for).to be_instance_of(Recurrence::Event) }
    end
    context 'when empty options are passed' do
      let(:opts) { {} }
      it do
        is_expected.to be_instance_of(Recurrence::Event)
        expect(event.options).to be_empty
      end
    end
    context 'with valid options' do
      let(:opts) { { event: 'stand-up', repeat: 'daily' } }
      it do
        expect(event.options).to eq(opts)
      end
    end
  end
end
