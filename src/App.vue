<template>
<div>
<div class="header">
  <ul v-if="step ==1 | step==2" class="header-button-left">
    <li v-on:click="step=0">Cancel</li>
  </ul>

  <ul v-if="step ==1" class="header-button-right">
    <li v-on:click="step=2">Next</li> 
  </ul>

  <ul v-on:click="publish" v-if="step == 2" class="header-button-right">
    <li >publish</li> 
  </ul>

  <img src="./assets/logo.png" class="logo">
</div>

<Body 
  v-on:my_caption="my_caption = $event"
  v-bind:post_info="post_info" 
  v-bind:step="step" 
  v-bind:image_url="image_url"
  v-bind:clicked_filter="clicked_filter"
  v-bind:insta_fileter="insta_fileter" />

<div v-if="step == 0" class="footer">
  <ul class="footer-button-plus">
    <!-- <li v-on:click="step=1">+</li> -->
    <input v-on:change="upload" type="file" id="file" class="inputfile" >
    <label for="file" class="input-plus">+</label>
  </ul>
</div>
</div>
</template>

<script>
import Body from './components/Body.vue'
import user from './assets/data.js'
import EventBus from './EventBus.js'
export default {
  name: 'App',
  components: {
    Body,
  },
  data(){
    return{
      step:0,
      post_info: user,
      image_url: "",
      my_caption: "",
      clicked_filter: "",
      insta_fileter: [ "normal", "clarendon", "gingham", "moon", "lark", 
                        "reyes", "juno", "slumber", "aden", "perpetua", 
                        "mayfair", "rise", "hudson", "valencia", "xpro2", 
                        "willow", "lofi", "inkwell", "nashville"]
    }
  },
  mounted(){
    EventBus.$on('filter', (filter) => {
    this.clicked_filter = filter
    /* eslint-disable */
    console.log(filter)
    });
  },
  methods: {
    upload(e){
      // 1. 다음 스텝으로 넘어가
      // 2. 업로드 이미지를 dataurl로 압축
      // 3. 이미지를 그 이미지 표시해줌
      // 컴터의 cpu이용햐서 압축
      let file = e.target.files;
      let reader = new FileReader();
      reader.readAsDataURL(file[0]);
      reader.onload = e => {
        /* eslint-disable */
        console.log(e.target.result) 
        this.image_url = e.target.result
        this.step =1
      }
    },
    publish(){
      // 1. this.step == 0
      // 2. 내 게시물 this.user에 추가
      var my_post = {
        name: "new_user",
        userImage: "https://placeimg.com/100/100/arch",
        postImage: this.image_url,
        likes: 36,
        date: 'May 15',
        liked: false,
        caption: this.my_caption,
        filter: this.clicked_filter
      }

      this.post_info.unshift(my_post);
      this.step=0;
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
body {
margin: 0;
}
ul{
padding: 5px; list-style-type: none; }
.logo {
width:22px;
margin: auto;
display: block; position: absolute; left: 0;
right: 0;
top: 13px;
}
.header {
width: 100%;
height: 40px; background-color: white; padding-bottom: 8px; position: sticky;
top: 0;
}
.header-button-left { color: skyblue;
float: left;
width: 50px; padding-left: 20px; cursor: pointer; margin-top: 10px;
}
.header-button-right { color: skyblue;
float: right;
width: 50px;
cursor: pointer; margin-top: 10px;
}
.footer{
width: 100%;
position: sticky;
bottom: 0;
padding-bottom: 10px; background-color: white;
}
.footer-button-plus {
width: 80px;
margin: auto;
text-align: center;
cursor: pointer;
font-size: 24px;
padding-top: 12px;
}
.sample-box{
width: 100%;
height: 600px; background-color: bisque;
}
.inputfile {
display: none;
}
.input-plus {
cursor: pointer
}
#app {
box-sizing: border-box; font-family: 'consolas'; margin-top: 60px;
width: 100%;
max-width: 460px;
margin: auto;
position: relative; border-right: 1px solid #eee; border-left: 1px solid #eee; }
</style>
