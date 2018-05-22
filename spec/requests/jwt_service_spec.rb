require 'rails_helper'

describe JwtService do
  subject { described_class }

  let(:payload) { { 'one' => 'two' } }
  let(:token) { '123' }

  describe '.encode' do
    xit { expect(subject.encode(payload)).to eq(token) }
  end

  describe '.decode' do
    xit { expect(subject.decode(token)).to eq(payload) }
  end
end
