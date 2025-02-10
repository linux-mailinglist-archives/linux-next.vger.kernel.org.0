Return-Path: <linux-next+bounces-5403-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA20A2E2F2
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 04:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C12016498F
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 03:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86E943179;
	Mon, 10 Feb 2025 03:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BGlI/Hcb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D89C2C8;
	Mon, 10 Feb 2025 03:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739159632; cv=none; b=KyLQC9enbQ5T+gHjpsbrRq9lv+46Qiw/sysq/cQZeIB5l6aPEyr933rnxlV2X3bx3nwJq7htE2IoD5kUxRAPxLLAN4umS4A/zU5zsVBBM6faZbaKEdtpyEpaPYk71af9lL6/4J3CvGgaJq/Q/GoApKYzM7f7b1U3oLkR8775WTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739159632; c=relaxed/simple;
	bh=vom67kOHKiQuX8fnXwa0GURTiCPE8OBtrY6jq06pSx8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CdO5uJbPhK1aIgWQGCzEG4DcaahTw12UVipT/6+0r1fmWcG8SU+sC2Skm7L0H1NdHDvZhSo3UQIaM614lbLID9zskZrNne+v3L/rhRsBIdSIlkpEJpv6rcm2Iy3XGZx778aHCECmCYoTYZj8YdsxYtNkjGFipxy3Wer8slRyNDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BGlI/Hcb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739159628;
	bh=aMvp0QFhdjAW7mg6EKEmRiSR9LwEqTvh2enm+qN5jtU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BGlI/HcbwcGjyWyHEmNYsDW+Ocof2vzjzPQU2cZp1q7lkJHLPsnxKLnRt+uzZZ4VP
	 UWFW6bLhYX69WOcV5tRIBmAmdDV9adQDVH8ML1JoI6qjzaSmiivTkzTn05ntHrdwgO
	 3ex4ibOdnsxEi2Y7CxsYc0oEgFn7basEnfuVSy7sb+7toUzWVhM6Nf4LszR3ISGzT9
	 n3yZBqkhmGgUaq3YelInEsj9kBspX1ayKvDs70+30ytyQleUFkOUK/hhZweJQnoarR
	 Sx1rihmBEkURhmkcNuDSSSPCWYhYxE12sfAhzHTgmWx1wjAX+bwaRTcqL5TCngxvil
	 YNxVPl/rKFXHA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YrrKS6Bn4z4wby;
	Mon, 10 Feb 2025 14:53:48 +1100 (AEDT)
Date: Mon, 10 Feb 2025 14:53:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paul Moore <paul@paul-moore.com>
Cc: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the security tree
Message-ID: <20250210145348.59791103@canb.auug.org.au>
In-Reply-To: <CAHC9VhSJceL2PmFw1RiQEd9B3c7wjt6i_KzFxUjVdHV-Zxdyzw@mail.gmail.com>
References: <20250210121813.3e24cdaa@canb.auug.org.au>
	<CAHC9VhSJceL2PmFw1RiQEd9B3c7wjt6i_KzFxUjVdHV-Zxdyzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vS1sW4cJo2su/RIXY388RZK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vS1sW4cJo2su/RIXY388RZK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sun, 9 Feb 2025 22:44:42 -0500 Paul Moore <paul@paul-moore.com> wrote:
>
> On Sun, Feb 9, 2025 at 8:18=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> >
> > After merging the security tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > In file included from include/linux/perf_event.h:62,
> >                  from arch/arm/vfp/vfpmodule.c:21:
> > include/linux/security.h:2379:12: warning: no previous prototype for 's=
ecurity_uring_allowed' [-Wmissing-prototypes]
> >  2379 | extern int security_uring_allowed(void)
> >       |            ^~~~~~~~~~~~~~~~~~~~~~ =20
>=20
> Thanks Stephen, I just pushed a fix to the LSM tree, it should be
> fixed on your next pull.
>=20
> https://lore.kernel.org/linux-security-module/20250210034132.8448-2-paul@=
paul-moore.com/

Shouldn't it be "static inline" instead of "extern inline"?

--=20
Cheers,
Stephen Rothwell

--Sig_/vS1sW4cJo2su/RIXY388RZK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmepeEwACgkQAVBC80lX
0GxrLgf+JgtgFOPsoNv++HjaxBXhL1YJ2SftbWFblPSJNvZh3IOrfaTz+lFaNmwi
XdkM0lYo+Ud5f0OiFy3uJNxqaMsKnOIJ3Czyrdx+QgchCEI8AiOs1S4ECkMH2etK
S9SwKLDZmfTL1PPQEqLjIhjqBdGIfpP1TBwaM4g+e47ovBHMR+Up+Jy6eaFW03Dz
kDmEKfJk9vkH7S7PUTJe6l3sWGDslOKHwuTVlDX1thiuDYU664BvW2pJZKI2F75n
RYJj2kExavwoIQGNTQHFDcMWSL3KjOeCXsVo/JYwqjZrS2eEdm0f2GV2fqUrVG37
vdCjlaLdHs1ccTG0bA5UhsuRombD9g==
=n09/
-----END PGP SIGNATURE-----

--Sig_/vS1sW4cJo2su/RIXY388RZK--

