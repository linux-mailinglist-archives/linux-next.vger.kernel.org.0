Return-Path: <linux-next+bounces-4381-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3E19ABC12
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 05:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 395D51F240F4
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 03:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231824D8D1;
	Wed, 23 Oct 2024 03:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKEMTky8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5400B139E;
	Wed, 23 Oct 2024 03:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729653684; cv=none; b=kXbjrwzbgIJ1YAdug9UVIor3NP7SUhnKaj8WxkYEgwO2VtPcDWm2Wcyy5lKyvt3LtU1I0UxqF1KkMKFRAyfhU7EmZ82RETpYHhJod50KyE8nWZO+evYkI1Tq2cjF8QUhJAe7oauOyU7o3dsq2nYALWBKbT+OhQSKf34NCDkFSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729653684; c=relaxed/simple;
	bh=vfwq4CGbi67FZzd3D7/GwRIzh20AGEhmF5BAf1p3Q5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJyzux/By5NKWpSWDnBuWB15iPgOWR4FCuMSt4tym6Mtdokoho3KauaDJ0juQopFxYy2uJgCSqMPGjYh4BYtnA2uuMO9fnpdjQ2wPdTLR18QHfR64AR9P+PlEFOEB0mrh9WX4yzRxVdhiqTngHuAPKPigpl90LQJROaxQ5SXlpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKEMTky8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e8607c2aso6914940e87.3;
        Tue, 22 Oct 2024 20:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729653680; x=1730258480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvuQbPXYbODiGaP/9RXJzxAYeJ4UgG+zcj8XZ0RoIUw=;
        b=EKEMTky8T5JPVP/bkxTdu8vJ33peeS1Msl2o7UTRLPvdsrndO8r49Ln7SXIzFKJyEs
         FZKCoc1fFGvw8kYZlWgSrvIRFB2VIlfOajw/qdyrN4cSIvHnAQSX73crQB7fitiPresW
         qNIz8FhW2Hfjhm9PeOr4SzHsXdbSLBCYZN6O7f9niwLQlULVQlmLuPm5+hx90ehGNdej
         BSIKSCcyQ45jdHVnspNas9odwrX4SJ+F9StBioDKxH6AkG4mzERV3ntzD7+G52pMuTWd
         HVvBWCSj5rROAL6PTlYy0Phucz+B3KiHP3m4dZAbajrN86FAmXxs6FLaLAMUUvteC1tE
         QjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729653680; x=1730258480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvuQbPXYbODiGaP/9RXJzxAYeJ4UgG+zcj8XZ0RoIUw=;
        b=mVoDj/QKR3RefVwtsRtsOtnfjCjtEFMseu8crJfZRtTHpf6GLU1l9qp5GVqHHVI6mw
         KlRgcL6QvrMjckLat4DesYAy6BLezjU34fn+VNqwxHu2sR3Mrl7EyRQH67ldToK/SDgt
         5Ot/4HYrBheVYQS93rECD7bdm9uYIhf3l/ijrCBDojLf7mjwCBMfsl5zO51hT5bQpArB
         xWwUSAwWK0t8rYNUcp9qb9XqReSaU3C3SqXn4FR0R1OCbIip7wT1uWCYiCn061JFfacO
         4wzsdT6ZVPAtBUwcdB/OA+ReFJWKUL59bCcO6kyxGzRVcV1U+cuUJ2XdO81ujOaWS6yi
         Q2gg==
X-Forwarded-Encrypted: i=1; AJvYcCV8SyP06OcLpsen1Oit/5Qt274PLVucU6DBcPIIlN6w0VnL+1UWAUNEzhRf+CTdJCfqdfShaPkU+IqxXOE=@vger.kernel.org, AJvYcCVB108mb/Ml/p5KJVKAzTyl4fejyDmjyzv3QvUcRcspLp6advCM0g/gja4f7NI6rcQLcl/vNU+G4UWp2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8PpMBSojOVQ0BXYI4ApF/1pWScPb1B5amu0qecyR6+tGlnhU9
	qx8uaLay8M7d2bpus50z1ZopF9MwToDFGtiRSbTDCm/CIC2mYCLLrVAiZgWUmgomVMyebX76iOU
	56NTEHNs8bDQ8VNRHA1a6pjI/JkUMbNwI
