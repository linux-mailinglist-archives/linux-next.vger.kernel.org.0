Return-Path: <linux-next+bounces-9366-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6472FCA9EE5
	for <lists+linux-next@lfdr.de>; Sat, 06 Dec 2025 03:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEA6F3064E6D
	for <lists+linux-next@lfdr.de>; Sat,  6 Dec 2025 02:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7992E28CF7C;
	Sat,  6 Dec 2025 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="jgON1CA9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747A2877FC
	for <linux-next@vger.kernel.org>; Sat,  6 Dec 2025 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764988223; cv=none; b=E7DOidQEWf0hbc0N42GNVeW/vjIHqzox3bdNDIEoUC/KNMeuMYlRiYUIrwFhvyT0SwFUwtY4z7uUe3mWNp7i5vDGEBK9wK0Xpg8TiIJC2SQ548vc7rttvYWzROj81Yx8MGphXY/Jtdr9hSpbihiSvMayHQEQK1gRsKQPgpLDs2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764988223; c=relaxed/simple;
	bh=mSRMlBo4Os78HDxeTvBUUSIPKIZZ9kRdDwkzl3iYAoA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=U5+2gnKezcVQw2sIWmyWP7tkVlOiG4nPZtiaV4UtKXjLA8PcrEEk1G1Wj/DpeokJoVYmqQbQbkGhh8EYulRP6NxR40ZZBmx8iFt1LRtmV6wc6k5ou2v02+GNuobYyjO+tujkCgRlKQlo6lSBxVFRMSOK/MxGi6ztgg9jADsYoTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=jgON1CA9; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so2894784b3a.1
        for <linux-next@vger.kernel.org>; Fri, 05 Dec 2025 18:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1764988221; x=1765593021; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xUGh5qSayOViMDYnrxrNpBlnf97q7/uGelElej2/84=;
        b=jgON1CA9orCEqj+wIVNOmZIN/Al+NWX1S7/dZYxLMOiJXPjY6KZmTOpSC3jKFo2THt
         mAeF0v6zuesc/4+EKF4cxTUScgW4JzejNG43NzKvNFg9qrCX3BOpeiOq1q9OoloGEuRh
         y0qHsJDtpwkJFp/uSUbFZVX8rTDfTU5adyD7vDja5zW83qbDhjcCgOZnvSajDcn05Eeb
         +LuJhHMyZITulOZg6yaUDdJxuCAwk5gGbms5mYrtZHcW0wzXNNB9CGMsZ3XZ0VzPHfYr
         GIcGJevQcDUy2lSPFGNDsaSrJfOXoqqduE7oQOdYYLK/5DHkBrv1EIukxx+CLT+o+cDj
         1TGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764988221; x=1765593021;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/xUGh5qSayOViMDYnrxrNpBlnf97q7/uGelElej2/84=;
        b=NMNShVLEixkkbsVkGqRyT7AKorP6+T8yCbaH/YuKiAPrO0NtwuPhQbywEL70YAjw9g
         ZWtrredfgPTsR2/p4k6qcoDInMA4vgM6LAf9zZjzKqk57erDLj0hthPttNVPO3/lMgWD
         2lJhYSdJTYn5/N79pTOTI5CPgkKNZLMh/F+e0C8ws36AOT3/y7yC/O7fd7AL2S1QcK6z
         JMomTRoMgyqXBrE/qQriDUyxH+nXzrS7L8kUu7yg/KsWWX0D3ayUCNwfj2ib1MzRWylB
         Xuz1fNPc2CmLilRTYh/DR2djqHYD8nbL5Fhj3AQOo1MJNjfDq+PwHtjIvG9Sf1NDU+Tz
         98Jw==
X-Gm-Message-State: AOJu0YxJlXKPnwUy7d8LIArMA9RkZebT8ijvZ7R43yp/IrtKUOSFMUPM
	gT7rMsKt7neT6qWz6wF7Uo2JvqGad6Lrocic5X3PbYvNjT3cjVKrPzB1ZLqtAkpMkoo=
X-Gm-Gg: ASbGnct+KvscIEApXbXdJ7YL08mW+htqDxvHnhuDbvPDrxnVH+CigJfp3wTJLlaL3Wn
	E2NTT4DOhPzkyKZs20eyhnkKPeak4RxEjCMkMLZAOY9A2fDBK7gkJtDrejKaO9v883QgcQRznA0
	0uQ4SbBmIwqG/v63TYyaVPXf1x8XG27jcbB4KDt9Ekh1xLxy/w9zn/1YMUawlx/x35ZCbXLXpok
	RxcgSOXGY39+/OQASOXpvfA9hlBNtw7HiLoPkIGTo85UBA3qMuk9cXm9beowkeWl7i+RMsOQfhB
	xLx8eq+vTanpZUxQyTUsgxXd9sZKsk8DVxdMDHhRicJpU+BHGA1qh0ifH4DSuW8B8r44e4ygJVW
	g6XXo3ryEUvrK416i8sm2dB5tnr3NkqtGtZc0IwVkrDTfeM6VYANPeZt0N8FCVNWV0QsYyzkVwT
	1Q2O0N
X-Google-Smtp-Source: AGHT+IHXTG/Qzkf7TyVCXeJyvIzkFlh6xsuuY0/h8KD2BG/Qbx6RSvvwyoQMA5+sHQaX8ycNj0AeqA==
X-Received: by 2002:a05:7022:419c:b0:11b:65e:f40 with SMTP id a92af1059eb24-11e0315f398mr1002105c88.5.1764988220681;
        Fri, 05 Dec 2025 18:30:20 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2f3csm22039236c88.5.2025.12.05.18.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:30:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 6987d58a9cbc5bd57c983baa514474a86c945d56
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 06 Dec 2025 02:30:20 -0000
Message-ID: <176498821975.5095.3159825236266095671@1ece3ece63ba>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6987d58a9cbc5bd57c983baa514474a86c945d56/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6987d58a9cbc5bd57c983baa514474a86c945d56
origin: maestro
test start time: 2025-12-05 05:15:14.858000+00:00

Builds:	   44 ✅    9 ❌    0 ⚠️
Boots: 	  131 ✅    0 ❌    0 ⚠️
Tests: 	14618 ✅ 1166 ❌ 5496 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:6932b7961ca5bf9d0fd073d3
      history:  > ✅  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693283bc1ca5bf9d0fcf466d
      history:  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6932871a1ca5bf9d0fcf627d
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69327cd51ca5bf9d0fcf01dc
      history:  > ❌  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6932ba771ca5bf9d0fd07d09
      history:  > ❌  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69327cda1ca5bf9d0fcf022b
      history:  > ❌  > ❌  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_svs_1100bc00
      last run: https://d.kernelci.org/test/maestro:693285f81ca5bf9d0fcf5a91
      history:  > ❌  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:693275d51ca5bf9d0fcea9ce
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:693276af1ca5bf9d0fceb03b
      history:  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64.arm64_hwcap_sigbus_LSE2
      last run: https://d.kernelci.org/test/maestro:693293ba1ca5bf9d0fcfecdc
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:693278fe1ca5bf9d0fcec62d
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-proc-ramdisk.proc_read
      last run: https://d.kernelci.org/test/maestro:69328fa91ca5bf9d0fcfc2c9
      history:  > ✅  > ❌  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

