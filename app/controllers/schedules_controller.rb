class SchedulesController < ApplicationController
    def index
        @schedules = Schedule.all
        @schedule_count = Schedule.count
        @now = Time.current.to_s(:datetime2_jp) 
      end
    
      def new
        @schedule = Schedule.new
      end
    
      def create
        @schedule = Schedule.new(params.require(:schedule)
        .permit(:title, :start_time, :end_time, :all_day, :memo))
        if @schedule.save
          flash[:notice] = "予定を追加しました"
          redirect_to :schedules
        else
          redirect_to :new_schedule
          flash[:notice] = "スケジュールの登録に失敗しました"
        end
      end
      
      def show
        @schedule = Schedule.find(params[:id])
      end
    
      def edit
        @schedule = Schedule.find(params[:id])
      end
    
      def update
        @schedule = Schedule.find(params[:id])
        if @schedule.update(params.require(:schedule)
          .permit(:title, :start_time, :end_time, :all_day, :memo))
          flash[:notice] = "ユーザーIDが「#{@schedule.id}」の情報を更新しました"
          redirect_to :schedules
        else
          render "edit"
        end    
      end
    
      def destroy
        @schedule = Schedule.find(params[:id])
        @schedule.destroy
        
        redirect_to :schedules
      end    
end
