Return-Path: <linux-next+bounces-9476-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E5933CCE44C
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 03:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A63CF30036EB
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 02:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021641D6BB;
	Fri, 19 Dec 2025 02:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="AsqS4Mpz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16ED405F7
	for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766111413; cv=none; b=JUoCMbAF5/IfoT8QOUePsQugO43Q0mf/AhHSd5CALiv6yRqsLIGxHAdtwLk7z5P5FMuX0bla+LO0BABLjzL6h8HNALBlCtS+I4esKIODxnvFjeGDAF3p2YwwtPNOteONk3G8114j1bxhUOSXr0iMopaScIGm3fqf7rNRhRr19k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766111413; c=relaxed/simple;
	bh=jXmRsfVqtgkyfI+YiNoY66h6LYOHAru2axzn3TWc+KE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=a2u9x3S/xlBcgBcrnj8X6F3Ciu7CvU3HXpyA3K8UN9nAnGgeaNsERnD0KZHIwmzOk2cFSxOrQ/nH1l2Dhl8WLkUc8Sd+SQFYNXuwig6xql54nX7lbg3zksZE2CGXDw6JWzpXCozjKHkC0vxcNrbIuPYpH5iKg3wm0MrBBMi5SFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=AsqS4Mpz; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7ba55660769so1101782b3a.1
        for <linux-next@vger.kernel.org>; Thu, 18 Dec 2025 18:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1766111410; x=1766716210; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufL6IIOHqjmNIQvyT0r4uHEOSp955J6f2s3TEYgiKUU=;
        b=AsqS4Mpze3YetEKe+8n/2D6ZNWi8xqoHjL0Py6CVVAdOOtFMkeGogIIveHhaCQ2H1O
         LjRmFmfkdsbHsa/l5TIjOI4PoAWUHohrcbTEasrcPQSkaVFsNS7p1Yewo95NuEHKIic3
         PBzdIE0tb6hOrwqOtzVZ97///aXqTz1gKyd2utvs6KIyvBK9J23MvgpV/XnICD/FwJJ5
         9JneOUgg0xjKfbEAU1xtmNkgjjoR4vuIIIjH0PKYfRrBDRDdX/26eh6t+z8l5hG3dD+/
         2tTDMTm5dJtMrKErdPa9R2JRYau7xhPRl/hwwTkDK6H7xrtdGV0UtAYL4mT47VztaXzF
         OTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766111410; x=1766716210;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufL6IIOHqjmNIQvyT0r4uHEOSp955J6f2s3TEYgiKUU=;
        b=HXmQqVRDwLyIMEG2RSUM9K6t7OGm9aiWk3rIAYdU+UNyJCDhyVml5TDUwvrvCnzUJF
         8oerwisGOiV2Rrq9iT5OED83OedJjvv29kixrBxBJ+C++PmEr8v/te4Fa86Ce4o+ZPHX
         df47trGfWkIfneceHfRumvXcjqqf2kAEiUhV84I36abW3ChuIiMTNqo36vHbJ91183Ce
         YrZ3p3W3C0gVSalqe2eBAUw+UWhlDtfXnEl2wm1/I6y4SXNk8bZGVbd1IQ3Sdkdtf2VG
         WbK+YqnGXRG/e4xwAy6/mDzJXI/8lKKI1Kv7HMcfkAiEEWakQmOwY8AnXNPcpT6+U/5f
         l2tw==
X-Gm-Message-State: AOJu0Yw5n32pfJTYjQVmmqagFDABDsfN8NZeRtcY3SRERmmObBPk+YSE
	j0yXZqv60UNbNFDRajxZZtebIFn8VTzqpGdCFTaLgp478pbDWeJPprbXkG3c8pXVMbW9rgmhcIX
	YyiEJaBM=
X-Gm-Gg: AY/fxX7J0ik4aI8rd0W02zY444yaZpHmtQOgh+vanY99LREEp2ldiLXBRLcNHrgjC7t
	QFLENms62ttN4cFMVd7Wx59pSF2szNhUBTZe+173ZbiWYswHSMwBId8SV/8vhv0mseLbcNNFDTs
	P5WNS3+Ru8Jqj0pwkJYQ+O1fJjxIGgxmVPRT09i+g+ur/jysI3ZJYHi0aRCFboroei84P2t6p5O
	uksxfxue46x1z2Jls8aap/sO/jxbHHN40qsXBeYGOH3wEksPIrviqwsx0ew2rFhfVMtJMwzK/zO
	oNpQH8gJM6UkrB0Q4wf09q2qTAlaL0xXQOAsIb1+dDVd1e7tEf1RirIZpvxhXYDKaNZix/7gbhE
	d6fVZ3HIdtrcHqwdONhHFV4CMO7rVhY4z3bOvuj3Vxf8NBc9A5H9kCRdUJ9MvNqcaQsD6yX38jG
	SNpLNO
X-Google-Smtp-Source: AGHT+IFN7Ke6OQ07bnb4d++NMxAnocScdIzqLWmD5gvo0ZAklX27A5q93CJeMGuM7QtoOS36IOqJRw==
X-Received: by 2002:a05:701b:2719:b0:11b:1c6d:98bd with SMTP id a92af1059eb24-121721aac3fmr1193336c88.9.1766111410119;
        Thu, 18 Dec 2025 18:30:10 -0800 (PST)
Received: from 0dbd87e801fb ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254ce49sm3513928c88.15.2025.12.18.18.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 18:30:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 1058ca9db0edaedcb16480cc74b78ed06f0d1f54
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 19 Dec 2025 02:30:08 -0000
Message-ID: <176611140838.706.10349041011258866865@0dbd87e801fb>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/1058ca9db0edaedcb16480cc74b78ed06f0d1f54/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 1058ca9db0edaedcb16480cc74b78ed06f0d1f54
origin: maestro
test start time: 2025-12-18 11:29:27.684000+00:00

Builds:	   41 ✅    2 ❌    0 ⚠️
Boots: 	   33 ✅   84 ❌    0 ⚠️
Tests: 	 8860 ✅ 1012 ❌  962 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6943f16dcbfd84c3cdbfc0b8
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6943f16dcbfd84c3cdbfc0b9
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:6943f0ffcbfd84c3cdbfb7fd
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6943f0ffcbfd84c3cdbfb7fe
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe8b3
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe8b2
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe8b1
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe8b0
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe8af
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe8ae
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe8ad
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe879
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe953
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe952
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe951
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe950
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:6943fe25cbfd84c3cdbfe94f
      history:  > ❌  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6943f195cbfd84c3cdbfc17c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6943f195cbfd84c3cdbfc17d
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS

  No unstable tests observed.



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

