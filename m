Return-Path: <linux-next+bounces-215-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303A3802BD3
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 08:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5D6A280CC9
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 07:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14BD8F61;
	Mon,  4 Dec 2023 07:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr1x1T23"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F12CB3;
	Sun,  3 Dec 2023 23:03:08 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bf69afa99so774968e87.3;
        Sun, 03 Dec 2023 23:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701673387; x=1702278187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFUgMaJywl8iY3lwSLQMnwve6+5rhLeubZxAaYe0ZgQ=;
        b=Mr1x1T236cj1C4MR/Ox1IUBgUuR+bcvT5E2Uj3AzvMP44oOxXttGq+7mBGVNitYYML
         hf+IfUGlolr8aB3ImXoOHSR8jU2FsJmM7m1fD31NUlkOhIEgCM0HYmm9ToosIqypF6qY
         dmfLHV4/WBoVUMZt2ao6yvGynRXZQSDjhpEOvELMt2y9T1M4UVLmFD8C1ABsqsv63imc
         NDJIKj604QwidHB/fe+yMDjXlBcSlg9tYr25slqUygXmeSiGOvZiWWw7j/gUE7UstiiW
         ietFuXNIApQL/HdPwhCswuoY/J2R94I8B+/dlG9icAw0jczxXsGZAZp8jDOETOoMWUMS
         rUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701673387; x=1702278187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFUgMaJywl8iY3lwSLQMnwve6+5rhLeubZxAaYe0ZgQ=;
        b=k1NUJfvYgvmrGcFEr3EnkHm0gqtZQfDPS6RWk41SYpjYEIMiy6D7YFF4zVmsUCa906
         3O5GrQW2ksVpTOzKfDY+CyRc7tdTkUw7kPh82KCfhPdl/dlH+aTXOQBjhrB6a+zOOKUc
         jqpnkHOG8lYlVScUA2hQW8/K15PyMniJa2EFFkB93UDLCqJbpTtz33cO8qhXnFir1P2/
         ua0/mOd4sgL3RQwEWINc/Dni+ZRdIRtbgQkZ3VYjBk0g5ZVlZcBsLFLJ4gLt926qtb8f
         WqBeWArSkQKwz7im8RPXIkqzHCSJ7ngwmfzsmF/ii9pImSio86lhFKq96casIyna6ZK+
         3i/w==
X-Gm-Message-State: AOJu0YyHYpH+rrZ4K6jv3EhaF7gSimQq/6Aewt1d3XfM3pDLZrLx5lv9
	A4jb9hBWFSJL/s/LPVf0e5phBHWXaGoSsi4JVKs=
X-Google-Smtp-Source: AGHT+IG4mSgeMfIz8vSVWdJ7/GRsWTH49RJsDEc7HjPDv3AQgSOA4PAfj1zvgmdjtB/v06TFUPvMCvSNub6v4d9vOzc=
X-Received: by 2002:a05:6512:baa:b0:509:8a5e:654d with SMTP id
 b42-20020a0565120baa00b005098a5e654dmr3481368lfv.21.1701673386539; Sun, 03
 Dec 2023 23:03:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201112918.294b40b1@canb.auug.org.au> <CAFULd4Yfh0=TkhoevuJP1kghP5VLFj2zP9av68_s2pez3n2iog@mail.gmail.com>
 <20231204150807.600c2f09@canb.auug.org.au>
In-Reply-To: <20231204150807.600c2f09@canb.auug.org.au>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 4 Dec 2023 08:02:56 +0100
Message-ID: <CAFULd4Y4n4uGy-pTc0PD6+-OytzGZHeJTPZ_CPJDq7VM7ChRdA@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 5:08=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi Uros,
>
> On Fri, 1 Dec 2023 13:09:45 +0100 Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > On Fri, Dec 1, 2023 at 1:29=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> > >
>  > After merging the tip tree, today's linux-next build (x86_64 allmodcon=
fig)
> > > produced these warnings:
> > >
> > > WARNING: modpost: EXPORT symbol "const_pcpu_hot" [vmlinux] version ge=
neration failed, symbol will not be versioned.
> > > Is "const_pcpu_hot" prototyped in <asm/asm-prototypes.h>?
> > > WARNING: modpost: "const_pcpu_hot" [arch/x86/kernel/msr.ko] has no CR=
C!
> > > WARNING: modpost: "const_pcpu_hot" [arch/x86/kvm/kvm.ko] has no CRC!
> >
> > My build doesn't produce any warnings. A defconfig + enabling kvm.ko as=
 module:
> >
> > ...
> >  AR      built-in.a
> >  AR      vmlinux.a
> >  LD      vmlinux.o
> >  OBJCOPY modules.builtin.modinfo
> >  GEN     modules.builtin
> >  MODPOST Module.symvers
> >  CC      .vmlinux.export.o
> >  CC [M]  arch/x86/kvm/kvm.mod.o
> >  CC [M]  fs/efivarfs/efivarfs.mod.o
> > ...
> >
> > Does the attached patch help? Or is there anything else I should do to
> > trigger the above problem?
>
> The patch does not help.  I am just doing an X86_64 allmodconfig build
> with CONFIG_WERROR=3Dn. gcc is
>
> $ x86_64-linux-gnu-gcc --version
> x86_64-linux-gnu-gcc (Debian 13.2.0-2) 13.2.0
>
> This is a cross build with a ppc64le host.

The warning is triggered by CONFIG_MODVERSIONS=3Dy and will be fixed in
a different way by the patch in [1].

[1] https://lore.kernel.org/lkml/20231203232017.994963-1-ubizjak@gmail.com/

Thanks,
Uros.

