Return-Path: <linux-next+bounces-9392-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC61CB7ACB
	for <lists+linux-next@lfdr.de>; Fri, 12 Dec 2025 03:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1CED30109AB
	for <lists+linux-next@lfdr.de>; Fri, 12 Dec 2025 02:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5042BB13;
	Fri, 12 Dec 2025 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Tfhb7PQq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE9417A2F0
	for <linux-next@vger.kernel.org>; Fri, 12 Dec 2025 02:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765506631; cv=none; b=BcoYr3GWwUp08idVepxVKK3bBR8CK4rxXPHrMCwGQ0jD4VkC+2AiYd0iTiKLwp2XW7fSu46Ob2W//z4gE0BX3jqiQfqlgRphwqVKA+3OlCrw52ARoWgsV4S5KVrbO5YlqwAoVnntE0Vc08bxvwc5QPQbZYpgh/Fy7mAIwkajq6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765506631; c=relaxed/simple;
	bh=2lIEuojGFm9jWFomyRlt7ikgBXjlKwjNk+y3nMOl1kA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=rO1izWYekjdJbPDVzC6kV1AHVhUaNw8w+pGQnaucWJaVd065RGPcBK28Mv3risVCK2b69vqFnoNwu7pgLRoYp9E5RsDuFvwbUdC6Qe0jK3IE57PHCEbJbLsdQZpj92n0j22zUNg1PpVXdnmPwHzc6kIiFt9E255oyjhspveoBiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Tfhb7PQq; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c0224fd2a92so686635a12.2
        for <linux-next@vger.kernel.org>; Thu, 11 Dec 2025 18:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765506629; x=1766111429; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0+gvJQ8k/TpZ7lnWF7N+eLS/UTECnAXS5e6v9RqAJM=;
        b=Tfhb7PQqclVDwpAhXOvi3LXvRNrS2pHAV/B4abF/BCY5vyJPVkwu2nHqY5ytkasV0b
         67kx076Ujnw8KbBkOhvAbkUxF44UEfRuvMD/GqxHjgtrl9myr0me7DUXzShepqA5nhpV
         yBrQLGfKt1OX921e2sBaKp1uU/FWArJ3IIhAdJRvvU4XDUQ421Q/x7fH15rg9oO5ieYV
         RY1eWN1WXL15ui8y4NaCxVlo2rQliwh4b5hgcoPbqXctNdHbxD46r1Y1gp83FttzileD
         EBDZNasOb6rspW9s3jdix5dIZQqgj1B8mzo24t1vhK5q9UsgqnXIXdJdl8plN6BIuEYX
         D/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765506629; x=1766111429;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0+gvJQ8k/TpZ7lnWF7N+eLS/UTECnAXS5e6v9RqAJM=;
        b=q7h5YN4VbP1qtLdxOL6p+6lsPv68H0RAGQgqfN8u10dIwiahRSFOYSe5MbkCKpzgt3
         pGEujcwHWG1aNmrXS7TY1rKE+r8zHswCdiOC26lALMdMP1tR2xQkAwl9brBHKqjM7t2t
         PsrdBOingUyXm9wCFk+do07miR6MC3QhNKI6WgxOsUpDz5YHazuVX6h3q3VHBZRFVlY7
         nuZwQKAswRthQPGUkRQO5hio3GVTNyJq1K7dZDYrU461egupHaI489NvXkJN8U1H8qq6
         yNAJiT8qCXwapdjoLy8sk09iHoLudZzjLBBktFomgGt0wk4SQdXtnbMs0Byc7g0j7ESp
         ikhA==
X-Gm-Message-State: AOJu0YzqIxf3JZ9nuJVZmO/kwN41iqyIHHuVTbAOTx4qVRN8qaHGE2+U
	w5lXPX56RJ6Bf9JgQK4+vfCOLJ7qe+S/DcoNfYPYVIfJMCmmLZapM4X8vaPSUTuCOkUYaQQ4vBn
	t9R5AJHA=
X-Gm-Gg: AY/fxX4DWZEqLhteR4IrQGnNaK/gng2fZb7Ny6jZdKdtJOwQdavYyHNlnD/nSAUN9IQ
	zVfp4qFejp/5E0m1G8bBLr2/1hEko9MHKFz+8evuKuxFjQUh1R1vi9ttOWB/B2ujJKcaSQfAlNV
	vslzdkZi1zJ69Xs4G2ZdSPVS0CUO0e4SFwEszGLFy3Lyc9hIltEVUJX2w8NndFZRuBhBpXJQWDv
	lF+P1mtu13rjyhIwfb6t0+TAweNV+/YFJIDvbskJhKdQON7XJ3/wqfp3TUnX7hqY37r6j2cYwGS
	31EXMc124ks9LkjacEQXHZId3oa5VrjBFamDF1eKZ9aRNfpVMJK4zN+KMg2+RnTl37yorjUH3pr
	h3Q+KxUIcisqJXgtZbV8HAW+0JkT7h2u0SXZmJzW0tzfxh66OIZYMNadaZ7BgFpqs+xvgEY4dad
	Yj/4Dobk76liavQ70=
X-Google-Smtp-Source: AGHT+IH1X2PttlCCRnDe++fFNvLvBb1fNLdhTlDe4CT5e4S5Pt5hZCLfRsvOxgwtzRLLCswLKGIySg==
X-Received: by 2002:a05:693c:8009:b0:2a4:3593:646a with SMTP id 5a478bee46e88-2ac300f6825mr458188eec.26.1765506628745;
        Thu, 11 Dec 2025 18:30:28 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac191ba0fesm9839494eec.3.2025.12.11.18.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:30:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 5ce74bc1b7cb2732b22f9c93082545bc655d6547
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 12 Dec 2025 02:30:28 -0000
Message-ID: <176550662764.759.15516480156563785529@77bfb67944a2>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/5ce74bc1b7cb2732b22f9c93082545bc655d6547/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
origin: maestro
test start time: 2025-12-11 02:09:46.868000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  162 ✅    2 ❌    0 ⚠️
Tests: 	14645 ✅ 1152 ❌ 5808 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:693a399ecbfd84c3cdb27298
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:693a39a3cbfd84c3cdb27308
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:693a35bfcbfd84c3cdb25989
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:693a36b8cbfd84c3cdb25ea7
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:693a3c7dcbfd84c3cdb29e5b
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:693a39aacbfd84c3cdb2739b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:693a39b7cbfd84c3cdb2744c
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:693a3aeacbfd84c3cdb290b7
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx6q-sabrelite
  > Config: multi_v7_defconfig+preempt_rt
    - Architecture/compiler: arm/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693a3919cbfd84c3cdb2698b
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693a46cccbfd84c3cdb2d470
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:693a9e82cbfd84c3cdb3b0db
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:693aabe0cbfd84c3cdb3b422
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693a404ecbfd84c3cdb2bc79
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693a40f0cbfd84c3cdb2bf38
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-timers-ramdisk.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:693a40e8cbfd84c3cdb2bed7
      history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:693a37c4cbfd84c3cdb26448
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:693a39b4cbfd84c3cdb27426
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

