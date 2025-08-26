Return-Path: <linux-next+bounces-8097-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C9B351B1
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 04:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 827253BDBD1
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 02:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A846B27146E;
	Tue, 26 Aug 2025 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="s/KIuGSi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BC521FF49
	for <linux-next@vger.kernel.org>; Tue, 26 Aug 2025 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756175423; cv=none; b=F7irvEuSL1a9zmpw3DEV0VBdktOT1Lk6/qbRfhP9SisMrhDEInoexzf6U/9KDujUevYv5tGodZSQudWoLWRcuBCY5sChVLF1yGRkORbr1N9VfM6jDPheA8h+LujFwsrWxZiVaTIZmKwTKFfhmwm7Ofzb2iwI3b9DBajXnTk0CJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756175423; c=relaxed/simple;
	bh=A+UXt2KdGETh76hyrf/dJdlKJEf+rpjWdajMp8Rf4tU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Rdskz2+4zRRxbtWI3HBzQdj81KdiFy3zE4aSIxx5YRZZSk6cRrbyy3SCb0TvPpDhAQobhP43dbKZP+srhPSVXSGTJENBmieZXOffC/ugnM1lIvshhhL8GL9id7LYl73D5AzxaI7iXXFWnA+wao4uZOuo8rMQfhk/x12QxUXRgbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=s/KIuGSi; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so4470383b3a.1
        for <linux-next@vger.kernel.org>; Mon, 25 Aug 2025 19:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1756175418; x=1756780218; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5IF9VCup4h8LQtm3+x7V3ZxZYViFbZKDjuHoqKCsR0=;
        b=s/KIuGSis13n2ZSt8jxu8a4YvgjrTEB/XvReQW6NmTgku1x8gOh66Iqjy9cAZhOANZ
         XEDxUUPg6INWWOImMMUrhXVvz1s0+YQ995yjsSYgmm5QJWXe2Jnc+RK0GTZlInVLIMPl
         63ZDYOGYmgflwu7wWoz69vDACW7CGcZn8mUsMx2olELAm1cpZka+YIAT9UaSRP514am1
         km2HsJLV565m7hg8LHn9UzP/Z/hIphDhQ1auqLWvbBvIOJAG9rTic3+Av0sDYlmqqRoC
         ocfO+TvapvYUXe2KjL7U7UbjC6n4Yi+OOvqh4Fq/ocGaVdAS+yVR9rsy82O/g9VWzzdJ
         qHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756175418; x=1756780218;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C5IF9VCup4h8LQtm3+x7V3ZxZYViFbZKDjuHoqKCsR0=;
        b=BRUr3zgwzYoPVglbV/JEldN1dhPaPNKvwX0m5rJ2tnuFCmS1rCIRBGVO8nWgoVyJOG
         2F3fMVeQfI/qOu1xfClB0xstOfMNfwY8eySAcIyYs7Hjt6Xy0KLnCArIHXwfH3QiWU9E
         +veAHsF3ZsyFogUpbU/Etrtnp5o1UqoAxJHesx0v7fYwsEoGvL78ejrT19bvAX0J8Jhp
         GMjvje/G65VusLBfJSoyrCtadNQ0z8B0F+StIxSZJaPMP0vfsuSsFaU1Vl0jCQJnZglU
         UzYHVzwge8TRAjUpcRzsH+1FqUCCoo8Ha8FwqnJ9rnmuV5DpIiU4wzKedcx6bLPFak0/
         f3Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXJxoMaYVay6Lu7eX8lgWkvgA3h3ci3Dyf+pELj2wgxbrSMoJoBB0IC5dj3Y9AtLf0FJYfqIoyaEsbf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9j6+KtOExDzFGu8LBjmgqE4hhG8XUjuiK/+HW/cp2BH+aOm+9
	IcDZJY8Qz7PhOOL9OrmcAXGXJTb2s9XGVLZIHMMHeQuUQ2xNOjy02FBOkbpjKHrfa6OPA7cfHLa
	9yEvf
