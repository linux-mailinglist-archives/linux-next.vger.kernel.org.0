Return-Path: <linux-next+bounces-9389-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 294E2CB48EF
	for <lists+linux-next@lfdr.de>; Thu, 11 Dec 2025 03:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39D55300F9DB
	for <lists+linux-next@lfdr.de>; Thu, 11 Dec 2025 02:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA347E105;
	Thu, 11 Dec 2025 02:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="jT5OMz5d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081382D7BF
	for <linux-next@vger.kernel.org>; Thu, 11 Dec 2025 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765420232; cv=none; b=mIj5FWJYWW1isvGvTR+wd2YK3YAPBD125oq1bqNW68AKnpS5DB2hrWIjMt57Fmf5rfvxaVsLglfol+UiA7MBouy+1WXNT1gVdbn2EE0QN6LVzdVdYk3I3vcx4Zw9w9s9oyoaqG999oPL24OkJ4UIYfAC6bYpbhTDnRyPRcj2SKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765420232; c=relaxed/simple;
	bh=XeuVj3PCgVAT/uceuSzYG04d0SgRVKfxfLv2xsea9Ec=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=jJzr/fBA/WHvVumoKZ4nNvcxqjHYkxdRqoqaJnVokUrBILeXb2F/YooxLWB/XltBHpGFb/MGiMS/0ld+YH6plz/NFg7tTtaGsbQG1m0oLmI1b6BaJaGUAvhY/l1FkpuZiMIIt576P/0OlWgVI+sBhbmLSnrKdUzN/xbdMyHSEIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=jT5OMz5d; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297dd95ffe4so4929075ad.3
        for <linux-next@vger.kernel.org>; Wed, 10 Dec 2025 18:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765420229; x=1766025029; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssliM9W3OwkB+Dr6XIvU7cUIQCnOO5JqHR1fqOFCjT0=;
        b=jT5OMz5dnANKpSrypQ8lD0ZiAi465Y11H5zTc7wE/Phc71OXuZKVrN7j9A3gPR/MlM
         PO6utBxQkFPOYnVG1PYZg0C8E6/rnn5BDijXRQzYjHYhSwZF0tn3RDvZje7BK0jtB7DX
         YmCbP6A+4SsHxGSX9qdP3j5f0xluYcJeZ+u4REyUGwMPAsqb7kf+f1X6zXmE7RA1dy0X
         tNHyggvh8uWrBMsko/2muTj6lHUe2cfjOGYB+f20/4/KEBuEKE/ITEalUdkX8m5NoKPv
         NJcanJvdSp28gBgQHN1PpDp2Nj5lVfr5VVh4Lm1e2oyGp3pwZlYrwdKRqFw3R5BOBQdM
         4JCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765420229; x=1766025029;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssliM9W3OwkB+Dr6XIvU7cUIQCnOO5JqHR1fqOFCjT0=;
        b=MAsMuK9MwvazNgL/HNOVwra35j4RE73n7I7D2/qaKatAONipzYx9io7lMbgLCLLOIS
         HlaVXahTz+juTcYzQmFjMqcZpMYIaXM7siET4mACAm6hZj12/RXz2POcOj+SDbqjh1fT
         2NrA7lRtJiqJ1pQLNSQ1dQaZntvbi6GDkQtFMyEtzX32hcp60bxw/3oK/oNsnrm7eEj7
         rcRO47cpfycupSYznaPAMCv/srHqKpAFWqvE7Gpi9yWZwf0s/I/qchVULtLqBZPmEpek
         Yskqy8iS1rvkR/M4TF+NT0VbVIJsw7mCcgtIiu5KCjgt604J4SiiHreEVtevCheXgFAJ
         FZeg==
X-Gm-Message-State: AOJu0YxwBbKlH6zfK7W31Glgts1GpCTKB8jb6/Z0rlqsNu6BdND80iOt
	TTjFuXX8Xmqu52/jR6+fMGE+yNdvgrVUamRlKooZql8BAYxNLV9vz9qA2NqkWHQxjl/UL+pDst1
	aX9ATWKQ=
X-Gm-Gg: ASbGncszpTl1RXPAPqCsQyUE03HZRioOWrv68HKQm99qIVyachdA5Nc3kashkrKDBhJ
	qHI7gJ8vFe6NHSGVmOQAStxUziWGLwQa5PDeW9H7ZKYYembhqEMVCg9OSglE1msvaNdmtZeyX72
	+Q1QoAi+DLyVmTCT1TJFpJA1vNupgz9NHQ+UnSPa9uTOCjNKbWDq+5E3W41sNdMlHt06FcwGXeB
	xFTIlRAceafQwgB8CLZZbD4SPVEPxSvmCM4vrYND0dHttN0TAS9u87X1hzDECkJ/gQiYkeNCcNH
	TO0gH2j4Ti0JKgUDKT4Hdo3DcC+HT4q7MTQscJGhwxkA6Fa6ciEXqB+FTHm0FfSqs7yZurWG4gb
	T0lfIfGDjJcuE+WnH9D0Rya11ziWJrmLxoSpDQR+qTjWGKsDNc5Td9tBnfYZhGt18XgI2Pyw5L+
	2YdRys
X-Google-Smtp-Source: AGHT+IH2olirEkDEYNZ/Npi2zQQvhGe3CIb/B8pcJvV2uMKQzsT+kOxXSPI56NaslrdLHAIj4Jy3Zw==
X-Received: by 2002:a05:7022:e997:b0:11b:998d:bded with SMTP id a92af1059eb24-11f296ca8d0mr2759731c88.28.1765420229437;
        Wed, 10 Dec 2025 18:30:29 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb28dsm3510517c88.2.2025.12.10.18.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 18:30:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 008d3547aae5bc86fac3eda317489169c3fda112
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 11 Dec 2025 02:30:28 -0000
Message-ID: <176542022834.299.974180818951419201@77bfb67944a2>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/008d3547aae5bc86fac3eda317489169c3fda112/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 008d3547aae5bc86fac3eda317489169c3fda112
origin: maestro
test start time: 2025-12-10 03:07:22+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  158 ✅    3 ❌    0 ⚠️
Tests: 	14368 ✅ 1120 ❌ 5458 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6938f544cbfd84c3cdaf37d2
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6938f549cbfd84c3cdaf380b
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6938e969cbfd84c3cdaef4b1
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6938ebbacbfd84c3cdaf0efe
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6938f55ecbfd84c3cdaf3ae9
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6938eb18cbfd84c3cdaf01f9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:6938ec1fcbfd84c3cdaf1094
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:6938ec44cbfd84c3cdaf11cb
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6q-sabrelite
  > Config: multi_v7_defconfig+preempt_rt
    - Architecture/compiler: arm/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6938ec1acbfd84c3cdaf1056
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69390d06cbfd84c3cdaf991a
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:69391daccbfd84c3cdafa6fd
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6939207acbfd84c3cdafa9cf
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6938f662cbfd84c3cdaf428b
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6938f973cbfd84c3cdaf5550
      history:  > ❌  > ✅  > ❌  > ❌  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

