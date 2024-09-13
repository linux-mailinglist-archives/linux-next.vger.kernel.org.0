Return-Path: <linux-next+bounces-3834-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2209785BA
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 18:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21814B203A2
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 16:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0FA61FC4;
	Fri, 13 Sep 2024 16:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1lIKr8Ay"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6420856B72
	for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 16:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726244853; cv=none; b=RN9DoFno6Lq+1oFKITBQzpSRskm35JKAqvAH3RugoWX2Sbzye4lux94Ir457V7dSoEi3kLLLgKjobq8bTx2DBtq0JwsqKC7NZRqP1Ilkosrx439GFWiLgPMZfKc0IJSbxshRlXK1zw/u2Vn33eLU2E8EkTuqK10KU/AubnfX0uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726244853; c=relaxed/simple;
	bh=8h5Rfxoes1F/EQEOg2e1jm/KAtjsu5tZuD6b6E74r4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eia508Prn5WlbQkRxtJ/k0k7oAUokBgSkFmwqvmopC2qnsBpqAJ7zACgt0tofcJ9ft3FkUV9WH00v7quTSZinPL29V4yggz1Dy7/uOaqz9KCk6xhiEUc78v7A17waeC3uCRijxLEZQWU5QHgZ8QN/suHm8MOVB1dDixDipWuLoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1lIKr8Ay; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4581cec6079so289191cf.0
        for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726244850; x=1726849650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kaogzt0x83O50oW2Cdc8KsfEPIv2RHrKFooPdPcHuF0=;
        b=1lIKr8AyxHNKFxB554AF19Kd7F/bHOqYVm/pVuG+G0WrUVcZuqqCzq9KxHJfXdWqJp
         cGNvgw8gg25neqbex5UV34ycxw1WLIcmE6GfKsnv0iABDTaZBAjHKGYHm91kfSq6Eh55
         YEzW2DX2WJFTqNPrAZ480SCCFDriNj/8NguAiPbhHB/UxKW5c5DLJoGjSJ49iePULnCZ
         rCvAVpz27l0IM/ee0+s18oZWcS4T/YHEztinmwZB88EVUQ0YlRsM2VeLhmUWaMx9LL1o
         R1mntdJCnidd2wxb5fhh292QM9LqPd/tbqce61hgmOflFDg0564WrCKQr0DryT1hzS72
         a5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726244850; x=1726849650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kaogzt0x83O50oW2Cdc8KsfEPIv2RHrKFooPdPcHuF0=;
        b=USm9rimMTlk+FYymSwlW/kLvN0BCKRLj5xwNRR6el3EOhM76XT2EgiB5FVQ02KewHl
         Dj5uPKa7HOGi6JvorkgLmPyHLSe40Tksy3pekNpF8/bfSREzvvrkU+KIoeRpUuAIbXiQ
         pTjRXtjyUcr5VBIVN4I+eC8U7ejpWH6bA3Ej16v+vEsK857K5hi8EBuwetpfuyL9mDaw
         j6KlL3IOfEf2HpxS28qLr5jpiuOFAi2FNbEN35SS09hU0Fm/il/mJar7T5wpPz68htYX
         wyNR+2Lfkw0shG+8O8UU8qZPx15ImdzHv0MK+cFBdAk+ag1pMGqMr2JpA2VLM0HchMY+
         x8xg==
X-Forwarded-Encrypted: i=1; AJvYcCX6CQD0YqfqbnEXujsPUelJr7tYgWM8Xi4XG5c/1A82V/j6M5s7vle6Tct5fxFjYc8vsNjlTCoLZNEY@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDMGMU40+pbmYU5qkNLgXftg/lUMfSV+PZKSMobO5877x6Vlm
	/g5Ci0DOG1mtf49WyOxBGJfC7d9zjp998hnH1j4dfO+09lVpxo+Jfc6fwzSL739cXdhI5TuokAm
	VOUovy5sRhW9wZmbRX+pf5aNQtFv2UYGovndw
