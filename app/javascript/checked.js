function check() {
    const posts = document.getElementsByClassName("post");
    postsA = Array.from(posts);

    postsA.forEach(function (post) {
        post.addEventListener("click", (e) => { });
      });
};
window.addEventListener("load", check);