Return-Path: <linux-next+bounces-9125-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B644CC77021
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 03:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E0E54E666A
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 02:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629CD246BC5;
	Fri, 21 Nov 2025 02:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Xqh0PIWx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8B21D88D7
	for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763692234; cv=none; b=L8kyElVNzINUlEv4odDfgojkYi943nfpI5KB9pUaGA7A2dC8wAHoayT7iJ1JMKOM5SDJVSTJsA7GtzRoC0vUctsIghKE6rq7DKJURHUvttQxEhu5JiaYVm9mq8etOIjs0W1KPjQkIfgyLS2OGp3i6Sf23l3z0maFHPeiKmGGej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763692234; c=relaxed/simple;
	bh=CYtB/d5tfywkRLTFzUzYN2lln9/H1L/eZ/fv9yU4BaE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Zx+rX3ZMz+49zyEBpjqpyuYf65yQG0G2Tolr14OrmJYF2zhn4UNoGtEov8oR5imUc9hxOMhSndTWX+5Ix3OdtamubNTYeUg3DPYzdyJra2SOs25J7YtnrhjO/aj5/EG42R58jr7pBD6Kv0NjqzBAm4QNgk4EpXh/vCNiWrGjL5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Xqh0PIWx; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so1900288b3a.0
        for <linux-next@vger.kernel.org>; Thu, 20 Nov 2025 18:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1763692231; x=1764297031; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbvsXp/APaOYgeVlf4X7QQ+UGcQBZ4gUuZc4xc2xeOo=;
        b=Xqh0PIWx5rnqXqRFA2zWCyd732nydGMbJBskLJb6oMjA3d6c2hPdbGemg8vx2bkA0O
         79dkz9qMjsfvEi+DPaK35Jv8qjJzi/4YOXs8JdPW8eAd//1tDFDPXBO9ZI5acwjnHqM3
         lhcrtpP8EErL/+8JFRaNvWelc7r6V4FlmBdf8t3zCI2qK4RRc/3FH3MJL/t2RJt2TY38
         H9H6riJjeNLcaawCjkivoAOfZmddDo6XsNpuh8yF3xLIMEuybuWow1d4NiDzS4cOQyLi
         zRpwwZYFUWuCvYpEJThHxgJAcbIbhUrBIc/mNp5DKYpNHO+uI4oEaj8DG9YMHX/bO2+P
         nhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763692231; x=1764297031;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kbvsXp/APaOYgeVlf4X7QQ+UGcQBZ4gUuZc4xc2xeOo=;
        b=oYU7XoX6MfGabiAxFMeaoQVfHgEl6cjhVY4w6tE2L4nGuqLg+3zBXzAsNz/Gdf7g2V
         a3z8onlrCNSbIYgv55FT/V2FdvgbRHbTHzfMLwd8lUBegyHD31bmT9nEqvB4nAA7cKXi
         geunM1Soj0o13/bHFwAA4L4XhZoEh3jq58iqmDLCrpKU4BALY+i9goYc2olEXIaJaiNN
         Rsf/KErt2Ym0ZZ8pqFBtUOiUmcAFfkGm6RzfLuf2p0sBO9gHURhe6/7h5QMCQ9+VNy9d
         fUTamfbcz9tg3GxDcoNzVt4PPKxzR6yWLWUB4Ozzh+u2FT6zOYoaUgzf9Qs/hVRCAivf
         5RTg==
X-Gm-Message-State: AOJu0Yx6V3bmlQAC0PLkyoew5UN1Ho9MKAnTe9y+7wWGWRVA2j8w0VIu
	8i+7VQTKwA4scYPxNOmLA4X15WidXH995vXIhUgje7bK75eaPpia+7Llgw0ptdgKYfjF/YrVy4a
	VElku
X-Gm-Gg: ASbGnct5dOXDE21kiVwlrPYYdaVMQoUlQ0C/Y9mEfuYcqKgaQ4ukK3NdgvEdu7uDhIm
	2QMlLcPMic/PF+qjpdHUJVtK+Y/DJnjtd9OBjNFhwWYWgLm3H5KKyJFKyuXEhDOwEJBt7+OatPH
	3gfarVZx0MnAcKCPBzInDNoTTRddsSXBr77mlh0ATsAGsoRYIcerxQ76qgQo/dVDc6VJTadYKQS
	Vik2YCVKbpDtECcEv4Kpo+7VP4Algu56GVKtqAFf6RjjXG5K1X8neRqnSh7BtfLnsB3ee7zwIm4
	ZgwFyEbPBuCQgCGX/+yVEHSCjv43YC+ZC7WwJIYgDmglcmzCLxQXbsjRWrBmqbEkvKa7hYzuMPn
	tc3v0vZVARTbbhtu8BPF/6iK/a8x4xwnw37XmHfoYLk0RJ+04nuBX8fJ8eaBwQ8knk9lzN9OsjL
	4SZD4WqjDza4uRWmY=
X-Google-Smtp-Source: AGHT+IF52i4mwOCfxLVhVsFbndL3WFrqw/uLfzZNREqiucwFq2qQWwhqIEllNEdXX12qHXb1W5uduw==
X-Received: by 2002:a05:7022:458e:b0:119:e56b:9589 with SMTP id a92af1059eb24-11c9d714dc3mr236032c88.14.1763692230816;
        Thu, 20 Nov 2025 18:30:30 -0800 (PST)
Received: from f771fd7c9232 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e6dbc8sm16705989c88.10.2025.11.20.18.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 18:30:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 21 Nov 2025 02:30:30 -0000
Message-ID: <176369222971.3541.638582172517847462@f771fd7c9232>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
origin: maestro
test start time: 2025-11-20 09:23:53.566000+00:00

Builds:	   41 ✅    7 ❌    0 ⚠️
Boots: 	  138 ✅    3 ❌    0 ⚠️
Tests: 	12215 ✅ 5584 ❌ 5377 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:691ef6392fd2377ea9adbae6
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691ef5542fd2377ea9adb8c8
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:691eedf52fd2377ea9ad4792
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:691eeb0d2fd2377ea9ad3c38
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:691eeccc2fd2377ea9ad4386
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:691eee412fd2377ea9ad503f
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:691ef16d2fd2377ea9ad91f2
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691eef342fd2377ea9ad56e4
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691ef3c12fd2377ea9adb395
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691eef342fd2377ea9ad56e7
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691ef34a2fd2377ea9adaf92
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691eef352fd2377ea9ad56ed
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691ef1842fd2377ea9ad95ad
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:691ef0c12fd2377ea9ad7014
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:691ef1d62fd2377ea9ad9b22
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691ef5542fd2377ea9adb8c9
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:691ef6832fd2377ea9adbbe3
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh
      last run: https://d.kernelci.org/test/maestro:691ef6832fd2377ea9adbbe4
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_futex_numa_mpol
      last run: https://d.kernelci.org/test/maestro:691ef6832fd2377ea9adbbe5
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qemu
  > Config: defconfig+preempt_rt
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:691ee5d32fd2377ea9ad2df1
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.rtla-timerlat
      last run: https://d.kernelci.org/test/maestro:691ee5d22fd2377ea9ad2deb
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:691ee5d42fd2377ea9ad2df7
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.signaltest
      last run: https://d.kernelci.org/test/maestro:691ee7e32fd2377ea9ad34d9
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691eef382fd2377ea9ad5702
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691ef34b2fd2377ea9adaf9c
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:691eeeb72fd2377ea9ad52c4
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691ef0462fd2377ea9ad6015
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 7 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

