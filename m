Return-Path: <linux-next+bounces-9568-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D17CFBBFE
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 03:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72E753093B22
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 02:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB661E0E14;
	Wed,  7 Jan 2026 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Gl/05ZxA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861E51E5201
	for <linux-next@vger.kernel.org>; Wed,  7 Jan 2026 02:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767753011; cv=none; b=E0Bv6p8jQwcGb7RFREXDhbR0yvgCnKwyf7J2DnK+nfhnaBaxDm5Lvowx1+Ftl9ID39NcHyjl/EjH6IlSozOK/FPH95Us0nCmTK1tYn23kg7jDWtFLf8Ae0kwULufkrkwVRnXUp12EVt0TBNmVdMJjW3wy7zidd5+73y78Dl69As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767753011; c=relaxed/simple;
	bh=rEWFXTKoXlSluhC2b3MOqieyM7kMKCBuzuAgNenuvi4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=HhL49LGEFlPf0XqY4TL760fQHWWRo8l4iidDbOEQOWKhM0WG5UNVxPbf/QR9SlJrTJ3MUTVgWa16IUZ1WCMrPkHPPRaHj8ZBQAA1bB8x4B4eyf/0UPaM/HuVrAdoBvPVngtfxsXYS9RNZ2v+oBjecd0NYJwKGRnaZDZA6ywzyr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Gl/05ZxA; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2ae29ddaed9so163890eec.0
        for <linux-next@vger.kernel.org>; Tue, 06 Jan 2026 18:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1767753006; x=1768357806; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CadpWJ5RxdOaaMBm07QVLi8XIp/SKQ+egNPNTNlZumw=;
        b=Gl/05ZxApbMT9aBzUyX5J16Ndgreoh5wyP++ERYo6MjNe5BnRS/jCARfsfjwnbtr1O
         +ZdOqFI0bPmuOJPAd5fWxZ20dCMIWDGq/mVTPLTRMwemeLULNFB7k3rw3SVPJzsrn92Q
         cypLZnskkSBM1xVr2nr4D/+zcvNFDFsfcULuYPI4Yq3z5w4Q8jP/tB0Aar9bb3CTiMdw
         dnpqpJdBjvmWjCA+IpWGza5TcLnP5f0P17a4uR924xT7qKxaMPnHWSt6+rFIM1BeWG1h
         KFeUSHhZ5m/+ZyKsGCfgxWfHQP+pvk/MDxGo5n4sabZLbDVTa5j7zKVP9e22OvUpXLAp
         PSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767753006; x=1768357806;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CadpWJ5RxdOaaMBm07QVLi8XIp/SKQ+egNPNTNlZumw=;
        b=tnnpwZ4COyRHfGuxFhRgvdHzgw03WdmZthpt1kP9mohURcHfw2xWEv0LCJ8ePSdwyi
         maKy/0+GnQ7+Zr65DyweWuKScu/kiv8GXIHZMPRY266X56DeEJ669M8ZzVJF3cTP6K36
         sutP0ZfVhH+89vAaw+TZfqEVrXAEV3mfFZqLWnUywaftfkr0JyojNpxrrBa5Gl4o60Gz
         ZA81KwYPIV+W4PfooQlIMT9yxwVgbFP0nty2yjpeDFzR2Q6K+4QpKigOa2BM38uR3Ezt
         DTwcXI4kE3qXnm7vYdfKGTwO8npwuJGsqD/KcDv6LUCFCK2QJUoBBNiC0SKYlSMwG5R6
         0hLw==
X-Gm-Message-State: AOJu0YwG+KbGIQa2/MARQZpYrwEyYhoe0ndnIHmpj25yml/sdiBlPJZW
	rQAdAKEVw+g80dFfb5tC/8pTzwZijUksGwFZZlSv8Hr7ZOwVLcXwCiR7YjstxoZ90Vs=
