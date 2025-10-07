Return-Path: <linux-next+bounces-8570-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905CBC0078
	for <lists+linux-next@lfdr.de>; Tue, 07 Oct 2025 04:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3BB4B4E143B
	for <lists+linux-next@lfdr.de>; Tue,  7 Oct 2025 02:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A584A1E;
	Tue,  7 Oct 2025 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="KRZHUmKn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A379034BA3C
	for <linux-next@vger.kernel.org>; Tue,  7 Oct 2025 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759804217; cv=none; b=kYNoRt2nTiEzVxUaEQIz3M7AsGwgKKLjWkLhkWQULp0bPWua0ndK+CNgLkAm+0AUqMm/bCo+Y+0xUxJxmAZRz84CRuVWmWDt/ytoLhfVW5rmL7OrmhOpEiXSSAIVXrSsYWLAPVA6FCoGc+Jnlst0GgYQKDTbjNmMkBRZDxZYmic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759804217; c=relaxed/simple;
	bh=VUkIL8kEWT5zKsu4tjnC7JLnHuLtAbAkKJpGx39gnjw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=MZ/rkzwUpCRZd9cyMqFClEQ6XwRYDEEg7/0J7fdgBZ/jdFdnf/EhN2QRnhVihdJL0EqQCgQPGsvHEgnlotXQgbEkXuXi712CrZrPljmLYbjSkA64iQZXZNjDYsySfjI9yND8BjX5ljuncRI7dcR5ig890RhySSyLF9ONjMEM9Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=KRZHUmKn; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b62ed9c3e79so1719539a12.0
        for <linux-next@vger.kernel.org>; Mon, 06 Oct 2025 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759804215; x=1760409015; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZBsPhJgjMLpSt+Lxjo+jANmg7g2NPs+LCHizaXiHn4=;
        b=KRZHUmKnAnFJ5qo25xhOALfzVCWWr2cF9+T3roUEhrXLzDaKNzhE98JYlZYZ2TValI
         JRK6o2voBCXSNbF+fIH72wJiVeyI171tyEsLf1Guu3dknkRVHmDQ7uHGgsqtI6MS4YPb
         27rKRrzGPZ3szirhDoKV1RE/oxLo/ntohRJVGS8uv/5blG0Hg5qf8Jevl6acAWhflwpi
         oC/IaHrZNgQevjxNLqhIWVsMNEi+hk2xX6RsJomCsV7WiJm+ObrLPD0KX+mK/5JjJxMu
         xhrYAvjSDGdk2yUP3pp2GDCeNTroV8Ey1h3cqVsrEpHg4D7xtIm2FWIgO8xTdFUA4YrR
         y2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759804215; x=1760409015;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ZBsPhJgjMLpSt+Lxjo+jANmg7g2NPs+LCHizaXiHn4=;
        b=LvL0pWlwpcRHOhHLg7TR2uwpHRIgXs2iHfehZBK9yFg+sDV5Qp0AXX1ik+2dkW1KZW
         oam4VXau+y50hQhobZW5mClaKv+06U2f6XfdW6LgIfRa0u/o7ySrmR4t8ZT2yOeibfPq
         VnMeX9EZs3J3Yia0qe5ZjPXYmALTyjoOlB36p/iFFB5XUxunE/xn3pVg7FFPOMZxXNnx
         Dtw24oKZK+U0o5hDJtu4JkEOeW1H7PRDDwhLvID7ZA60+5xyLVK7z6JoePy8BAUndZUi
         hixWJL56gxwbH5cXvx9FFNR9si7TtUO11lx6DEOEVGsWvQZaaCUv0BK4DMXz3kJZGSey
         zvCw==
X-Gm-Message-State: AOJu0YyNbLYz1txlCckRx1tbFijmMX/ZyAPVs0oCgDqNJq+hnE7HrNRZ
	GkRiQoSKQerhUYPusT6EiSwBaG+KCLMDjbznbj5buRA49iT6hjkd/CM1Gv8Vfd9zwJMAID2S2S3
	+0L5G
X-Gm-Gg: ASbGncvsymycnfMtGGk1T+5HsuvtkFyu+v4JbCAlEOKKQxWqQC2pNrZPwbEK4XX9WgX
	oD3kbo2jGnGLieWnhIgmXRUfIheR7cp4/VjBsWmHJXMpVK0ISJ37gLi6/lpgXjI4V6ujk6VJXas
	m86/5l0YOyfi7iM2EEH8yMuNger0pdl3GdqzppsZ/vMxXfcP33KUy4Ml8vL+NTHxF3CmbwxUBDI
	NVaew6qx6z5Sk+JlZtoowilomtJXXFqPzRwa/NobdC7sQVCUZMLF1CQIyIJzO/6UYetQUBWb2cU
	AY5IrMsz6NAxd+4Fun3zSq5ChILTXKJthk2nphrD1XLGGW3xRVYHSWThgA4kzdHBy9a6ITfOQNq
	GWQwHMAhIaWzOgGheBgEe4YpwaineKZOXSj9cywR+
X-Google-Smtp-Source: AGHT+IFvbWN3p50aS1ufH2gTQvO5JnUYyHKuAT1T15vI/mckake2ceXgBbNawlzntCVY1cotJCUb+A==
X-Received: by 2002:a17:902:d4ca:b0:280:caeb:ed67 with SMTP id d9443c01a7336-28e9a5441c7mr188724505ad.23.1759804214676;
        Mon, 06 Oct 2025 19:30:14 -0700 (PDT)
Received: from d76c3c94e839 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b8796sm147364785ad.77.2025.10.06.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:30:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 4a71531471926e3c391665ee9c42f4e0295a4585
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 07 Oct 2025 02:30:13 -0000
Message-ID: <175980421349.60.755907050733119685@d76c3c94e839>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/4a71531471926e3c391665ee9c42f4e0295a4585/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 4a71531471926e3c391665ee9c42f4e0295a4585
origin: maestro
test start time: 2025-10-06 13:38:43.261000+00:00

Builds:	   60 ✅    0 ❌    0 ⚠️
Boots: 	  164 ✅   10 ❌    6 ⚠️
Tests: 	13644 ✅  566 ❌ 4534 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68e3d01e9512ca527453e506
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68e3d1e19512ca527453f600
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68e3d0259512ca527453e677
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68e3d2049512ca527453f659
      history:  > ✅  > ✅  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:68e3d0499512ca527453e826
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_23
      last run: https://d.kernelci.org/test/maestro:68e3d04a9512ca527453e882
      history:  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_24
      last run: https://d.kernelci.org/test/maestro:68e3d04a9512ca527453e889
      history:  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68e3cf029512ca527453e0f5
      history:  > ✅  > ❌  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68e3d8d89512ca5274542548
      history:  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68e3cf059512ca527453e0fb
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68e3d0249512ca527453e667
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68e3d0249512ca527453e668
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68e3d8d59512ca5274542531
      history:  > ❌  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:68e3d04a9512ca527453e875
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:68e3d04a9512ca527453e87c
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:68e3d0499512ca527453e81f
      history:  > ❌  > ✅  > ✅  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:68e3d8f69512ca5274542607
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68e3d04a9512ca527453e88f
      history:  > ❌  > ⚠️  > ⚠️  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_12
      last run: https://d.kernelci.org/test/maestro:68e3d0499512ca527453e836
      history:  > ✅  > ❌  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68e3d5979512ca5274541572
      history:  > ❌  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68e3d67f9512ca5274541c4b
      history:  > ❌  > ✅  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:68e3cee69512ca527453e06a
      history:  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

