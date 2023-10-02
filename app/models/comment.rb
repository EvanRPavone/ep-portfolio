class Comment < ApplicationRecord
  belongs_to :project, counter_cache: true
  belongs_to :user
  has_rich_text :body

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications

  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recipient
    return if project.user == user
    CommentNotification.with(comment: self, project: project).deliver_later(project.user)
  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
    # Notification.where(comment_id: comment.id).destroy
  end
end
