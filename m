Return-Path: <linux-next+bounces-8508-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74196BA5835
	for <lists+linux-next@lfdr.de>; Sat, 27 Sep 2025 04:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 302C0188EB22
	for <lists+linux-next@lfdr.de>; Sat, 27 Sep 2025 02:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0012D1547F2;
	Sat, 27 Sep 2025 02:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="n1XB+BjV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8324B28
	for <linux-next@vger.kernel.org>; Sat, 27 Sep 2025 02:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758940247; cv=none; b=oGul1GW0wjRpliOoHeG5Uz6D16lAx8c3qWet866e7hNKv8HblGIcLFFKIoayrSJJcDyPUIEx4Y5/rIfsTgvcrYrylnvgXcqHbh/UQo/6sqqtT8w5X6WBdct33BuEa24wXCI1hhq0BiV+cZryJ/Ho0Lt2sdhLqUlzzCwcMfO5nWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758940247; c=relaxed/simple;
	bh=59Trrtn00SgueutEqhyc1y+vXcIKBTTgKWIVnMxbNkE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ldp9jBlj4rZg/UVClJmYt/6q3TB0BiX1+7FnUpPeW1cDnJ/kxCkf6QLUFGbWpRjgq6gS7B/r8Ky4BFHwNn7ugQIYQdBifBfmzqKLQRaY8RIEVRsPXPlKNG7P8i5lh19Ri1qeIeFqEAScy+8/PrsXDig2GwUhCTs8pRmRcYggpUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=n1XB+BjV; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b57bf560703so2126295a12.2
        for <linux-next@vger.kernel.org>; Fri, 26 Sep 2025 19:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758940245; x=1759545045; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcbuV4b6H5oR4WUcvQZZhTutID8U3gdTYmpeB8JpPCo=;
        b=n1XB+BjVmS/1X6/gDaVuHBs+nt6dyLYDBXjH/WquQK2xEPRYCVWzswotHfyoAr6pRr
         LGfIjW8upP0nDQmdXCSBmiu1Io+DWcO1xj+ogNhdCfGUfC7CjWilv7WCqwE7hIj78Dkd
         v+svAamgGK5s4HMmaIgbmM4tDyv+XnW0UjsIC8Po8fWxer2zIRn/HF2IDuifB1VGL5zb
         WZjE/+P+xWDkJkjuS/Cjw0Wd95HNmTY5TkDgNuBkNBprdxi89Dn1wgAQFJYP5nuqitKI
         sqlvb1YYMODcj810GuxAw9a9RxY8pccRFL8sKWstaYws6RZ41opQTFIYMxgmi9DGnHrq
         kPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758940245; x=1759545045;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rcbuV4b6H5oR4WUcvQZZhTutID8U3gdTYmpeB8JpPCo=;
        b=Ipa3s7Na3weGmJTGl4NSx6zyN8VPq8OkfGc18aWhEfQwP/gD32PSww+tnwlHeuuvna
         i+U5lS0jGG21w3MiXIWG9N7aV6/mD2KUUVMcy8fpqUwfw5RVH82eLSuEwXe9SBHPrjjv
         ou68bieM1WHqQie1V9+idYuBnBXiwHO3yx0QB7oXxcutA7G8FC4t1osIypFE42tXkerF
         /jPkcc62b73SQ56v8CRDcii6vHqSTZ2ULE1cctDEFj5UidoBI3enQ7/f3YsiKrUmPM95
         aI/VT/sljqi09FuXX6JzSJfvrRtPon9rXJjZDSvDhfV6ZRJSgQgSr/6nxtZbnJ+K9Bi9
         CTrw==
X-Gm-Message-State: AOJu0YyyvCZK9ZMfu2jkJV4SzZuUTOM5Oy2RQivUz+gtBtynvDagKGfH
	agmvQxaOcijFyX4ebQeA12FnlIpMbl8K2IjDmNXV7TzxJnR+DImlfCf5WTRhGb3n64UAhklAJLG
	28y7cG9Q=
