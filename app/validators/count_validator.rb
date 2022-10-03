class CountValidator < ActiveModel::Validator
  def validate(value)
    # return has_error = true unless value.present?

    if value.count { |c| c <= 1 }
      record.errors.add :base, "曲は２つ以上登録してね！"
    end
  end
end
