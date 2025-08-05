Return-Path: <linux-next+bounces-7849-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA87BB1ABDC
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 02:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F1EE7A3DCB
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 00:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC30DDA9;
	Tue,  5 Aug 2025 00:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="KUquafEV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DAD1401B
	for <linux-next@vger.kernel.org>; Tue,  5 Aug 2025 00:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754355304; cv=none; b=VwF7xO6B26PGszabl7xtsUR+ScQwDF65I4OuDRUIHWDEew1MbFOKsoFIYs2TWbjbU6HcIhsb7BgtlRLLxzlsgLAC9st6k5KdSbfm73gruEIHXQrPq0eqC3yqhzteSa1L5MnEy5kiTS6LTlPJf3S3m3tC7Hq7jJob04n7Zjyzp6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754355304; c=relaxed/simple;
	bh=Ep8Wg2RpVtzK60eLPDWUZWfWsG/AE1vLI69yP3ipsq4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=XiFT+HNs8V4Pq79hpea6DZZAY+7AWH7FGM/v0B1wbyQKWZberrDbRxmft/M22I5Uddlt+UvLVQu3oDn4EL7Gl9YLnryKcGa2KmXCjI9LXyPKkDEM6i6oBhQEeDJazowCAWpWMNPVkhtJluX0qy1idbjLnSau9vfYY982QW+cOaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=KUquafEV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-240418cbb8bso33125765ad.2
        for <linux-next@vger.kernel.org>; Mon, 04 Aug 2025 17:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1754355302; x=1754960102; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep8Wg2RpVtzK60eLPDWUZWfWsG/AE1vLI69yP3ipsq4=;
        b=KUquafEVxJqHqVmhj8WHDlbnh5Bsy6NTmiY8WhPS80R708pT6xSrrIAD+ukh006tfu
         S2LDMo69bxS3/FCy/p+6W0QabLYui75NkpSbyGVXaIQnwR9NBYUaUoVrTF5bjPRweKNB
         yjbe3xiE1JJC/dT71tNX6ovkTOxrykjMa6nBBsX3BKUfAuETAZfQVnE7aAGxuQz21cWG
         s/f20u4F2tE7jmK3Rq8Jdsymmw+xhj4PDjpA+7qAsFNKWcY9eCl+ewWAXbVnbcEcLBbw
         C5vuM/jHdb6FXrWx8Ognez6kuL5rIkl3r3tQulUIm2yDxGXntzLJF2NStsaj6EL68NWs
         ZHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754355302; x=1754960102;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ep8Wg2RpVtzK60eLPDWUZWfWsG/AE1vLI69yP3ipsq4=;
        b=rijspJUAGdxWWJGLxHW1SmP3+vLc6ZRfCF4QM87ct8278ok8VVNOxB/3fuqtWOXNeQ
         nrIshyAVUH2CZKqX2LXO9ybU0V4ujeI/S9NR39H2GzstbZQFdhdfydtmeaH8QKsC5JoM
         x7XPDm+s6FVwgPPZBG8EEp7N5Ie7X4XJFosw/NEF/+CewQ7DTuEPZmarGi/1wdRxXFIj
         YjuYrWfANWg6DNj7JvUADmA81bpe+wLG0cezAg6CvjUqp2s7swvymXfgSi4yTl/4hy/h
         ufEJgmCGUY39iLeqdH5mpOLXzb+jSCPwbKP7CT5q85oRJ1ojgNTl14eAd/YkagDtwDyi
         6P1w==
X-Forwarded-Encrypted: i=1; AJvYcCWY/uKDecfJfGAbsSmGFkq8+Af4G9UlZNDVnMxHKuCrKHLkMCp7bzfLAMdUfb74zZ9ANypV8V21HaQV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2xdEqYmamqD4WVD2gdHAM4S0vkX+sab5olQqyan5XPkA0RtPE
	LNAMkIMF7RcNl4WWFdCktIwOhXf+ove4n7lROjfC4soE4gFI9iLDvnln3dL7zbfGsfw=
X-Gm-Gg: ASbGnctlhwfjgimzNdHlUrYoFKMUAaYlvETchEv1lCrgC4Ogzw7sntOUk02bqnxIkqH
	gkQjVGOANcUVZQ4oKIaSJ6j1MOQF3OlgQw0/nLpKfUZLI4y9G9eDXf7glifVkEkJtE8VE22DUOJ
	alPLRTB4NTvsLjlUEAjKResX8jbLp3hIIYOc0HT6AlFz30PN18s9PlrcjSDCIT6pFsNFO9eA0qm
	2ubuFNYf3IkHtZMYYSFQna3zYTzyZlbmwXICjX+Pr5KqtdEhEXrAC/2AjnSqBuMy3+vT5hf8yrx
	TH8lf5sAZxY2bjljqWCcRyzPU6qyQeJ68K1UHkiNXDknc87ziI490MDixNaFTMcvIW3hFI1jN1+
	picRRlShVvvn7pg==
X-Google-Smtp-Source: AGHT+IEOXv3zQ7vDD77EhyzwwJOSkCK59DkO6CkOqqFbehVZYQHfegDIuuUSIhmcFimS4SMW0HI7Zw==
X-Received: by 2002:a17:902:dacf:b0:240:49d1:6347 with SMTP id d9443c01a7336-24246ffbf2cmr147190985ad.35.1754355302315;
        Mon, 04 Aug 2025 17:55:02 -0700 (PDT)
