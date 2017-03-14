require 'spec_helper'

describe 'exception_api' do
  let(:application_error_number)  { -20001 }

  describe '.application_error_number' do
    subject { plsql.exception_api.application_error_number }
    it { is_expected.to eq application_error_number }
  end

  describe '.evoke' do
    context 'when passed message code' do
      it { expect{ plsql.exception_api.evoke('MESSAGE_CODE') }.to raise_exception(/ORA-20001/) }
    end
    context 'when message set' do
      before { plsql.exception_api.set_message('MESSAGE_CODE') }
      it { expect{ plsql.exception_api.evoke }.to raise_exception(/ORA-20001/) }
    end
  end
end