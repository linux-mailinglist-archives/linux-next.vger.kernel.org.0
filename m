Return-Path: <linux-next+bounces-318-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1831D80C1A6
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 08:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48F9F1C203A9
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 07:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7065E1F602;
	Mon, 11 Dec 2023 07:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbWeYfDe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29ACA9B;
	Sun, 10 Dec 2023 23:06:48 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54c77e0835bso5898079a12.2;
        Sun, 10 Dec 2023 23:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702278406; x=1702883206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2MEib+MwJnReuRpmTAL60gewi5yJRdPEiiZIiH6sIs=;
        b=kbWeYfDeQwNmQZ/EUodeZiwXdzODWgnjwoDFMTvMQZ6WbW2n7jTTfvfLavPnAEIDN4
         qYZkD2bXczI8p1/PuPfAAbxMwyPPLEDX2nAUnxoYe70Lbmkly4VAiGgF5XEZ6EwaKk9p
         YP5q1XV0XiQ6p6VnLvkXcN/FZnTjGPAU6NgPx52YIw0aQLpxuXKpva40nfEhyR/Lvauf
         mWHG7iwWbN6SdX7n/B21eJNAsAontSkLPLSr88HKyJX3J1Tz7FqllP/0KFXKEgoJoF9s
         ZL9wOJWi7HT9I3qVmsyExm5Ohk/LACly3c1CCtAQv3CC+iaUUdX19flUdqv93gEVqPyr
         GsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702278406; x=1702883206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2MEib+MwJnReuRpmTAL60gewi5yJRdPEiiZIiH6sIs=;
        b=Pz/tCv+SRncY33AHX975dJhZDBkd50O7ED5MdaHDTrM2FPVJRNvK6iYhpOhTkUVvKj
         T1rMx4+pVVGDiYofQJUQg01Kn5Gatx9uPSlWAhZ/DaztZI6BQe9j9Def3cH6J6Tnyghb
         50VrgGXiG8kw8vzHja1vyag/w0B94h1F3wQhmDAg6pdXjpUmGmDI9AL1pvkeHGQcb6tJ
         9dyOP93/R0TidS+naEXRG5IZ7x8vhZI5MIDHlMuwkieGEXOdAW4WWVgo9F8PeBeg0k54
         pifuagB6NB5JfM+OG9oYLWKQWZDtNwIct9pnxHc8Q4gB/087YCuHPQcY0mrhufaBWIB2
         ov+Q==
X-Gm-Message-State: AOJu0Yw7NC1TACWER1J3y22iEExR7Sg8MsYxAArSPKBq3+KWitBrrt/A
	Vdwmr5Nwsh9RTlnacZ4rNHc2YZ6HkSzMV+9q03o=
X-Google-Smtp-Source: AGHT+IF//nxtCvAma1TadxlfNQPlRR3CFEQ4xRj0CGPayT2SdFQ3qJP++BEu7p7l8iDwmIb5RHRpf0zbRWHN36j381c=
X-Received: by 2002:a50:9e6d:0:b0:54c:b175:87bf with SMTP id
 z100-20020a509e6d000000b0054cb17587bfmr2344684ede.2.1702278406336; Sun, 10
 Dec 2023 23:06:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201112918.294b40b1@canb.auug.org.au> <CAFULd4Yfh0=TkhoevuJP1kghP5VLFj2zP9av68_s2pez3n2iog@mail.gmail.com>
 <20231204150807.600c2f09@canb.auug.org.au> <CAFULd4Y4n4uGy-pTc0PD6+-OytzGZHeJTPZ_CPJDq7VM7ChRdA@mail.gmail.com>
 <20231211161946.2f151d13@canb.auug.org.au>
In-Reply-To: <20231211161946.2f151d13@canb.auug.org.au>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 11 Dec 2023 08:06:37 +0100
Message-ID: <CAFULd4Ysr_UxiE=jXoXMuJpzdzunNS=03tL2D0V+3zyr5tod+Q@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 6:19=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> On Mon, 4 Dec 2023 08:02:56 +0100 Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > On Mon, Dec 4, 2023 at 5:08=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> > >
> > > On Fri, 1 Dec 2023 13:09:45 +0100 Uros Bizjak <ubizjak@gmail.com> wro=
te:
> > > >
> > > > On Fri, Dec 1, 2023 at 1:29=E2=80=AFAM Stephen Rothwell <sfr@canb.a=
uug.org.au> wrote:
> > > > >
> > >  > After merging the tip tree, today's linux-next build (x86_64 allmo=
dconfig)
> > > > > produced these warnings:
> > > > >
> > > > > WARNING: modpost: EXPORT symbol "const_pcpu_hot" [vmlinux] versio=
n generation failed, symbol will not be versioned.
> > > > > Is "const_pcpu_hot" prototyped in <asm/asm-prototypes.h>?
> > > > > WARNING: modpost: "const_pcpu_hot" [arch/x86/kernel/msr.ko] has n=
o CRC!
> > > > > WARNING: modpost: "const_pcpu_hot" [arch/x86/kvm/kvm.ko] has no C=
RC!
> > > >
> > > > My build doesn't produce any warnings. A defconfig + enabling kvm.k=
o as module:
> > > >
> > > > ...
> > > >  AR      built-in.a
> > > >  AR      vmlinux.a
> > > >  LD      vmlinux.o
> > > >  OBJCOPY modules.builtin.modinfo
> > > >  GEN     modules.builtin
> > > >  MODPOST Module.symvers
> > > >  CC      .vmlinux.export.o
> > > >  CC [M]  arch/x86/kvm/kvm.mod.o
> > > >  CC [M]  fs/efivarfs/efivarfs.mod.o
> > > > ...
> > > >
> > > > Does the attached patch help? Or is there anything else I should do=
 to
> > > > trigger the above problem?
> > >
> > > The patch does not help.  I am just doing an X86_64 allmodconfig buil=
d
> > > with CONFIG_WERROR=3Dn. gcc is
> > >
> > > $ x86_64-linux-gnu-gcc --version
> > > x86_64-linux-gnu-gcc (Debian 13.2.0-2) 13.2.0
> > >
> > > This is a cross build with a ppc64le host.
>
> I am still seeing the warnings ...

The -v3 patch series that fixes this and the remaining sparse warnings
sits unreviewed for a week at [1].

I don't know why it is not being considered.

[1] https://lore.kernel.org/lkml/20231204210320.114429-1-ubizjak@gmail.com/

Thanks,
Uros.

