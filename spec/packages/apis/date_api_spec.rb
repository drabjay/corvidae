require 'spec_helper'

describe 'date_api' do
  let(:nsv) { Time.new(-4712, 12, 31, 12, 13, 14) }

  describe '.nsv' do
    subject { plsql.date_api.nsv }
    it { is_expected.to eq nsv }
  end
end
