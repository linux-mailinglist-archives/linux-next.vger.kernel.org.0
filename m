Return-Path: <linux-next+bounces-4434-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8199AFC9A
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 10:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B7EF1F22E3A
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 08:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCED1C9EDC;
	Fri, 25 Oct 2024 08:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsLuz/xj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E5D190046;
	Fri, 25 Oct 2024 08:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729845237; cv=none; b=ckmu9dfFZtNBIWG/tuKQ6hFVNQnAm6q9Hf6KOD9Luh1HekdTat7HgWStC09TJHH6TCTSqn3HGl4WySO3EQ9qEbx8r1bA2XakFH8Q5NZ7a71TZexojK/rULmtV+IoPlTHq92QFz4yISHQSi3EJdQt6YxOFQfPwH2GOXaQM/Rtw30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729845237; c=relaxed/simple;
	bh=VmH4GEz/1yumU6GDZb52FOM5yqDnQtSm2MRT9NfLCSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ML/ADVJI2zVItV0CoH/dI2TvXQRQU05/bLZyHUTDtzuBt9vBP9413w9BeSB5GVwBP8hJVeF8tgJQ6S2+wVrpcBqrKqxFFflpDOhIaB5LveIpK29McDr7AvKTGCMPgNDg2pfU8ZUn7maEwxIzoiNwwsVTDWnL78/ehtK4y4PoNUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsLuz/xj; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so19327601fa.3;
        Fri, 25 Oct 2024 01:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729845233; x=1730450033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8KmvyhTRLGny9eHJ6uOGMziMIWZWt5lh2kVoqa4hQs=;
        b=MsLuz/xjLU81TjiCrof0jDzGT8KsukNuueT9IbmbYkm76hJHn/uJ4BFnLRwq7okYkf
         t+qryTSexkfUXk67lL67LXmG1gH7g6s0nGhuqN8bui6KwkasElXLFJtiZSKd1vD0k7OP
         iOrqat9il0De8eBud+dEB2T3RNFt+Di1RNOQZ0N8sM3noHTrEhs/4U6T25V1ENKTCBAx
         dNI60q1Krw4l+4Cddb98xmLoK7yC5xdFrfH0qRTptAED57Xa5hheKmS2AiCg747ljwbr
         5NVdxlpSZmv+d0y73r7+0SbgYTKjQIzZawVYq/WCFxLrYbHy8e/LX9gfhtlLhesyV1Yd
         MrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729845233; x=1730450033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8KmvyhTRLGny9eHJ6uOGMziMIWZWt5lh2kVoqa4hQs=;
        b=A8U9be/7WJarplrUODkIGJt3jdK9tlod/bsh5EnsTksNI7dPwlXtOno3GwRwzkNy1y
         5481K+DkSmMWl9Bf0cpMnpw0z4ggTfX+VHLmlFmRJ7TKue3kAiiV5vnSkYwqXMroqAbj
         wrp43va3ZCVT6FZPeEQT20On9BOiyY44ik31Jj1+7TalUksHO51nKE4hwAmt2NZJootJ
         w6r3LyeNfrbz6jJg2uk7CzBBaPSpNuMCKAKmUoJQoy8FaPx18uaWb6jBNG0+htpnpTZX
         18NXFQae5ILGlJL+0cJO/PpeF+JtMNI7KIgURrHiUttdD1PUJMees5zgUTn0GfTFjeBq
         +Wfg==
X-Forwarded-Encrypted: i=1; AJvYcCU+w5S4U3VubLP+hiIbToahPcFISM9hoTntj0zsqSgLadOoBqp78S2NeHQBDlDQujJzeU+eW+KOranvBw==@vger.kernel.org, AJvYcCXdw8A7su+hD01sJ2DnIhlbAWdmfKf+auBdrVd7t+SpDS8XO6VA4XokXCKmplV7YGlykFOfwd7LwZYCbjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxXoQeFduyM7xvPbPX+V9fhU65DKGggWvKJJX4vZ3xknTxT6vI
	ZgMn4Dr1pdXf9IC7mdWxP5AnnjVUrkaqPcLhnmgsW+I9DdIVmielbBEa5Zoj2So4jSdnwqUXaYk
	W4xX/NjV/yQPRt4xV6XX3HATC8hg=
X-Google-Smtp-Source: AGHT+IENl8JjsOAnxskUlPP7ErvAicmucVdqNAW9jfEN7/CSpPor2wgtkYEkNHFlzF/5Ph03flJSJKcK5Yo6OCKfouY=
X-Received: by 2002:a2e:612:0:b0:2fa:dbf1:5b2d with SMTP id
 38308e7fff4ca-2fc9d38424cmr33423961fa.39.1729845232855; Fri, 25 Oct 2024
 01:33:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022173921.6fdbdd38@canb.auug.org.au> <ZxtAWopjlF9unBno@kernel.org>
 <CALe3CaAehCC6WOpCAGtMX3qsTqMc8jh3kn1Fz_m7_7_M6SMgfQ@mail.gmail.com>
