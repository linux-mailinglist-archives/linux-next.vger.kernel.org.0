Return-Path: <linux-next+bounces-4433-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC56D9AFC59
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 10:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA6A628323F
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 08:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4880718CBF8;
	Fri, 25 Oct 2024 08:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWil0F2u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA73418DF69;
	Fri, 25 Oct 2024 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729844412; cv=none; b=fR55bWxAnFOCB4mkGJuiFh+Zc1BBdUTbJvt+P+o+ies/SQnoK6dxYDnpVmL0kh20/ii2ze7OePYPuT046/dBZtPNflQTEXNfQzKqZNSVCvLdBr4FsxZ0RKMfEvSqLy44W7RbjgHRyDAULon5VQxERCofWJ92oGPYnif+l6bMh+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729844412; c=relaxed/simple;
	bh=bDnQwL/Ih+F9PSXbO0ueXaywlDMdaZlLBB8X+WWfmbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYn22+uslFJh9EEuLHuYr4EqGcIxvj4C6ULJK39ShwIUlK8trd23PRjnZh/fY8/7Qh10kw6GPKdin8rAyMWdc3TaEP8AeBRQP6EVOsRyhBpJ6CzrniiWlEOgZ0Ios5BdaB9Cwv0hr1JF3sr3E5eq+MOOwBa9gb7mSvEFiZ66kpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWil0F2u; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb599aac99so17837561fa.1;
        Fri, 25 Oct 2024 01:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729844408; x=1730449208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdVRII5Mj5ux2qDZBYaRbZSutIziGwFOkJ8/D0rX7dE=;
        b=jWil0F2u+bnl5b7fDEfMWdYWzTGZhQwVuX6vkeCFuHMHfYTHNwglg2IWrEmmZyF0U/
         LPWsV1Tej2ZdLTzVH99YulWeyB661kSbqg/9/P4nqnCTCa+f4/KWQdt+2YY+JT6oI5Xq
         l60uMAIpSj5ZbSszpcdbj4VFccCGW3vcfmYs83ISAseiVrgXNmxE3ntuAUFYFlWZnnfH
         pKAr/ePEYPgL5UgbbkD5nhH2GCs1gLPfsziJl7XK4CR8ygtdKIu7LahVSIZzPel2MVD0
         bjosRi6tcfmNOf0HRGplcwh0PILqv5ZjGRDiSdp5K/SohWzwUSGFW4yKyv/FqBE/70Yc
         uAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729844408; x=1730449208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdVRII5Mj5ux2qDZBYaRbZSutIziGwFOkJ8/D0rX7dE=;
        b=dL5C3o75DEcmooCHBmgOYDBP9WFRJ5/skzRC+WXeAydpW09jD7GC8bCszWgDwFXnGR
         QWxgexPB+g8eb42LNE2nOeoW+eHRqiiUamRZS5+Wik2y/D5a26VlIZOK4ydH8vih6UDj
         yDHPlvmIif9jDnznlueSKouTmHIKNzUu/kV0BLmEUEOT0PwnzpDQntvzFs4PK0rUxXJI
         xCGbCYFplyHzpJNBYImMCwl9bojs6ThhKCNwleS/ckFCmF30xa5vtnokEwG/9pSfdxNG
         qvNza0GuPs6Oz4Aq7Y1S3WldB0UuMKVZrgnT1IxEN810nIFNm0R6+zw0csQ6r9kxXlnZ
         WD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUi5dcZMmTa0f9q3GAmjZ+Mk3OeJq/SUpcsvzr6LVWpFHuTZ4bl83P2k1XdQiEltBZVVl3Ie5GsEgkm9A==@vger.kernel.org, AJvYcCXtJDL7rL1VBWWQQVFfFSbb4ZBLxWUL8raTc5K3tSdUo3K4rfqg107MmRHUTcYrtaSBXBEZ0Vb8z1JyhgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhGwmr7j+NOO6o/ytGlTdtIG4nsL7bRv3x53t+H+nc4yBQRFOB
	r0bh8BQAQ6jrR0ZYQVxmpeXU8eG6rHLLqSTS4pHDOkhfLBB1ZjpRkDnYlVq8Fx2JPHNCUOfvsCk
	fR2BVq2lWmjkYBTh5ia88aU+9xTqpqfgk
X-Google-Smtp-Source: AGHT+IHc55x2JN/ksg3o3E6iuIEkO8U63NycqqsYd3foD1CtawFaoYhqRObTBPGrL4AAFE6Wu+xAooSTfU3INVeOYI8=
X-Received: by 2002:a2e:610a:0:b0:2fb:2c43:f441 with SMTP id
 38308e7fff4ca-2fc9d5d40cfmr35199871fa.38.1729844407570; Fri, 25 Oct 2024
 01:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022173921.6fdbdd38@canb.auug.org.au> <ZxtAWopjlF9unBno@kernel.org>
