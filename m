Return-Path: <linux-next+bounces-9455-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4315DCCA164
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 03:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D959B304EF67
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 02:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D88F2FD1BF;
	Thu, 18 Dec 2025 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="vPbzJMKF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F7D2D47FF
	for <linux-next@vger.kernel.org>; Thu, 18 Dec 2025 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766025015; cv=none; b=osDz+78KxAts0z7CeHLyURh/aqMyL4+ANjEoD5uR/y5AnTo79+Yde/v9lZXi62KaWDXrX9L+9hXrW5Uz95H3UpPC6VvP8pD6t30yHn2VZt0VkG2OPBCvWkmpP7J/k99cl9JOQheohh626uVad0ODtt/laKJ4rHKqsEXcj69+/P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766025015; c=relaxed/simple;
	bh=uDcz3JwEsl1ahZ2isAEuyB0PZ9cijBsMpMyEWqkn+5A=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=eBALHSORA1lj5g6c5snhiGOrq0Zo1PIPY0mZixp1c8k43DUds6VosNm2Yi/0po1geSkH5YdmWESc0qe3mCTfe9yC+VSX7QdTsiDES31alWSGypnCjcKKx8gjUgVIgP3LH75iEXoizrAG6tTqdcTzfy3XM24OdqjZXMO4c5GELTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=vPbzJMKF; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso100349a12.1
        for <linux-next@vger.kernel.org>; Wed, 17 Dec 2025 18:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1766025012; x=1766629812; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zZFlIT/8B5n0RGd+kHjphPTdHbxqlUuuXXzUsbpf+M=;
        b=vPbzJMKFMDlVGLZIL9aWBAN70k1JgoZ89a9vZq0oBt6WL3+Mrl02uYhh2M2eg2t+Tw
         8HBscpjP4oJJUxCTApQBYFIZzzbodbidfCWvrG4eQeAumRZo6EkFGKC9Lvwk8c+VZI1Y
         yXv94IHJJgnuoewt1MnL8ioHKj+MkRv6MmQz1fpJYATAxRaSHpR72JrkHm+BUiUTtW5S
         IhmnIYYthkkWtJipqO0X9GezYQ2Xuv8jvleVWCYylUv6q2oVn+PgBOBkVHOrnI5OaQef
         5sSsnEtoWglNw4ELD40P3+AeoHWd75X9iILMw7ckM+Pf2vBIbqUxK4KirsYjQu0WkN9S
         SF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766025012; x=1766629812;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9zZFlIT/8B5n0RGd+kHjphPTdHbxqlUuuXXzUsbpf+M=;
        b=qCWsnKrzf0nagsmUIHO+P1k3gkx5/EJB1C+WNxV9tInvyV+iUJCGxYLG3ATA6QSYlp
         AkeTQgE3wWe5F/o5lMrn7qpuNvdgwm6f7vgYt9QVInSA+lPKvC2jC8gT89VfWO66PjoM
         NssuD/N1mLNTXc59QFTC1NViUHR82OndMGYLXqazvbnRYagLWrGKS4Vm78NC2gm1Z49B
         j19OhRzUa4cDz/Y+ncjuQ4K5HaUqiCOV0ayDOoPxPTCIWeY4T9BH6Ad1h1FZvcSOFFG6
         ntSxlOYf8oFubiACLYVCVqA3c/TkSEOS4CAvwKZnlS4qjeL/DqGd7Zx++hazr7Ugoqtp
         ZRBA==
X-Gm-Message-State: AOJu0Yy1iIBt36SWLLJYGMu1EGXADv2khnpjvgX+EVM/eltOfPf9KxTr
	eEeqpmV8t7ndPPN4U2UYt/qUkLCJqONaPwtXqLqQirB78JIsqNTKqrOpY7lHhqz3Qew=
X-Gm-Gg: AY/fxX4imj910bwOVZgQXPhBUgN9OzXZb7grkeLnuIFIxdrQDpg+f3WHDqTdL7Bc3hB
	QpUUboOkk389D28oVEpwBYfqovnMP4nqciJZz+YvmmWv7GIeDkWTtIz8t584AaDUnYnov0ofVZf
	cYruQbLwNUKFZZUpfU6Fgnv3o9RxONZ4go45pOA7IXPbXhhN5vpqYRtR6Vw63IbatV5L1EQE2MC
	TugvtvJa5Au+PrJQpinx0ICtfgLdte2CvaNnUG+uZOMuXRuSS2x6oY3BdAqov9kOPszymWEgq8C
	O0uLdm+LIarNusphoekYjtBZVunsr2q/6AjUN1455mpvyqlG9gUQWKq5dYOIwZZY76tNse/3w9S
	kIHngMkyCjnGOvb4Ix5lK+xTUkm6P2l5S/LirJv9M8Knjjz20KAnEGOJUWL7bjinLvnE1q4EoRa
	cwb/1E9iiyiGfl2Zs=
