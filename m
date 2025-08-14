Return-Path: <linux-next+bounces-7940-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E52DAB25984
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 04:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0A652A7FE0
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 02:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF32F2FF64F;
	Thu, 14 Aug 2025 02:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="a7zIGswl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C4C18B12
	for <linux-next@vger.kernel.org>; Thu, 14 Aug 2025 02:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755138628; cv=none; b=CYE5EHgEtxy/PoWDXCLrc/f6Te9wYDbN18laQFh8DCxLspTjnjtfJDrAKde8I8tXiFV9+QQJ2BScSB+XAEChykubqmUUS/Kk9Sg/53lQIplhzq471No+UG11GmCrwXxBPhYu/8NqKdsCizlTqHoWQ1IeZuWmd0bKvuFUMIQt+do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755138628; c=relaxed/simple;
	bh=GSRFbUk98AiRHCOr+J8Mp4cglTNHzonS7Prcd4sg368=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=rv6M4f3hXL+yXjdLZ76nOq5BgYjtinF6g1hGhPPBD9ZSzpQXxsEZbhXFYoz1Ghc7FR24LxeQE54Ao6AUlCchcEhtNSDNquJ/NmxncNN5mgSn8qqnGe86jO6NXEMSmftOLsXuvmd8KwaqoWEoJQlp6nCl+aD1HYUTl4OKnt3YhgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=a7zIGswl; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24456f3f669so5625875ad.1
        for <linux-next@vger.kernel.org>; Wed, 13 Aug 2025 19:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755138624; x=1755743424; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Znxt9dbs5RP3kJlBhEwnjmKEQtu5pIAveoBnFfnZyqA=;
        b=a7zIGswlGgBgV7GWsBN/bJTO+Z/0P0DcsdFunJDBepIem9dHwdTTlrFoZyiYwxTioj
         cdhMK7/octBd6KqoyvY++mYW2aXmoc1nJYZNZ/mEQ03dcQVhQ2PcI4aTUzl6t7mEUiAu
         MmU6GCoaSix1x2vx1Rnab9si2ntfd8jXbFrkR+abJ42tYjz9H+YWZJg73dbtIhJc+ew6
         pY11MuVhhqKWcVdmyzZ+4zOuhyNLKgwRkCoeuO0YrqVCeLRKBAzo+CVkWa8EC3RUl7DF
         NcPSLDuMgb8XfAGdZy58r2FZOnI4WSe1ET70FqOW3J3Mwpf1uBO11sgRYcbdT0C8apz5
         /XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755138624; x=1755743424;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Znxt9dbs5RP3kJlBhEwnjmKEQtu5pIAveoBnFfnZyqA=;
        b=YAqYUrjpOkEBQVGmXtBaQYldPtNQiZG0yncdor3SlwbUJ4EOCadYICtZaQe/39UoPD
         IaYGSJ4aW1XCwd8xZXX7gEzPv85TVj6JychlHhDzXX4MJXy1zoRAjZatGHx2O3kw6cTg
         WAbxQHGMOL7qpIEFRMafDURFx0Nc+7JHks5qoBmSNMIXtZ8jMJ7iaHZ9OwSgQPlPAI/d
         SfkVos/jFUfL6SVLXpHEtjGLdMda1Wzkuh87f8+0nL7am1nMbZWfIDmWf48+iezqzqsq
         nG72Hz8JpVdbhAUzCd+SJ2RcsIxXGcekcDNqACvTqFYV8Y6KRrXWjX+hT24m/TwHW2OT
         /BLA==
X-Forwarded-Encrypted: i=1; AJvYcCVV0/hpbt3zukvIqX/DzOcC6V3wZ9Kt7K0vxiQXD2AvEnxM8Mz8No9sSEh9zkWscRPmFOBSwvxTtKus@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7vfQLB1cEKZR7Xwh112XkCG7oBNkbypxQmq8v/YRIBN1wrnrz
	NQRX4encEfcgsW1tB4PEELIuHh1J5ImFI0sDpXifOg3ICWXf+IpDHZ1n5CzNkvIp2b2OxMwTuS/
	IdMJW
