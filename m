Return-Path: <linux-next+bounces-9593-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBCED06DA7
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 03:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4A623007C6F
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 02:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156F91EF0B0;
	Fri,  9 Jan 2026 02:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Dc6tTti+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F2E33987
	for <linux-next@vger.kernel.org>; Fri,  9 Jan 2026 02:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767925859; cv=none; b=RsxTNJtgbbi/K7VURXkBGLPi/8qkGNex8akPWVwmTMbNIXpW9L0sdl1b5epag9Dgmc9e8HZrMmPQz3QW6NorfhpXKr1wbArczxZxnC6A0layRszmOTeeirkmq0jClXL3bFHPsnyY49WtOeiPjpiRWhCjksTYJ1w0Zq+eXQZ1exI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767925859; c=relaxed/simple;
	bh=UMpYpxm72OjSEA1VYpmrOJ3rroBizTMX0BZ1s9MkflQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=gTF5TIzXU4t2PAc9ZFHkpNHIVGfge9Uu/yXJSD0jz8GRNCupeotRK+xLa1rVrXvKVJROq8Dita6QxT1S7xDiud2hujPlsirZq7XEVj7Y16t8DI3zeeTnRgAbGyS29/RlmufSrAscZoAjHhB9sWaJE40p9xJqXI/ZLtBjLos1Cgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Dc6tTti+; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2b04fb5c7a7so3380226eec.1
        for <linux-next@vger.kernel.org>; Thu, 08 Jan 2026 18:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1767925856; x=1768530656; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgZCfQbl2LriQddkEh+SwPtQQVh351vWMWR2pfGx1GI=;
        b=Dc6tTti+a42Q5IEgxPHh1Hl9vyYbBpeRGvesMZQj9WSFktVleCmhcT2fCTbz7U4GQu
         EWQxJFBQdew7JkqqpHEFhwUIbULhs2BeErom+uNVQxzFhYY/SMwn0rabagYH6mZ+0axz
         RvamyZpdoJDf7aiNJiSDiLocbbwdpdYhAwa5dTtzF0PbnkdmsstZR1jXipOWWWId8mxE
         psZ8klO11V+gF5zeKKkmjAtZEUmP5Pcq7rfwztqkpPuAPfJZGd9mSM2KD4mRKV+Gd7LB
         stIH+pB99WWWO6ICDJoHFVU8WfPKZzo14jo8zEnyNC5GBgkl7OqLLvo2P4VEhXjsPMB4
         jhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767925856; x=1768530656;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgZCfQbl2LriQddkEh+SwPtQQVh351vWMWR2pfGx1GI=;
        b=CoHb9e1YaCWMwkEbaNFxTjx8KWMoB6ZaoE7e+X+0bLT3dSVN7fy6Gt9+H/EuNRA756
         SayFG/QmBndR8W5B9ypL+ckR1qBR+HFY9yYkPvnuEAGNTINajy8LVPizXSX/V48fPgbS
         AO6Orux+ooTdqhdVygOj1eBhxjX6BGCBQW+jO0kpjoCMyFJuoTmXyUlTprCkm6+5wV9S
         UjnlBaDsmqevKtbY6QTXqz7Kdcn8+NYBNRVROz9cZ0VDhW0L5wAG+LI3wR73tmYLWprA
         BSmb0s+/siVaXDxN3T+dWOhbHGc+ihk28OJkIwBSju2HTE51WqctRhwuk7GTU8a53oIi
         /y9w==
X-Gm-Message-State: AOJu0Yyd/h1DJnq/d/AKRxs3jRjjeCg7RaYqhX5lyZ334CItjyj/FgLs
	UBN2Msmy3TuSl22ejxWa70fOVyHUMjEh6kH9fMXQrh3vBWRNfccPHvwrz/mGpCsxd620SAXD9q1
	1Gf9/oV0=
X-Gm-Gg: AY/fxX58vZxdYj3R7eph5gVYFVzvDhprkLSETDAQ0pBuA4xLm4mLHhV1Lol1tD9qvth
	+FkYDEU3ui8LaPb96Yf/JWYCf5K7ZsZebI8cWsXfuKXlj+XFRsgCMHsNnOmqXVf17GVTSsi4n0l
	2I372Nma/3VIrfQUlFhoYcry0V6uBZrVeEm5CW/MLgf0Dp8NH7U3kGx2V0iYqulSQOBEdu5mN1q
	JDZWPA0sz/67IivMYHHuYElwAklapzWaNDIG+ce0b8KMJ/lqzaEVZFW0w/7S5hf4narbkZVj5Qv
	sRbKq0PafIUPzGCDkB/6ioPAHrqwYQL/psotqszcTjApcMXvSL7O59VKLnpnD1zKzuqQDp0usTN
	41z/JWzamxNQED3jjuvvxsuBnbqGmqxshG7HlXyjbMGz7s2rKOWUGywPmam/6dJpe+ygASdP9or
	d7kiv52qMAVFHVGag=
