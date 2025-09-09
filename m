Return-Path: <linux-next+bounces-8239-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC4B49F1F
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 04:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EE7C441955
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 02:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74ED229B16;
	Tue,  9 Sep 2025 02:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ils0R12x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38A0C2C9;
	Tue,  9 Sep 2025 02:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757384556; cv=none; b=F7Hr4QFTNELRvviAGm6oyD/PJPdyURsM+7KFc/5/mbXh3uVv4f5sJGo6EEk9cX9zRHnajp7rtW3HwsEbocKzD1nKL8NXNu8iPBjynnGaUrMSAE9Hfo5neoYeazUwmjcV+RiC5PfH2nRGv4NNHT2YakFSJ+5B2PoO+KvgkVliybs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757384556; c=relaxed/simple;
	bh=a/vvROr3sZB7jhwjcIZ6k7m3OS7DTx46ekUFUo9UX5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nf5LTv37nGAFxaroHVn0QnhsueqqEst4w3YvMoa/u0DZRWXu2Gof88PxEVbuB7VKbctG+poQEUy8PRlj0OUEtty8ODwozSnS1hIDvGASYn2hoh8Mw+AiaejdQq8ocMrghbd5MNcsn64Ram3VQhUyAlsM8PWSle3mptAkFisqoos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ils0R12x; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757384548;
	bh=YEfjsQrNUZwxVNeiyiYkg5EgRnEhy9g8qhPuEFZb7ho=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ils0R12x0YlLPd2z9Chvg4xzL83DfTsf+294uTcE5mDkNCS5VGS9cMl/HI1TqDOa9
	 DDwQyXKp1Kvbtu0P6lYLXLDGyE2DyojiuApd/7s5l7jeCgXfn/c5oAg6oYvmyvXU9u
	 Qbtvu2tAlV7BJgSLqgeCcuwmwUmCPHSajvm/Sxb9lFxOdh13QbTKIL2dcua33MO/VT
	 UgA8QHgs4jOTofoG7Hbnq7zSydMU5T/P/e4GyMC8lGXvEV1g+82psC6I5p3kxFG3PM
	 8mG1+BM7NqrcmQy5tk6X8fmD0M7clxT8MZuOx6wr3IEwq6Ck7Wdr4V4iSMQp/mgxva
	 /DMZUpMnG4ryg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cLSJg5t5Yz4w21;
	Tue,  9 Sep 2025 12:22:27 +1000 (AEST)
Date: Tue, 9 Sep 2025 12:22:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <20250909122227.4dbbeb6f@canb.auug.org.au>
In-Reply-To: <20250904092319.GG2764654@google.com>
References: <20250904154122.63acc45c@canb.auug.org.au>
	<20250904063043.GE2764654@google.com>
	<CACMJSev63kfCBTzQnija6Q+PNm8KgD-LWVKeqRJ2kLBtT7Zh6A@mail.gmail.com>
	<20250904092319.GG2764654@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//ecByU.8B.jumH2KIlaCnOc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//ecByU.8B.jumH2KIlaCnOc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 4 Sep 2025 10:23:19 +0100 Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 04 Sep 2025, Bartosz Golaszewski wrote:
