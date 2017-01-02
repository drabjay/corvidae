require 'spec_helper'

describe 'varchar2_api' do
  let(:nsv) { '$$$Null$$$' }

  describe '.nsv' do
    subject { plsql.varchar2_api.nsv }
    it { is_expected.to eq nsv }
  end

  describe '.is_nsv' do
    context 'when passed nsv' do
      subject { plsql.varchar2_api.is_nsv(nsv) }
      it { is_expected.to be true }
    end
    context 'when not passed nsv' do
      let(:not_nsv) { 'not nsv' }
      subject { plsql.varchar2_api.is_nsv(not_nsv) }
      it { is_expected.to be false }
    end
    context 'when passed null' do
      subject { plsql.varchar2_api.is_nsv(NULL) }
      it { is_expected.to be false }
    end
  end

  describe '.nvl' do
    let(:first)  { 'first' }
    let(:second) { 'second' }
    context 'when first argument is nsv' do
      subject { plsql.varchar2_api.nvl(nsv, second) }
      it { is_expected.to eq second }
    end
    context 'when first argument is not nsv' do
      subject { plsql.varchar2_api.nvl(first, second) }
      it { is_expected.to eq first }
    end
    context 'when first argument is null' do
      subject { plsql.varchar2_api.nvl(NULL, second) }
      it { is_expected.to be NULL }
    end
  end
end
