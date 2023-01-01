RSpec.describe Part, type: :request do
  describe 'GET #index' do
    before(:example) { get parts_path }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
      assert_response :success
    end

    # it looks like we don't do this anymore, should I parse and check the JSON in response.body to check the views?
    it "renders 'index' template" do
      # expect(response).to render_template('index')
    end
  end

  # describe 'GET #show' do
  #   let part = create(:part)
  #   before(:example) { get parts_path(part) }

  #   it 'is a success' do
  #     get parts_path(part)

  #     expect(response).to have_http_status(:ok)
  #     assert_response :success
  #   end
  #   it "renders 'index' template" do
  #     # expect(response).to render_template('index')
  #   end
  # end
end






# RSpec.describe Part, type: :controller do
#   it 'shows the home page' do
#     get :index
#     expect(response).to have_http_status(:ok)
#   end
# end




# RSpec.describe 'PartsController' do
#   describe 'GET #index' do
#     # before(:example)  get :index
#     it "is a success" do
#       get :index
#       expect(response).to have_http_status(:ok)
#     end

#     it "renders 'index' template" do
#       expect(response).to render_template('index')
#     end
#   end
# end
