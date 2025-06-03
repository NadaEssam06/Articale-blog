class ArticalePolicy < ApplicationPolicy
    # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5
  def index?
    user.present?
  end

  def show?
    record.published? || user_owns_record?
  end

  def create?
    user.present?
  end
  def new?
    create?
  end

  def edit?
    user_owns_record?
  end

  def update?
    user_owns_record?
  end

  def destroy?
    user_owns_record?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.where("published = ? OR user_id = ?", true, user.id)
    end
  end

  private

  def user_owns_record?
    record.user_id == user.id
  end

end