X-Google-Smtp-Source: AGHT+IEkvNpRiwfSM1Iro+xe1nfWfayw/myyGTH7Cf1AYFFdoiU+qwSL4xgRMR2laD0bY/YsnFWwvg==
X-Received: by 2002:a05:7300:4309:b0:2ac:2dfd:9ff with SMTP id 5a478bee46e88-2ac303f731emr19143918eec.41.1766025012298;
        Wed, 17 Dec 2025 18:30:12 -0800 (PST)
Received: from 0dbd87e801fb ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e5c2be8sm1256137eec.8.2025.12.17.18.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 18:30:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 12b95d29eb979e5c4f4f31bb05817bc935c52050
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 18 Dec 2025 02:30:11 -0000
Message-ID: <176602501095.246.7507683878921083649@0dbd87e801fb>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/12b95d29eb979e5c4f4f31bb05817bc935c52050/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 12b95d29eb979e5c4f4f31bb05817bc935c52050
origin: maestro
test start time: 2025-12-17 03:53:35.952000+00:00

Builds:	   49 ✅    5 ❌    0 ⚠️
Boots: 	  164 ✅    2 ❌    0 ⚠️
Tests: 	18023 ✅ 2142 ❌ 4763 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:69429cbfcbfd84c3cdbee901
      history:  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:694233a2cbfd84c3cdbdd0d2
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:694233b0cbfd84c3cdbdd170
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69422ec6cbfd84c3cdbdb34e
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69423040cbfd84c3cdbdbd1e
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6942339dcbfd84c3cdbdd0a8
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:69424f8dcbfd84c3cdbe6393
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:69424f8dcbfd84c3cdbe63e7
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:69424f8dcbfd84c3cdbe638c
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:694237facbfd84c3cdbdef08
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:694233aacbfd84c3cdbdd129
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:69423514cbfd84c3cdbddae0
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:69429fb5cbfd84c3cdbeea88
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69422ec9cbfd84c3cdbdb369
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6942305dcbfd84c3cdbdbe9f
      history:  > ✅  > ❌  > ✅  > ✅  
            

### NEW BUILD ISSUES
- Issue: maestro:c537d0d22aa608b88bb407d6e02b6a733d3f78cf | version: 1
  Build: maestro:69422a08cbfd84c3cdbdaa9d
  Comment:  initialization of ‘int (*)(void *)’ from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types] in drivers/irqchip/irq-riscv-aplic-main.o (drivers/irqchip/irq-riscv-aplic-main.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-12-17 04:02:52.935277+00:00
  Culprit: code
- Issue: maestro:c537d0d22aa608b88bb407d6e02b6a733d3f78cf | version: 1
  Build: maestro:69422a0bcbfd84c3cdbdaaa0
  Comment:  initialization of ‘int (*)(void *)’ from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types] in drivers/irqchip/irq-riscv-aplic-main.o (drivers/irqchip/irq-riscv-aplic-main.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-12-17 04:02:52.935277+00:00
  Culprit: code
- Issue: maestro:ed08c10e7ce8b2654d125d029bb2aac6dc72096d | version: 1
  Build: maestro:694229a2cbfd84c3cdbdaa14
  Comment:  initialization of ‘int (*)(void *)’ from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types] in drivers/irqchip/irq-riscv-aplic-main.o (drivers/irqchip/irq-riscv-aplic-main.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-12-17 04:00:16.748622+00:00
  Culprit: code
- Issue: maestro:ed08c10e7ce8b2654d125d029bb2aac6dc72096d | version: 1
  Build: maestro:69422a08cbfd84c3cdbdaa9d
  Comment:  initialization of ‘int (*)(void *)’ from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types] in drivers/irqchip/irq-riscv-aplic-main.o (drivers/irqchip/irq-riscv-aplic-main.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-12-17 04:00:16.748622+00:00
  Culprit: code
- Issue: maestro:ed08c10e7ce8b2654d125d029bb2aac6dc72096d | version: 1
  Build: maestro:69422a0bcbfd84c3cdbdaaa0
  Comment:  initialization of ‘int (*)(void *)’ from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types] in drivers/irqchip/irq-riscv-aplic-main.o (drivers/irqchip/irq-riscv-aplic-main.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-12-17 04:00:16.748622+00:00
  Culprit: code


This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

