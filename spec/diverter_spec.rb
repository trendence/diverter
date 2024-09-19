require 'spec_helper'

describe Diverter do

  class Monkey
    class << self
      def cheek
      end
    end
  end

  it 'has a version number' do
    expect(Diverter::VERSION).not_to be nil
  end

  describe 'its constructor' do
    context 'without condition delivered' do
      subject { described_class.new { Monkey.cheek } }

      it 'executes block in a forked process' do
        expect_any_instance_of(Object).to receive(:fork).and_call_original
        subject
      end
    end

    context 'with condition false' do
      subject { described_class.new(condition: false) { Monkey.cheek } }

      it 'executes block in unforked' do
        expect(Monkey).to receive(:cheek)
        expect_any_instance_of(Object).not_to receive(:fork)
        subject
      end
    end

    context 'with condition nil' do
      subject { described_class.new(condition: nil) { Monkey.cheek } }

      it 'executes block in unforked' do
        expect(Monkey).to receive(:cheek)
        expect_any_instance_of(Object).not_to receive(:fork)
        subject
      end
    end


    context 'with condition true' do
      subject { described_class.new(condition: true) { Monkey.cheek } }

      it 'executes block in a forked process' do
        expect_any_instance_of(Object).to receive(:fork).and_call_original
        subject
      end
    end

  end
end