In-Reply-To: <ZxtAWopjlF9unBno@kernel.org>
From: Su Hua <suhua.tanke@gmail.com>
Date: Fri, 25 Oct 2024 16:19:31 +0800
Message-ID: <CALe3CaAehCC6WOpCAGtMX3qsTqMc8jh3kn1Fz_m7_7_M6SMgfQ@mail.gmail.com>
Subject: Re: linux-next: boot failure after merge of the memblock tree
To: Mike Rapoport <rppt@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Appreciate everyone.

Mike Rapoport <rppt@kernel.org> =E4=BA=8E2024=E5=B9=B410=E6=9C=8825=E6=97=
=A5=E5=91=A8=E4=BA=94 14:57=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Stephen,
>
> On Tue, Oct 22, 2024 at 05:39:21PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the memblock tree, today's linux-next build
> > (powerpc_pseries_le_defconfig) failed my qemu boot test like this:
> >
> > mem auto-init: stack:all(zero), heap alloc:off, heap free:off
> > BUG: Unable to handle kernel data access on read at 0x00001878
> > Faulting instruction address: 0xc0000000004f00e4
> > Oops: Kernel access of bad area, sig: 7 [#1]
> > LE PAGE_SIZE=3D4K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeries
> > Modules linked in:
> > CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.12.0-rc4-06078-g367eab=
a2691a #1
> > Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x8=
01200 0xf000006 of:SLOF,HEAD pSeries
> > NIP:  c0000000004f00e4 LR: c000000000489df8 CTR: 0000000000000000
> > REGS: c0000000028cfae0 TRAP: 0300   Not tainted  (6.12.0-rc4-06078-g367=
eaba2691a)
> > MSR:  8000000002001033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 84000240  XER: 0000=
0000
> > CFAR: c0000000004f2c48 DAR: 0000000000001878 DSISR: 00080000 IRQMASK: 3
> > GPR00: c00000000204994c c0000000028cfd80 c0000000016a4300 c00c000000040=
000
> > GPR04: 0000000000000001 0000000000001000 0000000000000007 c000000002a11=
178
> > GPR08: 0000000000000000 0000000000001800 c00000007fffe720 0000000000002=
001
> > GPR12: 0000000000000000 c000000002a6a000 0000000000000000 0000000001885=
5c0
> > GPR16: c000000002940270 c00c000000000000 0000000000040000 0000000000000=
000
> > GPR20: 0000000000000000 ffffffffffffffff 0000000000000001 fffffffffffff=
fff
> > GPR24: 00c0000000000000 0000000000000000 0000000000000000 0000000008000=
000
> > GPR28: 0000000000000000 0000000000002a6b 0000000000000000 0000000000001=
000
> > NIP [c0000000004f00e4] set_pfnblock_flags_mask+0x74/0x140
> > LR [c000000000489df8] reserve_bootmem_region+0x2a8/0x2c0
> > Call Trace:
> > c0000000028cfd80] [c0000000028cfdd0] 0xc0000000028cfdd0 (unreliable)
> > c0000000028cfe20] [c00000000204994c] memblock_free_all+0x144/0x2d0
> > c0000000028cfea0] [c000000002016354] mem_init+0x5c/0x70
> > c0000000028cfec0] [c00000000204547c] mm_core_init+0x158/0x1dc
> > c0000000028cff30] [c000000002004350] start_kernel+0x608/0x944
> > c0000000028cffe0] [c00000000000e99c] start_here_common+0x1c/0x20
> > Code: 4182000c 79082d28 7d4a4214 e9230000 3d020137 38e8ce78 79284620 79=
2957a0 79081f24 79295d24 7d07402a 7d284a14 <e9090078> 7c254040 41800094 e92=
90088
> > ---[ end trace 0000000000000000 ]---
> >
> > Kernel panic - not syncing: Attempted to kill the idle task!
> >
> > Caused by commit
> >
> >   ad48825232a9 ("memblock: uniformly initialize all reserved pages to M=
IGRATE_MOVABLE")
> >
> > I bisected the failure to this commit and have reverted it for today.
>
> Apparently set_pfnblock_flags_mask() is unhappy when called for
> uninitialized struct page. With the patch below
>
> qemu-system-ppc64el -M pseries -cpu power10 -smp 16 -m 32G -vga none -nog=
raphic -kernel $KERNEL
>
> boots up to mounting root filesystem.
>
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 49dbd30e71ad..2395970314e7 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -723,10 +723,10 @@ static void __meminit init_reserved_page(unsigned l=
ong pfn, int nid)
>                         break;
>         }
>
> +       __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
> +
>         if (pageblock_aligned(pfn))
>                 set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVAB=
LE);
> -
> -       __init_single_page(pfn_to_page(pfn), pfn, zid, nid);

Indeed, when #ifdef NODE_NOT_IN_PAGE_FLAGS is defined, there is no
problem, and this is why my
test environment did not reveal any issues. However, when
NODE_NOT_IN_PAGE_FLAGS is not defined,
page_to_nid needs to use page->flags to get the node ID, which depends
on __init_single_page for initialization.

>  }
>  #else
>  static inline void pgdat_set_deferred_range(pg_data_t *pgdat) {}
>
> > --
> > Cheers,
> > Stephen Rothwell
>
>
>
> --
> Sincerely yours,
> Mike.

Sincerely yours,
Su

