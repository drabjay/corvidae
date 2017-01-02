require 'spec_helper'

describe 'varchar2_api' do
  describe 'nsv' do
    subject { plsql.varchar2_api.nsv }
    it { is_expected.to eq '$$$Null$$$' }
  end
end
