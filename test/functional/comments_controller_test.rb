require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  def setup
  	@author = authors :sakshi
    @comment = comments :latest
    @article = articles :one
  end

  def test_create
    assert_difference ->{ Comment.count }, +1 do
      post :create, :article_id => @article, :comment => { commenter: "sakshi@gmail.com", body: "Awesome" }
      assert_response :success
    end
  end

  def test_destroy
	  sign_in authors(:sakshi)
	  assert_difference(->{Comment.count}, -1) do
	    delete :destroy, :article_id => @article, id: @comment
	  end
  end

end
