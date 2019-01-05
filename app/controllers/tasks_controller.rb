class TasksController < ApplicationController
  def index
    # テンプレート変数、Tasksテーブルからすべてデータを取得したものを
    # 変数に追加する。railsがsqlを発行している
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end
  
  # 登録処理
  def create
    @task = Task.new(task_params)
    
    # データベースに書き込む
    if @task.save
      redirect_to root_path
    else
      # 失敗した場合
      render 'new'
    end
  end
  
  # 編集処理
  def edit
    @task = Task.find(params[:id])
  end
  
  # 更新処理
  def update
    # idに紐づくデータ取得
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  # 削除処理
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end
  
  def toggle
    # ajaxを使用したいため、viewを使用しない設定
    head :no_content
    @task = Task.find(params[:id])
    @task.doneFlg = !@task.doneFlg
    @task.save
  end
  
  private
    def task_params
      params[:task].permit(:title)
    end
end
