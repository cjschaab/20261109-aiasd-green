import { render, screen } from '@testing-library/react';
import { describe, expect, it } from 'vitest';
import App from './App';

describe('application baseline', () => {
  it('renders the task manager shell', () => {
    render(<App />);

    expect(screen.getByRole('heading', { name: 'Task Manager' })).toBeInTheDocument();
    expect(screen.getByText('Platform baseline ready')).toBeInTheDocument();
  });
});
