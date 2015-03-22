require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  def setup
  	@author = authors :sakshi
    @comment = comments :latest
  end

  def test_create
  	assert_difference ->{ Comment.count }, +1 do
      post :create, commenter: "sakshi@gmail.com", body: "Awesome"
      assert_response :success
    end
  end

  def test_destroy
	  sign_in authors(:sakshi)
	  assert_difference(->{Comment.count}, -1) do
	    delete :destroy, id: @comment
	  end
  end

end
