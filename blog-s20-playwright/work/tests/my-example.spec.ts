import { test, expect } from '@playwright/test';

test('has title', async ({ page }) => {
  await page.goto('https://blog.sakaiine.com/');

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/blog/);
});

test('has title2', async ({ page }) => {
  await page.goto('https://blog.sakaiine.com/');

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/blog/);

  // screen shot
  await page.screenshot({ path: 'test-results/screenshot.png', fullPage: true });
});

// test('get started link', async ({ page }) => {
//   await page.goto('https://playwright.dev/');

//   // Click the get started link.
//   await page.getByRole('link', { name: 'Get started' }).click();

//   // Expects page to have a heading with the name of Installation.
//   await expect(page.getByRole('heading', { name: 'Installation' })).toBeVisible();
// });