X-Gm-Gg: ASbGnctzFeowTIvxRriOAcC71a0itQucSTmrnjt876mBWI1monf3ESv1iZhU3Tip0rO
	Ahl97JOUMd9B+67gecnmS0T4L50O/KefJtvOsyCk1Ob1KVs81+PxQ+vp1jRcvJCsDqWvxpFvSAD
	kAZ2Uh2/LQAUNaONfQDCKp69jgVyOLviC+MTOJldEvFZSvuCJXJkDUmyOF0wmY1dKOUIkTXwzol
	zMXo6JHRoUgmLQ3ZoojUI3mQdIj//Ks7uAC226xORltYA6q7zMXjEbFtaiFu9ITsGDnIbiMBEP7
	v1WeiFBW8GvFSjimPdPHAjEcL7MBup2NUNqYztXcttvosDgWtScM9FZamhJz33mC5tY7m40Hz+3
	GE2urTKWmeKOQDmQzuUFUPr78J98=
X-Google-Smtp-Source: AGHT+IHrh6BpfXhBLRzYocK1k4Yi3eZDWW4IHb9D67L6Ol+tGtYUS0IHl5i4gJ6lKjWP4SK9f4rz6g==
X-Received: by 2002:a17:903:22ca:b0:277:9193:f2ca with SMTP id d9443c01a7336-27ed4a29e9amr96108015ad.9.1758940245082;
        Fri, 26 Sep 2025 19:30:45 -0700 (PDT)
Received: from 1e895cdadf47 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a4d4158sm2814823a91.5.2025.09.26.19.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 19:30:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 262858079afde6d367ce3db183c74d8a43a0e83f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 27 Sep 2025 02:30:43 -0000
Message-ID: <175894024351.107.14229474313964219856@1e895cdadf47>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/262858079afde6d367ce3db183c74d8a43a0e83f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 262858079afde6d367ce3db183c74d8a43a0e83f
origin: maestro
test start time: 2025-09-26 16:14:29.438000+00:00