X-Gm-Gg: ASbGnctL8lCNtZ7E890fHKpMDLS1zQ7lBmdUBbSAM1eZlEJopoVbvqdjpxL72Y7xhrX
	8zDoqWp85uxydazJBsvrSYzqjmN/RH6S9+cF4rxB2p3aTovSCGxl6WsrbI17nNEEFoj4aY4KKx0
	DPbrYBsgnb+nGCY+GQ33nnebv/YCRkB1GIVxbXAOJuVIrVbCZY/gJy6e3U9wPaY37GdwuZ/Ntq4
	vrQvWoCv6qVjQpkgPpzCiKep0J4t7g5v44UpLNcFdR+ujPD5STkuzg3DTaK82hebXPu7go5wUMP
	Mh3Bosm8FHV1f1+JMgMUPwZpPxFATITdnSLVS4updGj6SpYY+CZPEO6cZVmgIKG10/qbMjue3+f
	D7KmR51gCHFWJBCFa
X-Google-Smtp-Source: AGHT+IExoo0Lbu+dD+1HxJh+yd/Ubw6BRJkakTeL4A87W/hBzbJ4o77lMJri4SWSvvHk/ng/FrAKXA==
X-Received: by 2002:a05:6a00:e1a:b0:771:1b70:2d1d with SMTP id d2e1a72fcca58-771f94bac62mr765476b3a.6.1756175417784;
        Mon, 25 Aug 2025 19:30:17 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771fb852dedsm35733b3a.88.2025.08.25.19.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 19:30:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 6c68f4c0a147c025ae0b25fab688c7c47964a02f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 26 Aug 2025 02:30:16 -0000
Message-ID: <175617541552.860.5120462441417364364@16ad3c994827>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6c68f4c0a147c025ae0b25fab688c7c47964a02f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
origin: maestro
test start time: 2025-08-25 08:34:16.297000+00:00

