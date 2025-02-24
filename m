Return-Path: <linux-next+bounces-5541-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CA4A414B1
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 06:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33EEE167D34
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 05:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F402BAF7;
	Mon, 24 Feb 2025 05:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CwOlPxWg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4535EA32;
	Mon, 24 Feb 2025 05:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740374454; cv=none; b=YpiU58tRq2MKgPntUOhc2HURrJp9nwbDwW+HjE/CFclx7P17Ims2w8qnmt0qv/YPyS3c5gLcoKLuSoaIT5WhFYlfs7uw66okfOF8eEk+AjYuhCOHnMMlkDi+RjhsVtm4C+QODDU6qTQD4PutDLGQF0WDvWJu97hmGjOuzT4MDqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740374454; c=relaxed/simple;
	bh=vQ3xjwYXH2I7M0i6ygJ4uXPPJmBF5XVsprnigQ/Nx4g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZdEeWLaCkJidTMzdUlRVSIaTi9/+6r+xHPjC3qotA8VThTSFWyzgnS15B6AmK2ZwOHh5n94lHakB0r4xH7vt6ygeW9U/WR9dRGsC01jIFsNodwyYSj7g0MIYiw9us8smd3iKUnOeOwRRWrbXv96P55rUjcyEIoivzJ3qP5erdcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CwOlPxWg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740374449;
	bh=EXNLqUsAjnUnjtxh+YLHpPs0uqC4sXP2JzQumL3iZ4Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CwOlPxWgP8EQj6EWdPLn/5HRpQWm3cnYXc4jZqzGy4halOJWWHsI5dtlDoFTRdBms
	 t9D72CZXdcwU1bU1Dy96B3A+CQmLFtltye1GwEZ/wgeE801zusfym7AdoeSCTCcUn0
	 VuGFYnOWTCr+lf838/kTpWNlSMdYReDF84oX/YI9WohNDA0cKfxnP1vB0CwM3j6DXD
	 E9BJLUx0clJwzI/uDKy7rgBKzOO7MY/xWF1ywoGAQIGCpieN0/j7Fp2kDvA0N6H2nD
	 5EdsLfn3bPGm/ZBX1tJKluR/DyimzikE0BdedCEyrZgId2WGrm5y7Lih3jA/4bYtA5
	 51YQA5YBlh2YA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1TbN5YTZz4wby;
	Mon, 24 Feb 2025 16:20:48 +1100 (AEDT)
Date: Mon, 24 Feb 2025 16:20:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>
Subject: Re: linux-next: build failure after merge of the pmdomain tree
Message-ID: <20250224162048.7806bb1d@canb.auug.org.au>
In-Reply-To: <20250224122318.228f695c@canb.auug.org.au>
References: <20250220113338.60ba2290@canb.auug.org.au>
	<20250224122318.228f695c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uNnA8B2eLM/pC.aKaEVGknV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uNnA8B2eLM/pC.aKaEVGknV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 24 Feb 2025 12:23:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 20 Feb 2025 11:33:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the pmdomain tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > x86_64-linux-gnu-ld: vmlinux.o: in function `rockchip_do_pmu_set_power_=
domain':
> > pm-domains.c:(.text+0x19aa103): undefined reference to `arm_smccc_1_1_g=
et_conduit'
> >=20
> > Caused by commit
> >=20
> >   61eeb9678789 ("pmdomain: rockchip: Check if SMC could be handled by T=
A")
> >=20
> > $ grep CONFIG_HAVE_ARM_SMCCC_DISCOVERY .config
> > $
> >=20
> > I have used the pmdomain tree from next-20250219 for today. =20
>=20
> I am still seeing this build failure.

And now that commit from the pmdomain tree has been merged into the
scsi-mkp tree and so the build failure happens there as well.

I have used the scsi-mkp tree from next-20250221 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/uNnA8B2eLM/pC.aKaEVGknV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme8AbAACgkQAVBC80lX
0Gy4KAf/QlM4Ge0cp+s8dxmAMVGn8dMv7uoqrRtJlzWukjsH9tDszLSJd0aPx8La
Kp+ZRVN2sfFXoO2neDkGVxbgGYXYMGBz6/TaoNneVkS57HXwnlppeZ1SXQob9BQw
9f0VXjuuSdM0asjQC95cp/5Xf93Jrr8VMuUbcOckM9vqzo8MBtm3hLQTzcWzXPu9
tUF7znc9tyNbUbz1XgDjFbVeip3D9ZxHGwBHEzZHrXf6SSCNtDlYmzHQMFTWCBAT
o3O+5/YbTu0/U1lCQV4qTlsTkC6eUPeOtisN/z48V7mFcs/iRwUtLx9UvbuihS6A
h+FFikEI+2mvxz3e3diz+uGwQ80nPg==
=Ex84
-----END PGP SIGNATURE-----

--Sig_/uNnA8B2eLM/pC.aKaEVGknV--

