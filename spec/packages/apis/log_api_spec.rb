require 'spec_helper'

describe 'log_api' do
  let(:loff)        { 0 }
  let(:lfatal)      { 10 }
  let(:lerror)      { 20 }
  let(:lwarning)    { 30 }
  let(:linfo)       { 40 }
  let(:ldebug)      { 50 }
  let(:lall)        { 60 }
  let(:ldisallowed) { 99 }

  describe '.loff' do
    subject { plsql.log_api.loff }
    it { is_expected.to eq loff }
  end

  describe '.lfatal' do
    subject { plsql.log_api.lfatal }
    it { is_expected.to eq lfatal }
  end

  describe '.lerror' do
    subject { plsql.log_api.lerror }
    it { is_expected.to eq lerror }
  end

  describe '.lwarning' do
    subject { plsql.log_api.lwarning }
    it { is_expected.to eq lwarning }
  end

  describe '.linfo' do
    subject { plsql.log_api.linfo }
    it { is_expected.to eq linfo }
  end

  describe '.ldebug' do
    subject { plsql.log_api.ldebug }
    it { is_expected.to eq ldebug }
  end

  describe '.lall' do
    subject { plsql.log_api.lall }
    it { is_expected.to eq lall }
  end

  describe '.level' do
    subject { plsql.log_api.level }
    context 'when set to allowed value' do
      before { plsql.log_api.set_level(lwarning) };
      it { is_expected.to eq lwarning }
    end
    context 'when set to disallowed value' do
      before do
        plsql.log_api.set_level(linfo)
        plsql.log_api.set_level(ldisallowed)
      end
      it { is_expected.to eq linfo }
    end
  end

  describe '.is_fatal' do
    subject { plsql.log_api.is_fatal }
    context 'when less than level' do
      before { plsql.log_api.set_level(loff) };
      it { is_expected.to be false }
    end
    context 'when equal to level' do
      before { plsql.log_api.set_level(lfatal) };
      it { is_expected.to be true }
    end
    context 'when greater than level' do
      before { plsql.log_api.set_level(lerror) };
      it { is_expected.to be true }
    end
  end

  describe '.is_error' do
    subject { plsql.log_api.is_error }
    context 'when less than level' do
      before { plsql.log_api.set_level(lfatal) };
      it { is_expected.to be false }
    end
    context 'when equal to level' do
      before { plsql.log_api.set_level(lerror) };
      it { is_expected.to be true }
    end
    context 'when greater than level' do
      before { plsql.log_api.set_level(lwarning) };
      it { is_expected.to be true }
    end
  end

  describe '.is_warning' do
    subject { plsql.log_api.is_warning }
    context 'when less than level' do
      before { plsql.log_api.set_level(lerror) };
      it { is_expected.to be false }
    end
    context 'when equal to level' do
      before { plsql.log_api.set_level(lwarning) };
      it { is_expected.to be true }
    end
    context 'when greater than level' do
      before { plsql.log_api.set_level(linfo) };
      it { is_expected.to be true }
    end
  end

  describe '.is_info' do
    subject { plsql.log_api.is_info }
    context 'when less than level' do
      before { plsql.log_api.set_level(lwarning) };
      it { is_expected.to be false }
    end
    context 'when equal to level' do
      before { plsql.log_api.set_level(linfo) };
      it { is_expected.to be true }
    end
    context 'when greater than level' do
      before { plsql.log_api.set_level(ldebug) };
      it { is_expected.to be true }
    end
  end

  describe '.is_debug' do
    subject { plsql.log_api.is_debug }
    context 'when less than level' do
      before { plsql.log_api.set_level(linfo) };
      it { is_expected.to be false }
    end
    context 'when equal to level' do
      before { plsql.log_api.set_level(ldebug) };
      it { is_expected.to be true }
    end
    context 'when greater than level' do
      before { plsql.log_api.set_level(lall) };
      it { is_expected.to be true }
    end
  end

  describe '.is_all' do
    subject { plsql.log_api.is_all }
    context 'when less than level' do
      before { plsql.log_api.set_level(ldebug) };
      it { is_expected.to be false }
    end
    context 'when equal to level' do
      before { plsql.log_api.set_level(lall) };
      it { is_expected.to be true }
    end
  end
end
