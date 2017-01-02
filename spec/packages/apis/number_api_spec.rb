require 'spec_helper'

describe 'number_api' do
  let(:nsv) { -789456123 }

  describe '.nsv' do
    subject { plsql.number_api.nsv }
    it { is_expected.to eq nsv }
  end

  describe '.is_nsv' do
    context 'when passed nsv' do
      subject { plsql.number_api.is_nsv(nsv) }
      it { is_expected.to be true }
    end
    context 'when not passed nsv' do
      let(:not_nsv) { 123456789 }
      subject { plsql.number_api.is_nsv(not_nsv) }
      it { is_expected.to be false }
    end
    context 'when passed null' do
      subject { plsql.number_api.is_nsv(NULL) }
      it { is_expected.to be false }
    end
  end

  describe '.nvl' do
    let(:first)  { 1 }
    let(:second) { 2 }
    context 'when first argument is nsv' do
      subject { plsql.number_api.nvl(nsv, second) }
      it { is_expected.to eq second }
    end
    context 'when first argument is not nsv' do
      subject { plsql.number_api.nvl(first, second) }
      it { is_expected.to eq first }
    end
    context 'when first argument is null' do
      subject { plsql.number_api.nvl(NULL, second) }
      it { is_expected.to be NULL }
    end
  end
end
