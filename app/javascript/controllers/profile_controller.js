import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["posts", "liked_posts", "commented_posts", "posts_btn", "liked_btn", "commented_btn"]

    connect() {
        this.posts_btnTarget.classList.add("profile-selected-posts")
        this.liked_postsTarget.style.display = "none";
        this.commented_postsTarget.style.display = "none";
    }   

    posts() {
      this.posts_btnTarget.classList.add("profile-selected-posts")
      this.liked_btnTarget.classList.remove("profile-selected-posts")
      this.commented_btnTarget.classList.remove("profile-selected-posts")
      this.postsTarget.style.display = "flex";
      this.liked_postsTarget.style.display = "none";
      this.commented_postsTarget.style.display = "none";
    }   

    liked_posts() {
        this.posts_btnTarget.classList.remove("profile-selected-posts")
        this.liked_btnTarget.classList.add("profile-selected-posts")
        this.commented_btnTarget.classList.remove("profile-selected-posts")  
        this.postsTarget.style.display = "none";
        this.liked_postsTarget.style.display = "flex";
        this.commented_postsTarget.style.display = "none";
    }

    commented_posts() {
        this.posts_btnTarget.classList.remove("profile-selected-posts")
        this.liked_btnTarget.classList.remove("profile-selected-posts")
        this.commented_btnTarget.classList.add("profile-selected-posts")  
        this.postsTarget.style.display = "none";
        this.liked_postsTarget.style.display = "none";
        this.commented_postsTarget.style.display = "flex";
    }
}