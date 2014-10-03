shared_examples "require log in" do
  it "redirects to the log in page" do
    action
    expect(response).to redirect_to new_user_session_path
  end
end