require 'spec_helper'

describe 'date_api' do
  let(:nsv) { Time.new(-4712, 12, 31, 12, 13, 14) }

  describe '.nsv' do
    subject { plsql.date_api.nsv }
    it { is_expected.to eq nsv }
  end

  describe '.is_nsv' do
    context 'when passed nsv' do
      subject { plsql.date_api.is_nsv(nsv) }
      it { is_expected.to be true }
    end
    context 'when not passed nsv' do
      let(:not_nsv) { Time.new(1001, 2, 3, 4, 5, 6) }
      subject { plsql.date_api.is_nsv(not_nsv) }
      it { is_expected.to be false }
    end
    context 'when passed null' do
      subject { plsql.date_api.is_nsv(NULL) }
      it { is_expected.to be false }
    end
  end

  describe '.nvl' do
    let(:first)  { Time.new(1001, 1, 1, 1, 1, 1) }
    let(:second) { Time.new(2002, 2, 2, 2, 2, 2) }
    context 'when first argument is nsv' do
      subject { plsql.date_api.nvl(nsv, second) }
      it { is_expected.to eq second }
    end
    context 'when first argument is not nsv' do
      subject { plsql.date_api.nvl(first, second) }
      it { is_expected.to eq first }
    end
    context 'when first argument is null' do
      subject { plsql.date_api.nvl(NULL, second) }
      it { is_expected.to be NULL }
    end
  end
end