X-Google-Smtp-Source: AGHT+IE1AdvGV/Mul4OCEBl97ukKsSg2SQTpvUqE3C9w8YTKnYhu/U0ykIz3QHwCPE2P54v15D53vQ==
X-Received: by 2002:a05:693c:40d5:b0:2b0:514a:a8cf with SMTP id 5a478bee46e88-2b17d252222mr6801866eec.17.1767925856083;
        Thu, 08 Jan 2026 18:30:56 -0800 (PST)
Received: from 1c5061884604 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a55e2sm10228865eec.8.2026.01.08.18.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:30:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 09 Jan 2026 02:30:55 -0000
Message-ID: <176792585513.754.15221344256588607272@1c5061884604>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/fc4e91c639c0af93d63c3d5bc0ee45515dd7504a/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
origin: maestro
test start time: 2026-01-08 03:26:30.352000+00:00

Builds:	   52 ✅    2 ❌    0 ⚠️
Boots: 	  123 ✅   31 ❌    0 ⚠️
Tests: 	17367 ✅ 1769 ❌ 5069 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:695f2fb6cbfd84c3cde0029f
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:695f30dbcbfd84c3cde00b7b
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:695f2fa4cbfd84c3cde0025d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:695f3207cbfd84c3cde019eb
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:695f2fcdcbfd84c3cde002f5
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:695f4810cbfd84c3cde074f7
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_7e300000
      last run: https://d.kernelci.org/test/maestro:695f4810cbfd84c3cde07509
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:695f4810cbfd84c3cde074f8
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:695f2fa5cbfd84c3cde00263
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:695f3495cbfd84c3cde03c41
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_7e300000
      last run: https://d.kernelci.org/test/maestro:695f3677cbfd84c3cde048aa
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:695f3677cbfd84c3cde04894
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_mmc_fa20000
      last run: https://d.kernelci.org/test/maestro:695f3539cbfd84c3cde04131
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:695f3539cbfd84c3cde040ef
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:695f4179cbfd84c3cde05d21
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:695f4179cbfd84c3cde05d1e
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:695f4179cbfd84c3cde05d6b
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:695f4179cbfd84c3cde05d6a
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:695f4179cbfd84c3cde05d00
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:695f4179cbfd84c3cde05cff
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:695f4179cbfd84c3cde05cfe
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:695f4179cbfd84c3cde05cf3
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:695f4179cbfd84c3cde05cf2
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11e01000_rt1715_4e
      last run: https://d.kernelci.org/test/maestro:695f306ccbfd84c3cde003fd
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11d01000_pmic_34_tcpc
      last run: https://d.kernelci.org/test/maestro:695f307fcbfd84c3cde004fb
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:695f31dfcbfd84c3cde018b8
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:695f3303cbfd84c3cde02003
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:695f31e2cbfd84c3cde018d6
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:695f3424cbfd84c3cde038e1
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000
      last run: https://d.kernelci.org/test/maestro:695f4179cbfd84c3cde05d03
      history:  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000_qca-wifi_1
      last run: https://d.kernelci.org/test/maestro:695f4179cbfd84c3cde05d02
      history:  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:695f4179cbfd84c3cde05cca
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000
      last run: https://d.kernelci.org/test/maestro:695f416acbfd84c3cde05c7a
      history:  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000_bluetooth_2
      last run: https://d.kernelci.org/test/maestro:695f416acbfd84c3cde05c79
      history:  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:695f416acbfd84c3cde05bef
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f08000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde0661e
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f09000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde0661d
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f0a000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde0661c
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f23000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde0661b
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f24000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde0661a
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f25000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde06619
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde065f5
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde065f4
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde065f3
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde065f2
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde065f1
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde065f0
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde065ef
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde0658e
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde0658d
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde0658c
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde0658b
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:695f41e4cbfd84c3cde0658a
      history:  > ✅  > ✅  > ❌  > ✅  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

