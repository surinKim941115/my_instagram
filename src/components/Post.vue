 <template>
<div class="post">
  <div class="post-header">
    <div class="profile" :style="'background-image:url('+post['userImage']+')'"></div>
<span class="profile-name">{{post['name']}}</span> </div>
  <div :class="'post-body '+post['filter']" :style="'background-image:url('+post['postImage']+')'">
  </div>
<div class="post-content">
<p>{{post['likes']}} likes</p>
<p><strong>{{post['name']}}</strong> {{post['caption']}}</p> <p class="date">{{post['date']}}</p>
  </div>
</div>
</template>

<script>
export default {
      props:{
      post: Object,
  }
}
</script>

<style>

</style>