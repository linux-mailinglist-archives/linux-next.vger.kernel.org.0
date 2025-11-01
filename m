Return-Path: <linux-next+bounces-8780-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A2CC27604
	for <lists+linux-next@lfdr.de>; Sat, 01 Nov 2025 03:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72C373BB847
	for <lists+linux-next@lfdr.de>; Sat,  1 Nov 2025 02:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16FE1C8631;
	Sat,  1 Nov 2025 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="d4AxGrph"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C3E194A73
	for <linux-next@vger.kernel.org>; Sat,  1 Nov 2025 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761964212; cv=none; b=LXx7Y893sSGc1pw8l2+dXEklK398rPjJFuRBCZGQG/6VJWSg7AAhFdYJiAg/cDI1AoRD1koMks+SPyTajuGP9vZ3hCBTUrK44neLWOl/qb1ld8ur1PE7QIaEWD8LDtij6/7a7FNXyiB399/Y8AoKt+olbHWyxMZiOthYChwUUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761964212; c=relaxed/simple;
	bh=nNG0u45rJFrJoxcjJAe1dQqDsWErFJshQMozYLadsM4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Plk5rg7D6wQW9XxGDTsbJAvxo4AIiq8E6HoFX3QQ3TDEEuf3tM8t33vmIYuGXEQdPlsBgZ2kZRanbxdTm9Clwsoz94c2gnuJYlifB3a83ONYR3676+DGG9wVScq+I118eq0QmNo3VNTgVLxbjAFHDVof5ZqbPgVe3Sl1NGzULHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=d4AxGrph; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso2967848b3a.0
        for <linux-next@vger.kernel.org>; Fri, 31 Oct 2025 19:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1761964210; x=1762569010; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhj24wIpkbknBQZiGIJcNUXqturILnL21PayuKZ9v7Y=;
        b=d4AxGrphmYYYYKLFL71jDcnGum6vtJ8baNROThTPEt/wLBYnLQc+K1qQMiIbhQOoGJ
         rSZoHTkyOClOXH4bqOv2EJcEYRCBR06oR8nLs6vbOI/BcVapIChKlYldh0uHRXmxiKyK
         FQcOhzzNfQ9XfcEluTAifVNYNjv53Vynk+yOiGIOE9KYH2jSW/jk9S2SoMAaFG7iMyVX
         3ydPQULdeRQjqQhvI96NpUH7HoOZHZSK5dYXSn2CJoU1w/MUR0shdh2iF3Es9FycmQ1M
         A8b7aijJ+8U2YVwy6J1ATIyfAxvpZP6ZWaU/BY772dozYsdFeuJrKCXae8w3bUZT1C0g
         N0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761964210; x=1762569010;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rhj24wIpkbknBQZiGIJcNUXqturILnL21PayuKZ9v7Y=;
        b=fmx+5Ll7u/hflrND1kfmv5Sdh36d3LIG73pekY1zGkxLhBJRPQDf+fAAFGXSeD19Bh
         iUiS47MYyCMI/yJR5SBZQAQQrGaCuSQFWrDuiCkl2nhzlJN66tOSR4KORpCU+IbbwN8R
         3XHChZFLt2Ps+xs7/TDEidRRnK0bTmfyR89i01P0rj7BDaTr7R9Fumwqqj3PjTy0c2lT
         8ujJh4L/H0EQR7eObHG8y49jnbiddoDRQ4JRJfMKZuw9ircArvY4Te5k2x821iCR4sLn
         YnhVgAxn8/0VAyd7cI1/HivupPJNIN8RPjLI/UeB8qlFsLFVGuTPABGNTOwr8vpuiTcK
         kG7Q==
X-Gm-Message-State: AOJu0YxFOm7NWE2ijQt3t8mMGDyXgfxefaI+AxC5ixRl0e5Im+RYl52/
	V45jIqVSWO92PZmpUZHWoG5cnFgOOfWSharzmC0UazwXCVSVTtFHsPhHw5GeCIWQ4lIMziuL9um
	Vh/l+XhY=
X-Gm-Gg: ASbGncvC5J746IU3jfnGXbOArEeyLlEt/UeKsEEX4TaJrqstIyFwNim5i6tDphMe2Md
	4EE+vSOm1TkhRuOQzOaQqiWWrAiQupCHOb0w8S+7jW37X3bGOUzL5LRszROMIgvBCox4vd+tanD
	uKbQDQ23+LvHHQRKR3okcSOjbJFZSQh6ovaiU8Z8M0fABQAfpnQGY5uGAU4DFY4DGpdMTbxEBLA
	tNDtrBcwIJ9988+9pmvw3Ksbz1ePo93Ai22GzE1k1l1ffproAr63ReQDI/9NnKAZ3Ret0qMr+KA
	JT2uub5DxxhhVmw0nlHCclNZSBt5Ws8FUf16qnaT3xPlu0RIvqgulOaYuA95l2RYYrjMdfQDaNA
	JU5cNiutFfJrF/A/Fazg7uaRJk0H+dwMc3I1ZCiAN/E0xIKOL67wV9vohnjvybYY2IQDjcw==
X-Google-Smtp-Source: AGHT+IEGoOrH0iEPi6Y7pp4JB/LuIxMBhVQE4luqDKUom11AGmaTjNBy6aPGjxAUURYPT2+DhdWWrg==
X-Received: by 2002:a05:6a00:3c89:b0:7a2:7811:55c2 with SMTP id d2e1a72fcca58-7a7794c4f55mr7112848b3a.24.1761964210171;
        Fri, 31 Oct 2025 19:30:10 -0700 (PDT)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d77930sm3615189b3a.17.2025.10.31.19.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 19:30:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 01 Nov 2025 02:30:09 -0000
Message-ID: <176196420888.2102.13912513500291818571@efdf33580483>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/98bd8b16ae57e8f25c95d496fcde3dfdd8223d41/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
origin: maestro
test start time: 2025-10-31 09:40:20.554000+00:00

Builds:	   44 ✅   10 ❌    0 ⚠️
Boots: 	  221 ✅    6 ❌    0 ⚠️
Tests: 	10607 ✅ 4645 ❌ 4539 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:690493799df0fb426d148fde
      history:  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8
      last run: https://d.kernelci.org/test/maestro:690493799df0fb426d148f84
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:690493799df0fb426d148f5c
      history:  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:690493799df0fb426d148f92
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS

  No unstable tests observed.

### NEW BUILD ISSUES
- Issue: maestro:cd79512a03e4fd8760092dacf80363de08e082d1 | version: 1
  Build: maestro:6904853b9df0fb426d143b46
  Comment:  ./arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format in arch/riscv/kernel/vdso/vgettimeofday.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-10-31 09:48:09.031990+00:00
  Culprit: code


This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

