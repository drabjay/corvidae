require 'spec_helper'

describe 'number_api' do
  let(:nsv) { -789456123 }

  describe '.nsv' do
    subject { plsql.number_api.nsv }
    it { is_expected.to eq nsv }
  end
end