X-Gm-Gg: ASbGncuLjorWSULz21FXCh3X67AKV2uiLyp4DUOjglDoz2AhMX7N+NFvz98Hjh69F9G
	LU25WVOY/0qB8iJjXnJCtNWdOLJ50e4+AMKYQI0jjYb80hctPLHngPVe0n8Tk6YSgEpnKuPdU67
	l2VkOHGVH7Ep/o+Ow2jM+HlueV9rztoMKXJIcKC+zpPv7X/kd4W7dK49WliSJADQbWjCDOu38/n
	8ybDpNpAQp8cPso75molFiehNNxSbcT5cD7Vsk2wCspxnXRvd/kdeq23mnakAlcZwvFIvo3WkKl
	0jI1fR75QAFbfZmvZv5c7SSdyMWJroDHfbAIeexS3ReJkEeBrBiozL4YOT+TRV81yFlazXcrX7x
	3kk8cgqbPW3ba3szO
X-Google-Smtp-Source: AGHT+IEGVX9aFf69ja0XysvabemEyuG3dBQEpt9CnWHoE7dmNzrTMsnLbwNOh39SbKapMAyjGKSqCQ==
X-Received: by 2002:a17:902:e54a:b0:244:5bbe:acde with SMTP id d9443c01a7336-2445c69a153mr9135325ad.28.1755138624038;
        Wed, 13 Aug 2025 19:30:24 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b491sm339342485ad.131.2025.08.13.19.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 19:30:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 43c3c17f0c805882d1b48818b1085747a68c80ec
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 14 Aug 2025 02:30:22 -0000
Message-ID: <175513862256.89.15536859819629965779@16ad3c994827>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/43c3c17f0c805882d1b48818b1085747a68c80ec/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 43c3c17f0c805882d1b48818b1085747a68c80ec
origin: maestro
test start time: 2025-08-13 05:34:06.693000+00:00

Builds:	   57 ✅    3 ❌    0 ⚠️
Boots: 	   88 ✅    0 ❌   57 ⚠️
Tests: 	13428 ✅ 4916 ❌ 4275 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
- kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c406c233e484a3f921070
  history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d26233e484a3f91b502
  history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
- kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c406c233e484a3f9210be
  history:  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c406c233e484a3f921063
  history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2cff233e484a3f91b404
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.acct (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d01233e484a3f91b40a
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d01233e484a3f91b40d
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d07233e484a3f91b42b
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d0f233e484a3f91b472
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d13233e484a3f91b48a
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d23233e484a3f91b4f5
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d2a233e484a3f91b518
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2df2233e484a3f91b81f
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2df5233e484a3f91b8b9
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.landlock (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2dfb233e484a3f91b8e2
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.lsm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2dfc233e484a3f91b8e5
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2dfd233e484a3f91b8ee
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2dfe233e484a3f91b8f1
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.zram (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e05233e484a3f91b91b
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: beaglebone-black
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c2909233e484a3f919a70
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.acct (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c2916233e484a3f919aa3
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c2917233e484a3f919aa6
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.breakpoints (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c291b233e484a3f919ab2
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.capabilities (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c291c233e484a3f919ab5
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.clone3 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c291d233e484a3f919ab8
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.coredump (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c291f233e484a3f919abb
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c291f233e484a3f919abe
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c2927233e484a3f919ad6
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.fchmodat2 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c292b233e484a3f919ae5
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.futex (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c292c233e484a3f919ae8
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.kcmp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c292d233e484a3f919aeb
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.mqueue (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c292d233e484a3f919aee
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.proc (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c292f233e484a3f919af4
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ptrace (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c292e233e484a3f919af1
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.signal (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c2932233e484a3f919afd
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.timers (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c2930233e484a3f919af7
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.tmpfs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c2931233e484a3f919afa
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.vdso (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c2933233e484a3f919b1a
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.gpio (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b17233e484a3f91ac17
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ipc (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b18233e484a3f91ac1a
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.landlock (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b18233e484a3f91ac1d
  history:  > ⚠️  > ❌  > ❌  > ⚠️  
            
- kselftest.lsm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b19233e484a3f91ac20
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.memfd (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b1a233e484a3f91ac23
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.perf_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b1b233e484a3f91ac29
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ring-buffer (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b1c233e484a3f91ac2c
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.rlimits (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b1c233e484a3f91ac2f
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.seccomp (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b1e233e484a3f91ac3b
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.splce (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b1d233e484a3f91ac32
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.sync (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b1d233e484a3f91ac35
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.timens (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b1e233e484a3f91ac38
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.ublk (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b1f233e484a3f91ac3e
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.uevent (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b20233e484a3f91ad62
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.user_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b20233e484a3f91ad7c
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: cd8180-orion-o6
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2cf2233e484a3f91b3bf
  history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d09233e484a3f91b44e
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d10233e484a3f91b479
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d14233e484a3f91b490
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d1d233e484a3f91b4d1
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d27233e484a3f91b505
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.signal (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d2d233e484a3f91b52a
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d2b233e484a3f91b51e
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.efivars (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2df2233e484a3f91b81c
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2df3233e484a3f91b822
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2dfd233e484a3f91b8eb
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2dfe233e484a3f91b8f4
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx8mp-evk
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d09233e484a3f91b452
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2cf4233e484a3f91b3d2
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d04233e484a3f91b41a
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d0c233e484a3f91b460
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d16233e484a3f91b4a2
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d20233e484a3f91b4e0
  history:  > ❌  > ✅  > ⚠️  > ⚠️  
            
Hardware: meson-gxl-s905x-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2cf8233e484a3f91b3e4
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2cf5233e484a3f91b3d8
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d05233e484a3f91b422
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d0d233e484a3f91b466
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d17233e484a3f91b4a8
  history:  > ❌  > ✅  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d21233e484a3f91b4e7
  history:  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2df8233e484a3f91b8cf
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689c2ef9233e484a3f91c7c9
  history:  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2970233e484a3f919b87
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2975233e484a3f919b99
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c297a233e484a3f919bab
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c296d233e484a3f919b75
  history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c297e233e484a3f919bbd
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2969233e484a3f919b5b
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e22233e484a3f91ba34
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e2b233e484a3f91ba95
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e2e233e484a3f91baa7
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e31233e484a3f91babb
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689c2efa233e484a3f91c7cc
  history:  > ⚠️  > ✅  > ✅  
            
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c298d233e484a3f919bf6
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2993233e484a3f919c16
  history:  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2971233e484a3f919b8a
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2976233e484a3f919b9c
  history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c297a233e484a3f919bae
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c296d233e484a3f919b78
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c297f233e484a3f919bc0
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c296a233e484a3f919b5e
  history:  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2984233e484a3f919bd2
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2988233e484a3f919be4
  history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e1c233e484a3f91b947
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e1f233e484a3f91b9f6
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e2e233e484a3f91baaa
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e31233e484a3f91babe
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e35233e484a3f91bad4
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: mt8192-asurada-spherion-r0
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689c2efb233e484a3f91c7cf
  history:  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2972233e484a3f919b8d
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2977233e484a3f919b9f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c297b233e484a3f919bb1
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c296e233e484a3f919b7b
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8195-cherry-tomato-r2
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689c2efc233e484a3f91c7d2
  history:  > ⚠️  > ✅  > ✅  
            
- fluster.debian.v4l2.gstreamer_av1 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c298b233e484a3f919bed
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_av1_chromium (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c298c233e484a3f919bf0
  history:  > ❌  > ⚠️  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2991233e484a3f919c08
  history:  > ⚠️  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2992233e484a3f919c0b
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2995233e484a3f919c1c
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2997233e484a3f919c52
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2972233e484a3f919b90
  history:  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2977233e484a3f919ba2
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c297c233e484a3f919bb4
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c296e233e484a3f919b7e
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2981233e484a3f919bc6
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c296b233e484a3f919b6c
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2985233e484a3f919bd8
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c298a233e484a3f919bea
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e17233e484a3f91b929
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e1a233e484a3f91b93b
  history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e20233e484a3f91ba1a
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e23233e484a3f91ba3d
  history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e29233e484a3f91ba8c
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e32233e484a3f91bac4
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e36233e484a3f91bada
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
Hardware: mt8365-genio-350-evk
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d51233e484a3f91b5aa
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d5b233e484a3f91b5c9
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d84233e484a3f91b6bb
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d70233e484a3f91b657
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d9e233e484a3f91b719
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2dab233e484a3f91b741
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8390-genio-700-evk
- kselftest.cpufreq.suspend (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d30233e484a3f91b536
  history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
- kselftest.cpufreq.suspend.cpufreq_main_sh (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2ebd233e484a3f91c55a
  history:  > ❌  > ✅  > ❌  > ❌  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d3b233e484a3f91b553
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d52233e484a3f91b5ad
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d5b233e484a3f91b5cc
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d85233e484a3f91b6be
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
- kselftest.cpufreq (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d2f233e484a3f91b533
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d1b233e484a3f91b4b8
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ❌  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d3c233e484a3f91b558
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d49233e484a3f91b57b
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d53233e484a3f91b5b0
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d5d233e484a3f91b5cf
  history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d67233e484a3f91b5f8
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d7c233e484a3f91b68f
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d87233e484a3f91b6c1
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d72233e484a3f91b65d
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d94233e484a3f91b702
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2da1233e484a3f91b71f
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2dae233e484a3f91b747
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: qemu
- boot (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2eab233e484a3f91c552
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: rk3288-rock2-square
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c2904233e484a3f919a52
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3399-gru-kevin
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d4a233e484a3f91b57e
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d5e233e484a3f91b5d2
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2d96233e484a3f91b707
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2da3233e484a3f91b723
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2db0233e484a3f91b74a
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2cfa233e484a3f91b3ea
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d0d233e484a3f91b469
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d18233e484a3f91b4ab
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2d22233e484a3f91b4ec
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3588-rock-5b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2cfb233e484a3f91b3ed
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689c2efc233e484a3f91c7d5
  history:  > ⚠️  > ✅  > ✅  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c299b233e484a3f919c6e
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c296f233e484a3f919b81
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2973233e484a3f919b93
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2978233e484a3f919ba5
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c296c233e484a3f919b6f
  history:  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2982233e484a3f919bc9
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e24233e484a3f91ba40
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e36233e484a3f91badd
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689c2efd233e484a3f91c7d8
  history:  > ⚠️  > ⚠️  > ✅  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c296f233e484a3f919b84
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2974233e484a3f919b96
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c2979233e484a3f919ba8
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c297e233e484a3f919bba
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689c296c233e484a3f919b72
  history:  > ❌  > ❌  > ⚠️  > ❌  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e21233e484a3f91ba31
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689c2e34233e484a3f91bace
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: stm32mp157a-dhcor-avenger96
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c290c233e484a3f919a79
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c291a233e484a3f919aaf
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c2922233e484a3f919ac7
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689c292a233e484a3f919ae2
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.ftrace (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b16233e484a3f91ac14
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.mm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b1b233e484a3f91ac26
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.zram (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2b21233e484a3f91ad7f
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: sun50i-a64-pine64-plus
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2cf7233e484a3f91b3de
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e04233e484a3f91b915
  history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
- kselftest.uevent.uevent_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c309d233e484a3f91ea9b
  history:  > ✅  > ❌  > ❌  > ✅  
            
- kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c309d233e484a3f91ea9c
  history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: sun50i-h6-pine-h64
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2cfd233e484a3f91b3f9
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: acer-cb317-1h-c3z6-dedede
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e78233e484a3f91bec6
  history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e81233e484a3f91bf61
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cc9233e484a3f91b2b9
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2ccc233e484a3f91b2d1
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cd9233e484a3f91b335
  history:  > ✅  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cdd233e484a3f91b34d
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2ce0233e484a3f91b365
  history:  > ✅  > ⚠️  > ⚠️  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e8b233e484a3f91c1c6
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cdd233e484a3f91b350
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2ce1233e484a3f91b368
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: acer-cp514-2h-1130g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2ea0233e484a3f91c39b
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2ea1233e484a3f91c39e
  history:  > ❌  > ⚠️  > ⚠️  > ❌  
            
Hardware: acer-R721T-grunt
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e74233e484a3f91beab
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e7e233e484a3f91beed
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e87233e484a3f91c1a8
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e91233e484a3f91c1ea
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e9b233e484a3f91c377
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2ea5233e484a3f91c3b9
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cbf233e484a3f91b275
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cc3233e484a3f91b28f
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cc6233e484a3f91b2a7
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cc9233e484a3f91b2bf
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2ccd233e484a3f91b2d7
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cd4233e484a3f91b30b
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cd7233e484a3f91b323
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cd0233e484a3f91b2f1
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cda233e484a3f91b33b
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cde233e484a3f91b353
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2ce1233e484a3f91b36b
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: asus-C433TA-AJ0005-rammus
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e7a233e484a3f91bed5
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: asus-C436FA-Flip-hatch
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e7b233e484a3f91bed8
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2ea2233e484a3f91c3a4
  history:  > ⚠️  > ❌  > ⚠️  > ❌  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e72233e484a3f91be99
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e85233e484a3f91bf76
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e88233e484a3f91c1ae
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2ea6233e484a3f91c3bf
  history:  > ❌  > ⚠️  > ⚠️  > ❌  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2ea3233e484a3f91c3aa
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e7c233e484a3f91bee1
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e7c233e484a3f91bee4
  history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
- kselftest.cpufreq.hibernate.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2f39233e484a3f91c84e
  history:  > ✅  > ❌  > ❌  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e86233e484a3f91bfc6
  history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
- kselftest.cpufreq.suspend.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c300f233e484a3f91e1ad
  history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e76233e484a3f91beba
  history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e80233e484a3f91befc
  history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e89233e484a3f91c1b7
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e93233e484a3f91c1f9
  history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e9d233e484a3f91c386
  history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2ea7233e484a3f91c3c8
  history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cc0233e484a3f91b27b
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cc4233e484a3f91b295
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cc7233e484a3f91b2ad
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cca233e484a3f91b2c5
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cce233e484a3f91b2df
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cd4233e484a3f91b311
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cd8233e484a3f91b329
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cd1233e484a3f91b2f7
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cdb233e484a3f91b341
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cde233e484a3f91b359
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2ce2233e484a3f91b371
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: hp-14b-na0052xx-zork
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cc4233e484a3f91b298
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: hp-14-db0003na-grunt
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e76233e484a3f91beb7
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e7f233e484a3f91bef9
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e89233e484a3f91c1b4
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e93233e484a3f91c1f6
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e9d233e484a3f91c383
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2ea6233e484a3f91c3c5
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e9b233e484a3f91c374
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cc1233e484a3f91b286
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cc8233e484a3f91b2b6
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2ccc233e484a3f91b2ce
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e81233e484a3f91bf02
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: hp-x360-14-G1-sona
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e7d233e484a3f91bee7
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e86233e484a3f91c141
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cd5233e484a3f91b317
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cd9233e484a3f91b32f
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689c2cd2233e484a3f91b2fd
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2e78233e484a3f91bec3
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689c2ea8233e484a3f91c3d1
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

