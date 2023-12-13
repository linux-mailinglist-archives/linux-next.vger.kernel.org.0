Return-Path: <linux-next+bounces-383-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B491181122E
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 13:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0745B20AB1
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 12:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407D42C185;
	Wed, 13 Dec 2023 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HR5wn3Vc"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2571C2943C
	for <linux-next@vger.kernel.org>; Wed, 13 Dec 2023 12:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243D0C433C7;
	Wed, 13 Dec 2023 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702472225;
	bh=5neyQLlIsWkVQ2qC/3BqHS/hcTbEBUuFcUcD3NBeG0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HR5wn3Vc92O0f9VH/KvOhlRbDK6cnTIzdbBfU7+Im7txS9/EYwh+f3J/O0TzyoblJ
	 7rElQ0qgoIssF7p525GEvCg5DL3fYjZEEuetWKZW4tPt7ISoXwa2G0w0VQI0Na6Vb7
	 +HScxFJgAr4LmbJ5CKhpzzm9yBPajUCkf+/TQVYK8tp1bYMZ00OqIymfOFhKyV/BQI
	 6NlzllRYkn2QD8WZ/KqfQ3lv8SWwrwEqg7ycvwerufxvI2e7/zZGxSS1JWDxQGDQyR
	 8WlDxQkrqzv0Egy1zNc1AmcsMvU31n7SPqHSLFxHoM6s21UPxtytLk0H+n9c6GXfw3
	 nyPKPtITtrC6Q==
Date: Wed, 13 Dec 2023 12:57:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: linux-next: Tree for Dec 11 (riscv32: patch.c)
Message-ID: <20231213-excretory-ashen-03a34f3a4c90@spud>
References: <20231211172504.058ad6b6@canb.auug.org.au>
 <9f0763c0-8175-4160-b72e-8e9e3aee42f8@infradead.org>
 <CAHVXubjbVxEvL01uu_Cm-_R8oLddwc6fUaQYE_Bc+sBThTmvWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="obwyZd8LQsMhiGve"
Content-Disposition: inline
In-Reply-To: <CAHVXubjbVxEvL01uu_Cm-_R8oLddwc6fUaQYE_Bc+sBThTmvWA@mail.gmail.com>


--obwyZd8LQsMhiGve
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 09:01:17AM +0100, Alexandre Ghiti wrote:
> Hi Randy,
>=20
> On Mon, Dec 11, 2023 at 10:17=E2=80=AFPM Randy Dunlap <rdunlap@infradead.=
org> wrote:
> >
> >
> >
> > On 12/10/23 22:25, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20231208:
> > >
> >
> > on riscv32:
> >
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L4':
> > patch.c:(.text+0xbe): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0xc2): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L12':
> > patch.c:(.text+0xd2): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0xd6): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L15':
> > patch.c:(.text+0x1ea): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L7':
> > patch.c:(.text+0x1ee): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0x1fe): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L22':
> > patch.c:(.text+0x202): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `__patch_insn_write':
> > patch.c:(.text+0x410): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0x414): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0x424): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0x428): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L46':
> > patch.c:(.text+0x53c): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0x540): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L48':
> > patch.c:(.text+0x550): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0x554): undefined reference to `__exittext_end'
> >
> >
> > Full randconfig file is attached.
>=20
> We can ignore this one as CONFIG_XIP is enabled and we agreed at LPC
> that I'll remove this soon.

I don't think we can (even if people hadn't sent patches yesterday for
XIP) act as if XIP being removed is a foregone conclusion.

--obwyZd8LQsMhiGve
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXmqHQAKCRB4tDGHoIJi
0v3JAQDasJk60e0AOa9BFldLhHllm/ZCvbLhi798Ft48nzn06AEAx1NxZQ4H+SZo
z8u48ofVkJagwI2H9MWYiHFrr32d0w0=
=hgAl
-----END PGP SIGNATURE-----

--obwyZd8LQsMhiGve--

