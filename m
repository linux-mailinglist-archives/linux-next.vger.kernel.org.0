Return-Path: <linux-next+bounces-9424-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01177CC09B5
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 03:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA6D8301CC58
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 02:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE0325776;
	Tue, 16 Dec 2025 02:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dy2aa0gm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B4C2E8881
	for <linux-next@vger.kernel.org>; Tue, 16 Dec 2025 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765852214; cv=none; b=CbvKXcVE3FPWXTg3MIeAyMYyGOSsDrP0ZOviQgAUCmJMZ+Y9DJSnNBzCBmRUAz+b10YsMZrjoAhvYxT9/QycthHhOfWVnVX6dtyjf0XXoOkC+WAbHTDGl6s5kCCXpOvDazGhW5tyl5SfG65o0o3kp817yKr4M4rHBU5gObMpJaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765852214; c=relaxed/simple;
	bh=QyTq6B02wGljvFOv6qZDGtnGtBuGe4oqyyL1Yfx3dTs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=XyOT2bjWF+GJvUXfBlsVe4gd9pZOsaZ0lZMbTD0m2B2orW0pNMQzSxbPTQAqh3312A4738VRGGVtD0ex80l1WRNIecOuYn8xiceqGU4U2Na/0DsQWWXflAivNvFEONkjLgFt0aS6SD7hdS0sXws2tw8OTwBzuhGYyZc+zysDO6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dy2aa0gm; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so4308915b3a.2
        for <linux-next@vger.kernel.org>; Mon, 15 Dec 2025 18:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765852211; x=1766457011; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcCFPRP2GnPfIY8sfh/mk2GNeSP0+wGOG5+5K7emqzk=;
        b=dy2aa0gml4jVftSD69vm1vR1xiMICzRm3/0UqOYorQCdISsdJe/yaZltztGIk+Zte2
         zTO05dKB0Ighuj+7WHyRrl1xyKVMA0LzQgPcC1RrFmT+v5ijszCTwsyqttNYTDsH/RUz
         J0aku8qAX9xTTIfmYHNP9+a7OuZu71NGUVC2EVX/bOOw0g3XO4tSjUxEdepp4XOUcgOf
         mcBJfRt4vBg1/BZsMMIO+DAvGuaGO/XNC5DjOckC3N5LyAU8ldY2r7ACWieoSXFE0WQg
         I4jxob8KvmlxEeuq/5MhhwQcOJ5znX+8pvb3wAFSmfCm2LNmQYvE58mUcV2OH2HKULJe
         +usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765852211; x=1766457011;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HcCFPRP2GnPfIY8sfh/mk2GNeSP0+wGOG5+5K7emqzk=;
        b=ci/l2LMipMjLYYC9K/USPD+Id7K+TYicjogMLYIgbgKCdOA0bJWbbXmQQ9h6Cp2R3L
         sp+bp9+4wDolPgxySU5QOepYEUkjbsrRMhqtpswLRtt4gadzme72fDTizo0U+7H8pOwN
         07qNbWQvQQB24bndZl0W63/4TH+1lHrOJ7wv8U2Yr7Ni6cYohZL+AaMwc7o3/NL020qR
         WZmVfr7XijcGS4MMiRlH3BTFZ83eo2FqB/yH8FrfVylbfeGDjnO1w0/BLZHXUC7pJ3bY
         XKRvc6xbtwchGjuo21Fn61GndoDLyRidtv3Ol7/BQ3En3xR1+hxnpOFoqasd2kKeuy7C
         L6wQ==
X-Gm-Message-State: AOJu0YwBua6cJ/Ps8FVy0lB4+0QL52bZ/zTW2dPQvbx4tpB4lqJ+hNSY
	r5fQz94UextlQbqNEXWuTjaKPZKar1YixYeBnfdqBxEfsRw36Vc2HmoQrQ2lQ/ReORCQtAnnXUB
	WER8NEZ8=
X-Gm-Gg: AY/fxX6uWjbwnmvz/kd4UTHDXGLXpeGtz7WE7BldkB5zvHs1nmo2WlDfySN1c7NANYo
	eOmJTNsKahwf/8smpqFHrxNjnceNShnVryWSEghjf0JDUWhCl6Q2mZJ5R188vK/LdRMO4/lPJs7
	CqRKmzJ+/tjxPlTdS+Vi4ZEX0atDxZ12vlEUOtGpzTqZIBM6QsDccEf/whmVA6gGi9nj8DHt2xk
	08KqNBGDVS4QqrERqescqSMZ9oZmS7NnvnY0OuGOrkI7HGBCQIna7R1297TnzAWXEGSeLM2zrfX
	4m0MPnru0a8AGN7MJiBQWp/q523mRdKPMI1BotqWCxEh/4f8jw/63pEp5iNA/CUevitNnqegCey
	3VrxtEZPox6GWe7n4YEKV+5iRxEFTYFDVO0++J8csdwmeSJehSUVCEipE4anUlBG4w7e2f/NoHA
	6FSZ2k
X-Google-Smtp-Source: AGHT+IEXhOmNSW7Ayk+T6Q4OgUfeg0JZ0A2fOZK3SAcxAMHsP+QSjiMekTBVSYamLaPaSR23KsEFDQ==
X-Received: by 2002:a05:7022:a87:b0:11e:3e9:3e8b with SMTP id a92af1059eb24-11f354f5679mr10727346c88.50.1765852211294;
        Mon, 15 Dec 2025 18:30:11 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b46f5sm48746437c88.5.2025.12.15.18.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 18:30:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 4a5663c04bb679631985a15efab774da58c37815
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 16 Dec 2025 02:30:10 -0000
Message-ID: <176585221006.2602.7390933256054506004@77bfb67944a2>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/4a5663c04bb679631985a15efab774da58c37815/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 4a5663c04bb679631985a15efab774da58c37815
origin: maestro
test start time: 2025-12-15 03:23:32.479000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  154 ✅    3 ❌    0 ⚠️
Tests: 	12111 ✅  765 ❌ 4042 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:693f8dd0cbfd84c3cdb979f4
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:693f8942cbfd84c3cdb95b1c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:693f8aaccbfd84c3cdb96413
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-timers-ramdisk.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:693f9d76cbfd84c3cdb98b29
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:693f8488cbfd84c3cdb93d9a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6940764bcbfd84c3cdba1c87
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6q-sabrelite
  > Config: multi_v7_defconfig+preempt_rt
    - Architecture/compiler: arm/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693f86f6cbfd84c3cdb95384
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693f8e25cbfd84c3cdb97ab6
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:693f894dcbfd84c3cdb95bad
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:693f8941cbfd84c3cdb95aef
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:693f8485cbfd84c3cdb93d7f
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:693f858dcbfd84c3cdb94219
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

