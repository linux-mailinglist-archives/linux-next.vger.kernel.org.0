Return-Path: <linux-next+bounces-8551-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 543FCBB5CDE
	for <lists+linux-next@lfdr.de>; Fri, 03 Oct 2025 04:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA7C71AE5190
	for <lists+linux-next@lfdr.de>; Fri,  3 Oct 2025 02:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114B0151991;
	Fri,  3 Oct 2025 02:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="d4qaK0Mn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9276350276
	for <linux-next@vger.kernel.org>; Fri,  3 Oct 2025 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759458625; cv=none; b=CotMYXDhWaVPpKZMIeyPZC+mEksOKWFD0zBl+4402HVg7oxfwRIN2/t3yLEBL6yNfI71Gl4/5eSMLiGojXZ4Lk8vCLcpGA3l1WPCcN1kIZYFKwIqUCEVGfO0gD2NsN0d+JcESnYZvGvB7MPkxxAUM+VT51f0YQLpJ+R7BzbLRAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759458625; c=relaxed/simple;
	bh=PxAcqIhAxEf4JdP+zKH+mnwvflcyyh/QH7mF8LkRMyk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=k8wlagMwH7mGzrxp2wnRj1K8rUT7U1HFfDetc2CdjrSrX6ZzBV8lMyswiRiFDV0kWkD6FbBqQFOdDJBMcLmH6ZHtls7wmF9joF2vvPMunF3EgrB2uMompFeOSMoB0hQSfd8awL4X+3R4NLSvbbCabxhpUOM/SKIXyfYvcWg8aTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=d4qaK0Mn; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-27c369f8986so16691615ad.3
        for <linux-next@vger.kernel.org>; Thu, 02 Oct 2025 19:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759458619; x=1760063419; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nZNxpNav5hSvL0hCHeeSDSOVt14eXQkeonI7oYiTjM=;
        b=d4qaK0MnOjM2M0vmTF5J1QzJg+BYlQ0oTQgiWon4eMdO2PjNSILSXgzbBY52gSgTBx
         6LKvfldYdJAJDaEKZ+T/IjO47sxcWvWGgKh3ruPADj/BSl5bVKY7JvBVcjBTkVEiTSYf
         TOY4lJhCPwPMFr1PAWx7KUwKXXi00MrE67uekpKVf4N3e9imNWjYSX4saelcN57Ap34m
         X0pHIZKuHRU0DLyZz+8D5ZkKAETrH37NB4RX7vJpTrx7y/4tOGVi/XPY1jzumjyql9mB
         XtBkxp2XXTDLwLm7jQg4TQ3fGduVfjZdOKFMfy5rxJvGytf5r3YNX3EoQFSA4+rusHpP
         /ymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759458619; x=1760063419;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2nZNxpNav5hSvL0hCHeeSDSOVt14eXQkeonI7oYiTjM=;
        b=RmD26TrOwZ3nuTAVnPBCMMALM0sQJ4hBLoAD9qJ45VPwPS+GiYFl4nNueEuNsrd26B
         MrgvOwkk5kj5KaBgRpppE10mpe67b0J7UaiDhVxBfdK8ssysV8p9sBW4T8yLPRcu47IV
         xxxvaZoiWfXYiqOuPwjKR1RI1Mz1tWAlKklvuG9ru0/pm5H/xPgYYBIJN/q2zF7gV9cS
         1Tl59AFjz35h8Br6T5PGLa3AWHLOyfPb9T8r5n0z1QPzMxQerJ1H7MtU3Aa3t9/Abe2K
         0wgHMXgX3a6/INjP6SZbQwTo21iZ7sIFNgq1VyTYs/3V37s5tt18uFvX93F5Mb2d9FH4
         8SuQ==
X-Gm-Message-State: AOJu0Yy5Syk8jBC3gFkDXyJCHzFjUreIPLCY8CtrUN0uQfawuGWVbPLR
	kVjIx8wccBLPgqO2CFZIsXdmxmfvFxWxddWU6YXz/iP9clAF/MVigcVO+dhLhmSyhjTbaTgBueF
	Fv+si
X-Gm-Gg: ASbGnctrbHPaZUIo+EDHDLdBC2BNdvRq4f3dSd/+WP0aUmvUU/ZJtzB+A4VH7JR/vpw
	7IQ8t8Df8v+oLHiGYUhGuk4mcitS8DKYiUBNSe66m72CsXJJRVLKP/PjuU+3vHHCKR0VDIWBpKz
	OgCRuI3eDZp8a6+HRPAiZBqwCXKxxjbQoAnBmzDLk559PBsO8+lvCagRhAY/MvvygAoUOQKDqvq
	fj2yR3x0+AyznCOZHyf4iVix70jf3UVFHyq6eOsOA0VwsINGv3WlkYntMucuGuUDq+8Xb/Iw6XQ
	y0ZXTThLzcpp2jPnR+8yB6TQ4QjwJmDGG9rE9vHxHHHKN6knkVRfUGTv+9DZK5RQAgTPvBEOtnw
	Z/vGccWJsiK1o4GaBA+saiuh/29uL0AntkzaqCmCW
X-Google-Smtp-Source: AGHT+IGFpnn13Kr8NkLl14/BNLMlgd8QjwDFMyexMcNp3UIpX1EPowws1F4BhNK/b73VSFzAxxLxug==
X-Received: by 2002:a17:903:1786:b0:288:e46d:b32b with SMTP id d9443c01a7336-28e9a58dd00mr15889675ad.17.1759458618761;
        Thu, 02 Oct 2025 19:30:18 -0700 (PDT)
Received: from c325b7c58cb6 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b87dcsm34203115ad.90.2025.10.02.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 19:30:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 7396732143a22b42bb97710173d598aaf50daa89
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 03 Oct 2025 02:30:17 -0000
Message-ID: <175945861758.273.13503691506671429599@c325b7c58cb6>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/7396732143a22b42bb97710173d598aaf50daa89/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 7396732143a22b42bb97710173d598aaf50daa89
origin: maestro
test start time: 2025-10-02 17:19:19.014000+00:00

Builds:	   60 ✅    0 ❌    0 ⚠️
Boots: 	  159 ✅   11 ❌    5 ⚠️
Tests: 	12681 ✅  544 ❌ 3704 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:68dec31f841b167e8d3b887b
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:68dec31f841b167e8d3b8882
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:68dec31f841b167e8d3b8827
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68deb9e6841b167e8d3b6430
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68debb02841b167e8d3b68d8
      history:  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68deb9ea841b167e8d3b644e
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68debb57841b167e8d3b7238
      history:  > ❌  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:68dec31f841b167e8d3b882e
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_pcm-test_default_time2_fslimx6qudooac9_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:68dec31e841b167e8d3b87d9
      history:  > ❌  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68debf10841b167e8d3b7c03
      history:  > ❌  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68debf14841b167e8d3b7c11
      history:  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68dec033841b167e8d3b7ea9
      history:  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68dec033841b167e8d3b7eaa
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68deb9df841b167e8d3b6403
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68debb20841b167e8d3b6e1f
      history:  > ❌  > ✅  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68dec48a841b167e8d3b8f07
      history:  > ⚠️  > ⚠️  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68debf7e841b167e8d3b7cfc
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68dec027841b167e8d3b7e84
      history:  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

