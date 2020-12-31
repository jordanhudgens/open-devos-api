class FeaturedPlansSerializerService
  def initialize
    @plans = Plan.published.random_plans(10)
    @data  = {}
  end

  def run!
    build_plans
    serialize_data
  end

  private

    def build_plans
      @data[:plans] = @plans.map do |plan|
        plan_obj = plan.as_json

        plan_obj[:topic]                    = plan.topic
        plan_obj[:featured_image]           = plan.featured_image
        plan_obj[:featured_image_thumbnail] = plan.featured_image_thumbnail
        plan_obj[:featured_image_metadata]  = plan.featured_image_metadata
        plan_obj[:last_published]           = plan.last_published

        plan_obj[:devos]                    = plan.devos.map do |devo|
          devo_obj = devo.as_json
          devo_obj[:featured_image]           = devo.featured_image
          devo_obj[:featured_image_thumbnail] = devo.featured_image_thumbnail
          devo_obj[:featured_image_metadata]  = devo.featured_image_metadata
          devo_obj[:last_published]           = devo.last_published
          devo_obj
        end

        plan_obj
      end
    end

    def serialize_data
      @data.to_json
    end
end
