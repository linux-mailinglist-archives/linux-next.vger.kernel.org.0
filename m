Return-Path: <linux-next+bounces-8524-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8176EBAB036
	for <lists+linux-next@lfdr.de>; Tue, 30 Sep 2025 04:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1284F19243F4
	for <lists+linux-next@lfdr.de>; Tue, 30 Sep 2025 02:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF6772617;
	Tue, 30 Sep 2025 02:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="nJ33aGpD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEA621B9C1
	for <linux-next@vger.kernel.org>; Tue, 30 Sep 2025 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759199414; cv=none; b=K+pE6HdkPwyIbv9TOqnhR/9Z8HNZcroYJYezXHA0xiPtHPmg6f3gvxdGqw7UXDoZ26yapNSb8o9boO8vYOyUUBpSfFBdVS356Gn2Z29TbQBqh2xy8E+gHELgQ/m/lvtsoCQztUY6POAKYxR0/5M72koDZMh9dd53cMhFLLcsR3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759199414; c=relaxed/simple;
	bh=ju6f4AiP3CWshPwQjNX3iUKR6jvWYBJApdGGhhHKcbE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=c3WUivUyOI/ZOA1IK976Bec5idTfgYv5JjpitlakjF0Lmsf0qAlrtzbkcSYBLVEz4++ToLOe1EewWFBtvhk3F7IjBDCD69ketE+WYpzEa4YeOXNY2UyPxZENGzq/ux+2FvrS2u27wiXCPQNgYxSXyjOW37VCFs3W9Vmw9ocXZR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=nJ33aGpD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-781997d195aso1886574b3a.3
        for <linux-next@vger.kernel.org>; Mon, 29 Sep 2025 19:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759199411; x=1759804211; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKhI+kwn/MKS+yeatsiFFUrAT5c5urcbPJB4X992QZI=;
        b=nJ33aGpDpdgJeTu32GSFt0O62ij2Wi1+LUH2cht9S6KY/H6mi8SYZYymDI+fnVWpkX
         qsIL/q0UYvXlAbUU5itbqdkgk/zVQRaQ9+sG7vw4L3Uxmi0tZlI31m5VrVx34jsAB6F1
         eTYaYmgiiAyEHgXGgNXNXUFMPNxBfSRX0U+qJd9JHs0k5lnVcOr4aKkSQU3kUzFHFdEx
         i48ZF7+sLnrlJBfUpq4A+MTCNr3/702o5ufGRDXJaaP+91vNduz2SDbjdMNrk1kw58XF
         u8siDhPYFfuKilKFibwv6o7tRPCC1lCU2E/9GBks+HslbCh2RhHNvVm1sbX/EIGuqEe/
         H1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759199411; x=1759804211;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WKhI+kwn/MKS+yeatsiFFUrAT5c5urcbPJB4X992QZI=;
        b=ftmKn278ARwUeMU8ubjKx+UkNK/pZ3dxtnq+GIiDMGmLJeA/6o3rO6wSaKjI7uExgu
         NQbu2hGxHKnJj3tiV5ik5bD4MMEuD+heJYgpA5q5xqQsGL3yeh4A6Odu2ZrmbSv0R3GO
         IiGmgNvWcypEYdoqYhsgXLJpRq03XDevFfe+sDoaXwunImomW7T+6X7kQmlHKbioTDLY
         4Od3Rz84X5Y2rsJKB7P/3bVOHqy6j90Gf/rOoHPTZpsC+e2LaU8dXSYLPdK9KytPqfZ2
         RvOtsV4tm/KKW+hFr+xein18rOENfnCD8RkxMzPNfJ1E5F6cPCEgHU0Pl0gb+CiAHYBD
         c1Rg==
X-Gm-Message-State: AOJu0YyMoNUUriSSTfXi2t0UpIVV7jCShy4h+N1tbDKHgSJTNcPyjuPe
	4WlIRwkXxE+R8/0aSCc/3NdG0s2a6pe9VUA/7rbJr49GT0nljzBAZT39yem1BqfpLihMfAll4OC
	19PTQQP8=
