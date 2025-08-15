Return-Path: <linux-next+bounces-7954-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F884B275FF
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 04:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA1CE5E552E
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 02:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBC129B795;
	Fri, 15 Aug 2025 02:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="HttJgc1D"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC0D298CD0
	for <linux-next@vger.kernel.org>; Fri, 15 Aug 2025 02:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755225069; cv=none; b=SFh+fWXMq34KUm9fyeRZG2nJJ/+XkND52uZhu1nyhQNDvnY+ZMu0+KXstoKHlHrpLmKA03l5xG41GkO9tbg1bFiHCmfCevBh+Z5YJ1ZOlfEc9y1iVL19uRXfz4i1sU0vkGzpEEpbdh1EWUQ4N0IE994kFF2kRa6/ATN3vn1kf9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755225069; c=relaxed/simple;
	bh=IAXCheJeF17Fn+PsmG/QoHnDC3unK6WYj9c2WTMIDLE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=eWCLNuZTibV5R8y6qCqQHll7QgwjcBgfj+sxI6zNJ6uvUsFwkQf+QU7d4De+oKrwFyHyq8/MsxmDIYNXp1v3d5Q3IBba/ZitOxZsZdN31gKyW10u6Ic5CG0tZnt20rbJw6hLfiNGtiQAv5UbwgY1EB6EAl6cXfBoF4HVzLGd1+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=HttJgc1D; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-323267872f3so1522125a91.1
        for <linux-next@vger.kernel.org>; Thu, 14 Aug 2025 19:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755225066; x=1755829866; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLhWYxH4+b4iK+aW9hLiZc+tgc7hdr7wghctv2E/sQ8=;
        b=HttJgc1DfNyGVroq3mqrcR71Rx08HZbp844uFgCD7nn8lvaShzphrC8mlL0d1acaLC
         whuEO+G9INIXUPQk9PUUehk4ILPuSRA3KBlC5mfx61zgQqN6yNEUYx2pKk9+wpRlPvrf
         GDrk/AVuB/J1NWD7n282dp49IrD8ojTpSFXMgGAOZ10dUKcL6KDZyIc5NNUGMvl0Yqyl
         E3QkAlJpf9rIwlUkHyDHHcFoNiIrcQPlCi9kwyai+PsjXoWRIjE0N58fUpn8WXaN5LBT
         /3ExF0EC793ln7mjfHnOyfEih8PlOoMFP/qflshM4dqr5pfLgPE4ZnLDapEvgKh/xYtG
         /saQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755225066; x=1755829866;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CLhWYxH4+b4iK+aW9hLiZc+tgc7hdr7wghctv2E/sQ8=;
        b=A9jpdsvpDl7fTGh4TzLLOmbS2okM/YTSCZBJoQySyvg9NR/L9/z3GaHbMCW8PUb3H6
         5NbSXmrALGuTbmsFuSuKwAsvMSN9KQ2geXLSvwqVQclhuvItATHvHI7xEImM/kuJGz1N
         DbTPweXqbixZetef0Q28yQmsoUkksSoqQjQ0OjUl1HTefr22Nr3QGZs57TowrPMzM7fs
         kbwXxBMa6+5JXHocX/GTgIgoyYrLNF/UYk1QTqsrFqyIxnNlTzUqXjJfrRg6pr1Ke8yX
         MA8mb8mc/XyK1Ly3m9TSjwe9tvGbe1jFQoiynxyYrVhh+adPVWzs4bMxrM/NPMAxMA/w
         Rdxg==
X-Forwarded-Encrypted: i=1; AJvYcCUM2AILHzUc/0hCMtEaYXdEwC/Wq9WkGBR3t3e3KLSTgodti6J3nGf8OpAiKG8qwtQbsCjQogWEEhDZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxRAx73a3LxlJe5XOmmqKUierG2NadORiZORVsJ0NgfrgMrijZP
	BMf7HYYE8nlbH/JBHqpSEUgrm5pNDTR4XYHyMp7cVfKHUbgmIkNSZA/QlN45y7lIBes=
