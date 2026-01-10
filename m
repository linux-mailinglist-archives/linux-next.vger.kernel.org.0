Return-Path: <linux-next+bounces-9608-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D951D0CD7F
	for <lists+linux-next@lfdr.de>; Sat, 10 Jan 2026 03:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7FED030092AB
	for <lists+linux-next@lfdr.de>; Sat, 10 Jan 2026 02:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543541C3C08;
	Sat, 10 Jan 2026 02:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="PR/ckLhM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A11817B50A
	for <linux-next@vger.kernel.org>; Sat, 10 Jan 2026 02:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768012285; cv=none; b=ew5H0UfR0PJ+SG0wT1GIsZKCoIpQMuebDS7ZRnzSLsWcXJUvb4sri4cw1hvju79VWhvxuIkEXnkKv/4rOG4I+aZyFNQidnO+W+dMzecZORji+AT6dbhyV3OA22EYRBuF1jHePbNeaixf4fXLoDU3X/HAXfed39pNrLJyHkOZxJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768012285; c=relaxed/simple;
	bh=VF/jPjc+09efTlcHyg5FqxSRDVmY1Sz+h+nMwLgb9fI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=hNhMcrF1rg6ZtxbRxcMNsIhnsEIj+To2hwOi8yLysmQArm+wkmzC9lR4Ay5P1H75oBAjVhaxcq5Xh3Xjlrgh0qTSdh2wh9qzsoy6GfckiAbEukw5SGgoYRTZCRagzJhV4jEIrc13oSfjXYGbVjjRwNbNCgTTS3x04mmii1uQjQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=PR/ckLhM; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so11470487eec.0
        for <linux-next@vger.kernel.org>; Fri, 09 Jan 2026 18:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1768012282; x=1768617082; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esK8M2HWgJvBnKJTJUwUWEQwzA4o1sfgjBJmOxOL5rQ=;
        b=PR/ckLhMJidYU1sCvhs3cgrFLRZxDwJE8PBqo8yozPBXh7qbzXyuOdoX/PUBPRUX0l
         814qtkwJS3q+NvuuPoF9zV8UpDAe4hfeEv1U5QGYZz2d0RHtLvOfd80ZJZz0nbqDnAEA
         F+B0uVWYmCc77VjUc2fQZVwGxAd6qPNgXCRlEMSdRJDfrYAXKNNWyQt+/2fH5C7+eDTw
         /ITXxXlMbIEyLjIHP810WXIX636Tg/TZDN2gHfEDCIsU/U8aGs4kscemW3tucGpOcSQ6
         iXhd+zyqr5RZLx4czZ2hbTRm2bQqzy0EvVqRwrQ0Kxcj8Tmszy+DjhX0B7UplAbzZxtw
         QYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768012282; x=1768617082;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=esK8M2HWgJvBnKJTJUwUWEQwzA4o1sfgjBJmOxOL5rQ=;
        b=vbiTGOUU2VVBhsPS/RMc00tlSDXOsIHwljO9tfizRadDMQpWOv6jJPo3znp/INmhsz
         4BURTW3Lu6oZEwlMKVWQVqROuVWilBcmVXCivz7ICk1F68FMBXEsiT3kMpYrW2DhfJDK
         fTth5nbH3yyuu7oIzoX8/LgJEuoDGclz3QLwCVOWwCXx2sZZ4ph2IuImSHV11aOv0QDM
         h+QqRco92N6d3vlDvl5/1pHuXgz1kw74C0oMpH1gDNHeUg0ZYmJ0DxJF9cXfwlN8+SeW
         cAQMSrFhR+G+RT/rq6ge45GAs0fdTLjB9UlyczjRcXGi4wetYsLTHUBinfO2OwmAB65I
         1Amw==
X-Gm-Message-State: AOJu0YwDM5jQ5LMqLSEdetGgexqUORwpMRcthq8yt09W5wQ2mDCsjOfc
	lW021865fmw+xrE7f5qln84w+H+SZflqc3ajcH3v2PYYOZ9pBomJWJEXSoiTGsK6eMWt1s7Z66v
	b6bUFK0E=
X-Gm-Gg: AY/fxX4m2tGR9C+4iEQlp8yqKex0LC+drOL7q6/3YPi6zwvjI802shCED3WJtG6JXPp
	JOC7saC11i/oIq/kkl+o0kXeL6X6aqruj8k3NX6MNK4jmooiZ8q+VLH8PoEBIoIvQQwNrVmcJT9
	jTYlvAq5znmPHCPzc18dPj4biUo88tbhyZtF0GTpgb6Rbm0CJrRsnmZX7ZCuMOVZM7HwCeLI2vk
	69n+MR/Lu7AFQ60wP5t80v+zWAVRM6mSmkEWAQKbVUqxN1HpKareUL65kld002Zgn5LRmPvpUmY
	EURvgiUKcEV5tIe77nau/26SgEe2IcU0P+cIYvMYyX7o6eDh/uznH2ojhpGWNMC/y70twYOdVbz
	6dAkF6y4/nomuJsfRvs0BKec44qXVNMJm9B7Q8a/QW/3wV5ILygiMm9BjlimiO+zbLfn4n7djrm
	rHo1zZ
