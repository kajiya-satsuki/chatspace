class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  before_action :set_users, only: [:new, :edit]
  
  def index
  end
  
  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'グループを作成しました'
    else
      redirect_to new_group_path, alert: 'グループ作成に失敗しました'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループを編集しました'
    else
      redirect_to edit_group_path(@group), alert: 'グループの編集に失敗しました'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def set_users
    @users = User.all
  end
end
