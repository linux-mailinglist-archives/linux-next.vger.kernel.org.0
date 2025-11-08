Return-Path: <linux-next+bounces-8899-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C98A8C424CD
	for <lists+linux-next@lfdr.de>; Sat, 08 Nov 2025 03:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5560018921FF
	for <lists+linux-next@lfdr.de>; Sat,  8 Nov 2025 02:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41542A55;
	Sat,  8 Nov 2025 02:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FbnRk7DC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED79288535
	for <linux-next@vger.kernel.org>; Sat,  8 Nov 2025 02:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762569038; cv=none; b=lRBG5yx7rrDRbT1F+BdWY83Ytecd0ayn1cNFzS19BQl2KYjx+zkS2eGg/2sqa8bge4PzfYBkbBjBZYoKUr8MtNj/K1d9vac5J0+F3HPQbFCMl3nDFto8CVXrQbjGsjf04qawOhL6Tf8dJSzgqOyEOhQC4L+ervBRlU8W2ah7a+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762569038; c=relaxed/simple;
	bh=KYuvA00U62gUxRCdl8jllhyK6BtKKb5T/CIR54LQXdU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ez45GtmNFOa7CvU8sLA3DhhgkLbKOfjEb6GUhOi3FdIOY4UpEeTDlcMgQhLlO5W2fFdWyzgEkiX0PH13AUNpu4UW94SY1hg/5aU2yp7vlsgRGDjn+bBSZxs1LQOxHyZlKgyk77YfiH7t3uXaZmBDJ/AGYIOWKjAtg2GO6s1PTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FbnRk7DC; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-341d07c020fso1719100a91.2
        for <linux-next@vger.kernel.org>; Fri, 07 Nov 2025 18:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1762569036; x=1763173836; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhVPMt1VY1j60+aGTaGduXsGjui7yoxl/28T5MIrPUM=;
        b=FbnRk7DCgiFStLzlZxAFGS3owxfSQOh6ZKTzvJUbU+XYDhUtlK9QpJiQBdHmE6EySP
         gB9qRNn23pH6hHyBJ1uptehXKqN0xzioScrc6vq5roMBFa3vs0NEBeaIMsd6GNbeJLzA
         fmTm5/sGUGkTvYwHgLoC2c1mM+mf0Mwr9J2aPCGykpla1gt2TKcI28fsRdit1P4f0+BD
         PCijDHLHPNE7RfBUZjL2Jlay/fXZ8djlO+uz4a7L4Nr/pq+RnFQGG/aMlTRioP1/YUDn
         u33M1hacd+/5BlSyHYg2dg1CTCOs5KyBRDqbNE/o28Ymqm5XI363Bt1SIFoVVuSIIlns
         VJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762569036; x=1763173836;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhVPMt1VY1j60+aGTaGduXsGjui7yoxl/28T5MIrPUM=;
        b=PkdSGOvu+pC+1faIkC+e7bkmYBhFix2KHu8C2ZkE6Jscv5DFmUT154Sg2SY1HSYG6H
         cXFlYDt5PNv7fkGXJS3ZkYcLPX4R8xGQAeHUjUHu06gSrYm875/rDAMZ0gvSVrZK/0EP
         9y48DBdue7qr0Q3i2O55vN8Eu0hE4KGW6aKY6VvcVcXAGS8xYMmqpTD4/CPvhFvCkvyG
         6H2LrZMuL5QXy+ljONzq8jp5lpOCNaPLMfU1skSlk9ZEcN5WRb9p66OUAwXVEHUqsrd6
         bE8cuYZzsub//zuHvg9cxvdI1vDyCQg2xexVNbBq+pyc5xCY9nzWG9oHlh9dVjzIDZ+e
         TZdA==
X-Gm-Message-State: AOJu0YwaSrtYymnQ5FQ9ip9zfzraZUdz4EGZhf1vvkTJiHMC080z5PzW
	ioxQiXWpjxTspO87K81Srlb10uh+u3s/5r7hOCdQpT9kJOl1JDxSuTZw94+hj4iETVO4o0TLYVl
	KR3ck
X-Gm-Gg: ASbGncuw7KdqkKWRrKJQ5pA0OJ3U11aGs8W7/mIS6+7+ljbTF0aglPt5rrQiRvTjk45
	BFFxW9u2HCJ2FUO7VC+zf69Kj0BAdOtvcB4xCOHrslsE85+S7w0RDE6ic5XXhHjrY7u9txLqk/0
	JonacS+gG5Znw31qa42reZUMgIInNZ6+rnBlA/hK7CKTHRTq9FdUjvUjRR46B45wOz2xTHeD/pl
	7RElO5zLHUjX1MZv26JO5lKAqXf3h996XQSFCAsJd/Ns0dVBmpugudSTDYX0XVThYPL+Dz7LyfS
	KmLN0jh84s+VmW4smrQUi/Gh98FsoxT4CuwFsHhaKWD4gTjmkeYsVz2kNeZHsKIAk7SMSsTXhqV
	gUgv4+vKLV+88qB4qQhs/Rc4GS0y3tidBomDglYVQ1DUOjCW0+jPXkGHRraiabSdbuN5prGRBPE
	fc5FEw
X-Google-Smtp-Source: AGHT+IGWFCPqw+PDYNriCWGfllTkXmgZgV6lagktvcUSevAtc7RRITvbxcCUGbVNcjU3oto95XBPig==
X-Received: by 2002:a17:90b:1d4c:b0:341:8c8b:b8e6 with SMTP id 98e67ed59e1d1-3436cb532eamr1764138a91.16.1762569035578;
        Fri, 07 Nov 2025 18:30:35 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a696d978sm10692648a91.11.2025.11.07.18.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 18:30:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 08 Nov 2025 02:30:34 -0000
Message-ID: <176256903419.5324.516086142652423382@efdf33580483>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/9c0826a5d9aa4d52206dd89976858457a2a8a7ed/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
origin: maestro
test start time: 2025-11-07 05:20:41.808000+00:00

Builds:	   40 ✅   12 ❌    0 ⚠️
Boots: 	   98 ✅   41 ❌    0 ⚠️
Tests: 	 9935 ✅ 4854 ❌ 3753 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:690d9814f21f07610dd5035f
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:690d9816f21f07610dd50372
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:690d9b67f21f07610dd51d8e
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:690d97f1f21f07610dd501ed
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:690da171f21f07610dd542df
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:690da96ef21f07610dd57f61
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:690daa34f21f07610dd581a8
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            



This branch has 12 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

