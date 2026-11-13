import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './e2e',
  use: {
    baseURL: 'http://127.0.0.1:5187',
    ...devices['Desktop Chrome'],
  },
  webServer: {
    command: 'dotnet run --project ../src/TaskManager.Api --no-build --no-launch-profile --urls http://127.0.0.1:5187',
    url: 'http://127.0.0.1:5187/healthz',
    reuseExistingServer: !process.env.CI,
    timeout: 30_000,
  },
});
