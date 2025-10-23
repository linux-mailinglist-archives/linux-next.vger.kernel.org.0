Return-Path: <linux-next+bounces-8689-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5610BFEF07
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 04:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E5323A3896
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 02:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56ED1474CC;
	Thu, 23 Oct 2025 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="j8b76cA/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44911A3165
	for <linux-next@vger.kernel.org>; Thu, 23 Oct 2025 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761186615; cv=none; b=iSnJygbxzmYJKLvVhasukOZcL6wrnExcQVtCH6Kgud32kdJKHIPJEkWOWWBR1J0ROeM9/rltUle5pkqLb0TgZe6KRONvgp2f34HemRTLasi99i9uFpzuydOw+S+k2RwIdg0Q4dfG28woPEgH1dwIIJLfgI2zsm59rDGd5A7/JG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761186615; c=relaxed/simple;
	bh=oFjjUgRE1gMtPqGsn3DqxT2h87BS6R6lZMHimucMUSc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=k5uOI47RoAdHlTajpWSxyBfRkoYkJx+QkCABwlVZwSZ2DZvGbMVxmeUZTZmr1ZiCsHaGxhAwykSqk0G3i2HxfS28UOZ6S2x8Z09l5sdd8F5TD+2UTb2z+UhV6a2OthYGMWrXQC8xrhUtNzn+dpSQrUS6hhntgzhPJrQZy8pCHrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=j8b76cA/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33e27cda4d7so1516789a91.0
        for <linux-next@vger.kernel.org>; Wed, 22 Oct 2025 19:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1761186610; x=1761791410; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+659s2tpeXg2/9RMnqD3skF8l6kvm2zrztf7rTwBlE=;
        b=j8b76cA/bqpR120VJQlohgzTtmXnR3WVaA2tedObzxqpiQAa50SmMgg33uS7E/0jGu
         IT10tG5HmDMlDXIypejWiPlvmjq+euARtPSDVRD7QBc67bHt8TkevYqAg7cRRN3QpA5F
         XDmbkC1ye9D1z/Dp2zwF3CbLXrup1XJQpjzmCp/4Ckw6nOng9nm5p8cjByku/I4qUvUn
         NcF7ykk9BK2pQTZlL3LSbxpacwgLHLmpECGkTlzmyO6kH96feF0hSGYpMem1Bp/HqfWE
         XZEWJXC2DqhYOTTNkphWIyCWy8h5A/t8UCIvl6yUDglhAmGJnV2CH722vNGHUqxYUXOM
         8sXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761186610; x=1761791410;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F+659s2tpeXg2/9RMnqD3skF8l6kvm2zrztf7rTwBlE=;
        b=r1PQ1H7WRWHAZGKSuEadEDA7EG/smGqxYHzHfRXnCvdVu7jCeSMoV2M8vXqZ29BdBp
         pn5wE94ywYRCtb+uUbfIWSFeAKJzGuU0DveZrcg0Tyq9m7r3mL0Pap0LmVGx19rI8dtG
         Qymb9F5nthwB/99PLK0MYJPyVWd6ro7j5FJB+sfIDYR3Dhuc+az4qkdrupXkbFz8uw+2
         3PKrT7OJpeYLhIirGZRMdNTO1CFbq/cOFmVrrWaGcreFs+6MchkYUTLSjBOrSFtAsWBH
         PdAS9VfRCeG6+BpABfWhjllXeH3KjZw0ogrYn3vvxeRtLurWtv4O1yl9Jl20RKE8mnn7
         IQMg==
X-Gm-Message-State: AOJu0YxXWLOVOf5FijOeGhbj8JXHgIPzZS633ucClpyMJ149aAtvAEJr
	f0U1sf3dGiqAGETP+1ZxmmX2VCC28/He0RfdcufDVhM6hqSZx8oTIIiotKG/aAK8wjI=
X-Gm-Gg: ASbGncuBYV3dTKjm5TTECZpRY2k7ppOMnorNptsATL/9zBAbO0XX2kfZK0mirBKNW8W
	On0wNsVPn+2lvacuWMbHxzc6erKybJkYaOuo2EKMJUFVeeBa2IJ2u6sWSa0x8uMRSIQblMsurgw
	glbmAL5QMSe3fPfxcMPQFBSi26jAiR15nJz12PXaTLFpd++R2v87eCtPNr/whW1e4bA9IVS2XdM
	U3/9hS9HQA6HWslvU1XUvpD/bbEtbkV+WbqFPOQOxD31REEOfiNC1bGrU7Z+8gPa0vdYf/3tSBi
	C36deR1oGW4jWQaCEB/v0DcRWya88GO0FALo/hdbfKc9QbvTMPh+ENuiUPb0/3xAA1fldEhwqg5
	9yrpvOh5a0JKkbc7e70AAOXzOeq3WTQruCx8PkWgM+j+Az8N+HLjmMqD1s0YlX72zeUM1nw==
X-Google-Smtp-Source: AGHT+IFI2XXGVWkh+FgwWA4PnpoN4Qyg6nYlgXMiAsNm0yYrz0xRjx6b/Tb/oev2ZrtEeFE8MY8SjQ==
X-Received: by 2002:a17:90b:3812:b0:32e:15e9:2cbc with SMTP id 98e67ed59e1d1-33e905eec80mr4617133a91.5.1761186609855;
        Wed, 22 Oct 2025 19:30:09 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dfb568961sm3369188a91.1.2025.10.22.19.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 19:30:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - aaa9c3550b60d6259d6ea8b1175ade8d1242444e
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 23 Oct 2025 02:30:09 -0000
Message-ID: <176118660872.5727.7414824944860329251@15dd6324cc71>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/aaa9c3550b60d6259d6ea8b1175ade8d1242444e/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
origin: maestro
test start time: 2025-10-22 03:48:45.229000+00:00

Builds:	   44 ✅   10 ❌    0 ⚠️
Boots: 	  149 ✅    2 ❌    0 ⚠️
Tests: 	 6693 ✅  247 ❌ 1469 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kernelci_sleep
      last run: https://d.kernelci.org/test/maestro:68f86e919533132a189736d1
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68f86ea79533132a1897377c
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68f86fa59533132a18973b89
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68f859409533132a18970ab8
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68f86eaa9533132a1897379d
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68f87cf79533132a18976187
      history:  > ✅  > ❌  > ✅  
            

### NEW BUILD ISSUES
- Issue: maestro:764471d48b9e1faab06d96f79a325cdcf2a995b7 | version: 1
  Build: maestro:68f854869533132a189705c5
  Comment:  variable 'sqe' is uninitialized when used here [-Werror,-Wuninitialized] in io_uring/fdinfo.o (io_uring/fdinfo.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-10-22 04:01:58.895298+00:00
  Culprit: code


This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

