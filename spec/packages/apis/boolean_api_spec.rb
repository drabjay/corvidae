require 'spec_helper'

describe 'boolean_api' do
  let(:true_varchar2)  { 'TRUE' }
  let(:false_varchar2) { 'FALSE' }
  let(:null_varchar2)  { 'NULL' }
  let(:true_number)    { 1 }
  let(:false_number)   { 0 }
  let(:null_number)    { NULL }

  describe '.true_varchar2' do
    subject { plsql.boolean_api.true_varchar2 }
    it { is_expected.to eq true_varchar2 }
  end

  describe '.false_varchar2' do
    subject { plsql.boolean_api.false_varchar2 }
    it { is_expected.to eq false_varchar2 }
  end

  describe '.null_varchar2' do
    subject { plsql.boolean_api.null_varchar2 }
    it { is_expected.to eq null_varchar2 }
  end

  describe '.true_number' do
    subject { plsql.boolean_api.true_number }
    it { is_expected.to eq true_number }
  end

  describe '.false_number' do
    subject { plsql.boolean_api.false_number }
    it { is_expected.to eq false_number }
  end

  describe '.null_number' do
    subject { plsql.boolean_api.null_number }
    it { is_expected.to eq null_number }
  end

  describe '.to_char' do
    context 'when passed true' do
      subject { plsql.boolean_api.to_char(true) }
      it { is_expected.to eq true_varchar2 }
    end
    context 'when passed false' do
      subject { plsql.boolean_api.to_char(false) }
      it { is_expected.to eq false_varchar2 }
    end
    context 'when passed null' do
      subject { plsql.boolean_api.to_char(NULL) }
      it { is_expected.to eq null_varchar2 }
    end
  end

  describe '.to_number' do
    context 'when passed true' do
      subject { plsql.boolean_api.to_number(true) }
      it { is_expected.to eq true_number }
    end
    context 'when passed false' do
      subject { plsql.boolean_api.to_number(false) }
      it { is_expected.to eq false_number }
    end
    context 'when passed null' do
      subject { plsql.boolean_api.to_number(NULL) }
      it { is_expected.to eq null_number }
    end
  end
end
