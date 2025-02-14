require 'spec_helper'

describe 'sendmail::mc::ostype' do
  on_supported_os.each do |os, facts|
    let(:facts) { facts }

    context "on #{os}" do
      case facts[:osfamily]
      when 'Debian'
        let(:title) { 'debian' }

        it {
          is_expected.to contain_concat__fragment('sendmail_mc-ostype-debian')
            .with_content(%r{^OSTYPE\(`debian'\)dnl$})
            .with_order('05')
        }
      when 'RedHat'
        let(:title) { 'linux' }

        it {
          is_expected.to contain_concat__fragment('sendmail_mc-ostype-linux')
            .with_content(%r{^OSTYPE\(`linux'\)dnl$})
            .with_order('05')
        }

      when 'FreeBSD'
        let(:title) { 'freebsd6' }

        it {
          is_expected.to contain_concat__fragment('sendmail_mc-ostype-freebsd6')
            .with_content(%r{^OSTYPE\(`freebsd6'\)dnl$})
            .with_order('05')
        }
      end
    end
  end
end
