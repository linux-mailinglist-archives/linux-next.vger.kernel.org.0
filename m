Return-Path: <linux-next+bounces-7960-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E54B28A10
	for <lists+linux-next@lfdr.de>; Sat, 16 Aug 2025 04:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4985A5692CE
	for <lists+linux-next@lfdr.de>; Sat, 16 Aug 2025 02:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5B11C6BE;
	Sat, 16 Aug 2025 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="sZAFehHY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0293FA927
	for <linux-next@vger.kernel.org>; Sat, 16 Aug 2025 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755311421; cv=none; b=E2PnQlgewJpI2KgsNtc1tSGyboE4Hh+09QjzvlOd3xcf3l+8rKMmmGCFfQbdFE3Jy/iJsAMVzg/a9lzUGdkjOSOiMdmOZUTF/knFQQtHvCCBStoFR4OsOoUTf3/XpevtCWWpMx+2SZW4qFvToH1TH4obDnijFwlG1TZ5cqJX6AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755311421; c=relaxed/simple;
	bh=B1mOzMorHvhWNzzZoTFJl0dUwxkJ6vpHU8sCTn3mZAw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ESPe4p77IY5h7bLxnQJlYo8y9g+oKoSs/Zoh9zH9XVLA6mCBCsM5fXZvudQgtwDFgLs3LAJ3rBCVlpo3FeQoLj2ZWgB20QVSDVEuyMIa6Qv0Jo/ad0Wf89yAWOLi8OfpHMTsm33/9ZhfIG+vB5KPt8N/UifZYUPQJhXghmd4vzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=sZAFehHY; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-321cfa7ad29so2680543a91.1
        for <linux-next@vger.kernel.org>; Fri, 15 Aug 2025 19:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755311418; x=1755916218; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UNKcXPXx4k6lbd1TxvVTQqdBVEBQFwIpF1wpVJSpB8=;
        b=sZAFehHYtXsz4Zqp9lluTezkAJOqB7pKZlZR5/o3CpWXwPTSl4C/BibDsjXn/VzFEv
         Jg0Ihm45XjlrSFefFg6a6xC7sG+lqkkmKGF3ZTDJSvn2T6tYGVvCwK3BXA8Nf7pcKIvR
         /+xkxZ4Ob238tCDZEPQfteLYbEhuDWWJ/x0x5y/bbdDPadNlF5N7ypsRvShV2KijArDC
         ErvZVc36emYwh8Q0L8STQOKA9dMs+gg7EmPpeWScSc15+sL2lNF/LHfSRRIY/LDheZlD
         jcagn27msiWREH80LhsVNr7geP5M02RXRXczo/bqDXY2OYtXgiqJC+MeVtaKInreqN9K
         Y3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755311418; x=1755916218;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9UNKcXPXx4k6lbd1TxvVTQqdBVEBQFwIpF1wpVJSpB8=;
        b=AFOgvLW1gUypQIJoDlHwGdP74ehyGSBq5XdiZTAMmMmwfHtHtYgsFuTRSiX+qon2au
         k6s4f6yKK6POnsv4h8q8EZXc9TN/ch2YJhnDIVFvd2iXaXONL7Djgb/UvN+BzG3kHgma
         Dh30AtHJoOdyt+QYf+v3qPYUmoWSQtwqv1j9MjQGG18OHw5PopTPvHz6IFkWg3COLes7
         lSLXmZcsnOihOUCsPHsumrA/2IjUpYgm4fnbarQ9mhHeSkjo0DGS1M2tq3+aKFDZ7wnY
         3XiWqMn/HnHyDexWgOekrdmHQtkbu2vCOVyQYVB1a08RbFEJu86gAHgSaLuqd2PJYBoA
         bmKA==
X-Forwarded-Encrypted: i=1; AJvYcCVcStb6jkBTSLoZ3MpZBfGYsDlCL1PXRJ+1o4UsX/nqXyRW+j8O041UrAU5wyLOzYEtEgZwVQqmkyml@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50oHDauHaA+P5K6gC5bq85wj8RmMRBR94dOOGRPatOOfuOmxP
	KQb2iBW98nH2jrwk+9wc5rSlxt+8FcI2Um7WePrBuJTnAEuWNrRXLl96Iv3V/4Zv1HHbvkC9q6A
	yqrb8