X-Gm-Gg: ASbGncvD2EO8vlGaSdqqPqcSKa4fTh50FwGJIK/dexAbrXelZIL9qsi0AI2J88o2SX7
	cPeIAAySgXA6Ge2mm+plnS4BOHG6bCVinW8fcOYWhWn5+tQTdLwH344x5MqIO2FKtmvJxqWEZIY
	Z8TFsTPsWhssdUs1ttLgaeEeby/K7yc7p5+Vh77XCYWzJxGqNDbJ16R7QFSt2eyB5UmnweWwv0a
	Yqrx1gJ1L+alxXyn3JCS+OTpCtKx1rcDRWkUH22QMODI9llqlSxUgTUatgsqUV84x6LWelBj2dv
	H4B4AMsZVsmN0oMg9E2Sw8/ZhKSuh7A6XybVjsXlkTNar2g6XAbvtA0uTJAR8STAIDYKztdBKsM
	FQ+HZRfsYSiOiHTcmlIJ/UBbZgyGhdOBRMohESpWt/WZDaAQSii4=
X-Google-Smtp-Source: AGHT+IGhKyclGE5FECBY+Cv3+74jR2kQG8bLf2kduDJyA+yuymiZPmUTPW6/5lZpz8zxIHuRMnoDpg==
X-Received: by 2002:a05:6a20:5493:b0:24e:c235:d7ea with SMTP id adf61e73a8af0-2e7d10a3c3amr22746929637.47.1759199411173;
        Mon, 29 Sep 2025 19:30:11 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78348969edcsm5325959b3a.25.2025.09.29.19.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:30:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3b9b1f8df454caa453c7fb07689064edb2eda90a
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 30 Sep 2025 02:30:10 -0000
Message-ID: <175919940964.2235.11916783790208792908@1dfac204f25d>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3b9b1f8df454caa453c7fb07689064edb2eda90a/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3b9b1f8df454caa453c7fb07689064edb2eda90a
origin: maestro
test start time: 2025-09-29 15:30:26.994000+00:00

Builds:	   60 ✅    0 ❌    0 ⚠️
Boots: 	  163 ✅    9 ❌    6 ⚠️
Tests: 	12473 ✅  562 ❌ 3371 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.kvm.kvm_kvm_page_table_test
      last run: https://d.kernelci.org/test/maestro:68db1d9e841b167e8d33c41b
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:68dab8f2841b167e8d32f9e6
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:68daabbb841b167e8d32c0d0
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68daad84841b167e8d32cd80
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_18
      last run: https://d.kernelci.org/test/maestro:68dabeef841b167e8d33214d
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6e2841b167e8d32ed06
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331b86
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331b7d
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d3319af
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d3319a3
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331ae2
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d3319a0
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d33199a
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331acc
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331aca
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68daabc7841b167e8d32c14d
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68daacc9841b167e8d32c390
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6d8841b167e8d32ecd6
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33ad68
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33ad5f
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68db0885841b167e8d33ab91
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68db0885841b167e8d33ab85
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33acc4
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33acc6
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68db0885841b167e8d33ab82
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68db0885841b167e8d33ab7c
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33acae
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33acac
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33acaa
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68daabc2841b167e8d32c120
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68daad98841b167e8d32d0ff
      history:  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68daabca841b167e8d32c16b
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68daaccb841b167e8d32c39c
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_pcm-test_default_time2_fslimx6qudooac9_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:68dabeef841b167e8d3320c5
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6de841b167e8d32ecfa
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d3308b1
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d3308a8
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68dabb0f841b167e8d3306d9
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d330836
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d33080c
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d33080e
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68dabb0f841b167e8d3306cb
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68dabb0f841b167e8d3306c5
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d3307f6
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d3307f4
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d3307f2
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: juno-uboot
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6e0841b167e8d32ed03
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d331229
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d33121c
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68dabbd7841b167e8d33104e
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbd7841b167e8d331042
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d331180
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d331182
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68dabbd7841b167e8d33103f
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68dabbd7841b167e8d331039
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d33116a
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d331168
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d331166
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331b27
      history:  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331ac8
      history:  > ❌  > ⚠️  > ⚠️  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68dab97b841b167e8d32fc0f
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68dab97b841b167e8d32fc10
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6e7841b167e8d32ed15
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68dac3d5841b167e8d333510
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68dac3d5841b167e8d333507
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333338
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d33332c
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333469
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d33346b
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333329
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333323
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333455
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333453
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333451
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.mqueue
      last run: https://d.kernelci.org/test/maestro:68dab73a841b167e8d32ee26
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6ee841b167e8d32ed2a
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabf75841b167e8d332591
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68dabf75841b167e8d332588
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3323b7
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3323ab
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3324ec
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3324ee
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3323a8
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3323a2
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3324d6
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3324d4
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3324d2
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6f0841b167e8d32ed2d
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbb2841b167e8d330f4f
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68dabbb2841b167e8d330f46
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330d78
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330d6c
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330ea9
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330eab
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330d69
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330d63
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330e93
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330e91
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330efe
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

