Return-Path: <linux-next+bounces-9379-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A0DCAEBCB
	for <lists+linux-next@lfdr.de>; Tue, 09 Dec 2025 03:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A107630022A7
	for <lists+linux-next@lfdr.de>; Tue,  9 Dec 2025 02:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31E6301465;
	Tue,  9 Dec 2025 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="XohJDqsl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16862236F0
	for <linux-next@vger.kernel.org>; Tue,  9 Dec 2025 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765247412; cv=none; b=o/HLl15D/LPRet8TnMOqCSwEkcysXLLHREaq8OoTjc3jklRhPGn96fsdRScEWqWqV4W+OCF2JB6ySN+f5p+RM2+wPkdQHa5Op7bfB9IocK6GLYfX1p6gHcNv41l+K1IcH05AypLqxN0Nq71BaQawFClT6LxZVph67DptrOMIZvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765247412; c=relaxed/simple;
	bh=XHwioasBPxtu9P05vjZ6r+C3DBbyd8PFv5153mB2pMI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=UZuMtxBK3nQJQeQUpI4ZftUs49dEK4zE+ihMoZoTX51j7+pRAm23fdtfPtqk0Io31/NiTgfo2uo+LTRlrL1dBFY0mro/Yp0+8m04wTD6WMukdzadu0DTqhDwqILubOPA1tVXts3aRVo1YhYvJvP5IvP0FALSchYo1je//0u4Vkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=XohJDqsl; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c03eb31db80so733087a12.2
        for <linux-next@vger.kernel.org>; Mon, 08 Dec 2025 18:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765247410; x=1765852210; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNgyIS16h5bh+WIHKhZQqLzGoEwLfh4tXdLn0xKKUxI=;
        b=XohJDqsl+keqk7Key/vnmpHcFXthxxIxBH80wben/C+1bPvgEP/fcd1ecBcefXpk+0
         LX6ax/RxEPO9zlpPj53hFA+ra8qhs0ji69LaYTlPHuIapeFh72vCJocVesNPvd9YcoQl
         O72MwhRlHCghcBxXwO14W07apYkfpNUvXP8geLtMCXWqp566xSe0Azm4bngdpDJMs9Op
         WuqQsykzNtVB77+18ijKLNdyeSWg/7ezKvOjdMbWcxpXVvp/1Gj8JlNCHoE2XPDUWjPQ
         Q3PstGb6JhNQawfj0zVkXVanNbFF/V4q3+Y1Q5bDXWV6auPlU6COeJykdPwVH1CCztVD
         tlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765247410; x=1765852210;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNgyIS16h5bh+WIHKhZQqLzGoEwLfh4tXdLn0xKKUxI=;
        b=qbm0qkoAsQjwxtM3jnh/IC4/yux5pwi3S33x8VITW/2SWcaU4uPA3ODsr19/pTB+Ss
         fnUpjq3zr848Nph3OhGZiG0H8UXISousXC5K8KUs4yxFEcSqUp1k1goTsbQuomb4eW/g
         i1M0fYSv5GbiJycDGn8CSbBfJsXbwfU+z1O6msq5PbDEiAXqrmG0D/gQ5GCuBgol7Nbe
         qz01ZlmB8fpHwyG+TQ/Ch005hKEAp4hIqVOgG45PW8LEOCOUD3gl17Hnv9BwEzmskWGK
         /TxC1l5UKYlgrL8oDQfouBmUjSofWgkMoAL/e2RFohDb7feNtYGu/NZRPwRIb91g2T//
         rD/w==
X-Gm-Message-State: AOJu0YyKx3vtPtRMhzBRYPDBJDbGF8Hl8gX+cIqVsz3aXxT/mMJ8aA0y
	+Vn25G/krrsnF6l+VVWNV2Q0LfZ3XDShvxQAJ7/I+8elz4zM2POxRu5Qi9aJgOks47ywsMo+MPH
	SjZ6l3mg=
X-Gm-Gg: ASbGncuLy2Dlebo8boj0U/pvHi27rIjHYHl+eEYHqHn7UufYZYr3LOyTxfnMtx43rFd
	r4E+bEXaMrZkwAHEajF0O3Z4aIx09pXTQMMxqqG9jKQEBjSqnDaasIRiLTVsdsjQJnfHEVzhKdy
	pFv/ziPQ7/nLTASAJVUrOCHpVLMZnrbA9gb9srq0v4Y5q5MYMgIPxvWxza/GiO4EWQJC5oI2uWL
	G3SmadtmLd57O/ZwwWlB1usP71Z0aw4hwNTecwUQpJ1TR60nxR/mtUm3RXKryoWf5c03cJzfgFp
	32PjBAy6A56hWI8iNDvnZjJiDnJFd+KN5kiknirbdZ6yNFEB8z8zsEjrbrWqiejyHhSNzMcMjM7
	zTKtkUqCtawSWCrDg5S9oMKlkyEjy7wmaeGpij4r0mN0WmGfLWrpRWoTsRTr1OYACXBk19gANO4
	AFCiZd
X-Google-Smtp-Source: AGHT+IFk3ei7W65UmFvhmKPSZpOIWDaFcCSUrB+IIUk7n16ddyh0QfHHbvUxYxbmI/EiP7qNNgx7xQ==
X-Received: by 2002:a05:7022:61a5:b0:11b:d561:bc10 with SMTP id a92af1059eb24-11e032d7171mr7338456c88.41.1765247409828;
        Mon, 08 Dec 2025 18:30:09 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7552defsm64344525c88.2.2025.12.08.18.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 18:30:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 82bcd04d124a4d84580ea4a8ba6b120db5f512e7
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 09 Dec 2025 02:30:09 -0000
Message-ID: <176524740883.6537.14584074880665617438@1ece3ece63ba>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/82bcd04d124a4d84580ea4a8ba6b120db5f512e7/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 82bcd04d124a4d84580ea4a8ba6b120db5f512e7
origin: maestro
test start time: 2025-12-08 02:19:50.322000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  155 ✅    3 ❌    0 ⚠️
Tests: 	14607 ✅ 1171 ❌ 6158 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:69366a6e1ca5bf9d0fda13c7
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:69363f181ca5bf9d0fd97046
      history:  > ❌  > ❌  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:69363f4f1ca5bf9d0fd97111
      history:  > ❌  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:6936678a1ca5bf9d0fda118d
      history:  > ❌  > ❌  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693642201ca5bf9d0fd9786a
      history:  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693642b71ca5bf9d0fd97a8c
      history:  > ❌  > ❌  > ✅  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-proc-ramdisk.proc_read
      last run: https://d.kernelci.org/test/maestro:69364b101ca5bf9d0fd9b819
      history:  > ❌  > ✅  > ✅  
            
      - kselftest-timers-ramdisk.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:69364d0e1ca5bf9d0fd9cfee
      history:  > ❌  > ❌  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_svs_1100bc00
      last run: https://d.kernelci.org/test/maestro:6936493f1ca5bf9d0fd9abda
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6936452b1ca5bf9d0fd981b3
      history:  > ❌  > ✅  > ❌  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:69363e001ca5bf9d0fd96baf
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:693645301ca5bf9d0fd981f0
      history:  > ❌  > ✅  > ❌  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