Builds:	   58 ✅    2 ❌    0 ⚠️
Boots: 	  165 ✅    9 ❌    6 ⚠️
Tests: 	13396 ✅  523 ❌ 3679 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68d6d430aabea828fddb1952
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d6d69eaabea828fddb2ffb
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68d6d42baabea828fddb1925
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d6d629aabea828fddb2cce
      history:  > ✅  > ✅  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:68d6cda4aabea828fddb11a7
      history:  > ✅  > ❌  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_pcm-test_default_time2_fslimx6qudooac9_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:68d6e182aabea828fddb4231
      history:  > ✅  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.pkvm
      last run: https://d.kernelci.org/test/maestro:68d6c847aabea828fddafad3
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68d6c79faabea828fddaf278
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68d6c8d3aabea828fddb03d5
      history:  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_18
      last run: https://d.kernelci.org/test/maestro:68d6e182aabea828fddb42b9
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d6c5fcaabea828fddaebc5
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d6c5fdaabea828fddaebc8
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c8deaabea828fddb05e2
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d6c8deaabea828fddb05d9
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d6c8ddaabea828fddb040a
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c8ddaabea828fddb03fe
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d6c8deaabea828fddb053e
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c8deaabea828fddb0540
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d6c8ddaabea828fddb03fb
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d6c8ddaabea828fddb03f5
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d6c8ddaabea828fddb0528
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d6c8ddaabea828fddb0526
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c8ddaabea828fddb0524
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:68d6d423aabea828fddb18db
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d6d57faabea828fddb1dc5
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68d6d433aabea828fddb1970
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d6d66faabea828fddb2dc7
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d6c5feaabea828fddaebcf
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c8c9aabea828fddb0391
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d6c8c9aabea828fddb0388
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d6c8c9aabea828fddb01ba
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c8c9aabea828fddb01ae
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d6c8c9aabea828fddb02ea
      history:  > ⚠️  > ❌  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c8c9aabea828fddb02ec
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d6c8c9aabea828fddb01ab
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d6c8c9aabea828fddb01a5
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d6c8c9aabea828fddb02d4
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d6c8c9aabea828fddb02d2
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c8c9aabea828fddb02d0
      history:  > ⚠️  > ❌  > ⚠️  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d6c5feaabea828fddaebd2
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c88baabea828fddafdaf
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d6c88baabea828fddafda6
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d6c88baabea828fddafbcd
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c88baabea828fddafbb5
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d6c88baabea828fddafd0a
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c88baabea828fddafd0c
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d6c88baabea828fddafbaf
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d6c88baabea828fddafba3
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d6c88baabea828fddafcf3
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d6c88baabea828fddafcf1
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c88baabea828fddafcef
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
Hardware: juno-uboot
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d6c5feaabea828fddaebd5
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d6c94baabea828fddb08a9
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c94baabea828fddb089d
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d6c94baabea828fddb09dd
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c94baabea828fddb09df
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d6c94baabea828fddb089a
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d6c94baabea828fddb0894
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d6c94baabea828fddb09c7
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d6c94baabea828fddb09c5
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c94baabea828fddb09c3
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d6c5ffaabea828fddaebda
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c7e2aabea828fddaf798
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d6c7e2aabea828fddaf792
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d6c7e2aabea828fddaf5c4
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c7e2aabea828fddaf5b8
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d6c7e2aabea828fddaf6f6
      history:  > ⚠️  > ❌  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c7e2aabea828fddaf6f8
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d6c7e2aabea828fddaf5b5
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d6c7e2aabea828fddaf5af
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d6c7e2aabea828fddaf6e0
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d6c7e2aabea828fddaf6de
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c7e2aabea828fddaf6dc
      history:  > ⚠️  > ❌  > ⚠️  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d6c600aabea828fddaebe0
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c7d6aabea828fddaf572
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d6c7d6aabea828fddaf569
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d6c7d5aabea828fddaf39b
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c7d5aabea828fddaf38f
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d6c7d5aabea828fddaf4ce
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c7d5aabea828fddaf4d0
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d6c7d5aabea828fddaf38c
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d6c7d5aabea828fddaf386
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d6c7d5aabea828fddaf4b8
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d6c7d5aabea828fddaf4b6
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c7d5aabea828fddaf4b4
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
      - kselftest.mqueue
      last run: https://d.kernelci.org/test/maestro:68d6c622aabea828fddaec72
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d6c601aabea828fddaebed
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c89faabea828fddb0028
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d6c89faabea828fddb001f
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d6c89eaabea828fddafe51
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c89eaabea828fddafe45
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d6c89faabea828fddaff83
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c89faabea828fddaff85
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d6c89eaabea828fddafe42
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d6c89eaabea828fddafe3c
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d6c89faabea828fddaff6f
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d6c89faabea828fddaff6d
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c89faabea828fddaff6b
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d6c601aabea828fddaebf0
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c7e5aabea828fddaf9c3
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d6c7e5aabea828fddaf9ba
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d6c7e4aabea828fddaf7ed
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c7e4aabea828fddaf7e1
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d6c7e5aabea828fddaf91a
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c7e5aabea828fddaf91c
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d6c7e4aabea828fddaf7de
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d6c7e4aabea828fddaf7d8
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d6c7e5aabea828fddaf904
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d6c7e5aabea828fddaf902
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d6c7e5aabea828fddaf900
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68d6c853aabea828fddafb16
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68d6c98faabea828fddb0b01
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68d6c98faabea828fddb0b02
      history:  > ❌  > ✅  > ✅  > ❌  
            

### NEW BUILD ISSUES
- Issue: maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893 | version: 1
  Build: maestro:68d6bd56aabea828fddae00b
  Comment:  undefined reference to `pm_hibernation_mode_is_suspend' in vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c) [logspec:kbuild,kbuild.compiler.linker_error]
  First seen: 2025-09-26 16:34:06.057303+00:00
  Culprit: code
- Issue: maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893 | version: 1
  Build: maestro:68d6bd59aabea828fddae00e
  Comment:  undefined reference to `pm_hibernation_mode_is_suspend' in vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c) [logspec:kbuild,kbuild.compiler.linker_error]
  First seen: 2025-09-26 16:34:06.057303+00:00
  Culprit: code

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

