class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all
    #処理
    #処理
    #処理
    #index（テンプレート）を描画
    render 'index'
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
       redirect_to root_path , notice: 'メッセージを保存しました'
      # メッセージが保存できなかったとき
    else
    @messages = Message.all
       flash.now[:alert] = "メッセージの保存に失敗しました"
       render 'index'
    end 
  end

  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  ##ここまで
end
