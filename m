Return-Path: <linux-next+bounces-8628-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 88764BEDDDA
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 04:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 13D7134B30D
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 02:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816031E492A;
	Sun, 19 Oct 2025 02:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="S3bTjk+f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616751EB9F2
	for <linux-next@vger.kernel.org>; Sun, 19 Oct 2025 02:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760841050; cv=none; b=SVf6NSkXksL6gGQLbvrDYaEvmxU9LtKm6z+FZwvAXa3v0OTpfKajRImob//EBHF0qMUehHE8fqQUNBrz2IOJJ+Z3s0IFQtGYCxPLUwx72qajKJtbHyErwTpxd09NigqCFsGEbCPJi8fHKTM3C0RJXjC+GWkle8/6GYo2ToTmyl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760841050; c=relaxed/simple;
	bh=CDjZx4NB3judOJjcCz31yvQBZiYhQxRyJMfq0RSZ3pA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=IOobfBNqzssx/NaQVL1gzRqAkEp71GzzTiNcR1/mEtGGeupKlLcrgI959xSdmIlqMOSRZSL7+VlbOvjeEredINQj9ldidN0jXIf7HZ/lY6o0K9tnvJl/C6EgrGyPEXLNWbqGnyLdxZMj+6gTcZ4fYJPlibztywAcQ9Kawodt5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=S3bTjk+f; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27c369f8986so31653855ad.3
        for <linux-next@vger.kernel.org>; Sat, 18 Oct 2025 19:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1760841047; x=1761445847; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJt8jzLCOd1oZYh8kfLhqjaU0JdCtG1WMqml3ugb0IY=;
        b=S3bTjk+fvjaCnWGDGuWwS0ZafWKQAQ8mM4POMjcEIwbUpLM7gOZJRkjEvi4U7F9Ye1
         4TGljsqalWQ2VG2OKABbT1d1w1K7m+6/M2czLVYGroJnSiKtGfN1LTF1wJ1Is2L+m3n9
         12+FGApkPjjIrwJASg4+2hnui3A5DLFQCrVdp1x/VpuseU/H0ovtaioQhSqeO1Nn/X/Y
         tU6eVsTgs82+4LUTigXkJy5QLz4WOicOKdstH5HQMdxQeZ2a0WAY4VcwhpiVtQXmS5/+
         Batum5WIBEVpTR38SeKUNQUBC1uiYWsT+QheIU+lQtsFnJHIMSHZywJuEk7duTFHrM7V
         MrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760841047; x=1761445847;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jJt8jzLCOd1oZYh8kfLhqjaU0JdCtG1WMqml3ugb0IY=;
        b=l3cIT0Gm1JdGEI/oPMs+g0LkVoTPR4AQ6je3x1CeTRAR0rng6qpUOAKW7/4BRKthrk
         Bk46yBtH6r+OrbdQALm77Z658D0piR8Ue4sTdiZ48KAMDQT0HTFC/b7dicX0JF47Ydym
         636PJvaw9O/1GgTQP7foGYftO3ZEi/u++vh4ve56UV4eekJCQKDVE4Sxp39pjtwO9N6z
         IAkmJNKUJxk0kExzX/76tyvCcrJuMe3mQcKWt5217ovnr/9NCkfuBxQj0wcPBHjatVG1
         9YBdokq8qNuwPVNk/HAedfdsjGAVjviaEx43UC6RQZqlF2YtpQ25i5moj4WpVZARzav1
         SZgg==
X-Gm-Message-State: AOJu0Yz/wnD/YuHdHs6GroCEP44QMOc3EWYbTCyyCpFR33aZpHAPSQt5
	CUQH4luwmgI0N0wTEaLtiKNQFmJfcSm/g3AhfZ+XnLOx9TKX8ChoKdCEFvA2KcrW6D4QhisNnf3
	kV9wLq9c=
