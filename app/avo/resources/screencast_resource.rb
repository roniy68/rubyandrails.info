class ScreencastResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], title_cont: params[:q], m: "or").result(distinct: false)
  end
  self.find_record_method = ->(model_class:, id:, params:) {
    model_class.friendly.find id
  }

  field :id, as: :id
  field :title, as: :text
  field :content, as: :trix
  field :url, as: :text
  field :slug, as: :text
  field :authors, as: :has_many, through: :authorings
end
