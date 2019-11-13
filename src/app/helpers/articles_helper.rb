module ArticlesHelper
  def notificate!(article)
    Notification.find_or_create_by!(
      user: article.user, article: article,
      status: article.status, offset: ''
    )
    return unless article.pending?

    Notification.find_or_create_by!(
      user: professor, article: article.proofreader,
      status: article.status, role: 'proofreader', offset: ''
    )
  end
end
