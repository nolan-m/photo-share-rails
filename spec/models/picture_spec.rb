require 'spec_helper'

describe Picture do
  it { should belong_to :user}
  it { should validate_attachment_presence :photo}
  it { should validate_attachment_content_type :photo}
  it { should validate_attachment_size :photo}

end
