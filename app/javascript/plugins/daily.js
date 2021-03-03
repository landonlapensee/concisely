const resetDailyVideoChatTriggering = (button) => {
  button.innerText = 'Start Video Chat';
  dailyVideoChatTriggering();
};

const showHideDailyVideoChat = () => {
  const button = event.currentTarget;
  button.removeEventListener('click', showHideDailyVideoChat);
  button.innerText = 'Stop Video Chat';

  const videoContainer = document.getElementById('videoContainer');
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
