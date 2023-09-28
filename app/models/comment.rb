class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_rich_text :body

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications

  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recipient
    CommentNotification.with(comment: self, project: project).deliver_later(project.user)
  end

  def cleanup_notifications
    notification_as_comment.destroy_alll
    # Notification.where(comment_id: comment.id).destroy
  end
end