X-Google-Smtp-Source: AGHT+IFLIVO3GAQiV32AIRq5tRq8/+Y6XmNS4xK792rwOjota6Ua04VI9PjqMQ/wHusA5aDseJUdCQZv6B0+BHgZ16k=
X-Received: by 2002:a05:622a:4cc:b0:456:796b:2fe5 with SMTP id
 d75a77b69052e-45864512051mr7158501cf.9.1726244849858; Fri, 13 Sep 2024
 09:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913125302.0a06b4c7@canb.auug.org.au> <20240912200543.2d5ff757@kernel.org>
 <20240913204138.7cdb762c@canb.auug.org.au> <20240913083426.30aff7f4@kernel.org>
 <20240913084938.71ade4d5@kernel.org> <913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com>
In-Reply-To: <913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Sep 2024 09:27:17 -0700
Message-ID: <CAHS8izPf29T51QB4u46NJRc=C77vVDbR1nXekJ5-ysJJg8fK8g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To: christophe.leroy2@cs-soprasteria.com
Cc: Jakub Kicinski <kuba@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 9:13=E2=80=AFAM LEROY Christophe
<christophe.leroy2@cs-soprasteria.com> wrote:
>
>
>
> Le 13/09/2024 =C3=A0 17:49, Jakub Kicinski a =C3=A9crit :
> > On Fri, 13 Sep 2024 08:34:26 -0700 Jakub Kicinski wrote:
> >>> The second "asm" above (CONFIG_PPC_KERNEL_PREFIXED is not set).  I am
> >>> guessing by searching for "39" in net/core/page_pool.s
> >>>
> >>> This is maybe called from page_pool_unref_netmem()
> >>
> >> Thanks! The compiler version helped, I can repro with GCC 14.
> >>
> >> It's something special about compound page handling on powerpc64,
> >> AFAICT. I'm guessing that the assembler is mad that we're doing
> >> an unaligned read:
> >>
> >>     3300         ld 8,39(8)       # MEM[(const struct atomic64_t *)_29=
].counter, t
> >>
> >> which does indeed look unaligned to a naked eye. If I replace
> >> virt_to_head_page() with virt_to_page() on line 867 in net/core/page_p=
ool.c
> >> I get:
> >>
> >>     2982         ld 8,40(10)      # MEM[(const struct atomic64_t *)_94=
].counter, t
> >>
> >> and that's what we'd expect. It's reading pp_ref_count which is at
> >> offset 40 in struct net_iov. I'll try to take a closer look at
> >> the compound page handling, with powerpc assembly book in hand,
> >> but perhaps this rings a bell for someone?
> >
> > Oh, okay, I think I understand now. My lack of MM knowledge showing.
> > So if it's a compound head we do:
> >
> > static inline unsigned long _compound_head(const struct page *page)
> > {
> >          unsigned long head =3D READ_ONCE(page->compound_head);
> >
> >          if (unlikely(head & 1))
> >                  return head - 1;
> >          return (unsigned long)page_fixed_fake_head(page);
> > }
> >
> > Presumably page->compound_head stores the pointer to the head page.
> > I'm guessing the compiler is "smart" and decides "why should I do
> > ld (page - 1) + 40, when I can do ld page + 39 :|
> >
> > I think it's a compiler bug...
> >
>
> Would it work if you replace it with following ?
>
>         return head & ~1;
>

I was able to reproduce with the correct compiler version, and yes,
this fixes the build for me. Thanks!

Probably healthy to add UL, yes?

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 5769fe6e4950..ea4005d2d1a9 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const
struct page *page)
 {
        unsigned long head =3D READ_ONCE(page->compound_head);

-       if (unlikely(head & 1))
-               return head - 1;
+       if (unlikely(head & 1UL))
+               return head & ~1UL;
        return (unsigned long)page_fixed_fake_head(page);
 }

Other than that I think this is a correct fix. Jakub, what to do here.
Do I send this fix to the mm tree or to net-next?

--=20
Thanks,
Mina

