require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  def setup
  	@article = articles :one
  	@author = authors :sakshi
  end

  def test_index
  	get :index
    assert_response :success
  end

  def test_create
  	sign_in authors(:sakshi)
    assert_difference ->{ Article.count }, +1 do
      post :create, title: "My app", text: "This is a rails app."
      assert_response :success
    end
  end

  def test_fail_create_without_title
  	sign_in authors(:sakshi)
    assert_no_difference ->{ Article.count } do
      post :create, text: "This is a rails app."
    end
  end

  def test_update
  	sign_in authors(:sakshi)
  	put :update, id: @article.id, text: "Rails is awesome!"
  	assert_response :success
  end

  def test_destroy
	  sign_in authors(:sakshi)
	  assert_difference(->{Article.count}, -1) do
	    delete :destroy, id: @article.id
	  end
  end

  def test_show
    get :show, id: @article
    assert_response :success
  end

  def test_edit
    sign_in authors(:sakshi)
	  get :edit, id: @article
    assert_response :success
  end

  def test_new
    sign_in authors(:sakshi)
	  get :new
    assert_response :success
  end

end
