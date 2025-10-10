Return-Path: <linux-next+bounces-8581-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A12BCB6D9
	for <lists+linux-next@lfdr.de>; Fri, 10 Oct 2025 04:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50DB03A7BA8
	for <lists+linux-next@lfdr.de>; Fri, 10 Oct 2025 02:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADCD1DF742;
	Fri, 10 Oct 2025 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="scA85VCW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD5E78F5D
	for <linux-next@vger.kernel.org>; Fri, 10 Oct 2025 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760063417; cv=none; b=aaclmvxRliAl89ZjEPhquFK9IG+m8wUf3Eae5Hj3AfmR7hQ8K8eE8Fiur4zb33iRKE/GNP3Ocp5X68nK6OqDSYHik2M0l4lUvoQNpyQPfPAshtrChzHmys51/7e6RXaIGq/ExYb0ahvFAmMpzPFAPW2KTRPeY6+pesD+YCXy718=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760063417; c=relaxed/simple;
	bh=HnkvvR46ur/0P9ZXbeg0H8AK6lGyuaWrReEBMy4mQOE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Bi80UMXs2ptV7IEwkVhqFQhWBkaQXL0tj2c8yUxLglCUwwt1gmiYSqju2/fSEL47iQhbqTjuDHmGbM1aa5uSH5gcV5w0jo4Ss5F7LeaPK+jSxYEsxdsDbIxhTAnVwnh/k+AyuhVkP+tY5GKYfFgUoF20SlTu/y2x84Ss9TK+/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=scA85VCW; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-78af9ebe337so1235704b3a.1
        for <linux-next@vger.kernel.org>; Thu, 09 Oct 2025 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1760063414; x=1760668214; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJzR5bo7Pt1r3GPQd9NSrMPUa5ayljw6pp5t4vQptSI=;
        b=scA85VCWctY/8mYTBKgXsv+mLclHonbhnwJAf56EtCYWiPWb5VmyyhnqaHixUcVbbH
         xxXHgVRrHK9FzSud/ExEnew7XM4O0X/Ez6TbgdxlsjVOc1yquEU+XCSUhp4U5XuHLlNT
         2GUNo4oPWGd8pcufMclOQx7g8arC9NGhS31WsR6FLdEp9rh2CItPVJMnuLt1oeVpO53b
         J469oL3qeMBjOpKXycOmWDXuXc1VbwPWakd6MamBVopnUYc6kTB/PXGjzgcDlNeQWSST
         Ie9krt27dkNwzovFT3L2n3ccEjgONx9iOlVVwoZMRHCMhXLI9Nr8ur4VTaqKpw9+FLLr
         hHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760063414; x=1760668214;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jJzR5bo7Pt1r3GPQd9NSrMPUa5ayljw6pp5t4vQptSI=;
        b=XIW4maIc++RRr5HMFbbFweoMWqmEW/7vEncmYUWnfc8WtCPzgWqgi4ToSajP1Dtzob
         dj+7Wv2ovnS2RX91crbFmqbhfNijaRJzO1VdOWyNFMjTgqzlpQhoPmslP3Gy1ViBgd4M
         E5heb6816RMoGm+TiaDAQRXtMtUwi8vYDh7F0NERZSOdgGPqTEoDDZVOBkngOiI4pHiW
         TDfb5X8oD1ahpHTFDFifhn4cDfDlBozVDcOzTlALpN6L2qBnEiBsDoqBTf2HrzaXWxET
         3LeJSWhIVl5fS763WZiQcGG8QcXVMiLf16lXNVYt6SMCbWGcV91P/0af9Z4w1vzZv2Zh
         ZLjA==
X-Gm-Message-State: AOJu0Yy39mKJwfKtUF35ZQpwkWBR1Vf5T6b5evtLB0GhRTv3YsGmWbaJ
	Xhy31+iqebPEXJ0XWnO24G/SKQaWBVWNQnnP9XbfKN/yUNrDAHCmtg8C1VgkKPG+FX9Od8s0AhF
	SnUT4Kq8=
X-Gm-Gg: ASbGncuW9OWXsdQIXK1Q3ILe7F0Ld4HJDOqGRjKyQu2dKDfCHP04dQQ6gYOKQT26Y9O
	GsvH3e84i+ToZ24I7MR9LFpxap7l8/GGh23Wl80+pj6LVn/MPbMzaeWSLqxvK9neMyYMdj8jnZK
	pi4kjQn2QmxNvrIGUPFIBx85Sybq0oLRvhfa3STAuRF7TegtfjoAzvcKsEXLqfVL5YWnc/xQYZb
	r5DetTXKR0c6XpzViDHSMdP4xyESpI22DUihef0X6NjYHBrPsUQK4HB2p3nwGl3wKeHIczLAO60
	mMvTUx/XKZGMVRuULnS911HZnCBmqnaqre46gDqhX3ib9nEkqzEbc4kV7KMDA0IqLgi6BDk6wng
	W2zSZYH7qOVspKQvaMhadhfn5NyX622XC6Uk=
X-Google-Smtp-Source: AGHT+IE9dIZpVydlkGCiMVBT4SaxE2Pyg75XrWMHsRX3yszGrbdu4YmLgcqAmwTl80TC7VMKBRS0UQ==
X-Received: by 2002:a05:6a00:178e:b0:782:ec0f:d271 with SMTP id d2e1a72fcca58-79385ce0c44mr11878692b3a.8.1760063414320;
        Thu, 09 Oct 2025 19:30:14 -0700 (PDT)
Received: from d76c3c94e839 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2774sm1137639b3a.63.2025.10.09.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:30:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 0b2f041c47acb45db82b4e847af6e17eb66cd32d
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 10 Oct 2025 02:30:13 -0000
Message-ID: <176006341280.2043.4890831644700268654@d76c3c94e839>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/0b2f041c47acb45db82b4e847af6e17eb66cd32d/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 0b2f041c47acb45db82b4e847af6e17eb66cd32d
origin: maestro
test start time: 2025-10-09 12:12:32.949000+00:00

Builds:	   60 ✅    0 ❌    0 ⚠️
Boots: 	  171 ✅    9 ❌    4 ⚠️
Tests: 	12582 ✅  553 ❌ 4173 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68e7b19d9512ca52745a4310
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:68e7ad709512ca52745a3c25
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_23
      last run: https://d.kernelci.org/test/maestro:68e7ad709512ca52745a3c7f
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_24
      last run: https://d.kernelci.org/test/maestro:68e7ad709512ca52745a3c86
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68e7b1a39512ca52745a4322
      history:  > ✅  > ❌  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:68e7b52f9512ca52745a6401
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-12
      - fluster.debian.v4l2.gstreamer_h264.JVT-AVC_V1-GStreamer-H-264-V4L2-Gst1-0.SVA_BA1_B
      last run: https://d.kernelci.org/test/maestro:68e7b2b49512ca52745a4821
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_12
      last run: https://d.kernelci.org/test/maestro:68e7ad709512ca52745a3c33
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:68e7b1c49512ca52745a43dd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68e7b05a9512ca52745a3eca
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68e7b05b9512ca52745a3ed0
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68e7abbf9512ca52745a35d0
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:68e7b52f9512ca52745a63fe
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68e7b1419512ca52745a41e1
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68e7b4239512ca52745a5572
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:68e7b1c29512ca52745a43d4
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.ipc
      last run: https://d.kernelci.org/test/maestro:68e7b52d9512ca52745a63e8
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68e7b5409512ca52745a647c
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68e7b6479512ca52745a65f6
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68e7b6479512ca52745a65f7
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