X-Gm-Gg: ASbGncv8SQYQpf1d5/yYruekUBj0JAf1TEoTz5mHk4lQT1vglCKJJ9SoUvH8E3n9sY5
	VYYS4cHoriOt6rMTM/4x/WWIJTe0j3ZvfIoaPntAVyFe/yOm6pbCYfi1ZAZE9TrgRG/Z4ih+eeu
	oQhn7g5BMuCjmhqyybk00c2uwxifLpUT37oqmLkjH5vVI19YKNdFuetUe+KP6z3qUc9n34GFAka
	G4yBQMerOY8KvjqhgEUjTUj2iZdbr6mkvAJ6Ycw+SGr89DzjMdysFrhqg0RJpu1TJrlgtIx5Klh
	HlobGCUSdf5cPRCjQ5OiYPxNnzpAYYyFqkEmGHxvZzSpAOOh0qAxo8Pzi9UDauBykfbsPkvT6Ov
	+GZPZ6aZXOqd4zWOqHtdXsPI2TV0=
X-Google-Smtp-Source: AGHT+IF9EgfIZS+bxMAlNNvog6b7C8NkBo+e+48aqGYPupPuOKkRiKzy5IVZMO2JFwSeHPEHdoJNaw==
X-Received: by 2002:a17:90b:28d0:b0:321:90c0:bc62 with SMTP id 98e67ed59e1d1-323402f2115mr6020978a91.5.1755311418033;
        Fri, 15 Aug 2025 19:30:18 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32331184ee0sm5539231a91.29.2025.08.15.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 19:30:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 1357b2649c026b51353c84ddd32bc963e8999603
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 16 Aug 2025 02:30:17 -0000
Message-ID: <175531141668.276.6671945095574257034@16ad3c994827>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/1357b2649c026b51353c84ddd32bc963e8999603/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 1357b2649c026b51353c84ddd32bc963e8999603
origin: maestro
test start time: 2025-08-15 04:38:53.535000+00:00