X-Gm-Gg: ASbGncvo2v688A8zYnxQD3g7vyYeXuBlGr4pXGIyZPq+eLFGEBWgh67kiCzj3W4o52j
	UtcZv+jfEr4i3hImV5RhsdkH95POLTqp8Kf0a9b9db3e64Cvr6VLZr+yR1ngvfYidUb93fwQXpc
	LLvW6KFZLAc5i+D+Eb488zFj3twJjvV1UFa+v07US4YBGbiK7Uaqt+mAe4kuy+Xyx0zEUwNAANC
	CZZESo5wIQfEu3L+H/WUeEbEGudtN3N3G6SPqtGlYSqrLxIrwdlct3SoKQ8DEsUmGwHj5oaY5d8
	XzeqZJUa7dfmQ5yZ+zKGxw4t7arwwd+/qhSogqOCaB97P4D20TxJfOHznZn4KMCePPWnLkp5SEF
	dH9zJEYEQ0uxJuDXzUZUVi0s5gHE=
X-Google-Smtp-Source: AGHT+IFxBm7Uh/DEaLpgLzy7BlOMu2pJ85oO8wC8op+8I+R4iFoALlgZuch6p0hGymDLxyb18Y7Syg==
X-Received: by 2002:a17:90b:3d8c:b0:321:4182:2b9e with SMTP id 98e67ed59e1d1-323421922damr839489a91.12.1755225065614;
        Thu, 14 Aug 2025 19:31:05 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c9ae46sm62147a91.31.2025.08.14.19.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 19:31:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 931e46dcbc7e6035a90e9c4a27a84b660e083f0a
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 15 Aug 2025 02:31:04 -0000
Message-ID: <175522506418.104.3777163073405772957@16ad3c994827>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/931e46dcbc7e6035a90e9c4a27a84b660e083f0a/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 931e46dcbc7e6035a90e9c4a27a84b660e083f0a
origin: maestro
test start time: 2025-08-14 03:32:09.289000+00:00

