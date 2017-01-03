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

  describe '.to_boolean' do
    context 'when passed true_varchar2' do
      subject { plsql.varchar2_api.to_boolean(plsql.boolean_api.true_varchar2) }
      it { is_expected.to be true }
    end
    context 'when passed false_varchar2' do
      subject { plsql.varchar2_api.to_boolean(plsql.boolean_api.false_varchar2) }
      it { is_expected.to be false }
    end
    context 'when passed null_varchar2' do
      subject { plsql.varchar2_api.to_boolean(plsql.boolean_api.null_varchar2) }
      it { is_expected.to be NULL }
    end
    context 'when passed other value' do
      it { expect{ plsql.varchar2_api.to_boolean(nsv) }.to raise_exception(/ORA-06502/) }
    end
  end

  describe '.to_date' do
    let(:date) { Time.new(1001, 2, 3, 4, 5, 6) }
    subject { plsql.varchar2_api.to_date('1001-02-03 04:05:06', 'YYYY-MM-DD HH24:MI:SS') }
    it { is_expected.to eq date}
  end

  describe '.to_number' do
    subject { plsql.varchar2_api.to_number('123,456.789', 'FM999,999.999') }
    it { is_expected.to eq 123456.789}
  end
end
