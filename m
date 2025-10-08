Return-Path: <linux-next+bounces-8575-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E95BC32A3
	for <lists+linux-next@lfdr.de>; Wed, 08 Oct 2025 04:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CA99189BC53
	for <lists+linux-next@lfdr.de>; Wed,  8 Oct 2025 02:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD3219F137;
	Wed,  8 Oct 2025 02:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YruPms/S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F31FAC42
	for <linux-next@vger.kernel.org>; Wed,  8 Oct 2025 02:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759890616; cv=none; b=g84q5kVsVDno65hZaSJRPmc9AMsSNVzZtl6B9hcz3tGVWumHle2jTshh7d1jfIo9HsV4kE1J41JeTszxX7ZLS95H9pDf/KzWiwy2CnScdrUYvfWFao5RQmsrczNz6wLgZYgEtqOl+nhuHb24mr+7SBJbmq4K/GfJrMg/+KmdoQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759890616; c=relaxed/simple;
	bh=yaqQW9mJ09FaBq6hQkhMMwpq3kcUDbqMaZplcC8Rm5Q=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=f4hBjZsp8tEN3gv1wG+Pk6QsamTesGDx3bcVPhay0jlSFHRO3rSeMm//IUEJCkhCeOt3LiCshZ9wW56f2yaGRWycA3FGOJJAQ1Yf/n+2yILhH7QZAtdvOD/X1MNVKhLau9h/QFVoTX09304438jxgfZ0B3atsfLXJHfwiP9MvVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YruPms/S; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3306d3ab2e4so8083179a91.3
        for <linux-next@vger.kernel.org>; Tue, 07 Oct 2025 19:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759890614; x=1760495414; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqlNYnpE7PSZGAYZ7fOQ6QGjtu5MmHLFhtW1BZjSlkg=;
        b=YruPms/S3LpChv/M9ixffZnkL69YLRYoCihZCyUgdmFej/4luyzgJ1Kt7DdyKcxZw0
         f7c2QhixDMVpx4LP4roa+ShJ+64qtR1tJd4kpTkhGTiaD4oVZ8x6MuQu2y6pFcbe7xt/
         kjHmsXw6rEZAX8ddo6l6ldOMkYtcwqTgIldjiN6DaLqRUjVrZzIv6svLbzudi8dAmE0j
         wCN8POe9FaufGaRbeMs6i4GqANwUPK5wPot+x5DOLyh1zhdZ4vwOCEntCrfhQ4zUhm9T
         vAynu5U+cA2qZQALPU+ooYB8KXHK8/jufqDuo5oJxBlT153Rxq7dlN3D0GrAuDuGEICd
         afWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759890614; x=1760495414;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KqlNYnpE7PSZGAYZ7fOQ6QGjtu5MmHLFhtW1BZjSlkg=;
        b=rv3KDGQiV+9lt7JzU+UnD/iIozLteWtq0mXiXbUq6A9tsMj+hK6jsMABLVGB7l+d2e
         /nP38dX4I2FqYujLeEz8nEuNk93BYJvMssb0u0L+2jxmgK66HVwuK5cuDXwfODA3iH6N
         JJFexvc+X6711M+weMPHYV6bAMUREhxFt7zJFEelbBXJqpoR+UL3AX9w+ybvRtL4h2Nu
         3GsoeXiEX++fYna8C/jrHXG/zp2mHO0WZTKlySBzEby/soAGzeFlUKOOywZqL4LdE8zM
         DWHl6Q+A0s0DtsuN1AozIFZMgPwYmvrhHw1MQKPdyJsBFyAwZflkMBq2DfhLiN1ZksYs
         VcpQ==
X-Gm-Message-State: AOJu0YxYKBqOXRxVHj78/MknifTg09K4QFGpGcDitNh3Ts5S6hdSxEAQ
	5LS4vJ96x7KlmaunRd4xoeeThsiU4PNGt5gkskIyuSZ1ttLapLPemr2sDEpb9k+b9CNyMqGhWJ6
	7iwUd
X-Gm-Gg: ASbGncvdw4h2AOHg/N/lX6SyQU5U8v2v4/tXBwsHNijUZ0KB8IbSH8TYg1+R3maN70f
	0cskzUOAD4k9xRTmnM2Ywndt9gBHvbY6wHFk//35J0vvO/3CZsVm1QguZQ9JSA+gNd1qFILiOyN
	2Jb0S+DrVQ8LQYyLwyiDk23+nqBs+QzK5F16+Ze/VWI4L2E55UWM3tqiMMuSdKzn9O3VSeEmXme
	Cdh36YoEm/zofxLkI5pjFEUAMfFhsMz7NdslvK7DoKOhhJub2ah6Rjv6l9IAc/Lej2Yfq+3nmiN
	63fMLj4kX6z+Jd2LNWSjEDL/pkG+k9odosiRyYwZgZA2/zU/e437h3EALtzJxS6n2YmtFMjJyyg
	vpd5RW0/s+4icPt9xpgD5lLCtjmQehhIf0NLjqDcw
X-Google-Smtp-Source: AGHT+IGa0Lr48iyD0Na8r6Bkd0g5qc+MSYzjhNs5i3zoDmsbtfbFWTIO5eO/bj7C4MKDOmJWztTywg==
X-Received: by 2002:a17:90b:4a0f:b0:32e:3f93:69e2 with SMTP id 98e67ed59e1d1-33b5114967fmr1923406a91.13.1759890614153;
        Tue, 07 Oct 2025 19:30:14 -0700 (PDT)
Received: from d76c3c94e839 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099af3cf6sm16395025a12.13.2025.10.07.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 19:30:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 68842969e138d9ad3e3aa2bbd65d514df1581b5c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 08 Oct 2025 02:30:13 -0000
Message-ID: <175989061303.641.7750695771739890249@d76c3c94e839>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/68842969e138d9ad3e3aa2bbd65d514df1581b5c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 68842969e138d9ad3e3aa2bbd65d514df1581b5c
origin: maestro
test start time: 2025-10-07 13:31:04.863000+00:00

Builds:	   60 ✅    0 ❌    0 ⚠️
Boots: 	  171 ✅   10 ❌    6 ⚠️
Tests: 	12416 ✅  552 ❌ 4175 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:68e521229512ca527455e7a0
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_23
      last run: https://d.kernelci.org/test/maestro:68e521239512ca527455e7fb
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_24
      last run: https://d.kernelci.org/test/maestro:68e521239512ca527455e802
      history:  > ✅  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68e5209d9512ca527455e48f
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68e520a49512ca527455e499
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68e521b19512ca527455eac8
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68e521b19512ca527455eac9
      history:  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:68e521239512ca527455e7ed
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:68e521239512ca527455e7f4
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:68e521229512ca527455e799
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.ipc
      last run: https://d.kernelci.org/test/maestro:68e5205a9512ca527455e3ae
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68e521059512ca527455e6b6
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68e529709512ca527456074f
      history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68e5300a9512ca527456294e
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68e51bc89512ca527455ca1d
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68e51df99512ca527455d5e5
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68e520ef9512ca527455e663
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_12
      last run: https://d.kernelci.org/test/maestro:68e521239512ca527455e7ae
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68e527999512ca527456023c
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68e528979512ca5274560541
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:68e5206c9512ca527455e3db
      history:  > ❌  > ✅  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