Builds:	   57 ✅    3 ❌    0 ⚠️
Boots: 	   89 ✅    0 ❌   56 ⚠️
Tests: 	14187 ✅ 4973 ❌ 5026 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8390-genio-700-evk
- kselftest.cpufreq.suspend (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6916233e484a3f9527d6
  history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
- kselftest.cpufreq.suspend.cpufreq_main_sh (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d72af233e484a3f95800f
  history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: sc7180-trogdor-kingoftown
- fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2-Gst1-0.vp80-03-segmentation-04 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6b5d233e484a3f95498e
  history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6441233e484a3f94dd53
  history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.uevent.uevent_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6441233e484a3f94dd54
  history:  > ❌  > ❌  > ✅  > ✅  
            
- kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6441233e484a3f94dd55
  history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6bcd233e484a3f954cdd
  history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.hibernate.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6bcd233e484a3f954cde
  history:  > ❌  > ❌  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6c34233e484a3f95504a
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6c34233e484a3f95504b
  history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68ec233e484a3f9521a3
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: beaglebone-black
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68a2233e484a3f951ccc
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.acct (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68b4233e484a3f951e65
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68b5233e484a3f951e6c
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.breakpoints (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68b8233e484a3f951f20
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.capabilities (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68b9233e484a3f951f23
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.clone3 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68ba233e484a3f951f26
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.coredump (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68ba233e484a3f951f29
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68bb233e484a3f951f2c
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68c1233e484a3f951f59
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.fchmodat2 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68c4233e484a3f951f65
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.futex (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68c4233e484a3f951f68
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.kcmp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68c5233e484a3f951f84
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.mqueue (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68c6233e484a3f951f87
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.proc (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68c8233e484a3f951f91
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ptrace (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68c7233e484a3f951f8e
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.signal (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68ca233e484a3f951f9c
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.timers (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68c9233e484a3f951f94
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.tmpfs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68c9233e484a3f951f97
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.vdso (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68cb233e484a3f951fc1
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: cd8180-orion-o6
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68e1233e484a3f952150
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68f5233e484a3f9521ec
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68fb233e484a3f952266
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68ff233e484a3f95233f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6908233e484a3f952497
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6910233e484a3f95272d
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.signal (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6915233e484a3f9527ca
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6913233e484a3f9527c1
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.efivars (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6319233e484a3f94d01e
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d631b233e484a3f94d036
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d632d233e484a3f94d0b2
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6330233e484a3f94d0bb
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68e4233e484a3f952160
  history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68f0233e484a3f9521c2
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68f7233e484a3f952225
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6902233e484a3f9523b2
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d690a233e484a3f9526eb
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: meson-gxl-s905x-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68e7233e484a3f952174
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68e5233e484a3f952166
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68f1233e484a3f9521cf
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68f8233e484a3f95222f
  history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6903233e484a3f9523b8
  history:  > ✅  > ⚠️  > ⚠️  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d690b233e484a3f9526f9
  history:  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6324233e484a3f94d05c
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689d6bee233e484a3f954d28
  history:  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67dd233e484a3f950fc1
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67e1233e484a3f950ff0
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67e4233e484a3f951002
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67da233e484a3f950faf
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67e8233e484a3f951014
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67d6233e484a3f950f9d
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6d9c233e484a3f95589a
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6da5233e484a3f955973
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6da8233e484a3f955986
  history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6dab233e484a3f95599a
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6acb233e484a3f954194
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6a08233e484a3f95369a
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6a04233e484a3f953682
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6a3b233e484a3f9538c3
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d69e2233e484a3f9533d5
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6a4a233e484a3f953a5c
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d69a4233e484a3f95310d
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6aa4233e484a3f953dcc
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6aa2233e484a3f953ccf
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ❌  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d708a233e484a3f957171
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6d9a233e484a3f95587e
  history:  > ⚠️  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d70fc233e484a3f957587
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: mt8192-asurada-spherion-r0
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67de233e484a3f950fc7
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67e2233e484a3f950ff6
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67e6233e484a3f951008
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67db233e484a3f950fb5
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8195-cherry-tomato-r2
- fluster.debian.v4l2.gstreamer_av1 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d68fe233e484a3f952281
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_av1_chromium (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67f1233e484a3f95105e
  history:  > ⚠️  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6966233e484a3f952d9d
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67f6233e484a3f951155
  history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67f7233e484a3f951158
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67fa233e484a3f95116a
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67df233e484a3f950fca
  history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67e3233e484a3f950ff9
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67e6233e484a3f95100b
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d690a233e484a3f9526d8
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6912233e484a3f952794
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67d8233e484a3f950fa6
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67ec233e484a3f951037
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67ef233e484a3f951058
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6d93233e484a3f955829
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6d96233e484a3f95583e
  history:  > ⚠️  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6d9b233e484a3f955884
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d70b8233e484a3f9571e7
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6dad233e484a3f9559a3
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6db0233e484a3f9559c5
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: mt8365-genio-350-evk
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6216233e484a3f94bc35
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6253233e484a3f94bfa0
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6283233e484a3f94c2ee
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8390-genio-700-evk
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6522233e484a3f94e6f8
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6526233e484a3f94e75e
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6526233e484a3f94e73c
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
- kselftest.cpufreq (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6916233e484a3f9527d3
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6906233e484a3f9523c8
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d651e233e484a3f94e6dc
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6528233e484a3f94e803
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d66b5233e484a3f94ff49
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6af2233e484a3f9545de
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6246233e484a3f94beb6
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d68ce233e484a3f951fd8
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d68ca233e484a3f951f9e
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6b8a233e484a3f954bc1
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6b97233e484a3f954bd3
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6287233e484a3f94c314
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: qemu
- boot (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d618e233e484a3f94b0ec
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: rk3288-rock2-square
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d6897233e484a3f951a72
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3399-gru-kevin
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d651b233e484a3f94e571
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6579233e484a3f94ecb4
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6879233e484a3f9519ba
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d688d233e484a3f951a31
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d68c5233e484a3f951f6a
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: rk3399-rock-pi-4b
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d640f233e484a3f94db16
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68e8233e484a3f95217a
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68f9233e484a3f952232
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6904233e484a3f9523bc
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d690c233e484a3f9526fc
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3588-rock-5b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68e9233e484a3f95217d
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6e2c233e484a3f956077
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6908233e484a3f952499
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d67e0233e484a3f950fcd
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d690a233e484a3f9526ed
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6909233e484a3f9524e2
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_0_timer_17c20000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6909233e484a3f952514
  history:  > ⚠️  > ⚠️  > ✅  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d6907233e484a3f9523ca
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6db1233e484a3f9559c8
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689d6bf2233e484a3f954e2c
  history:  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d68f6233e484a3f9521f3
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d68f7233e484a3f952214
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d68f2233e484a3f9521d4
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d68f7233e484a3f95221d
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d68d0233e484a3f951ff1
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_0_timer_17c20000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689d68d0233e484a3f952000
  history:  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d70e5233e484a3f9574c9
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689d6dae233e484a3f9559aa
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: stm32mp157a-dhcor-avenger96
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68a6233e484a3f951e0d
  history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68b7233e484a3f951f1d
  history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68bd233e484a3f951f35
  history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689d68c3233e484a3f951f62
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6606233e484a3f94f4a3
  history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.mm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6609233e484a3f94f5b5
  history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.zram (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d660f233e484a3f94f6a4
  history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: sun50i-a64-pine64-plus
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68e6233e484a3f95216e
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6326233e484a3f94d09d
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d690d233e484a3f952706
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: sun50i-h6-pine-h64
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68ea233e484a3f95218c
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: acer-cb317-1h-c3z6-dedede
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d688d233e484a3f951a4a
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68aa233e484a3f951e27
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6926233e484a3f9528b5
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d692f233e484a3f952901
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6933233e484a3f952919
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d693f233e484a3f952a22
  history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6942233e484a3f952c58
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6945233e484a3f952c74
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6783233e484a3f950b7f
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6943233e484a3f952c5b
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6946233e484a3f952c77
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6184233e484a3f94af7f
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d684a233e484a3f951848
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: acer-R721T-grunt
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d615a233e484a3f94ab44
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6162233e484a3f94abfb
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d616c233e484a3f94adf6
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6175233e484a3f94ae4e
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d617f233e484a3f94aeb4
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6187233e484a3f94affa
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6927233e484a3f9528bb
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d692a233e484a3f9528d3
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d692d233e484a3f9528eb
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6930233e484a3f952907
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6934233e484a3f95291f
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d693a233e484a3f95294f
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d693d233e484a3f952967
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6937233e484a3f952937
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6940233e484a3f952b31
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6943233e484a3f952c5e
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6946233e484a3f952c7a
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: asus-C433TA-AJ0005-rammus
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6951233e484a3f952d79
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: asus-C436FA-Flip-hatch
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6cff233e484a3f955615
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6e04233e484a3f955e96
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6831233e484a3f9515cb
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d68ee233e484a3f9521ae
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d62ae233e484a3f94c54c
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d62d0233e484a3f94cc36
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6833233e484a3f9515da
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6161233e484a3f94abef
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d615c233e484a3f94ab57
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6164233e484a3f94ac0a
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d616f233e484a3f94ae05
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6177233e484a3f94ae5d
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6181233e484a3f94aec3
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6189233e484a3f94b0cd
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6927233e484a3f9528c1
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d692b233e484a3f9528d9
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d692e233e484a3f9528f1
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6931233e484a3f95290d
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6934233e484a3f952925
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d693a233e484a3f952955
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d693e233e484a3f95296d
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6937233e484a3f95293d
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6941233e484a3f952c4c
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6944233e484a3f952c68
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6947233e484a3f952c80
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: hp-14b-na0052xx-zork
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d692b233e484a3f9528dc
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6947233e484a3f952c83
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: hp-14-db0003na-grunt
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d615b233e484a3f94ab54
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6164233e484a3f94ac07
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d616e233e484a3f94ae02
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6177233e484a3f94ae5a
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6181233e484a3f94aec0
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6189233e484a3f94b0ca
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6b6b233e484a3f954a99
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d692f233e484a3f9528fe
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6932233e484a3f952916
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6948233e484a3f952c89
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: hp-x360-14a-cb0001xx-zork
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d625b233e484a3f94bfc0
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-14-G1-sona
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6608233e484a3f94f4b2
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d616a233e484a3f94adf0
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6dfd233e484a3f955e6c
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6e49233e484a3f956137
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689d6e1b233e484a3f95604a
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d65fe233e484a3f94f478
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d6795233e484a3f950ca6
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689d66dc233e484a3f950339
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

