Return-Path: <linux-next+bounces-8080-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B457CB32675
	for <lists+linux-next@lfdr.de>; Sat, 23 Aug 2025 04:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B79491C239EA
	for <lists+linux-next@lfdr.de>; Sat, 23 Aug 2025 02:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039681FC104;
	Sat, 23 Aug 2025 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Mawkronu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2071519E97B
	for <linux-next@vger.kernel.org>; Sat, 23 Aug 2025 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755916217; cv=none; b=fHf7ogQpPv1iZ9Z8JBgcDtEur3mozaTPQj2ugBMs4Z+uCoArrI4449uQNfEf/LZFrQZ4oxNkTZHIh/g0CNhB4PEVOdSp/r7OldWdmSqD7KvXbSlXP785t/wXs0PrTZLBT0YtdJR07+VujiylyiWi7FmSSpjm37uGvUGdF2gDxxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755916217; c=relaxed/simple;
	bh=5o6+GHJiHAp+O+isshGZKy1D0GV0lm92TufV6eRe15U=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=kERB0j6JXhNM/13oEplvSqT5mKEGPp39FQ/0PZE32NgvxBF8lusx2MhC5vgCuGtE3jj9Kzg5Ubfz6N6gaNNDJi4JV84Jkl3vT6gacU8/ixUsDte4Av2Q4nL2y957tutsBy82cp/wipxpNnJau6OBBShMCxt7sjjcFT9DJ2i+4vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Mawkronu; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2460757107bso22750735ad.2
        for <linux-next@vger.kernel.org>; Fri, 22 Aug 2025 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755916213; x=1756521013; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YferKJ7fZrddWUwf61cDCzKlga244RUEUUM5OjxTnJo=;
        b=Mawkronuk+E0mLdVHb49W/gqu6fkrK4Ql+inci2MBFjTfvsiBZZ30eJ33FSTXfljMr
         1593/AyjqA+e1zKTeBtd/mJfIf8qsvP1ot4fEeJ+vwAWcxtFYWXpJrNCfDt4rkZCz5RG
         UJDq88pyKvlxG+epRhoOEkU15g5e8m2MjHizoN+xvM7gjYWU7A+C6nYQ+7rQfvAf+2m2
         dN8sy93DT9A/7kEo51oLl+Z9ZrwRf6E+6+dyPdero0MiVBpmiuMxXzRktYan4Jsqxl1N
         tb/HzcVD3A8Hd/ldNRRYZHIokUioXST+pbtf1ui9GhGdKTx4stLxFDMAwBOppSeCqZzJ
         AW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755916213; x=1756521013;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YferKJ7fZrddWUwf61cDCzKlga244RUEUUM5OjxTnJo=;
        b=DdWSr6loeayD4UwZXeUbcwgyvdgb1qFDUYtsArS8xa293LPds1ALMxO9bLHcYHqltT
         rvuQrDKMvAr/aDsiC7TYzj3Z92SGKq432LQ7oR7ddgS0cZ+d+xu8lHbrjzmhR6UCrhrE
         tx6EbdnkjqKypDx97+YCwHZaQh4N7XmSZ21LfBynCix6epxHinkOda4wYbnpDwqK46LF
         A0s3zr5uq1cQTBbS4JUcDJnAVbuGnEi/nlBzJ0ZKx3cXLgg0uu2sLx7XyYF9y7tUCc+k
         JvhvF6wz6f4XTi2Buj4QnrJRqFYoGATFT9wEIJPmVC+yeZwRepjcmKrDRcegL7qQHz+N
         xr1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6k6EMdnHVfpysdH6QCi5M1/GM06VNb8v3xNHOABMx+hkcX8Seyy3LBVUTh4ORolFO2v7SePiXso8b@vger.kernel.org
X-Gm-Message-State: AOJu0YySNj+bEbNvcVBUsQQnj2G6V6e0kFgHRTZr9Ub+ZlMpoEdKstRY
	OdIuyWledNr0jnYWe5LnnTggugjSIjj1vOxx2qpZg2ihihQyr8VJFwqrZfQqkSNUhj1vOgaZOWt
	KwUwy
