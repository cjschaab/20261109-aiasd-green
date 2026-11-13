import { expect, test } from '@playwright/test';

test('ASP.NET Core serves the React baseline', async ({ page }) => {
  await page.goto('/');

  await expect(page.getByRole('heading', { name: 'Task Manager' })).toBeVisible();
  await expect(page.getByText('Platform baseline ready')).toBeVisible();
});
