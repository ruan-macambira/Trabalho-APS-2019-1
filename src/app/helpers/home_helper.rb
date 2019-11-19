module HomeHelper
  def articles_for_proofreadings(articles)
    if articles.any?
      list_articles
    else
      no_articles
    end
  end

  def list_articles(articles)
    content_tag :tbody do
      articles.collect do |article|
        content_tag :tr do
          content_tag(:td, article_link(article)) +
            content_tag(:td, article.event.initials)
        end
      end.reduce(&:+)
    end
  end

  def no_articles
    content_tag :tbody do
      content_tag :tr do
        content_tag :td, colspan: 2 do
          t('message.article.proofreader.none')
        end
      end
    end
  end

  def article_link(article)
    link_to(article.title, event_article_path(article.event, article))
  end
end
