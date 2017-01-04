require 'spec_helper'

describe 'canonical_api' do
  let(:date_format_model)   { 'J:SSSSS' }
  let(:number_format_model) { 'FM99999999999999999999999999999999999990.099999999999999999999999' }

  describe '.date_format_model' do
    subject { plsql.canonical_api.date_format_model }
    it { is_expected.to eq date_format_model }
  end

  describe '.to_date' do
    let(:date) { Time.new(1001, 2, 3, 4, 5, 6) }
    subject { plsql.canonical_api.to_date('2086707:14706') }
    it { is_expected.to eq date}
  end

  describe '.number_format_model' do
    subject { plsql.canonical_api.number_format_model }
    it { is_expected.to eq number_format_model }
  end

  describe '.to_number' do
    subject { plsql.canonical_api.to_number('123456.789') }
    it { is_expected.to eq 123456.789}
  end
end
