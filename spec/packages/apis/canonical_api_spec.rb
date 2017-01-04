require 'spec_helper'

describe 'canonical_api' do
  let(:date_format_model)   { 'J:SSSSS' }
  let(:number_format_model) { 'FM99999999999999999999999999999999999990.099999999999999999999999' }

  describe '.date_format_model' do
    subject { plsql.canonical_api.date_format_model }
    it { is_expected.to eq date_format_model }
  end

  describe '.number_format_model' do
    subject { plsql.canonical_api.number_format_model }
    it { is_expected.to eq number_format_model }
  end
end
