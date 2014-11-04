require 'spec_helper.rb'

describe U2F::ClientData do
  let(:type) { '' }
  let(:registration_type) { 'navigator.id.finishEnrollment' }
  let(:authentication_type) { 'navigator.id.getAssertion' }

  let(:client_data) do
    cd = U2F::ClientData.new
    cd.typ = type
    cd
  end

  describe '#registration?' do
    subject { client_data.registration? }
    context 'for correct type' do
      let(:type) { registration_type }
      it { is_expected.to be_truthy }
    end

    context 'for incorrect type' do
      let(:type) { authentication_type }
      it { is_expected.to be_falsey }
    end
  end

  describe '#authentication?' do
    subject { client_data.authentication? }
    context 'for correct type' do
      let(:type) { authentication_type }
      it { is_expected.to be_truthy }
    end

    context 'for incorrect type' do
      let(:type) { registration_type }
      it { is_expected.to be_falsey }
    end
  end
end
