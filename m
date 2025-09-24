Return-Path: <linux-next+bounces-8461-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE9FB9812B
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 04:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DE8A19C7A64
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 02:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143796FBF;
	Wed, 24 Sep 2025 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="KzTPgijX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5818543AA4
	for <linux-next@vger.kernel.org>; Wed, 24 Sep 2025 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758681021; cv=none; b=fsB/ic/64ffcc86EyPW8To0mAponPXumIK9ciF38fJbtKOE46WwzFnw6yvvEbWxHGKfMszg/Kh414MMF3fq84+Mv91XcIQovf5lvjP9pqdjFs1e4z3VKNVbjqAAwBQVoFNef91IwVlOT3uGrZ9arzGPhcBhBipHEtt58alA6g8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758681021; c=relaxed/simple;
	bh=JVMDLuF53YvZxcp0L6fKAXHwHwPb8AAiO1rR4x6ngLE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=RKsKsMY6BvmgU/5xPUO+e/7RYkgfoqEhRd2a3wPxtNB2QiclzQUlQEP/YrqsQI+GPKsWRxuSqkMVdag6igtKOW4V+Sqjfjm/7ixa2q+g6kDsIStA/kx6/Wq5joAgHy8Klk0L63qRDTQ7IOE21ffA9rVs9qKwv+XULnZzCsRejJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=KzTPgijX; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27a6c3f482dso21331985ad.1
        for <linux-next@vger.kernel.org>; Tue, 23 Sep 2025 19:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758681018; x=1759285818; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVEhKjgPJik36Hg6Yg/lgMPMoWEE1nUrs+nYSyyQuFo=;
        b=KzTPgijXv6YjJldJkmFGzwgU4OdVbXwe9YZfiKWjHjKGnQkCBFlZvxfhNY00T+Y464
         mcoSbjV10E/lnUVm0u0yp2RyR9OzKS4u2FmEG13Fo87PxrtKbtHhOjaKpT+Dr0MCL2uK
         RsXSYFpTfw5jLzK8AJSrSfps2C89ToTdywQkQN+UI1Y/zRXc/CCDRwU40B2CdH3yGoyA
         H5cfgkfWvr4ets93FxEcLApEJ91wIPRkynTS72x14to3NAXNHS+yNteSer1hdL8bMaN3
         GdkEu4AfIQTLqNdmyf06Mo++Xs9bMTQih4m/IG4MxTOd5cEswELT4MBYSiQdd4lfTU9M
         SsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758681018; x=1759285818;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVEhKjgPJik36Hg6Yg/lgMPMoWEE1nUrs+nYSyyQuFo=;
        b=fBskabGFXykuFQwiVsL3vTQ5ecdhxXDPkx899l2S1RDVSqNvEYsComIW58l3QqDF+h
         jdxcfTc2fBSRKrGWnvOOJSV5HEXX4OLqaAI9AhyssDsdMSizuKjBpSsRmR4rbqcWLGsL
         sspqTz/T1baVG1vR7SQAuL1sQ7XdyeZuI01g+Rd7XtPA5goK0c4HLiE3AeAenv4ckfnk
         /4+qgZzoNPE2+n0TsI9b80x25R8OegKm2moTsFUhRMRaC4lfEi3rSbYQgVEIj1GGyvhU
         kKBc76rcp5BGXnrnWXa3j9Ls7bVTf6QE3vJgKG0QaQnH/7HxP+EW4NjoE0EuP6aU8Nbz
         ycMQ==
X-Gm-Message-State: AOJu0YyHSk/VXa4CroK1K+swTaGsrpuCqh6QbBU9vCJipR4VKZWJCNTQ
	27xy5M0xXx2f6BkUmEbzinj2RE2BJ/zViL9Ki2ZNW4RI4BHmezbVkkyrdyo6oyrpE2tLGvSHzQQ
	4+lZq
X-Gm-Gg: ASbGnctsRaky9PTJI3pPlWsXs83XPOOgJunK2M+73Ds5ecnBxPhef2rjeLx4j8wqxVl
	iwrM6cBwu2bVErhRjID5zZrDno1m4ryKiNXcFDI7+f+b+vEmfnm/nn//dbLCLvJov96E7gp32lu
	b1yrxWbgKjjRxFAvrAGhZa3KJ75tWezAjF3l3eCz0Xvnlext3F03jOqmNCwZ5d9INmQMKPqA9Ef
	Cp4FNt6lc3/PVVoL/DSc5ugeoliCnvBk1IF/lCtjKM15ykpzvGwhndWLFKrPyH+Wfw48ZMXkg2q
	awxLVJw9sKnAHxANQcnEWgGb3eIYj7JnzQv5D1sJ7GN0m5FrX5wWJd+di+tHrIxl7qeL/QORyOb
	cE2MEyGEqWZAKaRp1
X-Google-Smtp-Source: AGHT+IFnRgljAg2apbDBUnE8DrYhncSa+8qNe+2GcWqT8PhglxEME5FZo1GMVehPUjduzKmNOhASbQ==
X-Received: by 2002:a17:903:2444:b0:279:fa:30fe with SMTP id d9443c01a7336-27cc28bef2emr56643425ad.26.1758681018576;
        Tue, 23 Sep 2025 19:30:18 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016bedfsm170813825ad.32.2025.09.23.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 19:30:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - ce7f1a983b074f6cf8609068088ca3182c569ee4
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 24 Sep 2025 02:30:17 -0000
Message-ID: <175868101694.1169.1635957649862190137@1dfac204f25d>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/ce7f1a983b074f6cf8609068088ca3182c569ee4/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: ce7f1a983b074f6cf8609068088ca3182c569ee4
origin: maestro
test start time: 2025-09-23 17:22:14.145000+00:00

Builds:	   58 ✅    0 ❌    0 ⚠️
Boots: 	  160 ✅    7 ❌    6 ⚠️
Tests: 	12334 ✅  542 ❌ 3380 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:68d3209e75b320799d3abba5
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d3221e75b320799d3acbcf
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68d320b075b320799d3abc46
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d322b875b320799d3ad163
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_18
      last run: https://d.kernelci.org/test/maestro:68d31c6e75b320799d3ab67f
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68d3000d75b320799d3a97f8
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:68d31b2875b320799d3ab508
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:68d2f09c75b320799d3a7383
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh
      last run: https://d.kernelci.org/test/maestro:68d2f54175b320799d3a8dc2
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68d320ad75b320799d3abc24
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d3219c75b320799d3abdf0
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68d3242775b320799d3ad661
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68d31ed975b320799d3aba64
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.pkvm
      last run: https://d.kernelci.org/test/maestro:68d3000075b320799d3a97cb
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68d2f0ad75b320799d3a73c4
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68d3000e75b320799d3a97fe
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68d3011e75b320799d3a9821
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68d3011e75b320799d3a9822
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

