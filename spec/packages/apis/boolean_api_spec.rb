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
end