Builds:	   35 ✅    5 ❌    0 ⚠️
Boots: 	   32 ✅    2 ❌   28 ⚠️
Tests: 	 8055 ✅ 2690 ❌ 3740 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8365-genio-350-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3058233e484a3faf913f
  history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-lazor-limozeen
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68ac3fc8233e484a3fafc88f
  history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: hp-14b-na0052xx-zork
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2beb233e484a3faf5ab1
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2be7233e484a3faf5a85
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: asus-C436FA-Flip-hatch
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2be7233e484a3faf5a7f
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac306c233e484a3faf92a9
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.acct (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac306d233e484a3faf92af
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac306d233e484a3faf92b2
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3072233e484a3faf92d7
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3078233e484a3faf9306
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac307b233e484a3faf931f
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3083233e484a3faf934c
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac308f233e484a3faf9399
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac32f4233e484a3fafa17b
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac32f8233e484a3fafa198
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.landlock (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3303233e484a3fafa1c8
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.lsm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3304233e484a3fafa1d3
  history:  > ✅  > ❌  > ✅  > ✅  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3306233e484a3fafa1de
  history:  > ⚠️  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3306233e484a3fafa1e9
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.zram (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac330e233e484a3fafa210
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: bcm2837-rpi-3-b-plus
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68aca62b233e484a3fb0742f
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.proc (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac308e233e484a3faf9396
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.proc.shardfile-proc (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68acad4a233e484a3fb07a64
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.ptrace.shardfile-ptrace (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68acaca8233e484a3fb079df
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: beaglebone-black
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b7e233e484a3fafbd66
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.acct (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b88233e484a3fafbda0
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b88233e484a3fafbda3
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ⚠️  
            
- kselftest.breakpoints (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b8a233e484a3fafbdaf
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.capabilities (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b8a233e484a3fafbdb2
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.clone3 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b8b233e484a3fafbdc4
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.coredump (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b8b233e484a3fafbdc7
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b8c233e484a3fafbdca
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b8f233e484a3fafbde2
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.fchmodat2 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b91233e484a3fafbdee
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.futex (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b91233e484a3fafbdf1
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.kcmp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b92233e484a3fafbdf4
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.mqueue (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b92233e484a3fafbdf7
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.proc (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b93233e484a3fafbdfd
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.ptrace (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b93233e484a3fafbdfa
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.signal (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b95233e484a3fafbe06
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.timers (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b94233e484a3fafbe00
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.tmpfs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b94233e484a3fafbe03
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.vdso (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b95233e484a3fafbe09
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.gpio (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2a72233e484a3faf53b7
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.ipc (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2a75233e484a3faf53bc
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.landlock (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2a78233e484a3faf53bf
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.lsm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2a7a233e484a3faf53c8
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.memfd (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2a7c233e484a3faf53da
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.perf_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2a81233e484a3faf53eb
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: cd8180-orion-o6
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3061233e484a3faf9250
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3073233e484a3faf92e1
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3079233e484a3faf9310
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac307c233e484a3faf9325
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3085233e484a3faf9352
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac308d233e484a3faf938a
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.signal (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3091233e484a3faf9484
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3090233e484a3faf939f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.efivars (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac32f4233e484a3fafa178
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac32f6233e484a3fafa187
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3305233e484a3fafa1d9
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3307233e484a3fafa1ec
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b7f233e484a3fafbd69
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b89233e484a3fafbda6
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b8c233e484a3fafbdcd
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: imx6q-udoo
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b7f233e484a3fafbd6c
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b89233e484a3fafbda9
  history:  > ❌  > ⚠️  > ❌  > ⚠️  > ❌  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b8c233e484a3fafbdd0
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: imx8mp-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3061233e484a3faf9253
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac306e233e484a3faf92b8
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3073233e484a3faf92e4
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac307d233e484a3faf9328
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3086233e484a3faf9355
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac32fa233e484a3fafa19e
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ❌  
            
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3300233e484a3fafa1bf
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3062233e484a3faf9256
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac306f233e484a3faf92be
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3074233e484a3faf92e7
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac307d233e484a3faf932b
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3086233e484a3faf9358
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac32fc233e484a3fafa1a9
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3301233e484a3fafa1c2
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3063233e484a3faf925f
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac306f233e484a3faf92c8
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3075233e484a3faf92f0
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac307f233e484a3faf9334
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3088233e484a3faf9361
  history:  > ⚠️  > ❌  > ⚠️  > ❌  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3064233e484a3faf9262
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68acfea7233e484a3fb10858
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.capabilities (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac307a233e484a3faf9316
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.clone3.shardfile-clone3 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad000f233e484a3fb10d18
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3088233e484a3faf9364
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3064233e484a3faf9265
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3070233e484a3faf92ce
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3076233e484a3faf92f6
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3079233e484a3faf9313
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3080233e484a3faf933a
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3089233e484a3faf9367
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac32fe233e484a3fafa1b3
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68ac3fc5233e484a3fafc880
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2747233e484a3faf4abf
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac275c233e484a3faf4ad3
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2773233e484a3faf4afe
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2735233e484a3faf4aad
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac278c233e484a3faf4b16
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ff0233e484a3fafc8a6
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ff3233e484a3fafc8b8
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ff6233e484a3fafc8ca
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ff8233e484a3fafc8dc
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac4000233e484a3fafc916
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac4003233e484a3fafc92f
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ffd233e484a3fafc904
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac4006233e484a3fafc941
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac400a233e484a3fafc953
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac400d233e484a3fafc965
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8186-corsola-steelix-sku131072
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68ac3fc6233e484a3fafc883
  history:  > ✅  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27d9233e484a3faf4b64
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27e8233e484a3faf4b74
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2805233e484a3faf4ba9
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac274b233e484a3faf4ac2
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2760233e484a3faf4ad6
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2778233e484a3faf4b01
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2738233e484a3faf4ab0
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac278f233e484a3faf4b19
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2723233e484a3faf4a9b
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27c3233e484a3faf4b4d
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ff1233e484a3fafc8a9
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ff4233e484a3fafc8bb
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ff6233e484a3fafc8cd
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac400a233e484a3fafc956
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: qemu
- boot (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2bf7233e484a3faf5b2f
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3065233e484a3faf926b
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3077233e484a3faf92f9
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3081233e484a3faf933d
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3089233e484a3faf936e
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3588-rock-5b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac305a233e484a3faf9152
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2811233e484a3faf4bb8
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac281a233e484a3faf4bc5
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2822233e484a3faf4bd2
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2829233e484a3faf4bdb
  history:  > ❌  > ⚠️  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2831233e484a3faf4be4
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2741233e484a3faf4ab9
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2755233e484a3faf4acd
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac276b233e484a3faf4ae3
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2783233e484a3faf4b0e
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac272e233e484a3faf4aa6
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac279b233e484a3faf4b28
  history:  > ❌  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27b6233e484a3faf4b3e
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ff5233e484a3fafc8c4
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ff7233e484a3fafc8d6
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ffa233e484a3fafc8ec
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ffd233e484a3fafc8fe
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac4002233e484a3fafc929
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac4005233e484a3fafc93b
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3fff233e484a3fafc910
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac4009233e484a3fafc94d
  history:  > ✅  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-lazor-limozeen
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2816233e484a3faf4bbd
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac281e233e484a3faf4bc8
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2744233e484a3faf4abc
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2758233e484a3faf4ad0
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac276f233e484a3faf4af5
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2788233e484a3faf4b11
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2732233e484a3faf4aaa
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27a0233e484a3faf4b2b
  history:  > ❌  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27ba233e484a3faf4b45
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac4006233e484a3fafc93e
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac4000233e484a3fafc913
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac4009233e484a3fafc950
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac400c233e484a3fafc962
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: stm32mp157a-dhcor-avenger96
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b80233e484a3fafbd6f
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b89233e484a3fafbdac
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b8d233e484a3fafbdd3
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ac3b90233e484a3fafbdeb
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2a6e233e484a3faf53a7
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.mm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2a7f233e484a3faf53dd
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.zram (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2a9c233e484a3faf5414
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: sun50i-a64-pine64-plus
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3065233e484a3faf926e
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68acba19233e484a3fb08b42
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68acedb0233e484a3fb0e374
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3078233e484a3faf9303
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac308a233e484a3faf9378
  history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3307233e484a3fafa1ef
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.uevent.shardfile-uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68acf032233e484a3fb0eac7
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.user_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac330d233e484a3fafa20d
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.user_events.shardfile-user_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68acf083233e484a3fb0eb4f
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
- fluster.debian.v4l2.gstreamer_av1 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27ce233e484a3faf4b5b
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_av1_chromium (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27d2233e484a3faf4b5e
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27df233e484a3faf4b6e
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27f2233e484a3faf4b7d
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27f6233e484a3faf4b80
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2801233e484a3faf4b9e
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2751233e484a3faf4ac8
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2768233e484a3faf4ade
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2780233e484a3faf4b07
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac273f233e484a3faf4ab6
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac2797233e484a3faf4b1f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac272a233e484a3faf4aa1
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27b3233e484a3faf4b3b
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ac27ca233e484a3faf4b57
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ff4233e484a3fafc8c1
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ff7233e484a3fafc8d3
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3ffa233e484a3fafc8e9
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac4005233e484a3fafc938
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac3fff233e484a3fafc90d
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ac400b233e484a3fafc95c
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: acer-chromebox-cxi4-puff
- kselftest.cpufreq.suspend.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2cec233e484a3faf6244
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2cf4233e484a3faf640f
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2cf0233e484a3faf6341
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-cb317-1h-c3z6-dedede
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2e12233e484a3faf736f
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2e36233e484a3faf7930
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ac3c21233e484a3fafc00f
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2cd8233e484a3faf61bd
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2bed233e484a3faf5abe
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: asus-C433TA-AJ0005-rammus
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2e12233e484a3faf7441
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2e14233e484a3faf7538
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2e0e233e484a3faf7286
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2e2c233e484a3faf7818
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2d16233e484a3faf6781
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2d0f233e484a3faf658c
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2eeb233e484a3faf884a
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: hp-14b-na0052xx-zork
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac33f4233e484a3fafa4e1
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2eb8233e484a3faf8449
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2ebb233e484a3faf8537
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ac3c0e233e484a3fafbf66
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: hp-x360-14a-cb0001xx-zork
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2cd0233e484a3faf60d7
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2d16233e484a3faf6819
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2d22233e484a3faf68ac
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2d23233e484a3faf6994
  history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: hp-x360-14-G1-sona
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2be1233e484a3faf5a49
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2bdd233e484a3faf5a25
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2d16233e484a3faf67ff
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac2d74233e484a3faf6e9c
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-R721T-grunt
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ac3c09233e484a3fafbf3d
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ac3c0f233e484a3fafbf6f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ac3c1e233e484a3fafbffd
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac3245233e484a3faf999c
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac327a233e484a3faf9aef
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac327b233e484a3faf9bb7
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac328c233e484a3faf9d71
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: asus-C436FA-Flip-hatch
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ac37b0233e484a3fafb497
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

