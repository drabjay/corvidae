require 'spec_helper'

describe 'varchar2_api' do
  describe '.nsv' do
    subject { plsql.varchar2_api.nsv }
    it { is_expected.to eq '$$$Null$$$' }
  end

  describe '.is_nsv' do
    context 'when passed nsv' do
      subject { plsql.varchar2_api.is_nsv('$$$Null$$$') }
      it { is_expected.to be true }
    end
    context 'when not passed nsv' do
      subject { plsql.varchar2_api.is_nsv('nsv') }
      it { is_expected.to be false }
    end
    context 'when passed null' do
      subject { plsql.varchar2_api.is_nsv(NULL) }
      it { is_expected.to be false }
    end
  end
end
