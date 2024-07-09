Return-Path: <linux-next+bounces-2894-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C67F92BB14
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 15:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDF2F284D37
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 13:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C1815F402;
	Tue,  9 Jul 2024 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eNDisifI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDD015575C;
	Tue,  9 Jul 2024 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720531763; cv=none; b=JpGLa6ebki496wpkMDDJ3jC3xhRFPtTsKxwhOl89D+MHIKeoJyr2GI3U8iQRQXjAZdpPAZW67x9sDnyJubB09oFv+hY6TiYU3sDphLPI0s974eqedDQRZmO1tBb74qRqEess3gpE94vYTJZexeDxb9+e7YE+bnXo3xWVVuWu11w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720531763; c=relaxed/simple;
	bh=KUMM/Y6Cr3JlVVQc0TPJ5+fE2qtpm+zVw5CjYuV9kfw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjYsej1/LBRBMY9IfSqxX+kzCu/VxQskjbtfLxPjYLvTtNiY7R9FytJPMkjqZcCJwqxgNcAIYoy41Ny1QTYRhk7GcrVabLWX2az8vItYamzYcEWJWC4ihPlLq/u3dhQ0I7qTpnSDjLgfdLg6IJZLH+URELBwYwCrARpM47QcoHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eNDisifI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720531759;
	bh=VmVJZsHAQJgYIEEqsBkQ/q4o+ZHXxEHrOveklUFiGuY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eNDisifI9FqwYzkTZgGPITOPnmeqSRHyWlKj+w7LNoHmDYS195OYsFYi8v94KlMZI
	 csXZLRnd+92vr5Mqqeyxuj2NIFgP2AAYTmJmS//HH2oTEoI4S73AV1icBX7CYO1QbC
	 gBxHWocLzTgSqgtPw35ymw/yWHcjVBbSQZ1g5NKSYjElUTHPKMowcPm2AErB9gLzpH
	 GWaJsljYj9Oil1+kecgtqzC/6mVt82XYqKeHt3hynS9oru3WNxKaXPgoU9Au7r9jDK
	 laxy5vD/KpznivknU6ZU//Iazrd+jWa+Lm3mYcMBoNY/kdIeprLVNEmOUkTXADmWTh
	 UI/V9DFqeRpHg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJMK94jrqz4w2P;
	Tue,  9 Jul 2024 23:29:17 +1000 (AEST)
Date: Tue, 9 Jul 2024 23:29:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Arnd Bergmann" <arnd@arndb.de>, "Rob Herring" <robh@kernel.org>
Cc: "Olof Johansson" <olof@lixom.net>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Paul Walmsley" <paul@pwsan.com>, ARM
 <linux-arm-kernel@lists.infradead.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the devicetree tree
Message-ID: <20240709232916.270d9927@canb.auug.org.au>
In-Reply-To: <f2ceee62-2612-42d1-b727-2f087acc6785@app.fastmail.com>
References: <20240709164618.69cfcfad@canb.auug.org.au>
	<CAL_JsqLmm6Da=4G9cJfAtKJB5j_dfbTywRRwHMKZyf3J7SAxfg@mail.gmail.com>
	<f2ceee62-2612-42d1-b727-2f087acc6785@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uG0ovzMaMlpMnt5a/gDqhBe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uG0ovzMaMlpMnt5a/gDqhBe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 09 Jul 2024 15:15:44 +0200 "Arnd Bergmann" <arnd@arndb.de> wrote:
>
> On Tue, Jul 9, 2024, at 14:42, Rob Herring wrote:
> > On Tue, Jul 9, 2024 at 12:46=E2=80=AFAM Stephen Rothwell <sfr@canb.auug=
.org.au> wrote: =20
> >>
> >> The following commits are also in the arm-soc and risc-v trees as
> >> different commits (but the same patches):
> >>
> >>   0620bce64afa ("dt-bindings: riscv: cpus: add ref to interrupt-contro=
ller")
> >>   877097a2fab0 ("dt-bindings: interrupt-controller: convert marvell,mp=
ic binding to YAML")
> >>   c7ce06684bf5 ("dt-bindings: interrupt-controller: riscv,cpu-intc: co=
nvert to dtschema") =20
> >
> > I had to rebase my tree yesterday to drop a bunch of reserved-memory
> > restructuring that seems broken beyond repair. Maybe I'm going to have
> > to just do reverts instead. I had no knowledge that anyone had pulled
> > in my tree and how is it just these 3 commits? It should be at least
> > these: =20
>=20
> I picked up=20
>=20
> b1a4e71d4fc4 arm: dts: arm: Drop redundant fixed-factor clocks
> f7e642bcd622 dt-bindings: interrupt-controller: convert marvell,mpic bind=
ing to YAML
> 2af8d8a583a4 ARM: dts: armada-{370-xp,375,38x,39x}: Drop #size-cells from=
 mpic node
>=20
> from patchwork when they were sent to soc@kernel.org. I don't
> see the other ones in the arm-soc tree though, maybe they
> are merged elsewhere?

Yeah, the risc-v tree.  Sorry about that, I should probably have done 2
notifications.

--=20
Cheers,
Stephen Rothwell

--Sig_/uG0ovzMaMlpMnt5a/gDqhBe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaNOywACgkQAVBC80lX
0GwtLAgAgn2AN5hx5okQjavimXlOhMzyiu44dEo8DnkA2PWHc88QQTlSUG1NHQcy
Fu0ZgllRPhGWyzz5PzMvWzHiyAEkd25h+I/GqgW+XIpl7WJtLJW3V5ow3BHDbs5k
gC5roYnx0yY1aw6MEyEVTn6svq9OzDyRJQljvfht6Q42N53mx2Qx3VTDMbe5B6Xi
4WHlpB2Ko7R3I3ANA4Uc1KBQhv8N0ey3L2SHg8TmnXv4jtcZRH28f5zm8VDEqRJI
wGsDXdb9ajrZKNZ6dN+N0AZG3gjsTdj0Vh3NSeJFMvfucWNuEVMoUV8VXBNeASDf
XYrBU2e8pfTK/a1P/iW+w3A+c7s8LQ==
=3vEU
-----END PGP SIGNATURE-----

--Sig_/uG0ovzMaMlpMnt5a/gDqhBe--

