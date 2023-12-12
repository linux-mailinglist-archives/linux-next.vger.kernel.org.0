Return-Path: <linux-next+bounces-353-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A8580E55B
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 09:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A41B4B20A47
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 08:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FB5179AC;
	Tue, 12 Dec 2023 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yH2jBSwi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF3DEA0
	for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 00:01:29 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so14979985e9.3
        for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 00:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702368088; x=1702972888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeYaPkYZV1gUI785r4n26WvSzflCnVMfe7xejKrvhGw=;
        b=yH2jBSwimfFNyIGLUWyUTYjjEtoyVRkXkG3gOZduV62s91oKAxbBkawkuvjtUtHHyv
         tFNAmmUG4XvLdeakHHt5dgs8oGRaE6h9VXRJATJe2P7Sv1Noq1LxZLSPZot8H+5DrRmx
         ByBdg4S9/xUQSlei8AWhfDxiGymdQvoCp1/B88gDjmnuDyNvU4yG+UmeASiCJIlEq/R9
         Q/LKRmjVZsRJ3TaTAKWJtRKnTLccA133IfkP7SY24zMq1kah5fj+SDssZkz7IISCVEuR
         FPtPGGGNAPLG/57dx18KvkWYTWnfWUuGjFKHPReH33JfYoi2Q0d6SklOkaSXJGzPhxgR
         AJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368088; x=1702972888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeYaPkYZV1gUI785r4n26WvSzflCnVMfe7xejKrvhGw=;
        b=H+mD8BEMI5wjBTQ15F/0Bq9u3tH+riWMH5etMS94SKC5SLFVhY9X1iuRFaKPgSjZ1U
         jyX6qf+8WvuM3Xf3EQSBuQ17kljQCeeCmXmC3cMuJeDaKBEHbwwet0g0VmBUErfsPErP
         53c/eBnNMl2HGqrxYp7bg9wb+Ij9zP4hktVbWdqbyPdazZ2BnjjUrwa+Xl5iIapCUkIq
         ZH7GeDBCMBwCwQdHaX4/kSyrdKnLErMmCwOvWUTxsXxkF7Y8tAGCPg1nnz4L4fJoJA5t
         YZ7sbZ5ZpAk9a5rX9iWI24qgeUx7X4FmE3rfMeXvEUPBQ4CVOOFsL8Unh8JtGdQbQczS
         j5GQ==
X-Gm-Message-State: AOJu0YzuppTTnCzVnRQebvphm/fKm+cPCMENC+F6DBEi6khnPOzPzU5/
	LDNDP5Ij0FIQca49wPpEEzErqbR6zjmciHJ/gun1eOkQgbv8HxDr
X-Google-Smtp-Source: AGHT+IFthsZWcAFKZ2O87HfQ853PVDauwWiX60VS5xQ0+k/2Rm3ww0q4uXdZGsXn0wGM3e/0uXgR2LhRggD6zLr6gKo=
X-Received: by 2002:a05:600c:3093:b0:40c:2b93:6a08 with SMTP id
 g19-20020a05600c309300b0040c2b936a08mr3205498wmn.16.1702368087940; Tue, 12
 Dec 2023 00:01:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211172504.058ad6b6@canb.auug.org.au> <9f0763c0-8175-4160-b72e-8e9e3aee42f8@infradead.org>
In-Reply-To: <9f0763c0-8175-4160-b72e-8e9e3aee42f8@infradead.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 12 Dec 2023 09:01:17 +0100
Message-ID: <CAHVXubjbVxEvL01uu_Cm-_R8oLddwc6fUaQYE_Bc+sBThTmvWA@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 11 (riscv32: patch.c)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Mon, Dec 11, 2023 at 10:17=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 12/10/23 22:25, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20231208:
> >
>
> on riscv32:
>
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: arch=
/riscv/kernel/patch.o: in function `.L4':
> patch.c:(.text+0xbe): undefined reference to `__exittext_begin'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: patc=
h.c:(.text+0xc2): undefined reference to `__exittext_begin'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: arch=
/riscv/kernel/patch.o: in function `.L12':
> patch.c:(.text+0xd2): undefined reference to `__exittext_end'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: patc=
h.c:(.text+0xd6): undefined reference to `__exittext_end'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: arch=
/riscv/kernel/patch.o: in function `.L15':
> patch.c:(.text+0x1ea): undefined reference to `__exittext_begin'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: arch=
/riscv/kernel/patch.o: in function `.L7':
> patch.c:(.text+0x1ee): undefined reference to `__exittext_begin'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: patc=
h.c:(.text+0x1fe): undefined reference to `__exittext_end'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: arch=
/riscv/kernel/patch.o: in function `.L22':
> patch.c:(.text+0x202): undefined reference to `__exittext_end'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: arch=
/riscv/kernel/patch.o: in function `__patch_insn_write':
> patch.c:(.text+0x410): undefined reference to `__exittext_begin'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: patc=
h.c:(.text+0x414): undefined reference to `__exittext_begin'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: patc=
h.c:(.text+0x424): undefined reference to `__exittext_end'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: patc=
h.c:(.text+0x428): undefined reference to `__exittext_end'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: arch=
/riscv/kernel/patch.o: in function `.L46':
> patch.c:(.text+0x53c): undefined reference to `__exittext_begin'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: patc=
h.c:(.text+0x540): undefined reference to `__exittext_begin'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: arch=
/riscv/kernel/patch.o: in function `.L48':
> patch.c:(.text+0x550): undefined reference to `__exittext_end'
> /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: patc=
h.c:(.text+0x554): undefined reference to `__exittext_end'
>
>
> Full randconfig file is attached.

We can ignore this one as CONFIG_XIP is enabled and we agreed at LPC
that I'll remove this soon.

Thanks,

Alex

>
> --
> #Randy
> https://people.kernel.org/tglx/notes-about-netiquette
> https://subspace.kernel.org/etiquette.html

