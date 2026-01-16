Return-Path: <linux-next+bounces-9678-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53051D2A27B
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 03:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E143B301C948
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 02:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530B926E165;
	Fri, 16 Jan 2026 02:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="GMKI0EdP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD41DDC35
	for <linux-next@vger.kernel.org>; Fri, 16 Jan 2026 02:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768530709; cv=none; b=jlwvlmtA39hLkkHQWwHzfG870CB15bAr6wcKy5K1096nKMmtbIxaQqx2+N2zLCObCKX/bgmfU+Tnnyva41DIkLWFncq8o4B6JwL+azczvPG1Bk30WJUDr0ZMpCFXZFbg9KHBAKj+XQh/0etTzzSYPWF1pKam0d69dKZMvvK5WOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768530709; c=relaxed/simple;
	bh=kKMwFAk3OEIOUm+bGTfBAlGj6weWixeleNFTlC4Loz4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=mvnygLNq2oyaZTJB78zZ2P766zoCcWNhVs8GyWKA7yP8haL8yyeCfwcPgutJ7xySvQLMJL9YOQUhEIUQZQR1kVj5GydyS1ELyDgSYFVUYIhBzbyi+SlqrA1/jdbAz5ZFtoYLD9hUyaIQZBwb6GxyJpU3UMSnpB0KUEQTDScmEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=GMKI0EdP; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-11f36012fb2so2389966c88.1
        for <linux-next@vger.kernel.org>; Thu, 15 Jan 2026 18:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1768530706; x=1769135506; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncH5qBXB++GLPCrRhLZDQon2QFjYJBKBSHb7V3ss0Io=;
        b=GMKI0EdPbaLN+CJryAK5iu4egOqvhUJuPOfMK4w9xZ2kvzmOYvCCZXvEkVLxGStIA1
         jAYtFCnEmg7hrMDLZUQ7JRJTP+EDKa80q0fvpkEp2gHu0vcOhGSjyJRCrbDncN+N4l9s
         Q8H3ZTK039gR7VJxI/0ke0pA2osyN9Ly1dFQ+pd3Q56JLdUI8fGxnlvi5RUV/tnn7V3w
         DwEOI0gd+5DOniJMcb4x+RTlwN/gZO6/84acll22pcnrKtgxlux1mj4kynxRz2M7M0L6
         HfK4Q8GIKhvTDcAgep61a/qJ92u7lbupaTsEOF9q9Iqoq97goecU7Bo0kD83gnbNGiCB
         gL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768530706; x=1769135506;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ncH5qBXB++GLPCrRhLZDQon2QFjYJBKBSHb7V3ss0Io=;
        b=gdiB4p/0S40UngYupzYq7YOlqVFpcXzA9rpp3PpWV6n3dsnGTE9VYtO6FHHJSz+6qw
         SVvL3cL8VtlN0PMUh/MeILgQnhKjR4MdJUgpOhRC1CskyY80swW11f7Fz8kSfaSShzMx
         pb1sb2jwqjIIw2Pjv9ZjD+uz9wV533hXDmb38i7P/NGfO/ctz19xtmCWyNW1u4ZCHHT3
         7xqZq0D3S1pJfSV/PmrtgU/D+ebBAdCuEUZ1gHqTbTq7eEgObFSf9/ckKp+IzHXUgmRz
         VDo+mAGHqQz2K5McoOPLeeM4k0CDV02jJ0SmRs6Qs5VdvrkmjxpS9yw/aYuszU8FLXeF
         /SfA==
X-Gm-Message-State: AOJu0Yw1j/KH2sJMuFKyYs758Y//BA0mHQQ52nrdsdmeTgAj8HTGfOzW
	bDDxT7QY3R43Xp6PJKElot/cJG7Trb0j+2c8xkYqO9f+8bB3csKA7fLcqHLH2xckcLCkFTehURh
	b/Sk48DU=
