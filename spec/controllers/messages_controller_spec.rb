require 'rails_helper'
require 'spec_helper'
describe MessagesController do
  let(:user) {create(:user)}
  let(:group) {create(:group)}

  describe 'GET #index' do

    context 'log in' do
      before do
        login_user(user)
        get :index, params: {group_id: group.id}
      end

      it 'assigns the requested message to @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it 'assigns the requested group to @group' do
        expect(assigns(:group)).to eq group
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end

    end

    context 'not log in' do
      before do
        get :index, params: {group_id: group.id}
      end

      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    let(:params) { {group_id: group.id, user_id: user.id, message: attributes_for(:message)} }

    context 'log in' do
      before do
        login_user(user)
      end

      context 'can save' do
        subject {
          post :create, params: params
        }

        it 'saves the new message in the database' do
          expect{subject}.to change(Message, :count).by(1)
        end

        it 'redirects to group_messages_path' do
          subject
          expect(response).to redirect_to(group_messages_path)
        end
      end

      context 'cannot save' do
        let(:invalid_params) {{ group_id: group.id, user_id: user.id, message: attributes_for(:message, body: nil, image: nil)}}

        subject {
          post :create, params: invalid_params
        }

        it 'unsave the new message in the database' do
          expect{subject}.to_not change(Message, :count)
        end

        it 'renders the :index template' do
          subject
          expect(response).to redirect_to(group_messages_path)
        end
      end
    end

    context 'not log in' do
      it 'redirects to new_user_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end