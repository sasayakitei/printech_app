require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create(validation)' do
    context '必須項目(email, nickname, password, password_confirmation)が入力されている場合' do
      it '入力されたユーザ情報は有効である' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context 'emailがblank, nilの場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        # email <= ''
        user = build(:user, email: '')
        user.valid?
        expect(user.errors[:email]).to include 'を入力してください'

        # email <= nil
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include 'を入力してください'
      end
    end

    context 'emailに"@"が含まれていない場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        user = build(:user, email: 'testuser.com')
        user.valid?
        expect(user.errors[:email]).to include 'は不正な値です'
      end
    end

    context 'すでに同じemailが登録されている場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        email = Faker::Internet.email
        # Create a dummy user.
        create(:user, email: email)

        # Enter the same email as the dummy user.
        user = build(:user, email: email)
        user.valid?
        expect(user.errors[:email]).to include 'はすでに存在します'
      end
    end

    context 'nicknameがblank, nilの場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        # nickname <= ''
        user = build(:user, nickname: '')
        user.valid?
        expect(user.errors[:nickname]).to include 'は3文字以上で入力してください'

        # nickname <= nil
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include 'は3文字以上で入力してください'
      end
    end

    context 'nicknameが2文字の場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        user = build(:user, nickname: 'a' * 2)
        user.valid?
        expect(user.errors[:nickname]).to include 'は3文字以上で入力してください'
      end
    end

    context 'nicknameが3文字の場合' do
      it '入力されたユーザ情報は有効である' do
        user = build(:user, nickname: 'a' * 3)
        expect(user).to be_valid
      end
    end

    context 'nicknameが16文字の場合' do
      it '入力されたユーザ情報は有効である' do
        user = build(:user, nickname: 'a' * 16)
        expect(user).to be_valid
      end
    end

    context 'nicknameが17文字の場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        user = build(:user, nickname: 'a' * 17)
        user.valid?
        expect(user.errors[:nickname]).to include 'は16文字以内で入力してください'
      end
    end

    context 'すでに同じnicknameが登録されている場合' do
      it '入力されたユーザ情報は有効である' do
        nickname = Faker::Internet.username(specifier: 3..16)
        # Create a dummy user.
        create(:user, nickname: nickname)

        # Enter the same email as the dummy user.
        user = build(:user, nickname: nickname)
        expect(user).to be_valid
      end
    end

    context 'passwordがblank, nilの場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        # password, password_confirmation <= ''
        user = build(:user, password: '', password_confirmation: '')
        user.valid?
        expect(user.errors[:password]).to include 'を入力してください'

        # password, password_confirmation <= nil
        user = build(:user, password: nil, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password]).to include 'を入力してください'
      end
    end

    context 'passwordが5文字の場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        pass = 'a' * 5
        user = build(:user, password: pass, password_confirmation: pass)
        user.valid?
        expect(user.errors[:password]).to include 'は6文字以上で入力してください'
      end
    end

    context 'passwordが6文字の場合' do
      it '入力されたユーザ情報は有効である' do
        pass = 'a' * 6
        user = build(:user, password: pass, password_confirmation: pass)
        expect(user).to be_valid
      end
    end

    context 'passwordとpassword_confirmationが異なる場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        pass = Faker::Internet.password(min_length: 6)
        user = build(:user, password: pass, password_confirmation: pass + 'a')
        user.valid?
        expect(user.errors[:password_confirmation]).to include 'とパスワードの入力が一致しません'
      end
    end

    context 'first_nameがblank, nilの場合' do
      it '入力されたユーザ情報は有効である' do
        # first_name <= ''
        user = build(:user, first_name: '')
        expect(user).to be_valid

        # first_name <= nil
        user = build(:user, first_name: nil)
        expect(user).to be_valid
      end
    end

    context 'first_nameが16文字の場合' do
      it '入力されたユーザ情報は有効である' do
        user = build(:user, first_name: 'a' * 16)
        expect(user).to be_valid
      end
    end

    context 'first_nameが17文字の場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        user = build(:user, first_name: 'a' * 17)
        user.valid?
        expect(user.errors[:first_name]).to include 'は16文字以内で入力してください'
      end
    end

    context 'family_nameがblank, nilの場合' do
      it '入力されたユーザ情報は有効である' do
        # family_name <= ''
        user = build(:user, family_name: '')
        expect(user).to be_valid

        # family_name <= nil
        user = build(:user, family_name: nil)
        expect(user).to be_valid
      end
    end

    context 'family_nameが16文字の場合' do
      it '入力されたユーザ情報は有効である' do
        user = build(:user, family_name: 'a' * 16)
        expect(user).to be_valid
      end
    end

    context 'family_nameが17文字の場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        user = build(:user, family_name: 'a' * 17)
        user.valid?
        expect(user.errors[:family_name]).to include 'は16文字以内で入力してください'
      end
    end

    context 'avatar_urlがURL形式である場合' do
      it '入力されたユーザ情報は有効である' do
        user = build(:user, avatar_url: Faker::Internet.url)
        expect(user).to be_valid
      end
    end

    context 'avatar_urlがblank, nilの場合' do
      it '入力されたユーザ情報は有効である' do
        # avatar_url <= ''
        user = build(:user, avatar_url: '')
        expect(user).to be_valid

        # avatar_url <= nil
        user = build(:user, avatar_url: nil)
        expect(user).to be_valid
      end
    end

    context 'avatar_urlがIPV4形式の場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        user = build(:user, avatar_url: Faker::Internet.ip_v4_address)
        user.valid?
        expect(user.errors[:avatar_url]).to include 'URLではありません。'
      end
    end

    context 'avatar_urlがJavaScriptの場合' do
      it '入力されたユーザ情報は無効であり、エラーメッセージが返る' do
        user = build(:user, avatar_url: 'javascript:alert("TEST");')
        user.valid?
        expect(user.errors[:avatar_url]).to include 'URLではありません。'
      end
    end
  end
end
