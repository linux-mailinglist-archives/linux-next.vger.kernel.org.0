Return-Path: <linux-next+bounces-9588-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBB7D00B35
	for <lists+linux-next@lfdr.de>; Thu, 08 Jan 2026 03:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C85E30581D5
	for <lists+linux-next@lfdr.de>; Thu,  8 Jan 2026 02:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697042DCBF3;
	Thu,  8 Jan 2026 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="swCOdQOm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B872DA756
	for <linux-next@vger.kernel.org>; Thu,  8 Jan 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767839417; cv=none; b=LWz4lFhUPkepvjaISP/GZxoHbHA9fjTpE3K+N2Y8wLAa3ixD44B5Fn8QPb+f/a/qaMB5EXixMtw33M/Ni9jQHBwngZb2d++223djBldgOZYZiPM6hQfj11KuKEAdhVOXnZCpuX5viBqS7qlr94bV+DvzEgp5NkZ5UGgJkj36+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767839417; c=relaxed/simple;
	bh=hF5OkL+3VFRKUwFg61IsglONCWVpGU5NBunhCEB2vwk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=qOxv4ij1Rb2v7/qJU2Yaq0srqHxoci4TN9XwAKOzYnJPLXZl0O463wGX1KpUFyeA7Dxg0azH9tP50DdNatCwNYRRgUQBtNA1pvoCCk4bAs/PLRp8uU9ecj96qlFZH7BWha1I5KjVQ7Z+9zhte7U/7kMyuAPkaMJ2Z9qE+SWM4Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=swCOdQOm; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b04fb5c7a7so2207194eec.1
        for <linux-next@vger.kernel.org>; Wed, 07 Jan 2026 18:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1767839411; x=1768444211; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Z8WU0GYImo2x9A3iO93f0ZWT4IrVffdUp6uOU4bi30=;
        b=swCOdQOm3r6DKPnSqEXPCaHdAjR/Bzjvw8JpLK5QGv2UtA3kFZqZUfM+FFy9Kfyk9a
         D4ULmsME5mqgCTpyylH3qj9BJHeywZfk16oly6fECB6OOlkb1OZUgWdXdtUB1PTyhvZ4
         w31z4dcW5ZD6JqFDiBqyOdR4ERCRTHO3bpUdS64nTDyn+XwyPSdk6yyW2q4bCTabykFT
         wNSjxYRBlSWU20ZfHbf/sJ81RjVt8bNvZVYeSiGPlm2qsVQz+7mKOuAQiqivp5pSCmS4
         5014t7bnmXLG32lYVSTxnZy9PwEjgkf86SMeiBx+Ru9xW/kWbtygw3zgaUd6J3ZqlgcP
         n94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767839411; x=1768444211;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Z8WU0GYImo2x9A3iO93f0ZWT4IrVffdUp6uOU4bi30=;
        b=dWHG6drUWa3u91gAzdHcnLmm4NHSm46HugmDH1/pjS1qY6Gql2xSNuIceqWS1FNcVc
         ABnnW5983/kzQSDsYll51jM3SspobAJIWznkUUC0Wbq+KcUPmOrnXw+KSCUoG6R7TfTL
         yAKe6MXSum+0esdgaWQzvU/Z0+y/uTe8e05nNZFFbZlMxMy8qjP7yVBm1ruTdP1UcvVX
         Wu2TLkW+ISMNSeq/Auod+jQy3TxQoM+2WA03R/du+SL0DYAnenmTXqijO+HRFhvtR8Oa
         NeFC7xX1gtvAGY72XjSRA8mVN8Rm1AtJZFmfoi3uz+L7YJCbimek6LF2nTerjOKai1hx
         SvRA==
X-Gm-Message-State: AOJu0YytjuLfpCa4cdqMD0YIrdOtnWq4yIeFzPBsc99eoUi0bYG8GtKE
	ePOzv22u53NKH68yifRLLmSJlUIPkBrCYxHr2VILgpPQOBcGSXxHdCU2oQPOpugJqOo=
