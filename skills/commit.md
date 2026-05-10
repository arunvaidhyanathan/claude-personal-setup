Create a git commit for the current changes.

Steps:
1. Run `git status` and `git diff` in parallel to understand all changes
2. Run `git log --oneline -5` to match commit message style
3. Stage only relevant files (never `git add .` blindly)
4. Write commit message:
   - Imperative mood: "Add X", "Fix Y", "Remove Z"
   - First line: 50 chars max
   - Body if needed: explain WHY not WHAT
5. Include Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
6. Run `git status` after to confirm clean state
7. Do NOT push unless explicitly asked