Builds:	   59 ✅    1 ❌    0 ⚠️
Boots: 	   89 ✅    0 ❌   56 ⚠️
Tests: 	14538 ✅ 4750 ❌ 4822 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb67233e484a3f97f142
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: beaglebone-black
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec64c233e484a3f97e59a
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.acct (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec655233e484a3f97e5d4
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec656233e484a3f97e5d7
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.breakpoints (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec658233e484a3f97e5e3
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.capabilities (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec658233e484a3f97e5e6
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.clone3 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec659233e484a3f97e5e9
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.coredump (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec659233e484a3f97e5ec
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec65a233e484a3f97e5ef
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec65e233e484a3f97e608
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.fchmodat2 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec660233e484a3f97e614
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.futex (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec661233e484a3f97e617
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.kcmp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec661233e484a3f97e61a
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.proc (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec662233e484a3f97e623
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ptrace (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec662233e484a3f97e620
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.signal (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec664233e484a3f97e62c
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.timers (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec663233e484a3f97e626
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.tmpfs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec663233e484a3f97e629
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.vdso (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec664233e484a3f97e62f
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.gpio (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec01c233e484a3f97c801
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ipc (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec01d233e484a3f97c804
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.landlock (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec01d233e484a3f97c807
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.lsm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec01d233e484a3f97c80a
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.memfd (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec01e233e484a3f97c916
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.perf_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec01f233e484a3f97ca31
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ring-buffer (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec01f233e484a3f97ca34
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.rlimits (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec020233e484a3f97ca37
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.seccomp (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec021233e484a3f97ca4e
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.splce (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec020233e484a3f97ca3a
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.sync (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec021233e484a3f97ca3d
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.timens (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec021233e484a3f97ca40
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.ublk (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec022233e484a3f97ca55
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.uevent (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec022233e484a3f97ca58
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.user_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec023233e484a3f97ca5b
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: cd8180-orion-o6
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb5b233e484a3f97f0fb
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb6f233e484a3f97f16f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb76233e484a3f97f19a
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb7c233e484a3f97f1b1
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb8b233e484a3f97f1e6
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb9c233e484a3f97f222
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.signal (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecba4233e484a3f97f252
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecba2233e484a3f97f249
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.efivars (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdf1233e484a3f9809b5
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdf4233e484a3f9809bc
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ece01233e484a3f9809ee
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ece02233e484a3f9809f9
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx8mp-evk
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdfd233e484a3f9809dc
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb5f233e484a3f97f10c
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb6b233e484a3f97f158
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb72233e484a3f97f17f
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb80233e484a3f97f1c3
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb90233e484a3f97f1f7
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb62233e484a3f97f121
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb60233e484a3f97f112
  history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb6c233e484a3f97f15e
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb73233e484a3f97f187
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb83233e484a3f97f1c9
  history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb92233e484a3f97f1fe
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdfb233e484a3f9809d6
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689ed023233e484a3f983283
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec181233e484a3f97cce2
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec188233e484a3f97cd16
  history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec17e233e484a3f97ccd0
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec18c233e484a3f97cd28
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec17b233e484a3f97ccbe
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2c5233e484a3f984122
  history:  > ✅  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2cd233e484a3f984160
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2cf233e484a3f984172
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2d2233e484a3f984197
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec19a233e484a3f97cd8e
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec181233e484a3f97cce5
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec185233e484a3f97cd07
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec189233e484a3f97cd19
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec17f233e484a3f97ccd3
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec18c233e484a3f97cd2b
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec17c233e484a3f97ccc1
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec190233e484a3f97cd3d
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec193233e484a3f97cd4f
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2bc233e484a3f9840ef
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2bf233e484a3f984101
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2c3233e484a3f984113
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2d5233e484a3f9841ac
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: mt8192-asurada-spherion-r0
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec182233e484a3f97cce8
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec185233e484a3f97cd0a
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec189233e484a3f97cd1c
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec17f233e484a3f97ccd6
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8195-cherry-tomato-r2
- fluster.debian.v4l2.gstreamer_av1 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec194233e484a3f97cd58
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_av1_chromium (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec195233e484a3f97cd5b
  history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec197233e484a3f97cd67
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec199233e484a3f97cd88
  history:  > ❌  > ⚠️  > ⚠️  > ❌  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec199233e484a3f97cd8b
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec19c233e484a3f97cd9d
  history:  > ⚠️  > ❌  > ⚠️  > ❌  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec182233e484a3f97cceb
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec186233e484a3f97cd0d
  history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec18a233e484a3f97cd1f
  history:  > ✅  > ⚠️  > ⚠️  > ✅  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec180233e484a3f97ccd9
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec18e233e484a3f97cd31
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec17d233e484a3f97ccc7
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec191233e484a3f97cd43
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec194233e484a3f97cd55
  history:  > ❌  > ⚠️  > ⚠️  > ❌  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2b9233e484a3f9840df
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2bd233e484a3f9840f5
  history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2c4233e484a3f984119
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2c6233e484a3f98412b
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2d3233e484a3f9841a0
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2d6233e484a3f9841b2
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8365-genio-350-evk
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece1e233e484a3f980a99
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece4b233e484a3f980fa3
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8390-genio-700-evk
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece0c233e484a3f980a48
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece18233e484a3f980a80
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece1e233e484a3f980a9c
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
- kselftest.cpufreq (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecba7233e484a3f97f25b
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb88233e484a3f97f1dc
  history:  > ⚠️  > ❌  > ❌  > ❌  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece0d233e484a3f980a4b
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece18233e484a3f980a83
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece1f233e484a3f980a9f
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece25233e484a3f980aba
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece33233e484a3f980d17
  history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece3b233e484a3f980d32
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece2c233e484a3f980ad5
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece41233e484a3f980d4d
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece46233e484a3f980f8e
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece4c233e484a3f980fa9
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: qemu
- boot (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdeb233e484a3f9809ad
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: rk3288-rock2-square
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec648233e484a3f97e57c
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3399-gru-kevin
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece14233e484a3f980a6b
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece20233e484a3f980aa2
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece41233e484a3f980d50
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece47233e484a3f980f91
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece4d233e484a3f980fac
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: rk3399-rock-pi-4b
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ece1a233e484a3f980a89
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb64233e484a3f97f127
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb83233e484a3f97f1cd
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb93233e484a3f97f201
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3588-rock-5b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb64233e484a3f97f12a
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec19f233e484a3f97cdac
  history:  > ❌  > ⚠️  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2-Gst1-0.vp80-03-segmentation-04 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec4f3233e484a3f97e2e5
  history:  > ❌  > ❌  > ✅  > ❌  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec180233e484a3f97ccdc
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec183233e484a3f97ccee
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec186233e484a3f97cd10
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec17d233e484a3f97ccca
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_0_timer_17c20000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec28b233e484a3f97d2e3
  history:  > ⚠️  > ✅  > ✅  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec18e233e484a3f97cd34
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ed2d1233e484a3f984191
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-lazor-limozeen
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689ed025233e484a3f983292
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec1a1233e484a3f97cdb5
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec181233e484a3f97ccdf
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec184233e484a3f97cd01
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec187233e484a3f97cd13
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec18b233e484a3f97cd25
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec17e233e484a3f97cccd
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_0_timer_17c20000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689ec284233e484a3f97d20f
  history:  > ⚠️  > ✅  > ✅  
            
Hardware: stm32mp157a-dhcor-avenger96
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec64e233e484a3f97e5a3
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec657233e484a3f97e5e0
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ec65b233e484a3f97e5f8
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec01b233e484a3f97c7fe
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec01e233e484a3f97ca2e
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.zram (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ec024233e484a3f97ca5e
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: sun50i-a64-pine64-plus
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb61233e484a3f97f119
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdfc233e484a3f9809d9
  history:  > ❌  > ❌  > ⚠️  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb96233e484a3f97f207
  history:  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ece08233e484a3f980a24
  history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.uevent.uevent_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecf27233e484a3f981801
  history:  > ❌  > ✅  > ✅  > ❌  
            
- kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecf27233e484a3f981802
  history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h6-pine-h64
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecb66233e484a3f97f137
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: acer-chromebox-cxi4-puff
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdc3233e484a3f98084a
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: acer-cb317-1h-c3z6-dedede
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdca233e484a3f980887
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689ece50233e484a3f980fb8
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689ece59233e484a3f9810d3
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689ece66233e484a3f98129c
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689ece6c233e484a3f9812e2
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdd3233e484a3f9808d9
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689ece56233e484a3f980feb
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689ece6a233e484a3f9812c5
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689ece6c233e484a3f9812e7
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecde3233e484a3f980965
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecde3233e484a3f980968
  history:  > ⚠️  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: acer-R721T-grunt
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689ece57233e484a3f980fee
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: asus-C433TA-AJ0005-rammus
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdc4233e484a3f980853
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: asus-C436FA-Flip-hatch
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdc5233e484a3f980856
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecde3233e484a3f98096e
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdcd233e484a3f9808a2
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdcf233e484a3f9808c1
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecde7233e484a3f980989
  history:  > ⚠️  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecde4233e484a3f980974
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdc6233e484a3f98085f
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdc6233e484a3f980862
  history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.cpufreq.hibernate.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecf92233e484a3f982882
  history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: hp-11A-G6-EE-grunt
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689ece6b233e484a3f9812d5
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: hp-14b-na0052xx-zork
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689ece6e233e484a3f9812f3
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdde233e484a3f98093c
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689ece6e233e484a3f9812fc
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: hp-x360-14-G1-sona
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdce233e484a3f9808b5
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: lenovo-TPad-C13-Yoga-zork
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdc2233e484a3f980841
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecdd9233e484a3f980915
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ecde9233e484a3f98099b
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

