Return-Path: <linux-next+bounces-9063-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 439AAC67060
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 03:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id B33FE24233
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 02:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCA132720A;
	Tue, 18 Nov 2025 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="yNNwNiyl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DE7279DA2
	for <linux-next@vger.kernel.org>; Tue, 18 Nov 2025 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763433023; cv=none; b=pRoB0vg8n0o5s7EDyTa+P4nJAURRxTvs9/0vDDlqgpscxV+CdmcR+KZ+Ltghczt5mvGjmUYdpGbZGszLtPAErN4vr5g+6OUGsuNVK59y2xTPLRVSNeFMMiU/s5sAtlRNMuX46DkO0BlbHtspwm5+0fxQ6QmJKtyohn6654tt3jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763433023; c=relaxed/simple;
	bh=Vn/P4aWvIru+3zHKgTBqwh3tgY/95BcJrduKSfazgiA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=N4wB3OmTXoJvzXIsnBt5Fy8badkGl1v4g5++3FK984L1sQR8YZB/lPwuEtVa1StzAEuWqd4HbqWjNPr1bxrwD65p8PDFCA0Uqm0p2bzV3hx9Ld40oFvNdusbwOAjVYPbOXoj3wgepGig7Y9Qhf1Ei7hi99o+njAP2iohkm7N418=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=yNNwNiyl; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29808a9a96aso51892255ad.1
        for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 18:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1763433021; x=1764037821; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrQsKHNJSAb6FoXL7rjlDFuCNaW6j7wi9sr75Fe3Ing=;
        b=yNNwNiyl1pQlfEQ85fmiFxXes/9q7ceOJ5Q0seAY0rJAaO/L4jsRnRUjMjlVS9vya/
         MKtQ79ZEqY39y1ygrT8geOfa+oipKtO5Rn2kfWj08a97D2/JaHp7Pxxx5RDa+22VRL+A
         47lQngjSScMkkoL56TP26zy41jBIpCVXQm6YT0bYw54ZtxrJ+R5+wHA8IHXwqaP1hmSz
         JzMyvGmbdgDNbjD8jBBv1RQ4lCg9TtCHe+txfoG75QmoGIYSkWFFGmU679NTWhzW8mW6
         8opL7Dl4Uc1gi7q7+dPSyVxIBrhE7Zw/ru6DXBHiIwS9IeL850XNF2Akr7u6TEDwimfL
         Vjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763433021; x=1764037821;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VrQsKHNJSAb6FoXL7rjlDFuCNaW6j7wi9sr75Fe3Ing=;
        b=CdfOlk18mHMjof+c3rtLjL8UzHMLf88fdBjv+w1BHTNydUdv7hIL0Zi/GZdORuA8My
         XVk9/+rjkG65YhaQQO/wI/LVhGIrD0mLlUIjbpafTL4yMsmCO/pfoqTC0vOhT61vbiyf
         vlbeyZ5Qienyb+sH1FZN2FPOuWrVZ1dOdeOrOJuLMxpaYHarf/EixvodcNjUNV6onm02
         sAv4+xYVSkSMVhA96Abqekenri5mnapd2d9eFLL/HCgjkR6obxN26+V52TupUqVi3zZI
         NW40uk19uCIZIx3QqK4tpOQmN2FDHeXClvQg6YqSNnvHkIzA2qP9wQkhFCB4uky4+BWg
         1QfQ==
X-Gm-Message-State: AOJu0YzPayZ4MmHI2JHt9Rc/CHXsdUYvY0VheVNPl/4Z4yoVqhvsignd
	irgcyznaJ3/rBEsLIguP+VrZiT8NK8esVhiLStCGFk05UVYgtghLtxp7FCPHw0HAkZy/6iSb6KR
	iWgcY
X-Gm-Gg: ASbGncvGUSQ062+0i0u9CXgrBzFZPWtDVTKdNJvgM78BSDPetb7TWgKLLBUDE/kPuoN
	G9ubKocCrLIAA7srA8/Ee8rTudO35urquKAWS0aQ7PTbFCbt8XDZGxIdpj5qtmyqWAG3VoKLkCg
	dQKX1mW2V7MrtuDFzVSGTfq4d3vuvICHnE3NxSlvBHfAjcbbB3bUkAkw4hbHgKS9if/W7rF0hkX
	ifITSCRK12hgZUYVLx16be+d8glwLBqzgNxUylTKzpA1shNc9FV7PnGcCf8hAPqSvW1zh3pRPJE
	+iD3vpbGdzAyaREW/f41ad8eFdvfxSgsQqNC6Hw0g2BlPeCEKeVjyXDM949hz0OQmZmikxvtIN2
	jCp6TxgPXxxZtf27fLVuHrtxwDyHL18OO3FiUNyBE9AGIjSPDTdk2sSYuaH4ECNghzaQTdREOPQ
	I4f8ga
X-Google-Smtp-Source: AGHT+IHujFd880y7blxvf6gD1g5j6JnnIZInZ4SP5mBvSDs6eZLpwxDW0fYQz0MKeiQa4X3h6c3x2Q==
X-Received: by 2002:a05:7022:1707:b0:11b:7970:ea3f with SMTP id a92af1059eb24-11b7970ec72mr2615072c88.25.1763433020747;
        Mon, 17 Nov 2025 18:30:20 -0800 (PST)
Received: from f771fd7c9232 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b80fd6790sm29418322c88.10.2025.11.17.18.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 18:30:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 0c1c7a6a83feaf2cf182c52983ffe330ffb50280
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 18 Nov 2025 02:30:19 -0000
Message-ID: <176343301920.2151.15473907960388548683@f771fd7c9232>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/0c1c7a6a83feaf2cf182c52983ffe330ffb50280/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 0c1c7a6a83feaf2cf182c52983ffe330ffb50280
origin: maestro
test start time: 2025-11-17 09:07:54.654000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  145 ✅    8 ❌    0 ⚠️
Tests: 	10875 ✅ 5263 ❌ 3372 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:691b0f482fd2377ea9a4b64a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691aee932fd2377ea9a4796e
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691b118a2fd2377ea9a4b895
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691aee932fd2377ea9a47a4a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691af26f2fd2377ea9a49204
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691aee952fd2377ea9a47a50
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691b02602fd2377ea9a4ab93
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691aee982fd2377ea9a47a5f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691af50a2fd2377ea9a49ba6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:691aee3c2fd2377ea9a46d3e
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:691aeed12fd2377ea9a47d90
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:691af6682fd2377ea9a49df6
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:691aebe22fd2377ea9a45736
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691aed8d2fd2377ea9a45bd0
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:691aebf12fd2377ea9a457c6
      history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691aee692fd2377ea9a47839
      history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:691aebea2fd2377ea9a45781
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691aedcd2fd2377ea9a45e3b
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:691aebf32fd2377ea9a457e4
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691aee5a2fd2377ea9a47454
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

