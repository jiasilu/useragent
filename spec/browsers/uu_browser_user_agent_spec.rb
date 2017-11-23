require 'user_agent'

describe "UserAgent: 'UU/1.0.1 (iPhone; OS 9.0.2)'" do
  before do
    @useragent = UserAgent.parse("UU/1.0.1 (iPhone; OS 9.0.2)")
  end

  it "should return UUBrowser" do
    expect(@useragent.browser).to eq("UU Browser")
  end

  it "should return '1.0.1' as its version" do
    expect(@useragent.version).to eq("1.0.1")
  end

  it "should return 'iPhone' as its platform" do
    expect(@useragent.platform).to eq("iPhone")
  end

  it "should return '9.0.2' as its os" do
    expect(@useragent.os).to eq("9.0.2")
  end
end

describe "UserAgent: 'UU/1.0.0 (Android; OS 4.2.2)'" do
  before do
    @useragent = UserAgent.parse("UU/1.0.0 (Android; OS 4.2.2)")
  end

  it "should return BlurBrowser" do
    expect(@useragent.browser).to eq("UU Browser")
  end

  it "should return '1.0.0' as its version" do
    expect(@useragent.version).to eq("1.0.0")
  end

  it "should return 'Android' as its platform" do
    expect(@useragent.platform).to eq("Android")
  end

  it "should return '4.2.2' as its os" do
    expect(@useragent.os).to eq("4.2.2")
  end
end
