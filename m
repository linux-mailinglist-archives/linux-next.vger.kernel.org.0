Return-Path: <linux-next+bounces-384-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E536811301
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 14:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0E8E1C20C0D
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 13:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180402D049;
	Wed, 13 Dec 2023 13:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VNYSMCnd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3651F5
	for <linux-next@vger.kernel.org>; Wed, 13 Dec 2023 05:34:03 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-336378d3bfdso900881f8f.1
        for <linux-next@vger.kernel.org>; Wed, 13 Dec 2023 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702474442; x=1703079242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dyjir5JRDNINX6nR7/5ESizZ9tEUbuiCsuJQ4w7zFo=;
        b=VNYSMCndJbI1isqMiDw878AQfjF4wFwlqdOeoJfBLH2lM6DJ/l7uveaOCAL3zGoToX
         ZrLAE0ZiykHEEEiA3D7IVw03BuY2RozbuqgWuRZgw4ItnDYcp478Yt7GaZFKqYzqExvu
         3Fy6lin8b44qPqio2y//JGUGke8JPNQOxCxFJm+WeUSkLARDfBCVUhXk3TmkYsfDZh1G
         XlLD3YB/t+DKcFrTQBvIP8WRcS6EyUds9WlF52SZzblcNpnGSfPhnSkGhxrjcXVZcLA7
         jhbU1guqJCjc1C96Bb5J6Eofy+xvOcL7pNN2FQzFe89NaNPE6++7tnLiYV6IlBiqE/3j
         5n+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702474442; x=1703079242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dyjir5JRDNINX6nR7/5ESizZ9tEUbuiCsuJQ4w7zFo=;
        b=Om5U5v0/x473nKcJli0m/3+14CVC3HOpxMSqMJiezwAGnkTdQ8kYfTj2mQtCrDfYvt
         6aga5uOc4wBNVaIe6A14qDISGaJT5P7JPcrKRoXqynEGykJ9Z1qp0q4w0lTOaGlbdw7i
         aBG0wIQaQwXGP8KpV+ZqHKgLmkwpeHu5G4t3C4LRL4CVUWYolRvKn3VJCahnIeqrrpJC
         d7N/N6HA4bNRM8e/CZv1ZFqeYWwKX5YfHdc4n7MakeFNmQpBoOrWUBG59GCzkQTmSoV7
         XP9utVctXt9+wXNeZWkeNXUs8itKZuvOFIybWnaNSX8zJxqsy55RbYXD2f/wQ8je6/6d
         4BuQ==
X-Gm-Message-State: AOJu0YxXRz4+AAQ3IBHLfMV8VA+6RyEGHRDm/KrrSVTOJd3XiFx8k5g3
	7n8yhhDe0g6HQSqRjFkGmP3IuhXu10TrIUhZKdLMjw==
X-Google-Smtp-Source: AGHT+IFybgoQ6Al99rIKrMcsVnZxQR6oFoK6iWMIGdqOMI6Sp6BCx7NcNiQgT+gKVVCUUSRnONFO8oE8BX/RwIP3ftI=
X-Received: by 2002:adf:e884:0:b0:332:fa1b:9f8b with SMTP id
 d4-20020adfe884000000b00332fa1b9f8bmr3416809wrm.69.1702474442029; Wed, 13 Dec
 2023 05:34:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211172504.058ad6b6@canb.auug.org.au> <9f0763c0-8175-4160-b72e-8e9e3aee42f8@infradead.org>
 <CAHVXubjbVxEvL01uu_Cm-_R8oLddwc6fUaQYE_Bc+sBThTmvWA@mail.gmail.com> <20231213-excretory-ashen-03a34f3a4c90@spud>
In-Reply-To: <20231213-excretory-ashen-03a34f3a4c90@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 13 Dec 2023 14:33:50 +0100
Message-ID: <CAHVXubga7Q6X-zW_qztS2V_Z8TBp0gm2UV_GAj2O-5nn-_yCyA@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 11 (riscv32: patch.c)
To: Conor Dooley <conor@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 1:57=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Dec 12, 2023 at 09:01:17AM +0100, Alexandre Ghiti wrote:
> > Hi Randy,
> >
> > On Mon, Dec 11, 2023 at 10:17=E2=80=AFPM Randy Dunlap <rdunlap@infradea=
d.org> wrote:
> > >
> > >
> > >
> > > On 12/10/23 22:25, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > Changes since 20231208:
> > > >
> > >
> > > on riscv32:
> > >
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
arch/riscv/kernel/patch.o: in function `.L4':
> > > patch.c:(.text+0xbe): undefined reference to `__exittext_begin'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
patch.c:(.text+0xc2): undefined reference to `__exittext_begin'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
arch/riscv/kernel/patch.o: in function `.L12':
> > > patch.c:(.text+0xd2): undefined reference to `__exittext_end'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
patch.c:(.text+0xd6): undefined reference to `__exittext_end'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
arch/riscv/kernel/patch.o: in function `.L15':
> > > patch.c:(.text+0x1ea): undefined reference to `__exittext_begin'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
arch/riscv/kernel/patch.o: in function `.L7':
> > > patch.c:(.text+0x1ee): undefined reference to `__exittext_begin'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
patch.c:(.text+0x1fe): undefined reference to `__exittext_end'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
arch/riscv/kernel/patch.o: in function `.L22':
> > > patch.c:(.text+0x202): undefined reference to `__exittext_end'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
arch/riscv/kernel/patch.o: in function `__patch_insn_write':
> > > patch.c:(.text+0x410): undefined reference to `__exittext_begin'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
patch.c:(.text+0x414): undefined reference to `__exittext_begin'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
patch.c:(.text+0x424): undefined reference to `__exittext_end'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
patch.c:(.text+0x428): undefined reference to `__exittext_end'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
arch/riscv/kernel/patch.o: in function `.L46':
> > > patch.c:(.text+0x53c): undefined reference to `__exittext_begin'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
patch.c:(.text+0x540): undefined reference to `__exittext_begin'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
arch/riscv/kernel/patch.o: in function `.L48':
> > > patch.c:(.text+0x550): undefined reference to `__exittext_end'
> > > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: =
patch.c:(.text+0x554): undefined reference to `__exittext_end'
> > >
> > >
> > > Full randconfig file is attached.
> >
> > We can ignore this one as CONFIG_XIP is enabled and we agreed at LPC
> > that I'll remove this soon.
>
> I don't think we can (even if people hadn't sent patches yesterday for
> XIP) act as if XIP being removed is a foregone conclusion.

Ok, the fix is easy enough for me to send it right now, so I'll fix that :)

