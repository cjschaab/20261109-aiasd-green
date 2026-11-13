#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

expected_node="$(tr -d '[:space:]' < .nvmrc)"
actual_node="$(node --version | sed 's/^v//')"
if [[ "$actual_node" != "$expected_node" ]]; then
  echo "Expected Node.js $expected_node, found $actual_node." >&2
  exit 1
fi

expected_dotnet="$(python3 -c 'import json; print(json.load(open("global.json"))["sdk"]["version"])')"
actual_dotnet="$(dotnet --version)"
if [[ "$actual_dotnet" != "$expected_dotnet" ]]; then
  echo "Expected .NET SDK $expected_dotnet, found $actual_dotnet." >&2
  exit 1
fi

dotnet clean TaskManager.slnx
rm -rf src/TaskManager.Api/bin src/TaskManager.Api/obj tests/TaskManager.Api.Tests/bin tests/TaskManager.Api.Tests/obj
npm ci --prefix web
dotnet tool restore
dotnet restore TaskManager.slnx --locked-mode
npm --prefix web test
npm --prefix web run build
dotnet build TaskManager.slnx --no-restore

cleanup() {
  docker compose down --volumes --remove-orphans
}
trap cleanup EXIT
docker compose up --detach --wait postgres

export POSTGRES_TEST_CONNECTION_STRING="Host=127.0.0.1;Port=55432;Database=task_manager_test;Username=task_manager_test"
dotnet test TaskManager.slnx --no-build
web/node_modules/.bin/playwright install chromium
npm --prefix web run test:e2e