Received: from poutine ([2804:1b3:a701:ff56:648c:a86e:fc5f:581e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976cbdsm120412375ad.75.2025.08.04.17.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 17:55:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [TEST REGRESSION] next/master:
 kselftest.dt.dt_test_unprobed_devices_sh_soc_video-decoder_16000000_video-codec_16025000
 on mt8186-corsola-steelix-sku131072
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 05 Aug 2025 00:55:00 -0000
Message-ID: <175435529841.940562.17094645738857201320@poutine>




Hello,

New test failure found on next/master:

kselftest.dt.dt_test_unprobed_devices_sh_soc_video-decoder_16000000_video-codec_16025000 running on mt8186-corsola-steelix-sku131072

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit HEAD: 5c5a10f0be967a8950a2309ea965bae54251b50e
tags: next-20250804

test id: maestro:689042d7236da8c8a0d7149e
status: FAIL
start time: 2025-08-04 05:19:19.165000+00:00
log: https://files.kernelci.org/kselftest-dt-68903fbb236da8c8a0d6f6db/log.txt.gz

# Test details:
- test path: kselftest.dt.dt_test_unprobed_devices_sh_soc_video-decoder_16000000_video-codec_16025000
- platform: mt8186-corsola-steelix-sku131072
- compatibles: google,steelix-sku131072 | google,steelix
- config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
- architecture: arm64
- compiler: gcc-12

Dashboard: https://d.kernelci.org/t/maestro:689042d7236da8c8a0d7149e


Log excerpt:
=====================================================
IGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_100 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_200 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_300 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_400 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_500 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_600 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_700 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_idle-states_cpu-off-b RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_idle-states_cpu-off-l RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_idle-states_cpu-retention-b RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_idle-states_cpu-retention-l RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_l2-cache0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_l2-cache1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_l3-cache RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_dmic-codec RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_firmware_chromeos RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_firmware_coreboot RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_fixed-factor-clock-13m RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_gpio-keys RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_lpddr-channel0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_lpddr-channel0_rank_0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_lpddr-channel0_rank_1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_lpddr-channel1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_lpddr-channel1_rank_0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_lpddr-channel1_rank_1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_opp-table-cci RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_opp-table-cluster0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_opp-table-cluster1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_opp-table-gpu RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_oscillator-26m RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_oscillator-32k RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_pmu-a55 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_pmu-a76 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_psci RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp1000-edpbrdg RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp1800-dpbrdg-dx RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp1800-edpbrdg-dx RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp3300-disp-x RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp3300-edp-dx RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp3300-ldo-z5 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp3300-s3 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp3300-z2 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp4200-z2 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp5000-z2 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-ppvar-sys RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-usb-p1-vbus RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_reserved-memory_audio-dma-pool RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_reserved-memory_memory_50000000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_reserved-memory_memory_60000000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_reserved-memory_memory_61000000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_reserved-memory_ramoops RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_aal_1400c000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_adc_11001000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_adsp_10680000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_audio-controller_11210000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_ccorr_1400b000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_11017000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_13000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_14020000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_15020000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_15820000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_1602f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_17000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_1a000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_1a04f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_1a06f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_1b000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_1c000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_color_14009000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_dither_1400f000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_dsi-phy_11cc0000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_dsi_14013000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_efuse_11cb0000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_gamma_1400d000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_gpu_13040000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11007000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11007000_anx7625_58 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11007000_anx7625_58_aux-bus_panel RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11008000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11008000_touchscreen_5d RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11009000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11009000_trackpad_15 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_1100f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_1100f000_dp-bridge_5c RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11016000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11016000_codec_1a RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_interrupt-controller_c000000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_iommu_14016000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_jpeg-encoder_17030000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mailbox_1022c000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mailbox_10686100 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mailbox_10687100 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mmc_11230000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mmc_11240000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mmc_11240000_bluetooth_2 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mutex_14001000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_ovl_14005000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_ovl_14006000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pinctrl_10005000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_postmask_1400e000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pwm_1100e000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pwrap_1000d000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pwrap_1000d000_pmic RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pwrap_1000d000_pmic_audio-codec RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pwrap_1000d000_pmic_regulators RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pwrap_1000d000_pmic_rtc RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_rdma_14007000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_rdma_1401f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_scp_10500000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_scp_10500000_cros-ec-rpmsg RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_serial_11002000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_14002000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_14003000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_14004000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_14023000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1502e000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1582e000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1602e000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_17010000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1a001000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1a002000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1a00f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1a010000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1b002000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1c00f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1c10f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11000000_flash_0 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_extcon0 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_i2c-tunnel RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_i2c-tunnel_sbs-battery_b RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_keyboard-controller RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_typec RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_typec_connector_0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_typec_connector_1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11012000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11012000_tpm_0 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_svs_1100bc00 RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_10000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_10001000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_10003000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_10006000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_10006000_power-controller RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_1000c000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_14000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_c53a000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_t-phy_11c80000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_t-phy_11ca0000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_thermal-sensor_1100b000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_timer_10017000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_usb_11201000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_usb_11201000_usb_11200000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_usb_11281000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_usb_11281000_usb_11280000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_video-decoder_16000000 RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_video-decoder_16000000_video-codec_16025000 RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_video-encoder_17020000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_watchdog_10007000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_sound RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_speaker-codec RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_timer RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_wifi-pwrseq RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_wifi-wakeup RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh RESULT=fail>
+ set +x
<LAVA_SIGNAL_ENDRUN 1_kselftest-dt 19410038_1.1.3.5>
<LAVA_TEST_RUNNER EXIT>
/ #

=====================================================


#kernelci test maestro:689042d7236da8c8a0d7149e

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