X-Gm-Gg: AY/fxX7Sifcz2SdmzsGI3VEXZ7rShKNaOmpu/Ppc7BiDuiED+ZggCmtix5f96GjDc/d
	VoswLklyD8V5p+SndztMq06A4QGj7g26TdZr4lfP9dbr+1RNkZ2RznxiadfiO46d4/Ol9Jq8N/s
	4WIUyniuQkHuP83lAMe96nZzxx+bXvV5JDdJx8TF2QYT5dtf/v97ibqitCrfhtLoWQhTFzqirS1
	luqzIAHJGN0N6jS7FQtj6/2t168QxE5plYJCM7vVSb9AO2lbs1X2BwGfqHGeaF6Wmuv36ytR9Id
	t8bIFVwt39urZ3vJ0aCQMYLtaYXtYsUPXo2hDSpy8kGGGyNkh9hhsiBjI7ql1iT3nzasEv+VaZF
	fwslAsagvklEbQzZxhincxhRlTXLKA0UHQ4Y8nRo/XXWsP+l4ZDE4umijOSl2IWDTmOcWfgNWpn
	5L7nKl
X-Google-Smtp-Source: AGHT+IGGpUFUB87siCC2/6OYjwKT78Xueeeb25Q6NRKYtho6yfv+N6NBRGAdIE40HxH1ImcOd/dEAg==
X-Received: by 2002:a05:7300:d511:b0:2ae:5abb:ecb5 with SMTP id 5a478bee46e88-2b16fe7868dmr3166594eec.14.1767753006236;
        Tue, 06 Jan 2026 18:30:06 -0800 (PST)
Received: from 0dbd87e801fb ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a1383sm5499523eec.9.2026.01.06.18.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 18:30:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 07 Jan 2026 02:30:05 -0000
Message-ID: <176775300468.9466.14126958168909943159@0dbd87e801fb>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6cd6c12031130a349a098dbeb19d8c3070d2dfbe/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
origin: maestro
test start time: 2026-01-06 02:03:03.018000+00:00

Builds:	   52 ✅    2 ❌    0 ⚠️
Boots: 	  165 ✅    3 ❌    0 ⚠️
Tests: 	19274 ✅ 2071 ❌ 5166 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000
      last run: https://d.kernelci.org/test/maestro:695c82b7cbfd84c3cddbec84
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:695c82b7cbfd84c3cddbec40
      history:  > ✅  > ❌  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000
      last run: https://d.kernelci.org/test/maestro:695c82a0cbfd84c3cddbe9a7
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:695c82a0cbfd84c3cddbe92d
      history:  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:695c8b8fcbfd84c3cddc0813
      history:  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:695c8cfacbfd84c3cddc12cf
      history:  > ✅  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-timers-ramdisk.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:695c9373cbfd84c3cddc2c31
      history:  > ✅  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:695c810ecbfd84c3cddbd4a9
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:695c810ecbfd84c3cddbd4aa
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:695c82b7cbfd84c3cddbeca9
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:695c82b7cbfd84c3cddbeca6
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:695c82b7cbfd84c3cddbec9e
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:695c82b7cbfd84c3cddbec9d
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:695c82b7cbfd84c3cddbec81
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:695c82b7cbfd84c3cddbec80
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:695c82b7cbfd84c3cddbec7f
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:695c82b7cbfd84c3cddbec74
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:695c82b7cbfd84c3cddbec73
      history:  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:695c7f56cbfd84c3cddbc77c
      history:  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:695c80a7cbfd84c3cddbcdd0
      history:  > ❌  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:695c7f59cbfd84c3cddbc797
      history:  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:695c81cccbfd84c3cddbe365
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:695c8b96cbfd84c3cddc0858
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:695d4f5ccbfd84c3cddce544
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_7e300000
      last run: https://d.kernelci.org/test/maestro:695d4f5ccbfd84c3cddce556
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:695d4f5ccbfd84c3cddce545
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000_qca-wifi_1
      last run: https://d.kernelci.org/test/maestro:695c82b7cbfd84c3cddbec83
      history:  > ✅  > ⚠️  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000_bluetooth_2
      last run: https://d.kernelci.org/test/maestro:695c82a0cbfd84c3cddbe9a5
      history:  > ✅  > ⚠️  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

