const { chromium } = require('playwright');

(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage();
  await page.goto('http://localhost:8888/index.html');
  await page.waitForTimeout(2000);
  await page.screenshot({ path: '/tmp/tetris-ui.png', fullPage: true });
  await browser.close();
  console.log('Screenshot saved to /tmp/tetris-ui.png');
})();
