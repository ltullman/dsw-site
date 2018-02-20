ActiveAdmin.register User do
  include ActiveAdmin::AjaxFilter

  permit_params :email,
                :password,
                :password_confirmation,
                :name,
                :description,
                :is_admin,
                :avatar,
                :team_position,
                :team_priority

  index do
    selectable_column
    column :avatar do |u|
      image_tag u.avatar.url(:thumb)
    end
    column :name
    column :email
    column :description
    column :is_admin
    actions
  end

  form do |f|
    f.inputs do
      f.input :avatar, as: :file, hint: image_tag(f.object.avatar.url(:thumb))
      f.input :name
      f.input :description
      f.input :email
      f.input :team_position
      f.input :team_priority, as: :number, min: 0, max: 10, hint: 'Lower values show first'
      f.input :password
      f.input :password_confirmation
      f.input :is_admin
    end

    f.actions
  end

  filter :name
  filter :email
  filter :is_admin

  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete('password')
        params[:user].delete('password_confirmation')
      end
      super
    end
  end

end
