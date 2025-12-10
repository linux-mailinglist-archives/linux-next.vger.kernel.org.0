Return-Path: <linux-next+bounces-9383-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFC6CB1B71
	for <lists+linux-next@lfdr.de>; Wed, 10 Dec 2025 03:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBFA03011FB3
	for <lists+linux-next@lfdr.de>; Wed, 10 Dec 2025 02:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528EB18DB35;
	Wed, 10 Dec 2025 02:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="oXYMxVkt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88012686A0
	for <linux-next@vger.kernel.org>; Wed, 10 Dec 2025 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765333825; cv=none; b=hgloF8CKOoTdE5FKIwg++RfKwc49ODUHlXaSGB2PDZ3VONrja5QiTvkWEPuZnAU3fRJvU5kxeguB9JQgDhxPHwHk10SShTdmCdHsHzgVZYbHJb4ZssjPuVGM++a1w9EzOEx1ICvdM3qxwksSkqJMn4tY99bnBxF2O39ygW1OU3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765333825; c=relaxed/simple;
	bh=D0cev3mH+EZYbXfI3ldK3r2n9Gs5FX4IE3aYnlyNjNc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=MYaRaX7A1bgFQ8tVSFnqqAF5JiR4RRa37D4MCPQFhXJDBg3YtJpLN2ERO2Pcdi6JBa4qzKCBZmNGovr6A0u7SBkQjYF0c7N3ytcjHPa/rVcqGXlRD4tOeUwwaTd5hyGAngwfl5iRlP2jmrD90g2NwM3LvXMZ/zquxYA/DzzBMTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=oXYMxVkt; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297e264528aso63784635ad.2
        for <linux-next@vger.kernel.org>; Tue, 09 Dec 2025 18:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765333823; x=1765938623; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLltq9in0XtCC/gcWqBNP9gU7cEcbBuRtqTAKiuIH3A=;
        b=oXYMxVkthHPUmPbxwWp8bg9qMQBSWWGEc8gJSspMgTBVCUAfjaLJ2bGMK1QH/7zcuU
         gsbqkg9UHXGsu8LF5uQEe1VbJnP3m+TFDcACQeBJ2JcTxs0Tr2chqgl/tkpmhq2CWipY
         7uUad55ju0s4W7RNFHZh+zfjrPnqS4P7k6nV36oa8uwPl/ac+IZ00tMe4ce/Btk4mTua
         wP0RKmoZlHusFaaCTXDaSFCPrruDqLs/b9DyDgbGIkt3Da1MMJxspOB2yxP7BAYBo12R
         +ksktOEJBGphUByTwPEqUiNGpAoZwDiuCis35dw/BcxZ7AUHVnh6iiBPIHYpIS5hmFu2
         +Cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765333823; x=1765938623;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YLltq9in0XtCC/gcWqBNP9gU7cEcbBuRtqTAKiuIH3A=;
        b=WAXiytz8ngD8Wj4NBmquJ326b8sf1hOq4/9Cy6Cxc5ds6P1EPy2VL75kvEOyXtn2wK
         qzzbpAkP8ZoJbC5Sw2CjG+xev9cNnVTggx1mvQDZbVjxZaxf3z9KayjT+YA3FQK1gS+3
         +FaL5vRIpA3y67yiJkxsPhRmAgoa/mp2Lg9OPT7JYn7zNgQIf011SrCe1TzgNhKmmUSG
         pMiQ+nh10KiRfxwjKTABpBm844PEbZb42Yrep3Fr1b4X8yQd50OT5+cvEXS05x76LKpz
         OVvgO9S1hDBI6RJUbz8eYKkS+vR7USzIj2cznF2elW3w2FD9YDZ5Yt9Yq9QxZCfrSOwA
         BZvA==
X-Gm-Message-State: AOJu0YzWYupR86nNAAAhFaTbUJxYijPzL4o9dmqy7aWUEH1wI9EFSpfB
	WHsv2IeEOZDWLnCl0X83LeBzTJeU+7O0BD3iAeDrGS0qJzCq3HgNbfCSIANukH2WaB47x1yRvlW
	owAXKC8s=
X-Gm-Gg: ASbGnct4k10wTnCKJIw6Nhhz3s9BWTIWLG4HqXSafY0ZuOevVlyjQ2FES0hYOzUvZYu
	xo5b8z3S5VeOFZMf4z7E1bWeO86v0YtRbJa9+LScL3vUSQzI0Fwe74pp5nsrTH92oiJAwMa1vbz
	WXVxCyvphARPGgU9KcsXcyUt3+takw1D7PHu6ddN1c9PvTKdDvCVzq+CAI644ojCAupsij9HhZA
	dacCzmV5wXWUcgOq0do7p1FiyaidxQ525ouEv1dqIbzhFr/YkNE3zfSvwRyBUG+cUW3yk5rXWC5
	m8D0igiLvoSPd/KqIEuooHPZohMSgfI41/VdS4GIt+ngDGDB/EGRomkr32PqEUHAcKoOgHBWdhB
	3uaQCgIoWTpVQPKsZMEVMZ3FTZALXCDF2ojJ+nt2LWDEJGne8gtK3SxYvvgGCuyYYkTGQnudkSD
	WHqZ0O
X-Google-Smtp-Source: AGHT+IFjTNnxSg4hbUbHIwObthS13rpzAZvF/DPxFEYs0Fxt3VLdEsf+ENayUmzleyslNTPZjaSfLw==
X-Received: by 2002:a05:7022:1404:b0:119:e56b:98bf with SMTP id a92af1059eb24-11f296d7ae9mr445825c88.38.1765333822855;
        Tue, 09 Dec 2025 18:30:22 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76ed82esm83498627c88.7.2025.12.09.18.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 18:30:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - c75caf76ed86bbc15a72808f48f8df1608a0886c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 10 Dec 2025 02:30:22 -0000
Message-ID: <176533382184.6997.2383837179111164316@1ece3ece63ba>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/c75caf76ed86bbc15a72808f48f8df1608a0886c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: c75caf76ed86bbc15a72808f48f8df1608a0886c
origin: maestro
test start time: 2025-12-09 03:08:09.774000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  156 ✅    2 ❌    0 ⚠️
Tests: 	14607 ✅ 1161 ❌ 5842 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69379d1dfe27e1c8072be92f
      history:  > ✅  > ❌  > ❌  
            
Hardware: imx6q-sabrelite
  > Config: multi_v7_defconfig+preempt_rt
    - Architecture/compiler: arm/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69379886fe27e1c8072bd6f0
      history:  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6937a45afe27e1c8072c2127
      history:  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69379d25fe27e1c8072be968
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:69379b53fe27e1c8072be1cb
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:69379c6ffe27e1c8072be508
      history:  > ❌  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:69379cacfe27e1c8072be717
      history:  > ❌  > ✅  > ✅  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-timers-ramdisk.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6937a42bfe27e1c8072c2090
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:693829affe27e1c8072ceef8
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:69383154fe27e1c8072cf207
      history:  > ✅  > ❌  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69379fa5fe27e1c8072c0b0c
      history:  > ❌  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6937a2bdfe27e1c8072c1e3d
      history:  > ❌  > ✅  > ❌  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