X-Gm-Gg: AY/fxX6zDARlfIkzK0l6fHBl1eCMjQ0fDMS8fs9xji4vOMeA3nd3PXEveT3aL6IXeUl
	V9yXx7nQC9co7TjyTAaHwPA621xH6LBIQEhLgsmsq+oyPqw6VKj89/DSniRraC9X2uIxHMlUVU7
	UiRg1Kny6HBQoAqgrSjjvpV+zHF/5RpaxqRsgMrX53vVRXlhMLdekJEjqkfkveUpi152sHYdxaF
	xhUQtRWPfZIyi8bmrOc3MhlfSfnD+ihYAHJ5XDIpokiyeqnXiSvmetEsYTboyAyYcJDvSRsxmIv
	kjyu2Smm4fAz5HEwDU96nWbStIR5RY9KigZVFG5MWwUER29OclhvutErZKjutsh1gJwuXgR4Jzy
	m6RgSm+opOe1kL7qW5OObrq1bMCAaYbn51M0mHFvUCwp/B9nuu5vWqjBWcbN/A8HIf/y8weP0gg
	at9IP5
X-Received: by 2002:a05:7022:2483:b0:119:e56b:91f2 with SMTP id a92af1059eb24-1244b36f135mr1145609c88.35.1768530705710;
        Thu, 15 Jan 2026 18:31:45 -0800 (PST)
Received: from 1c5061884604 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad72063sm1343436c88.6.2026.01.15.18.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 18:31:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 16 Jan 2026 02:31:45 -0000
Message-ID: <176853070471.3985.6263437514983241055@1c5061884604>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/9b7977f9e39b7768c70c2aa497f04e7569fd3e00/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
origin: maestro
test start time: 2026-01-15 06:03:25.371000+00:00

Builds:	   53 ✅    2 ❌    0 ⚠️
Boots: 	  161 ✅    3 ❌    0 ⚠️
Tests: 	16729 ✅ 2173 ❌ 4400 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:69688bafb2a19cc73ab131a8
      history:  > ✅  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:69688bc6b2a19cc73ab13215
      history:  > ✅  > ❌  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:696891deb2a19cc73ab16ed9
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.JVT-AVC_V1-GStreamer-H-264-V4L2SL-Gst1-0.BANM_MW_D
      last run: https://d.kernelci.org/test/maestro:6968910bb2a19cc73ab15cf9
      history:  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69688b33b2a19cc73ab12f69
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69688d5ab2a19cc73ab142f5
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.vdso
      last run: https://d.kernelci.org/test/maestro:69688ac8b2a19cc73ab12e38
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.vdso.vDSO_vdso_test_abi
      last run: https://d.kernelci.org/test/maestro:696890a4b2a19cc73ab1590e
      history:  > ❌  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:69688ae4b2a19cc73ab12ebc
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:69688bc6b2a19cc73ab13262
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8
      last run: https://d.kernelci.org/test/maestro:69688bc6b2a19cc73ab13207
      history:  > ❌  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:6968910bb2a19cc73ab15d0b
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f08000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab15863
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f09000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab15862
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f0a000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab15861
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f23000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab15860
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f24000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab1585f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f25000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab1585e
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab15886
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69688b34b2a19cc73ab12f6c
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69688cf7b2a19cc73ab13ecd
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688d64b2a19cc73ab143a4
      history:  > ✅  > ❌  > ✅  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688d22b2a19cc73ab140c3
      history:  > ✅  > ❌  > ✅  
            
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69688a1cb2a19cc73ab12bf1
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: asus-C433TA-AJ0005-rammus
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688c47b2a19cc73ab1348e
      history:  > ✅  > ❌  > ✅  
            
