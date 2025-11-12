Return-Path: <linux-next+bounces-8924-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF08C50588
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 03:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D94DA189A46E
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 02:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143AF296BDF;
	Wed, 12 Nov 2025 02:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dHS4KBWE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E4D285CA2
	for <linux-next@vger.kernel.org>; Wed, 12 Nov 2025 02:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762914670; cv=none; b=u7qWhCBa0RZdLgNe1kyw+s9eWPVup60DN0z6Twl6tKGTXZsolNMyUmnNSsvrcwQYrLtiXCJ4UbMInOoxat6tOjSdv/OzcWN0HFwvxO8rETNAqBV8JtjuiBgos5O5fIIlDIjEVQDR5B98ohktw7FFXnPMKfPevKxuLnWSA0nUV64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762914670; c=relaxed/simple;
	bh=wBhbExdtalLrB8G1EOmNZRwiLQiHzq9oK6rLDaShlZY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=gHbOcgsLJvGaIpiqRAB1nqAuJOLZliw3YGgyZZRm23QQJVbBr6sSXEOovPKq11LboN5kZfx5HGQaV0q+o6MUaHsp8+H2JeRGGqOsDgW5BexBj/++g5zgcUpC3Sj8Opge9n+LjkCTOVH/UBZ775WI+TaSL4CaU1jVhs/VVvy0oKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dHS4KBWE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2957850c63bso2495495ad.0
        for <linux-next@vger.kernel.org>; Tue, 11 Nov 2025 18:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1762914667; x=1763519467; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afecEGtrtXDvx5FnjaHHVR4RWnSJcaoQpWOnHSe9noc=;
        b=dHS4KBWEhGrdQuWwZJbvVaduoa85Y78p0+YvumI64xA5H36lk03yFEB+W3r/4v2V61
         nziGc8/tP0m8cdeT4LzueKoSFyKsWR1eSmRfrLAEKyQ+HJ2YbC1KRz7vQ6s671MQCgXm
         sloNAEAkdvvxfoOJY7buDlbrP1/K080+SpQ6Vp2UWK6Q0F8JH45LTvDJAduxL9suNu+e
         /Vw1l/Kfd5XPfwT2xkJC51htdqrWYoV6J219kqfp422JS527EILDQBwsBD5LYbx034P0
         u44UffNT4YF6wyfoEAoxeMoD2dP/9pN2y6vpCdO+Zqu6FZ3JMr/rHKAGDKbdG0PWHUtg
         n40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762914667; x=1763519467;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afecEGtrtXDvx5FnjaHHVR4RWnSJcaoQpWOnHSe9noc=;
        b=SYSKIqObp+Q96wp9eyMrDQAxn9YvyIS9EbuO+AH8OtoiyIIN5xXhGuPvUWH7z7OOdO
         lmKnIhMopq20YTkIvLAaQOGKFpL2TnA+YLIoCHLM+m7wVgCsM5TUNPwM/wNclTvVj4dx
         8s5IzHorA+KdRGG0xim2TEOH9mQQzhY5jXVHWaW0PtSf0SGGGiUL1nKnrp6JJc3rcR80
         xYBz3vWjxDJRIbtiUc4ma3eFwQ6ZvPPIYsV/wPXu42l5pVWWUDmN4L98gdGDzTu6W/yh
         6GCljooDkIqJ1a1K27x/z1wYEvxjBMToJ3CcSnY5Zi4UXhLBO91YUg8Xpkhl98sriFUt
         LT5g==
X-Gm-Message-State: AOJu0Yx3rruTQEueJrt5OJLgZc1Cjv0ycMqBUYkxsUkNNUGh3WiZUhPv
	F+7GbC+atVzzb8DRCTiQYmvQUcxErl+OMkT8cXa5YdS5rp4DpWF4Es4yoen2nN+pZNiCxHZ9xQ5
	EJuJ8
X-Gm-Gg: ASbGncvavNYP1XX8tylMSKvOWTWJGLGTOd7JY6/Cgzyc1TU2fRTr1KmVjb6jznx0WnI
	Ap1DIBXLvIDi5Q03QhN67NTjOT2tSAzqcC1MEJ49HSKX5rUeZyBaSf3jnJBvwi2SqqSYV9pxJAv
	ohLew/rw2G1u925G8/NoWisH8KZqNBOXjUY3xx0YN0qLTjSL8pXsMS8oD+r0lkg9MnmR2woIkvo
	/Q0vHqTLQCmh44zHe78CYqJiqzoh6eq2SAI+ANc3vHaOa59hFhKpqB+NtpBnUwcAOnsYqKg5g12
	+iN10oDqNNrmoHiJTp3ITKBI2iJ3buGr4F072JonGA051ytnm4pA5vdjw5hop/E+TVfnXdGQR36
	83IQ3EBJ4ZifiKjMKi2SPLyS0kpaGTqVUCwvL2a7oGCo+lbMaNlcB8qPyW1HJSqgC5+j8ig==
X-Google-Smtp-Source: AGHT+IHHmipMXyJJ+efS/6gPvNBZ2Q/UzmNlaakcsDQa3ow2aqwokxhnQ6GvwrVctEwp474uc6fbvw==
X-Received: by 2002:a17:902:ef51:b0:295:592f:9496 with SMTP id d9443c01a7336-2984edd5b91mr15648875ad.20.1762914667535;
        Tue, 11 Nov 2025 18:31:07 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbf0c2asm11793165ad.27.2025.11.11.18.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 18:31:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 2666975a8905776d306bee01c5d98a0395bda1c9
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 12 Nov 2025 02:31:06 -0000
Message-ID: <176291466638.7165.6722034678628096385@efdf33580483>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/2666975a8905776d306bee01c5d98a0395bda1c9/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 2666975a8905776d306bee01c5d98a0395bda1c9
origin: maestro
test start time: 2025-11-11 05:12:40.996000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  149 ✅    4 ❌    0 ⚠️
Tests: 	11885 ✅ 5777 ❌ 4632 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6912cafa2fd2377ea9967113
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6912cce32fd2377ea996974f
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: acer-cbv514-1h-34uz-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6912cda52fd2377ea996a795
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6912ce5c2fd2377ea996a967
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:6912caf52fd2377ea99670e6
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6912cc202fd2377ea9967c2f
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:6912cd9e2fd2377ea996a6fb
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_2
      last run: https://d.kernelci.org/test/maestro:6912cedb2fd2377ea996acf5
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:6912cedb2fd2377ea996acfc
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:6912cedb2fd2377ea996ad32
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:6912cedb2fd2377ea996ad89
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:6912cedb2fd2377ea996ad2b
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6912cd7c2fd2377ea996a56c
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6912d7b42fd2377ea996c7d4
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6912d86e2fd2377ea996ca0a
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