X-Gm-Gg: ASbGncvpbvZ2MktYQ17LxL7LviL9pXBCjK3bFHr2yB1S2ha0Qzxizt7m4uFZmLO0TVL
	tU/WddwCRjSkYGVKPET2cZuGiKjZR1JoAD72zROOCMK1mH1UTBgEjvtxZ6AeTjhxEYKc3jaIFpf
	sjgXGvajTVtjwM60EnAfgKTY3g1cBuAnj+esb1N5BwXJHDPOxb1QyA/pWD5PulBfpqronjBOtRa
	eUfwYuinim/qzv7Pv12frAzAwzVggBTe1uqyDEGvt4RYkK3lSN+1gbx+a1pXWYkSWDCLV6BBEtH
	+Oi0yRKpIkeocRuRNTwHeM5PqTs7cNSovSGO0s5ZUMfYDO4HA7ggnF5RACOElQYcjFk6XYOtUxa
	PbB29dTWbza0Su9dE
X-Google-Smtp-Source: AGHT+IH/qgM2kiwhh1yQ2Ufo5HU2E5eaJlvFxkrmQ7lwkn09hKzWoB81+J/8XQEcODU5rtTwQwaf5g==
X-Received: by 2002:a17:902:c94c:b0:246:273:c694 with SMTP id d9443c01a7336-2462edac306mr82491075ad.12.1755916212882;
        Fri, 22 Aug 2025 19:30:12 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687b4f93sm9260005ad.58.2025.08.22.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 19:30:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 0f4c93f7eb861acab537dbe94441817a270537bf
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 23 Aug 2025 02:30:11 -0000
Message-ID: <175591621111.343.14126439130996389908@16ad3c994827>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/0f4c93f7eb861acab537dbe94441817a270537bf/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 0f4c93f7eb861acab537dbe94441817a270537bf
origin: maestro
test start time: 2025-08-22 06:50:42.027000+00:00

Builds:	   55 ✅    4 ❌    1 ⚠️
Boots: 	   82 ✅    3 ❌   56 ⚠️
Tests: 	11890 ✅ 4758 ❌ 3887 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8365-genio-350-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8225b233e484a3fa8afd4
  history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mt8390-genio-700-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8225c233e484a3fa8afd7
  history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mt8395-genio-1200-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8225d233e484a3fa8afda
  history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a85874233e484a3fa94153
  history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.uevent.uevent_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8597f233e484a3fa94384
  history:  > ✅  > ❌  > ❌  > ❌  
            
- kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8597f233e484a3fa94385
  history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
- kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_888000_bridge_8_aux-bus_panel (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d73233e484a3fa8919a
  history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_sound (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d73233e484a3fa89135
  history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-lazor-limozeen
- kselftest.dt.dt_test_unprobed_devices_sh_sound (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d72233e484a3fa89065
  history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8227a233e484a3fa8b075
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8b957233e484a3faa7483
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a85865233e484a3fa940f9
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a85867233e484a3fa94105
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.landlock (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8586c233e484a3fa94123
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.lsm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8586d233e484a3fa94126
  history:  > ✅  > ✅  > ❌  > ✅  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8586e233e484a3fa9412f
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8586f233e484a3fa94132
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.zram (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a85875233e484a3fa94159
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: bcm2837-rpi-3-b-plus
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8489d233e484a3fa90b36
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.proc (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a822a3233e484a3fa8b21e
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.proc.shardfile-proc (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a853b8233e484a3fa9354f
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.ptrace.shardfile-ptrace (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8533f233e484a3fa934b8
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: beaglebone-black
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81e75233e484a3fa89993
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.acct (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81eed233e484a3fa89ccb
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81ef4233e484a3fa89cd2
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f12233e484a3fa89ce4
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.capabilities (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f18233e484a3fa89ce7
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.clone3 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f1f233e484a3fa89cea
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.coredump (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f23233e484a3fa89cee
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f29233e484a3fa89cf1
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.fchmodat2 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f77233e484a3fa89edb
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f7e233e484a3fa89ede
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.kcmp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f85233e484a3fa89ee1
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mqueue (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f8b233e484a3fa89ee4
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.proc (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f96233e484a3fa89eea
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ptrace (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f92233e484a3fa89ee7
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f9e233e484a3fa89eee
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.tmpfs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81fa4233e484a3fa89f0a
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.vdso (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81fb0233e484a3fa89f14
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.gpio (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8219b233e484a3fa8a6b6
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ipc (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8219b233e484a3fa8a6b9
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.landlock (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8219c233e484a3fa8a6bc
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.lsm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8219d233e484a3fa8a6bf
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.memfd (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8219e233e484a3fa8a6c2
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a821a0233e484a3fa8a6c8
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ring-buffer (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a821a1233e484a3fa8a6cb
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.rlimits (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a821a1233e484a3fa8a6ce
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.seccomp (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a821a5233e484a3fa8a6db
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.splce (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a821a2233e484a3fa8a6d2
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.sync (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a821a3233e484a3fa8a6d5
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timens (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a821a4233e484a3fa8a6d8
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ublk (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a821a6233e484a3fa8a6de
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.uevent (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a821a7233e484a3fa8a6e1
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.user_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a821a8233e484a3fa8a6e4
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: cd8180-orion-o6
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82269233e484a3fa8b024
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82285233e484a3fa8b0aa
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8228c233e484a3fa8b0d9
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82291233e484a3fa8b0f9
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8229a233e484a3fa8b1de
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a822a1233e484a3fa8b212
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.signal (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a822a6233e484a3fa8b245
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a822a5233e484a3fa8b232
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.efivars (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a85864233e484a3fa940f6
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a85866233e484a3fa940fc
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8586e233e484a3fa9412c
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8586f233e484a3fa94135
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81e7d233e484a3fa899b1
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81efc233e484a3fa89cd5
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f2f233e484a3fa89d04
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f64233e484a3fa89eca
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx6q-sabrelite
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81e1d233e484a3fa896b5
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- ltp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a8209b233e484a3fa8a0de
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.cyclicdeadline (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a823df233e484a3fa8c027
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.cyclictest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a823e4233e484a3fa8c047
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a823e9233e484a3fa8c05f
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pmqtest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a8212a233e484a3fa8a577
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.ptsematest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a823e2233e484a3fa8c034
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.rtla-osnoise (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a821da233e484a3fa8aaf8
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.rtla-timerlat (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a821d8233e484a3fa8aaec
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.rt-migrate-test (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a821dd233e484a3fa8ab1a
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a82470233e484a3fa8c192
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a82484233e484a3fa8c1a3
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a82485233e484a3fa8c1bd
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: imx6q-udoo
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81e83233e484a3fa899b4
  history:  > ✅  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f04233e484a3fa89cd8
  history:  > ❌  > ❌  > ⚠️  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f35233e484a3fa89d0d
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
Hardware: imx8mp-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8226a233e484a3fa8b02b
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8227e233e484a3fa8b084
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82285233e484a3fa8b0ad
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82292233e484a3fa8b0fc
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8229a233e484a3fa8b1e1
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a85868233e484a3fa9410b
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8586b233e484a3fa9411a
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8226a233e484a3fa8b02e
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8227f233e484a3fa8b087
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82286233e484a3fa8b0b0
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82292233e484a3fa8b0ff
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8229a233e484a3fa8b1e4
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a85868233e484a3fa9410e
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8586b233e484a3fa9411d
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8226c233e484a3fa8b03d
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82280233e484a3fa8b08a
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82287233e484a3fa8b0b9
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82294233e484a3fa8b10f
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8229c233e484a3fa8b1f1
  history:  > ❌  > ⚠️  > ❌  > ⚠️  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82270233e484a3fa8b04f
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82281233e484a3fa8b08d
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a842a2233e484a3fa8fea2
  history:  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.capabilities (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8228d233e484a3fa8b0e3
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.clone3.shardfile-clone3 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a84613233e484a3fa90494
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8229c233e484a3fa8b1f4
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8226d233e484a3fa8b043
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82281233e484a3fa8b093
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82295233e484a3fa8b115
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8229d233e484a3fa8b1f7
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8586a233e484a3fa94114
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
Hardware: mt8365-genio-350-evk
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a82ffc233e484a3fa8da79
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83000233e484a3fa8da94
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83004233e484a3fa8dab3
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83008233e484a3fa8dacf
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83017233e484a3fa8db23
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a8301b233e484a3fa8db46
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83011233e484a3fa8db08
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8390-genio-700-evk
- kselftest.cpufreq (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a822a7233e484a3fa8b24b
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a822a8233e484a3fa8b255
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82297233e484a3fa8b1d2
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a822a0233e484a3fa8b206
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a82ffc233e484a3fa8da7c
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83000233e484a3fa8da97
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83005233e484a3fa8dab6
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83009233e484a3fa8dad2
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a8300d233e484a3fa8daed
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83017233e484a3fa8db26
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a8301c233e484a3fa8db49
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83012233e484a3fa8db0b
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83021233e484a3fa8db64
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83025233e484a3fa8db7f
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a8302a233e484a3fa8db9a
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8395-genio-1200-evk
- kselftest.cpufreq (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a822a8233e484a3fa8b252
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82298233e484a3fa8b1d5
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a822a0233e484a3fa8b209
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a82ffd233e484a3fa8da7f
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83001233e484a3fa8da9a
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83005233e484a3fa8dab9
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83009233e484a3fa8dad5
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a8300e233e484a3fa8daf3
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83018233e484a3fa8db29
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a8301c233e484a3fa8db4c
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83012233e484a3fa8db0e
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83021233e484a3fa8db67
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83026233e484a3fa8db82
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a8302a233e484a3fa8db9d
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: qemu
- boot (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a818f3233e484a3fa870fe
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: rk3399-gru-kevin
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a82ffd233e484a3fa8da82
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83026233e484a3fa8db85
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a8302b233e484a3fa8dba0
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: rk3399-rock-pi-4b
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a82ffe233e484a3fa8da85
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83002233e484a3fa8daa0
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82272233e484a3fa8b055
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82289233e484a3fa8b0c4
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82296233e484a3fa8b118
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8229d233e484a3fa8b1fa
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3588-rock-5b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82273233e484a3fa8b058
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: stm32mp157a-dhcor-avenger96
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81e8a233e484a3fa899b7
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f0c233e484a3fa89cdd
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f3d233e484a3fa89d10
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a81f71233e484a3fa89ed8
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8219a233e484a3fa8a6b3
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.mm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8219f233e484a3fa8a6c5
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.zram (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a821a9233e484a3fa8a6e7
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: sun50i-a64-pine64-plus
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8226e233e484a3fa8b049
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a84d5a233e484a3fa92028
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8386e233e484a3fa8f2d5
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8228a233e484a3fa8b0d0
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8229e233e484a3fa8b200
  history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a85870233e484a3fa94138
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.uevent.shardfile-uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8597f233e484a3fa94386
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.user_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a85875233e484a3fa94156
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.user_events.shardfile-user_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a85a8e233e484a3fa94823
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: sun50i-h6-pine-h64
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82276233e484a3fa8b064
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a83003233e484a3fa8daa6
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8195-cherry-tomato-r2
- fluster.debian.v4l2.gstreamer_av1 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81cf9233e484a3fa88f2f
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_av1_chromium (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d00233e484a3fa88f38
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d28233e484a3fa89017
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d4c233e484a3fa89034
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d52233e484a3fa8903f
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d69233e484a3fa89056
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d83233e484a3fa89214
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c12233e484a3fa8871a
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c3f233e484a3fa8883f
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c6e233e484a3fa8893b
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81be0233e484a3fa88434
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c99233e484a3fa88985
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81bb5233e484a3fa881af
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81cc3233e484a3fa88e32
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81cf1233e484a3fa88f2c
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822ab233e484a3fa8b318
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822af233e484a3fa8b32c
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822b2233e484a3fa8b341
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822b5233e484a3fa8b353
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822b7233e484a3fa8b3b4
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822bf233e484a3fa8b3f8
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822c1233e484a3fa8b40d
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822ba233e484a3fa8b3c6
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822c4233e484a3fa8b422
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822c7233e484a3fa8b434
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822ca233e484a3fa8b4fb
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81bf9233e484a3fa8869a
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c29233e484a3fa887ff
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c58233e484a3fa8885f
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81bca233e484a3fa8828a
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c83233e484a3fa8895c
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822aa233e484a3fa8b2c5
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822ad233e484a3fa8b323
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822b0233e484a3fa8b338
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822b3233e484a3fa8b34a
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822b6233e484a3fa8b3ab
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822bc233e484a3fa8b3d3
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822c0233e484a3fa8b404
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822b9233e484a3fa8b3bd
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822c3233e484a3fa8b416
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822c5233e484a3fa8b42b
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822c9233e484a3fa8b43d
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8186-corsola-steelix-sku131072
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d12233e484a3fa89006
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d3b233e484a3fa8901d
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d5a233e484a3fa89048
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81d72233e484a3fa89129
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c01233e484a3fa886dd
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c31233e484a3fa88802
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c5e233e484a3fa88926
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81bd1233e484a3fa8829d
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c8b233e484a3fa88968
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81ba7233e484a3fa88199
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81cb6233e484a3fa88c61
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81ce1233e484a3fa88f1c
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822ab233e484a3fa8b312
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822ae233e484a3fa8b326
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822b1233e484a3fa8b33b
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822b4233e484a3fa8b34d
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822b6233e484a3fa8b3ae
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822bc233e484a3fa8b3e5
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822c0233e484a3fa8b407
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822b9233e484a3fa8b3c0
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822c3233e484a3fa8b41c
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822c6233e484a3fa8b42e
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822ca233e484a3fa8b452
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81db7233e484a3fa89532
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c1a233e484a3fa887eb
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c47233e484a3fa88845
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81e24233e484a3fa896ba
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81e25233e484a3fa89777
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81e4a233e484a3fa89897
  history:  > ✅  > ❌  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822c4233e484a3fa8b425
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81dca233e484a3fa89545
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c21233e484a3fa887f2
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81c4f233e484a3fa8884e
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81f3d233e484a3fa89d12
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81f3d233e484a3fa89dd1
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a81fd5233e484a3fa8a03a
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a822b8233e484a3fa8b3ba
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81dae233e484a3fa8951f
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a820ca233e484a3fa8a142
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a820ca233e484a3fa8a143
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8210d233e484a3fa8a336
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a8210d233e484a3fa8a3ec
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a82105233e484a3fa8a31a
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: acer-cb317-1h-c3z6-dedede
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81cca233e484a3fa88e35
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81cca233e484a3fa88ef4
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81cbc233e484a3fa88d63
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a82351233e484a3fa8ba71
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a82364233e484a3fa8bb14
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a82368233e484a3fa8bb2c
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81adb233e484a3fa8773a
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81adb233e484a3fa878ba
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81a70233e484a3fa8740e
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81a71233e484a3fa874fe
  history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81bd3233e484a3fa8829f
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81bd3233e484a3fa8835e
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81b6b233e484a3fa87ed3
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81c5d233e484a3fa88861
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81c5d233e484a3fa88920
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81cac233e484a3fa88c53
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: acer-R721T-grunt
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a8234e233e484a3fa8ba5f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a82358233e484a3fa8baaf
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a82365233e484a3fa8bb1a
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: asus-C433TA-AJ0005-rammus
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81aaa233e484a3fa8757a
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81aab233e484a3fa87639
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81b5e233e484a3fa87dd3
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: asus-C436FA-Flip-hatch
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81e61233e484a3fa898bb
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81e62233e484a3fa8996c
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81ea0233e484a3fa89aa7
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a818d2233e484a3fa86fe6
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81aab233e484a3fa8763e
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81aab233e484a3fa876ff
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81b2c233e484a3fa87b4b
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81aa8233e484a3fa87571
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81b32233e484a3fa87b5a
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81b32233e484a3fa87c12
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81a52233e484a3fa873ce
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81c1a233e484a3fa88726
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81c1a233e484a3fa887e5
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81b7d233e484a3fa88000
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81cc0233e484a3fa88d6a
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81cc0233e484a3fa88e29
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81dae233e484a3fa8951a
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81a56233e484a3fa873d8
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81bc8233e484a3fa881c5
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81bc8233e484a3fa88284
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81bf5233e484a3fa88694
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a82369233e484a3fa8bb39
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: hp-14b-na0052xx-zork
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81ba3233e484a3fa88188
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81d0b233e484a3fa88f41
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81d0c233e484a3fa88fff
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81d9a233e484a3fa89411
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81d8c233e484a3fa89225
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81d8c233e484a3fa892e3
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81ddd233e484a3fa89652
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a82354233e484a3fa8ba8a
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a82367233e484a3fa8bb29
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81b00233e484a3fa879d2
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a818d7233e484a3fa87010
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81adb233e484a3fa87737
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81adb233e484a3fa878af
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a818f0233e484a3fa870e8
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: hp-x360-14-G1-sona
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a818d4233e484a3fa86ff5
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81d6b233e484a3fa89058
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81ca9233e484a3fa88a92
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81ca9233e484a3fa88b51
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81c9c233e484a3fa88a77
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a82367233e484a3fa8bb26
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81bda233e484a3fa8836f
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81bda233e484a3fa8842e
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a81bf1233e484a3fa88541
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