X-Gm-Gg: ASbGnctQaIRfWAHp46rsIkOwfycHBKMJsvXsofKWptrjB9adXlntqtxJ8niqvLx8yT5
	8UHuO9sg45FxF/z/nF5pB+cz3ZkH+kpf+Q68PR0g+F8UsS6GHC3xCZOIhAcvstMTF7o01pPb9F+
	x0JBdewfFFtuPlgagIv0ZP8pqskKjiYbSVNNfHxdd7oNZl/xObE93RaomooejxuHiSkFXnp9iW0
	BAppkc5IvysF/5MW5wfJWcuDrUNzlWh8xVWtFpaIXYIfSzjD2U4KdtDofT0U0QviTJ7zyrIa8bG
	S4mmkmdObpONE4Z1JHs0U8sfvID7SkhlT4KBL4TW42XlUpMW9nMT5yPZww+mK7LM4RuzULi//Ol
	bln72HsQSwbH6/WwiemVJwbk18V97UYgLNExX2s5KH9Z23GZPKEh8IPJc404B1b91qaxnRA==
X-Google-Smtp-Source: AGHT+IFuiBKwrx4kMrbPCctCrfZQKV7CwDOBu03mEsRBoLGFHhW+0g67GPqBVbieHugkdpIq4ix+uA==
X-Received: by 2002:a17:902:c943:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-290c9d1b907mr123031365ad.14.1760841046534;
        Sat, 18 Oct 2025 19:30:46 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29247219764sm39156275ad.117.2025.10.18.19.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 19:30:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 93f3bab4310d4ff73027cc4f87174284d4977acf
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 19 Oct 2025 02:30:45 -0000
Message-ID: <176084104536.3883.9644532227384545004@15dd6324cc71>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/93f3bab4310d4ff73027cc4f87174284d4977acf/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 93f3bab4310d4ff73027cc4f87174284d4977acf
origin: maestro
test start time: 2025-10-17 23:49:51.841000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  143 ✅    2 ❌    0 ⚠️
Tests: 	 4214 ✅  246 ❌ 1439 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_utimer-test_global_wrong_timers_test
      last run: https://d.kernelci.org/test/maestro:68f311785621556c1f210b40
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_display-subsystem
      last run: https://d.kernelci.org/test/maestro:68f314405621556c1f211acb
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_ldb
      last run: https://d.kernelci.org/test/maestro:68f314405621556c1f211ac9
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2000000_spba-bus_2000000_ssi_2028000
      last run: https://d.kernelci.org/test/maestro:68f3143f5621556c1f211aaa
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_audmux_21d8000
      last run: https://d.kernelci.org/test/maestro:68f3143f5621556c1f211aa3
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000
      last run: https://d.kernelci.org/test/maestro:68f3143f5621556c1f211aa2
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_1000
      last run: https://d.kernelci.org/test/maestro:68f3143f5621556c1f211aa1
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_2000
      last run: https://d.kernelci.org/test/maestro:68f3143f5621556c1f211aa0
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_130000
      last run: https://d.kernelci.org/test/maestro:68f3143f5621556c1f211a90
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_134000
      last run: https://d.kernelci.org/test/maestro:68f3143f5621556c1f211a8f
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdmi_120000
      last run: https://d.kernelci.org/test/maestro:68f3143f5621556c1f211a8e
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ipu_2400000
      last run: https://d.kernelci.org/test/maestro:68f3143f5621556c1f211a8c
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68f3143f5621556c1f211a89
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_utimer-test_global_wrong_timers_test
      last run: https://d.kernelci.org/test/maestro:68f3123a5621556c1f2110dc
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_display-subsystem
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211ed0
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_ldb
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211ece
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2000000_spba-bus_2000000_ssi_2028000
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211ead
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_audmux_21d8000
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211ea6
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211ea5
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_1000
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211ea4
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_2000
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211ea3
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_130000
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211e93
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_134000
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211e92
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_2204000
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211e91
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdmi_120000
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211e90
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ipu_2400000
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211e8e
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ipu_2800000
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211e8d
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211e89
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_audio-codec-bt-sco
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201eb
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_funnel
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201dd
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_hdmi-connector
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201dc
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_native-hdmi-connector
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201db
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30000000_snvs_30370000_snvs-powerkey
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201bc
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30000000_snvs_30370000_snvs-rtc-lp
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201bb
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30000000_tmu_30260000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201b6
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30400000_pwm_30660000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201b3
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30400000_pwm_30670000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201b2
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30400000_pwm_30690000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201b1
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201ab
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_2000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201aa
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_dma-controller_30bd0000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201a8
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_ethernet_30bf0000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201a5
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a40000_codec_1a
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f22019d
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_spba-bus_30800000_can_308c0000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220196
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_dma-controller_30e00000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f22018e
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_dma-controller_30e10000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f22018d
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_spba-bus_30c00000_audio-controller_30ca0000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f22018a
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_spba-bus_30c00000_easrc_30c90000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220189
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_spba-bus_30c00000_sai_30c20000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220188
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_spba-bus_30c00000_sai_30c30000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220187
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_display-bridge_32fc4000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220181
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_display-controller_32fc6000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f22017f
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_dsi_32e60000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f22017e
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_hdmi_32fd8000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f22017c
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_phy_32fdff00
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220179
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ddr-pmu_3d800000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220178
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_38000000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f22016f
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_38008000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f22016e
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_npu_38500000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220169
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220164
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb-phy_382f0040
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220166
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_38300000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220163
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_38310000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220162
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-bt-sco
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220161
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f22015e
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: juno-uboot
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_i2c_7ffa0000_hdmi-transmitter_70
      last run: https://d.kernelci.org/test/maestro:68f36c0e5621556c1f220a22
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_i2c_7ffa0000_hdmi-transmitter_71
      last run: https://d.kernelci.org/test/maestro:68f36c0e5621556c1f220a21
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_4000000_can_4e08000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea64
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_4000000_m4fss_5000000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea5f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_b00000_r5fss_78000000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea50
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_b00000_rtc_2b1f0000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea4e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_b00000_temperature-sensor_b00000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea4b
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_can_20701000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea49
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_crypto_40900000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea48
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20000000_adc_49
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea3a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20000000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea39
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20000000_rtc_32
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea37
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20000000_sensor_48
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea36
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20010000_eeprom_57
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea33
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20010000_sensor_4f
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea31
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_mailbox_29000000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea2a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_mmc_fa20000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea27
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea25
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_interrupt-controller_20000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea22
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_pru_34000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea21
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_pru_38000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea20
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pwm_23000000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea1f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pwm_23010000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea1e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_serial_2850000_bluetooth
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea1a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_spi_20110000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea19
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_spi_20110000_tpm_1
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea18
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_spinlock_2a000000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea17
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e000000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea09
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e010000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea08
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e020000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea07
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e030000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea06
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e0f0000
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21ea05
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:68f367835621556c1f21e9e8
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kernelci_sleep
      last run: https://d.kernelci.org/test/maestro:68f2e8d85621556c1f2066ee
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:68f364bd5621556c1f21e095
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:68f366a95621556c1f21e57b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: x86-openblocks-iot-vx2
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68f2e6df5621556c1f2051f1
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68f2e8e55621556c1f206703
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68f2e8e55621556c1f206704
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68f2e9875621556c1f206914
      history:  > ✅  > ✅  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68f2e3bb5621556c1f2047f1
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_usb_2184200_usb-port_1
      last run: https://d.kernelci.org/test/maestro:68f3143f5621556c1f211a95
      history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_usb_2184200_usb-port_1
      last run: https://d.kernelci.org/test/maestro:68f3156e5621556c1f211e98
      history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_ethernet_30bf0000_mdio_ethernet-phy_1
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f2201a3
      history:  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_etf_28c04000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220176
      history:  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_etr_28c06000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220171
      history:  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_28c03000
      last run: https://d.kernelci.org/test/maestro:68f369505621556c1f220170
      history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68f2e8e15621556c1f2066fb
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68f2e8e15621556c1f2066fc
      history:  > ❌  > ✅  > ❌  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68f2e97e5621556c1f2068df
      history:  > ✅  > ✅  > ⚠️  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68f2e9a85621556c1f206a19
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68f2e9a85621556c1f206a1a
      history:  > ✅  > ❌  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