X-Google-Smtp-Source: AGHT+IGt8sO9Z8qwn0a+Kj2m0DgEHQX/Nl5ZXhBzunT2/k50uKjkCqsiyYQMClt3FceQeZpFBQVDHDsMj6nPw7mmFVw=
X-Received: by 2002:a05:6512:1294:b0:539:fb49:c47d with SMTP id
 2adb3069b0e04-53b1a2f4619mr383855e87.12.1729653680173; Tue, 22 Oct 2024
 20:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022173921.6fdbdd38@canb.auug.org.au>
In-Reply-To: <20241022173921.6fdbdd38@canb.auug.org.au>
From: Su Hua <suhua.tanke@gmail.com>
Date: Wed, 23 Oct 2024 11:20:43 +0800
Message-ID: <CALe3CaBU=9Ck-euohNna2hYxYJBbvA=LrmG7qDHTEeQ2rt9XCA@mail.gmail.com>
Subject: Re: linux-next: boot failure after merge of the memblock tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Rapoport <rppt@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Stephen Rothwell <sfr@canb.auug.org.au> =E4=BA=8E2024=E5=B9=B410=E6=9C=8822=
=E6=97=A5=E5=91=A8=E4=BA=8C 14:39=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi all,
>
> After merging the memblock tree, today's linux-next build
> (powerpc_pseries_le_defconfig) failed my qemu boot test like this:
>
> mem auto-init: stack:all(zero), heap alloc:off, heap free:off
> BUG: Unable to handle kernel data access on read at 0x00001878
> Faulting instruction address: 0xc0000000004f00e4
> Oops: Kernel access of bad area, sig: 7 [#1]
> LE PAGE_SIZE=3D4K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeries
> Modules linked in:
> CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.12.0-rc4-06078-g367eaba2=
691a #1
> Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x801=
200 0xf000006 of:SLOF,HEAD pSeries
> NIP:  c0000000004f00e4 LR: c000000000489df8 CTR: 0000000000000000
> REGS: c0000000028cfae0 TRAP: 0300   Not tainted  (6.12.0-rc4-06078-g367ea=
ba2691a)
> MSR:  8000000002001033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 84000240  XER: 000000=
00
> CFAR: c0000000004f2c48 DAR: 0000000000001878 DSISR: 00080000 IRQMASK: 3
> GPR00: c00000000204994c c0000000028cfd80 c0000000016a4300 c00c00000004000=
0
> GPR04: 0000000000000001 0000000000001000 0000000000000007 c000000002a1117=
8
> GPR08: 0000000000000000 0000000000001800 c00000007fffe720 000000000000200=
1
> GPR12: 0000000000000000 c000000002a6a000 0000000000000000 00000000018855c=
0
> GPR16: c000000002940270 c00c000000000000 0000000000040000 000000000000000=
0
> GPR20: 0000000000000000 ffffffffffffffff 0000000000000001 fffffffffffffff=
f
> GPR24: 00c0000000000000 0000000000000000 0000000000000000 000000000800000=
0
> GPR28: 0000000000000000 0000000000002a6b 0000000000000000 000000000000100=
0
> NIP [c0000000004f00e4] set_pfnblock_flags_mask+0x74/0x140
> LR [c000000000489df8] reserve_bootmem_region+0x2a8/0x2c0
> Call Trace:
> c0000000028cfd80] [c0000000028cfdd0] 0xc0000000028cfdd0 (unreliable)
> c0000000028cfe20] [c00000000204994c] memblock_free_all+0x144/0x2d0
> c0000000028cfea0] [c000000002016354] mem_init+0x5c/0x70
> c0000000028cfec0] [c00000000204547c] mm_core_init+0x158/0x1dc
> c0000000028cff30] [c000000002004350] start_kernel+0x608/0x944
> c0000000028cffe0] [c00000000000e99c] start_here_common+0x1c/0x20
> Code: 4182000c 79082d28 7d4a4214 e9230000 3d020137 38e8ce78 79284620 7929=
57a0 79081f24 79295d24 7d07402a 7d284a14 <e9090078> 7c254040 41800094 e9290=
088
> ---[ end trace 0000000000000000 ]---
>
> Kernel panic - not syncing: Attempted to kill the idle task!
>
> Caused by commit
>
>   ad48825232a9 ("memblock: uniformly initialize all reserved pages to MIG=
RATE_MOVABLE")
>
> I bisected the failure to this commit and have reverted it for today.
>
> --
> Cheers,
> Stephen Rothwell

Thanks, I'd also like to set up the environment for testing; could you
please share the command line instructions or XML files used for
testing?

Sincerely yours,
Su