>=20
> > On Thu, 4 Sept 2025 at 08:30, Lee Jones <lee@kernel.org> wrote: =20
> > >
> > > On Thu, 04 Sep 2025, Stephen Rothwell wrote:
> > > =20
> > > > After merging the mfd tree, today's linux-next build (x86_64 allmod=
config)
> > > > failed like this:
> > > >
> > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get':
> > > > gpio-stmpe.c:(.text+0x21a7c29): undefined reference to `stmpe_reg_r=
ead'
> > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get_directi=
on':
> > > > gpio-stmpe.c:(.text+0x21a7db2): undefined reference to `stmpe_reg_r=
ead'
> > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq_sync_un=
lock':
> > > > gpio-stmpe.c:(.text+0x21a8166): undefined reference to `stmpe_reg_w=
rite'
> > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a82ef): undefined refe=
rence to `stmpe_reg_read'
> > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8372): undefined refe=
rence to `stmpe_reg_read'
> > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq':
> > > > gpio-stmpe.c:(.text+0x21a8c27): undefined reference to `stmpe_block=
_read'
> > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8f05): undefined refe=
rence to `stmpe_reg_write'
> > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8f89): undefined refe=
rence to `stmpe_reg_write'
> > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_disable':
> > > > gpio-stmpe.c:(.text+0x21a91dc): undefined reference to `stmpe_disab=
le'
> > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_set':
> > > > gpio-stmpe.c:(.text+0x21a93a4): undefined reference to `stmpe_reg_w=
rite'
> > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a941e): undefined refe=
rence to `stmpe_set_bits'
> > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_o=
utput':
> > > > gpio-stmpe.c:(.text+0x21a95a4): undefined reference to `stmpe_set_b=
its'
> > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_i=
nput':
> > > > gpio-stmpe.c:(.text+0x21a9705): undefined reference to `stmpe_set_b=
its'
> > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_request':
> > > > gpio-stmpe.c:(.text+0x21a983e): undefined reference to `stmpe_set_a=
ltfunc'
> > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_dbg_show_one':
> > > > gpio-stmpe.c:(.text+0x21a99c0): undefined reference to `stmpe_reg_r=
ead'
> > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9b8c): undefined refe=
rence to `stmpe_reg_read'
> > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9bb1): undefined refe=
rence to `stmpe_reg_read'
> > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9c61): undefined refe=
rence to `stmpe_reg_read'
> > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9e6c): undefined refe=
rence to `stmpe_reg_read'
> > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_probe':
> > > > gpio-stmpe.c:(.text+0x21aa5b2): undefined reference to `stmpe_enabl=
e'
> > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21aa83e): undefined refe=
rence to `stmpe_disable'
> > > >
> > > > Presumably caused by commit
> > > >
> > > >   e160dd0ac8c3 ("mfd: stmpe: Allow building as module") =20
> > >
> > > Okay, I have removed this patch until it can be better tested.
> > > =20
> > > > I have used the mfd tree from next-20250903 for today.
> > > >
> > > > Note that commit
> > > >
> > > >  03db20aaa3ba ("gpio: stmpe: Allow to compile as a module")
> > > >
> > > > is in the gpio-brgl tree which has not been merged into linux-next =
at
> > > > this point. =20
> > >
> > > Okay, perhaps these need to go in together then.
> > >
> > > Thanks Stephen.
> > > =20
> >=20
> > I can take it through the GPIO tree if you will and set up an
> > immutable branch for you. Or not if the potential conflict is minimal. =
=20
>=20
> An IB would be good.  Thank you.

I am still seeing this failure.

--=20
Cheers,
Stephen Rothwell

--Sig_//ecByU.8B.jumH2KIlaCnOc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi/j2MACgkQAVBC80lX
0GyayAf/ZDKcsMyWLsr00X9xmN6TI5B+u7muKdIZwCA+FSrOC0uakn8636gdP1ps
AWGECpOc3lFWxfOnW1OkCni7VDJSVatl8VWtghb+bwYPOEQu2eovUrvZlQnpQe5s
l2JIE/lwm69bjQgWK4hcjPtsul//19JSWv8STyR+XE2wzssIxE4r1XgB4KXcqxQw
qxGGr9UQ2VN2Tp/ITOql1iV1tecFKex2J8e6M/5KCVo84Bv1e2jyfqdUilJUiGVC
8lzzSKlvlXmscUjJ/TksC8h858sgBt8dUgaJIOwqBH+zC1yhkdcVMiMYyHmQ7DoS
ODAjWCIgaEjzri83mglH1sKP6UKWbg==
=Vby0
-----END PGP SIGNATURE-----

--Sig_//ecByU.8B.jumH2KIlaCnOc--