Hardware: asus-C523NA-A20057-coral
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688c79b2a19cc73ab13671
      history:  > ✅  > ❌  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688cb2b2a19cc73ab13ad7
      history:  > ✅  > ❌  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_BOOTTIME
      last run: https://d.kernelci.org/test/maestro:696890a4b2a19cc73ab1592a
      history:  > ❌  > ❌  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_MONOTONIC
      last run: https://d.kernelci.org/test/maestro:696890a4b2a19cc73ab1591e
      history:  > ❌  > ❌  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_MONOTONIC_COARSE
      last run: https://d.kernelci.org/test/maestro:696890a4b2a19cc73ab15916
      history:  > ❌  > ❌  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_MONOTONIC_RAW
      last run: https://d.kernelci.org/test/maestro:696890a4b2a19cc73ab1591a
      history:  > ❌  > ❌  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_PROCESS_CPUTIME_ID
      last run: https://d.kernelci.org/test/maestro:696890a4b2a19cc73ab15935
      history:  > ❌  > ❌  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_REALTIME
      last run: https://d.kernelci.org/test/maestro:696890a4b2a19cc73ab1592e
      history:  > ❌  > ❌  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_REALTIME_COARSE
      last run: https://d.kernelci.org/test/maestro:696890a4b2a19cc73ab15922
      history:  > ❌  > ❌  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_TAI
      last run: https://d.kernelci.org/test/maestro:696890a4b2a19cc73ab15926
      history:  > ❌  > ❌  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_THREAD_CPUTIME_ID
      last run: https://d.kernelci.org/test/maestro:696890a4b2a19cc73ab15911
      history:  > ❌  > ❌  > ⚠️  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688cc3b2a19cc73ab13ca9
      history:  > ✅  > ❌  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6968903eb2a19cc73ab15216
      history:  > ✅  > ❌  > ✅  
            
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69688a1eb2a19cc73ab12bf7
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: hp-14b-na0052xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696892d1b2a19cc73ab17d61
      history:  > ✅  > ❌  > ✅  
            
Hardware: hp-14-db0003na-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688ca8b2a19cc73ab13941
      history:  > ✅  > ❌  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688caab2a19cc73ab139ff
      history:  > ✅  > ❌  > ✅  
            
Hardware: hp-x360-14-G1-sona
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688e9fb2a19cc73ab14ab9
      history:  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6968950cb2a19cc73ab18c41
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688d38b2a19cc73ab14216
      history:  > ✅  > ❌  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69688ecfb2a19cc73ab14cc4
      history:  > ✅  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69689132b2a19cc73ab15db7
      history:  > ✅  > ❌  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696891d6b2a19cc73ab16c86
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: mt8192-asurada-spherion-r0
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69689071b2a19cc73ab15423
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab15838
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab15837
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab15888
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab15887
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab15885
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab15884
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab15808
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab157da
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab157d9
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab157d8
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab157d7
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:6968909eb2a19cc73ab157d6
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69689076b2a19cc73ab155b0
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: qemu
  > Config: defconfig+preempt_rt
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.cyclicdeadline
      last run: https://d.kernelci.org/test/maestro:696887b5b2a19cc73ab12ac5
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
      - rt-tests.cyclictest
      last run: https://d.kernelci.org/test/maestro:696887b9b2a19cc73ab12acb
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:696887bbb2a19cc73ab12ad2
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
      - rt-tests.pmqtest
      last run: https://d.kernelci.org/test/maestro:696887beb2a19cc73ab12ad8
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
      - rt-tests.ptsematest
      last run: https://d.kernelci.org/test/maestro:696887c1b2a19cc73ab12ade
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
      - rt-tests.signaltest
      last run: https://d.kernelci.org/test/maestro:696887cab2a19cc73ab12af3
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
      - rt-tests.sigwaittest
      last run: https://d.kernelci.org/test/maestro:696887ccb2a19cc73ab12af6
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
      - rt-tests.svsematest
      last run: https://d.kernelci.org/test/maestro:696887ceb2a19cc73ab12af9
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69689138b2a19cc73ab15e47
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696891dbb2a19cc73ab16df8
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69689349b2a19cc73ab183c9
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69688b29b2a19cc73ab12f4e
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69688c03b2a19cc73ab13340
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688c8db2a19cc73ab1377c
      history:  > ✅  > ❌  > ✅  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688d97b2a19cc73ab146ad
      history:  > ✅  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688cb6b2a19cc73ab13baf
      history:  > ✅  > ❌  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688ca6b2a19cc73ab13851
      history:  > ✅  > ❌  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688c52b2a19cc73ab13572
      history:  > ✅  > ❌  > ✅  
            
Hardware: acer-n20q11-r856ltn-p1s2-nissa
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688cdab2a19cc73ab13dc1
      history:  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5300-8145U-arcada
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688d1ab2a19cc73ab13ff2
      history:  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688ea3b2a19cc73ab14b3c
      history:  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69688ea5b2a19cc73ab14c57
      history:  > ✅  > ❌  > ✅  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6968930cb2a19cc73ab182ce
      history:  > ✅  > ❌  > ✅  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

