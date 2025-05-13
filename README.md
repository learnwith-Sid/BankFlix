# 🔥 BankFlix – Daily Streak & Rewards System

Welcome to **BankFlix** — a gamified banking experience that rewards consistency! This SwiftUI module encourages users to log in daily, complete financial literacy challenges, and earn reward points, badges, and even unlock new avatars.

## 📱 Features

- 🗓️ **Daily Login Streak** tracking with milestone indicators  
- 🎁 **Reward Points** system for completing streaks and challenges  
- 🏅 **Badge Unlocks** for consistency and progress  
- 🦁 **Avatar Customization** — unlock new avatars at streak milestones (3, 5, 7, 10 days)  
- 📘 **Financial Resources** like guides and savings tips  
- 📈 **Weekend Bonus**: Unlock investment guides on weekends  
- 🎯 Motivational messages and progress highlights

## 👩‍💻 Tech Stack

- SwiftUI (iOS)
- MVVM Architecture
- Custom animations and UI components
- Data models for streaks, rewards, and avatars

## 🧩 Modules Overview

| Module              | Description                                    |
|---------------------|------------------------------------------------|
| `StreakDetailView`  | Displays login streak, milestones, badges, and avatar |
| `RewardPointsPage`  | Lists how to earn points and displays totals   |
| `BadgePopupView`    | Shows unlocked badge popup on milestones       |
| `AvatarSelectorView`| Lets users switch unlocked avatars             |
| `ResourceLinkView`  | Reusable component to show financial guides    |

## 🧠 Challenges Addressed (From a Bank's Perspective)

- Increase user retention through gamification
- Encourage financial literacy with educational content
- Build customer engagement using personalization
- Boost logins and app usage via streak-based motivation

## 🎨 Avatar Unlock System

| Streak Day | Unlocks            |
|------------|--------------------|
| 0          | Default Lion 🦁     |
| 3          | Fox 🦊              |
| 5          | Owl 🦉              |
| 7          | Panther panther 🐆 |
| 10         | Tiger 🐯            |

## 🚀 Getting Started

```bash
git clone https://github.com/yourusername/bankflix-streak-rewards.git
cd bankflix-streak-rewards
open with Xcode
