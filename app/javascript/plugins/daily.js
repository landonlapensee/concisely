const resetDailyVideoChatTriggering = (button) => {
  button.innerText = 'Start Video Chat';
  button.className = "btn video-button-video";
  dailyVideoChatTriggering();
};

const showHideDailyVideoChat = (event) => {
  const button = event.currentTarget;
  button.removeEventListener('click', showHideDailyVideoChat);
  button.innerText = 'Stop Video Chat';
  button.className = "btn btn-success video-button-video";

  const videoContainer = document.getElementById('video-container');
  // console.log(videoContainer);

  const callFrame = window.DailyIframe.createFrame(videoContainer, {
    showLeaveButton: true
    // iframeStyle: {
        // position: 'fixed',
        // width: '80%',
        // height: '100%'
    // }
  });

  callFrame.join({ url: 'https://concisely.daily.co/test' });

  button.addEventListener('click', () => {
    callFrame.destroy();
    resetDailyVideoChatTriggering(button);
  });
};

const dailyVideoChatTriggering = () => {
  const button = document.getElementById('dailyTrigger');
  if (button) {
    button.addEventListener('click', showHideDailyVideoChat);
  };
};

export { dailyVideoChatTriggering };