In-Reply-To: <CALe3CaAehCC6WOpCAGtMX3qsTqMc8jh3kn1Fz_m7_7_M6SMgfQ@mail.gmail.com>
From: Su Hua <suhua.tanke@gmail.com>
Date: Fri, 25 Oct 2024 16:33:16 +0800
Message-ID: <CALe3CaDW9vWcrukmWP+tj-ToSUh8p6==goL+B3aiGvxBDg79Ww@mail.gmail.com>
Subject: Re: linux-next: boot failure after merge of the memblock tree
To: Mike Rapoport <rppt@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Su Hua <suhua.tanke@gmail.com> =E4=BA=8E2024=E5=B9=B410=E6=9C=8825=E6=97=A5=
=E5=91=A8=E4=BA=94 16:19=E5=86=99=E9=81=93=EF=BC=9A
>
> Appreciate everyone.
>
> Mike Rapoport <rppt@kernel.org> =E4=BA=8E2024=E5=B9=B410=E6=9C=8825=E6=97=
=A5=E5=91=A8=E4=BA=94 14:57=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi Stephen,
> >
> > On Tue, Oct 22, 2024 at 05:39:21PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the memblock tree, today's linux-next build
> > > (powerpc_pseries_le_defconfig) failed my qemu boot test like this:
> > >
> > > mem auto-init: stack:all(zero), heap alloc:off, heap free:off
> > > BUG: Unable to handle kernel data access on read at 0x00001878
> > > Faulting instruction address: 0xc0000000004f00e4
> > > Oops: Kernel access of bad area, sig: 7 [#1]
> > > LE PAGE_SIZE=3D4K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeries
> > > Modules linked in:
> > > CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.12.0-rc4-06078-g367e=
aba2691a #1
> > > Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0=
x801200 0xf000006 of:SLOF,HEAD pSeries
> > > NIP:  c0000000004f00e4 LR: c000000000489df8 CTR: 0000000000000000
> > > REGS: c0000000028cfae0 TRAP: 0300   Not tainted  (6.12.0-rc4-06078-g3=
67eaba2691a)
> > > MSR:  8000000002001033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 84000240  XER: 00=
000000
> > > CFAR: c0000000004f2c48 DAR: 0000000000001878 DSISR: 00080000 IRQMASK:=
 3
> > > GPR00: c00000000204994c c0000000028cfd80 c0000000016a4300 c00c0000000=
40000
> > > GPR04: 0000000000000001 0000000000001000 0000000000000007 c000000002a=
11178
> > > GPR08: 0000000000000000 0000000000001800 c00000007fffe720 00000000000=
02001
> > > GPR12: 0000000000000000 c000000002a6a000 0000000000000000 00000000018=
855c0
> > > GPR16: c000000002940270 c00c000000000000 0000000000040000 00000000000=
00000
> > > GPR20: 0000000000000000 ffffffffffffffff 0000000000000001 fffffffffff=
fffff
> > > GPR24: 00c0000000000000 0000000000000000 0000000000000000 00000000080=
00000
> > > GPR28: 0000000000000000 0000000000002a6b 0000000000000000 00000000000=
01000
> > > NIP [c0000000004f00e4] set_pfnblock_flags_mask+0x74/0x140
> > > LR [c000000000489df8] reserve_bootmem_region+0x2a8/0x2c0
> > > Call Trace:
> > > c0000000028cfd80] [c0000000028cfdd0] 0xc0000000028cfdd0 (unreliable)
> > > c0000000028cfe20] [c00000000204994c] memblock_free_all+0x144/0x2d0
> > > c0000000028cfea0] [c000000002016354] mem_init+0x5c/0x70
> > > c0000000028cfec0] [c00000000204547c] mm_core_init+0x158/0x1dc
> > > c0000000028cff30] [c000000002004350] start_kernel+0x608/0x944
> > > c0000000028cffe0] [c00000000000e99c] start_here_common+0x1c/0x20
> > > Code: 4182000c 79082d28 7d4a4214 e9230000 3d020137 38e8ce78 79284620 =
792957a0 79081f24 79295d24 7d07402a 7d284a14 <e9090078> 7c254040 41800094 e=
9290088
> > > ---[ end trace 0000000000000000 ]---
> > >
> > > Kernel panic - not syncing: Attempted to kill the idle task!
> > >
> > > Caused by commit
> > >
> > >   ad48825232a9 ("memblock: uniformly initialize all reserved pages to=
 MIGRATE_MOVABLE")
> > >
> > > I bisected the failure to this commit and have reverted it for today.
> >
> > Apparently set_pfnblock_flags_mask() is unhappy when called for
> > uninitialized struct page. With the patch below
> >
> > qemu-system-ppc64el -M pseries -cpu power10 -smp 16 -m 32G -vga none -n=
ographic -kernel $KERNEL
> >
> > boots up to mounting root filesystem.
> >
> > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > index 49dbd30e71ad..2395970314e7 100644
> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -723,10 +723,10 @@ static void __meminit init_reserved_page(unsigned=
 long pfn, int nid)
> >                         break;
> >         }
> >
> > +       __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
> > +
> >         if (pageblock_aligned(pfn))
> >                 set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOV=
ABLE);
> > -
> > -       __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
>
> Indeed, when #ifdef NODE_NOT_IN_PAGE_FLAGS is defined, there is no
> problem, and this is why my
> test environment did not reveal any issues. However, when
> NODE_NOT_IN_PAGE_FLAGS is not defined,
> page_to_nid needs to use page->flags to get the node ID, which depends
> on __init_single_page for initialization.
>
> >  }
> >  #else
> >  static inline void pgdat_set_deferred_range(pg_data_t *pgdat) {}
> >
> > > --
> > > Cheers,
> > > Stephen Rothwell
> >
> >
> >
> > --
> > Sincerely yours,
> > Mike.
>
> Sincerely yours,
> Su

Hi Mike
Could you please advise whether the fix for this issue should be
submitted by you or me
as a new patch, or should I submit a patch that adjusts the code
position, just like this:

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 4ba5607aaf19..5a8114fb02ae 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -723,6 +723,9 @@ static void __meminit init_reserved_page(unsigned
long pfn, int nid)
                        break;
        }
        __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
+
+       if (pageblock_aligned(pfn))
+               set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE=
);
 }
 #else

Sincerely yours,
Su

