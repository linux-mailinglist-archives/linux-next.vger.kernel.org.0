Return-Path: <linux-next+bounces-7462-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D81C5B00117
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 14:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EED743BFD75
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 12:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D8118DB03;
	Thu, 10 Jul 2025 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bVQHOOV5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE45C207E1D;
	Thu, 10 Jul 2025 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752148852; cv=none; b=OURnTV/HWPp8qRYXY8ZEV9H46TVhk3wrapHcf8/ASU2CXqqZBilSoV1fmmaBN+c/kcucPwdm9zP3l9VrbCsIejtTWvbatGe7jmEIPtYCokRrzcdSxQwvl0nO0VGtBy+0NROkhn52YjeKJPDUIr3P3y9E+zkKe7K1SQAIyevBhZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752148852; c=relaxed/simple;
	bh=8aZ3wu4pDULEMT0o5wlrnZ+pfuBbJBRYNcs/POYChtc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q5GGABmwSniSXvob37xws1spmvJ7f1BC02W60AdGjXwfsbL2bUF8LoCt23ul21F8UN3b075V6ZRdoE7UkJDpzeNZpkSoSioOdetRqDjaFRy40NeoQ3Pc/Qy2Dyor5/0LfzJ795V/ZNcvsR6wU8VRU386cjseqrBIAQ5oelyPamA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bVQHOOV5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752148772;
	bh=sDi+ye7XIdRE/URF5MMZhFUiHVlg/sUPJJBg408tn5s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bVQHOOV5cjU0jHyr6Ummr9vv5a72IM/swtVDvYeELo+Owgl1FB57NoJ9AiFQ9T1K9
	 AnmvLSBvAeXTX0cKSB7tPp0YPGiakLro6DdTAqEbERG0+KxIBg76BSVY5sojlnUUrf
	 lt5+CjtdpyOROXyZbyHJ+Jj8E059iMragavVv1lgwJwaShK70TMLaJkQ7vwABBca3c
	 EnKAkrLjwd3036WcpqLyzjggXSCmEbUiYRGQ0jrqpQa2Zivg8mXMmNf+ES6XCJ8lQO
	 SAdESheh5S3ocT/9BBlzSf7BtdiwB9ovxmk880zZKZqMqYkyLHGoc7qi53N1NLaV04
	 s31jFWkrLzNPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdD0h0YL9z4wbn;
	Thu, 10 Jul 2025 21:59:31 +1000 (AEST)
Date: Thu, 10 Jul 2025 22:00:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Yury Norov <yury.norov@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the bitmap tree
Message-ID: <20250710220043.22d05555@canb.auug.org.au>
In-Reply-To: <c8c94357-8367-42b9-a817-f4ae3feacdf2@arm.com>
References: <20250710183449.20e255b4@canb.auug.org.au>
	<c8c94357-8367-42b9-a817-f4ae3feacdf2@arm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gcQuB3S9FVQr52l.G.T=lgg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gcQuB3S9FVQr52l.G.T=lgg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ben,

On Thu, 10 Jul 2025 09:44:09 +0100 Ben Horgan <ben.horgan@arm.com> wrote:
>
> On 7/10/25 09:34, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the bitmap tree, today's linux-next build (arm64 defconfi=
g)
> > produced this warning:
> >=20
> > arch/arm64/kvm/sys_regs.c: In function 'access_mdcr':
> > arch/arm64/kvm/sys_regs.c:2654:17: warning: ignoring return value of 'u=
64_replace_bits' declared with attribute 'warn_unused_result' [-Wunused-res=
ult]
> >   2654 |                 u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
> >        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > Introduced by commit
> >=20
> >    f66f9c3d09c1 ("bitfield: Ensure the return values of helper function=
s are checked")
> >  =20
>=20
> Sorry to have broken your tree. However, this is a valid warning and this=
 misuse of u64_replace_bits() was the motivation for the commit.
>=20
> The fix can be found here https://lore.kernel.org/kvmarm/20250709093808.9=
20284-1-ben.horgan@arm.com/T/#mc9e47859302654d84b4f2b3d9032d2b595d5df49

Well, normally that fix would have been applied (with appropriate ACKs)
in the same tree and before f66f9c3d09c1 (or in a shared branch merged
into this tree and some other tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/gcQuB3S9FVQr52l.G.T=lgg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhvq2sACgkQAVBC80lX
0GwdgQf9Eulh9zZi+hRNOCgp5ICGR5ayTDftgJ7BGEbMiKW+bhVab3WGDITu1Mb/
QMZUEa/jIiLRw0dgo0Qn52rVDvctLVgWuwfWnLAgL82JYByNq8KewFIlrUuSjuGt
IgXlAF4HgJqLC6hUdgocvsx26ElFWoEy2kBjzkPxqwkIq8SmMkbjJewpMtxtwYS1
IIh3dZvVbKvo7IK3UEDcyeiUVUUeHqvXaua0Qwkb2xq1fRHGLm5Ya9uf0CZmPXwF
36ExVhdRrJKmtxKrzaMyUjDqRQuCxaTZ/H1Zri1fhO9TtZhTccVixsqNroZficWo
az4itYxf7CwKaAyyOn+cUR0te2f6BA==
=mMym
-----END PGP SIGNATURE-----

--Sig_/gcQuB3S9FVQr52l.G.T=lgg--

