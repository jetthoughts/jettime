class Account::StaffController < Account::BaseController
  def index
    @users = User.where(:company_id => current_company.id).paginate(:page => params[:page])
  end

  def new
    @user = current_company.users.build
  end

  def destroy
    current_company.users.find(params[:id]).destroy
    redirect_to :account_staff_index
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = current_company.users.build(params[:user])
    if @user.save
      redirect_to :account_staff_index
    else
      render :new
    end
  end

  def edit
    @user = current_company.users.find(params[:id])
  end

  def update
    @user = current_company.users.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :account_staff_index
    else
      render :new
    end
  end
end