X-Gm-Gg: AY/fxX5pKJQ2g6PsJPkNisVq5clVGru04w0YdreMQfqjDven5H3G1Sx9LT1ZyNpcRVm
	Hrx47TEH5fL+3rOXt7CUhiCWabwJ/t36x21g4235u4GkssoffoerWIi6Jv15rAMuC11P39gDZJ/
	3AwVmlKpoAD4/D+owsw5AESFpSUn4iCBjKuFaQDdpcZOnbzT8wMI0A1NFvJA7ew/nrpRL3cHhBX
	eNJPSHCvrX5/qtanbq1PF0og8kw0ToB/IdMGnRx4zkR57ti8ZoP4QyhWjX2J3pXO4jJGaoI3Kvq
	8cySXd/LcYjYqzafpF/vjYfj8mcJu1bD5lvxnCXKa4HZjVusxGMkg5AVrmL3/9wjTTfw7Bidp+/
	cRPMYFVvPcdaYxTqhJsVnlee9cpQHZD/zl1BPiZqxyQ/61of2gorUTKMPSMj/JndW2rh7k2P548
	JkZ5gY
X-Google-Smtp-Source: AGHT+IH6Ee1i59fEjlaeGicWLEu+FxbtU0dj2wqPu1JYe3cR2Vac1oIke3x3zktq9ArGNhjkS0qdBg==
X-Received: by 2002:a05:7301:248:b0:2b0:48f7:837d with SMTP id 5a478bee46e88-2b17d251cd8mr2200474eec.11.1767839411250;
        Wed, 07 Jan 2026 18:30:11 -0800 (PST)
Received: from 1c5061884604 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b2256sm7409078eec.25.2026.01.07.18.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 18:30:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 08 Jan 2026 02:30:10 -0000
Message-ID: <176783941012.294.14728875800583373714@1c5061884604>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
origin: maestro
test start time: 2026-01-07 07:20:47.512000+00:00

Builds:	   51 ✅    2 ❌    0 ⚠️
Boots: 	  129 ✅   26 ❌    0 ⚠️
Tests: 	18133 ✅ 1955 ❌ 5358 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:695e2430cbfd84c3cddef353
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:695e2cfccbfd84c3cddf3241
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_7e300000
      last run: https://d.kernelci.org/test/maestro:695e2cfccbfd84c3cddf3253
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:695e2cfccbfd84c3cddf3242
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000
      last run: https://d.kernelci.org/test/maestro:695e1f84cbfd84c3cddedfc3
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:695e1f84cbfd84c3cddedf80
      history:  > ✅  > ❌  > ❌  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000
      last run: https://d.kernelci.org/test/maestro:695e1af7cbfd84c3cddecc27
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:695e1af7cbfd84c3cddecbe1
      history:  > ✅  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f08000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddece1a
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f09000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddece19
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f0a000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddece18
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f23000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddece17
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f24000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddece15
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f25000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddece13
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddecdd2
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddecdd1
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddecdd0
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddecdcf
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddecdce
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddecdcd
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddecdcc
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddecd61
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddecd60
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddecd5f
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddecd5e
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:695e1b28cbfd84c3cddecd5d
      history:  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:695e23f5cbfd84c3cddef2d3
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:695e2508cbfd84c3cddefd58
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:695e1f84cbfd84c3cddedfe8
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:695e1f84cbfd84c3cddedfe5
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:695e1f84cbfd84c3cddedfdd
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:695e1f84cbfd84c3cddedfdc
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:695e1f84cbfd84c3cddedfc0
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:695e1f84cbfd84c3cddedfbf
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:695e1f84cbfd84c3cddedfbe
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:695e1f84cbfd84c3cddedfb3
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:695e1f84cbfd84c3cddedfb2
      history:  > ❌  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:695e12fecbfd84c3cdde8c84
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:695e14bdcbfd84c3cdde97ba
      history:  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:695e1302cbfd84c3cdde8ca3
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:695e1597cbfd84c3cddeacfb
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000_qca-wifi_1
      last run: https://d.kernelci.org/test/maestro:695e1f84cbfd84c3cddedfc2
      history:  > ✅  > ⚠️  > ⚠️  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000_bluetooth_2
      last run: https://d.kernelci.org/test/maestro:695e1af7cbfd84c3cddecc26
      history:  > ✅  > ⚠️  > ⚠️  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