X-Google-Smtp-Source: AGHT+IETi2wlDfbBoA9qGyIbPX+wnjyg9pXaEoMKOY1JKvXiDfAFq4sfiTFRSvcNaZjtK+rceDMuKQ==
X-Received: by 2002:a05:7301:fa6:b0:2a4:6bb6:c84a with SMTP id 5a478bee46e88-2b17d2344b9mr7929804eec.6.1768012281948;
        Fri, 09 Jan 2026 18:31:21 -0800 (PST)
Received: from 1c5061884604 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm12470376eec.2.2026.01.09.18.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 18:31:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 10 Jan 2026 02:31:21 -0000
Message-ID: <176801228083.1215.14395372319158233877@1c5061884604>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/f417b7ffcbef7d76b0d8860518f50dae0e7e5eda/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
origin: maestro
test start time: 2026-01-09 04:33:21.639000+00:00

Builds:	   52 ✅    2 ❌    0 ⚠️
Boots: 	  142 ✅   16 ❌    0 ⚠️
Tests: 	17572 ✅ 1903 ❌ 4295 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_leds
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde5012f
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-cam1
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde5012c
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-sd-io-1v8
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde5012b
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-sd-vcc
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde5012a
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdmi_7ef00700
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde5011a
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdmi_7ef05700
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde50119
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hvs_7e400000
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde50118
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mailbox_7e00b840
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde50110
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_serial_7e201000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde50105
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_watchdog_7e100000
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde50100
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69609ca9cbfd84c3cde39371
      history:  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6960a06bcbfd84c3cde3a98c
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6960a1d0cbfd84c3cde3b6d1
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-timers-ramdisk.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6960ab4acbfd84c3cde3e666
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6960a065cbfd84c3cde3a959
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_mmc_fa20000
      last run: https://d.kernelci.org/test/maestro:6960a34dcbfd84c3cde3c8c0
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:6960a34dcbfd84c3cde3c880
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69609affcbfd84c3cde3878a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69609b78cbfd84c3cde389db
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:69609c56cbfd84c3cde38ebd
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:69609c56cbfd84c3cde38eba
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:69609c56cbfd84c3cde38eb2
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69609c56cbfd84c3cde38eb1
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:69609c56cbfd84c3cde38e9e
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:69609c56cbfd84c3cde38e9d
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:69609c56cbfd84c3cde38e9c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:69609c56cbfd84c3cde38e91
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:69609c56cbfd84c3cde38e90
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11e01000_rt1715_4e
      last run: https://d.kernelci.org/test/maestro:6960a1b2cbfd84c3cde3b0fb
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11d01000_pmic_34_tcpc
      last run: https://d.kernelci.org/test/maestro:6960a1b4cbfd84c3cde3b5de
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:696093eecbfd84c3cde36101
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:696092cecbfd84c3cde357c5
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6960a292cbfd84c3cde3bf2a
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:6960926fcbfd84c3cde35028
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6960a071cbfd84c3cde3a9d1
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde500fd
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_7e300000
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde5010e
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_7e980000
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde50101
      history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:6960d6e4cbfd84c3cde500fe
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69609294cbfd84c3cde3524f
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000
      last run: https://d.kernelci.org/test/maestro:69609c56cbfd84c3cde38ea1
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000_qca-wifi_1
      last run: https://d.kernelci.org/test/maestro:69609c56cbfd84c3cde38ea0
      history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:69609c55cbfd84c3cde38e5e
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000
      last run: https://d.kernelci.org/test/maestro:69609c4fcbfd84c3cde38ddd
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000_bluetooth_2
      last run: https://d.kernelci.org/test/maestro:69609c4fcbfd84c3cde38ddc
      history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:69609c4fcbfd84c3cde38d9c
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f08000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde397f0
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f09000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde397ef
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f0a000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde397ee
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f23000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde397ed
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f24000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde397ec
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f25000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde397eb
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde3974c
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde3974b
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde3974a
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde39749
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde39748
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde39747
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde39746
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde396f7
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde396f6
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde396f5
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde396f4
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:69609ceccbfd84c3cde396f3
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: qemu
  > Config: defconfig+preempt_rt
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.cyclicdeadline
      last run: https://d.kernelci.org/test/maestro:6960919ecbfd84c3cde34c7f
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.cyclictest
      last run: https://d.kernelci.org/test/maestro:69609199cbfd84c3cde34c66
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:6960919acbfd84c3cde34c72
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.pmqtest
      last run: https://d.kernelci.org/test/maestro:6960919dcbfd84c3cde34c78
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.ptsematest
      last run: https://d.kernelci.org/test/maestro:6960919acbfd84c3cde34c6c
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.signaltest
      last run: https://d.kernelci.org/test/maestro:69609226cbfd84c3cde34f73
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.sigwaittest
      last run: https://d.kernelci.org/test/maestro:69609204cbfd84c3cde34ecb
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.svsematest
      last run: https://d.kernelci.org/test/maestro:696091e5cbfd84c3cde34d2e
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:696092c6cbfd84c3cde3549d
      history:  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6960a1c5cbfd84c3cde3b6bf
      history:  > ✅  > ❌  > ✅  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

