Return-Path: <linux-next+bounces-394-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A16812C74
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 11:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00DCE281444
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 10:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEAA39FEE;
	Thu, 14 Dec 2023 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Db7xGouY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC037B2
	for <linux-next@vger.kernel.org>; Thu, 14 Dec 2023 02:05:58 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3333131e08dso8336242f8f.2
        for <linux-next@vger.kernel.org>; Thu, 14 Dec 2023 02:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702548357; x=1703153157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDsPjfWnGKr9KSejE8QyzgD6e/he63cgsRUn3ctxThw=;
        b=Db7xGouYcEMoxcm44D4SrilE4KswMFIx1AzAkd0GfowMOwZhdWr2W8qAKJILnexLeR
         vyatx3XTh8xMcbEj9oXAVN0RS6qZ0qHEEZXhF+LdlNGH5TbDd+yxLfbuOHg/XVNRbJNt
         pZzv8OZ77Q1ZUtSaCPhvKPdkW3NvU8rYoNXl0HUcZsYT6tdIBqeKnACI4d+cFxYDQxYk
         C2hEwkjXvClcb4kE8+o5ZIx/kDqQYSI/c8WFqYzkDSdn90ac7eY8A1nZwueMgRfwM6DF
         rx2xZ5YgelI1X3bz3gZkio91CKE/5KqDOAKw8A1tgyvve1S1wTYDMWksyRFOd/nY3zUg
         TSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548357; x=1703153157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDsPjfWnGKr9KSejE8QyzgD6e/he63cgsRUn3ctxThw=;
        b=RyAcm2s8L+v0ri9ItNInn8Uu1V5EGH23SAJf/T5lMgtAx+NHLVxNzKnOVTncK4DVJ7
         okbLDw5eGI5cjv/R7gbLDVUCv6fDCfpf7ey8dQhOUs9ZSqJ/AdZXKRGNwVnRjUY6tF8Q
         mThT/6ayZOou9HJqQlmCPAyqwmq/JO0zJUR0tHcE/5e4Wg3kXsVmSb4jShyl4W+o9uso
         6gDkuwoKgyTNMOlecl0CIjwmAGW/rrLegFY69EUJfX86APIQee4z9MZIHB5Q4JUlXk36
         gFrZ88ZemqOpGSQuuowvl8GTpas2fukkL++mvuBFJowvuf1L3WZjVJo7emAjUF8jUZFv
         PPnA==
X-Gm-Message-State: AOJu0YyWgcTZX4S0ZepT0OMa55ZXEIm+SbO0tw6RLmWGe9A557U5RBcV
	3fa1C1j9ONWnoTl5qF/7lH94Kb5ymT4owODgt1Zpjw==
X-Google-Smtp-Source: AGHT+IFEj1d/zLkTSnTJxcMNp0WFx5qH7ufZ2AUcgoEC8MazG17uK9uacSlHh7g+oQWF1dkQvaBGJsNH94VyLR3Ch7Q=
X-Received: by 2002:adf:e053:0:b0:333:2fd2:2f08 with SMTP id
 w19-20020adfe053000000b003332fd22f08mr4447760wrh.129.1702548357302; Thu, 14
 Dec 2023 02:05:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211172504.058ad6b6@canb.auug.org.au> <9f0763c0-8175-4160-b72e-8e9e3aee42f8@infradead.org>
 <CAHVXubjbVxEvL01uu_Cm-_R8oLddwc6fUaQYE_Bc+sBThTmvWA@mail.gmail.com>
 <20231213-excretory-ashen-03a34f3a4c90@spud> <CAHVXubga7Q6X-zW_qztS2V_Z8TBp0gm2UV_GAj2O-5nn-_yCyA@mail.gmail.com>
In-Reply-To: <CAHVXubga7Q6X-zW_qztS2V_Z8TBp0gm2UV_GAj2O-5nn-_yCyA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 14 Dec 2023 11:05:46 +0100
Message-ID: <CAHVXubhN3GQ1hu7uVof2RSByVzAGCeT_-_YvNpgaDOKuZL2fBw@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 11 (riscv32: patch.c)
To: Conor Dooley <conor@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 2:33=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> On Wed, Dec 13, 2023 at 1:57=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Dec 12, 2023 at 09:01:17AM +0100, Alexandre Ghiti wrote:
> > > Hi Randy,
> > >
> > > On Mon, Dec 11, 2023 at 10:17=E2=80=AFPM Randy Dunlap <rdunlap@infrad=
ead.org> wrote:
> > > >
> > > >
> > > >
> > > > On 12/10/23 22:25, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > >
> > > > > Changes since 20231208:
> > > > >
> > > >
> > > > on riscv32:
> > > >
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: arch/riscv/kernel/patch.o: in function `.L4':
> > > > patch.c:(.text+0xbe): undefined reference to `__exittext_begin'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: patch.c:(.text+0xc2): undefined reference to `__exittext_begin'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: arch/riscv/kernel/patch.o: in function `.L12':
> > > > patch.c:(.text+0xd2): undefined reference to `__exittext_end'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: patch.c:(.text+0xd6): undefined reference to `__exittext_end'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: arch/riscv/kernel/patch.o: in function `.L15':
> > > > patch.c:(.text+0x1ea): undefined reference to `__exittext_begin'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: arch/riscv/kernel/patch.o: in function `.L7':
> > > > patch.c:(.text+0x1ee): undefined reference to `__exittext_begin'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: patch.c:(.text+0x1fe): undefined reference to `__exittext_end'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: arch/riscv/kernel/patch.o: in function `.L22':
> > > > patch.c:(.text+0x202): undefined reference to `__exittext_end'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: arch/riscv/kernel/patch.o: in function `__patch_insn_write':
> > > > patch.c:(.text+0x410): undefined reference to `__exittext_begin'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: patch.c:(.text+0x414): undefined reference to `__exittext_begin'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: patch.c:(.text+0x424): undefined reference to `__exittext_end'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: patch.c:(.text+0x428): undefined reference to `__exittext_end'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: arch/riscv/kernel/patch.o: in function `.L46':
> > > > patch.c:(.text+0x53c): undefined reference to `__exittext_begin'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: patch.c:(.text+0x540): undefined reference to `__exittext_begin'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: arch/riscv/kernel/patch.o: in function `.L48':
> > > > patch.c:(.text+0x550): undefined reference to `__exittext_end'
> > > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld=
: patch.c:(.text+0x554): undefined reference to `__exittext_end'
> > > >
> > > >
> > > > Full randconfig file is attached.
> > >
> > > We can ignore this one as CONFIG_XIP is enabled and we agreed at LPC
> > > that I'll remove this soon.
> >
> > I don't think we can (even if people hadn't sent patches yesterday for
> > XIP) act as if XIP being removed is a foregone conclusion.
>
> Ok, the fix is easy enough for me to send it right now, so I'll fix that =
:)

The fix is here
https://patchwork.kernel.org/project/linux-riscv/patch/20231214091926.20343=
9-1-alexghiti@rivosinc.com/
and I asked Palmer to replace the v1 he already had in -fixes with
this new version, hopefully it will land in rc6.

Thanks,

Alex

