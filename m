Return-Path: <linux-next+bounces-4642-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0079A9BE4F7
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 11:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B95DE2833EC
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 10:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB861DE3CD;
	Wed,  6 Nov 2024 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i2K/q4KH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D31DE3C2;
	Wed,  6 Nov 2024 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730890616; cv=none; b=Mv8zWZYOlnrJaxjMfLLku8wNTYQe31nslacJXQMnxdv4P4j+GIw9YIsyrWo9sHdsbEHNe5PXMeEGICt75YreorZPLv6oo/sGSYfFw/9cd0NVRTnOdydSExpQeNcVDoiVPZT9N/K0PEW/7+T2uF1Kxx/fHTdPz7TMKVhJmQvxTYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730890616; c=relaxed/simple;
	bh=dBCBb99ErzyWdTv/DxKCD/8rqxAsx9QyMxDGQQe/nKs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTmASvtMS8kWEJ4+CsaimERoqyLUxJ9lL0nXaMIiXiBbIVjop3+LqCfQtk+CAS/Ub+1dyYsuTH7NrdqIVGd+v21HFgVs08flFZ8IAQUBlqjkZ4zF6ak+EXRna9rWuiodMfsLUnuxmkVNpDz7T+MbNRQf1M0+PSbY4BHjJYHprE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i2K/q4KH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730890608;
	bh=dBCBb99ErzyWdTv/DxKCD/8rqxAsx9QyMxDGQQe/nKs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i2K/q4KHgwxRSQqNOzvVE9U5jvlUq2HM+hIvzMhpiQI9vdWDl1cXlD+11q31rI8bH
	 yfwXsF0eCbi6nylcRncP4W1ddlzfE2CLqJ4SBJrLe5c+mcVeO8ad161I5//YJNirvr
	 anIAOiKSdGfvJq90/wKUcXu+4l71WR2LGBsrOMKdFyYN0ThteodIhxN5OYMlWZCdtC
	 cBBpIZ291mARVCh/aAJ9YC2HMbUqISZoaOOj2ed7Caq4wtJTvbj109p1lwNyAn23Xp
	 CLaEt9ZnxU2m6/4wYgDq0CpNzUHoOCIYeYUlVmQuSCvihNwnwuFbm2nDPghbDM+3RE
	 ru1McXfpxSNGQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xk2Fr3fVLz4x9G;
	Wed,  6 Nov 2024 21:56:48 +1100 (AEDT)
Date: Wed, 6 Nov 2024 21:56:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: boot failure after merge of the vfs-brauner tree
Message-ID: <20241106215649.1a3d9a05@canb.auug.org.au>
In-Reply-To: <20241106-manchmal-obrigkeit-a790ff30c8b2@brauner>
References: <20241030183044.673e14b4@canb.auug.org.au>
	<20241106-manchmal-obrigkeit-a790ff30c8b2@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pMWwjicm33py=432zz6A3FS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pMWwjicm33py=432zz6A3FS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Wed, 6 Nov 2024 10:55:15 +0100 Christian Brauner <brauner@kernel.org> wr=
ote:
>
> On Wed, Oct 30, 2024 at 06:30:44PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the vfs-brauner tree, today's linux-next build (powerpc
> > pseries_le_defconfig) qemu boot test failed like this: =20
>=20
> This should have been fixed for a while now. Sorry, I'm just getting
> slowly back to work as I'm recovering from a rather sever illness. Let
> me know if this is still something you're seeing.

Yeah, this has been fixed.

--=20
Cheers,
Stephen Rothwell

--Sig_/pMWwjicm33py=432zz6A3FS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcrS3EACgkQAVBC80lX
0GyqZwf/T3pI+AwwinJCVn75CD+eoZ4HEMrnmx6kWzfyUiEJs8HhASaKWDd54ux0
6u6MYFplqNwwJ8jod/cfFV/HoBM+0kXQfgxXu3iWivsndjinyIHt8elO0y1Y5Ghn
CHI+CQzOIMakMW3TpOwe5LQ279jKLTsOZr2VMK1/LPeNUNPlyxoi3nuf3H2koQVD
rsN3HxN9c/t/55y4u3PTFZwcgcKhlDtQeqZDWBCKT1fZniAPPvXH7rgTLsu1s5Ql
0x37hR2nmWZMfJDil4FbAi3lC1ucMjiy92pA6oAZyndH94SIAGYn0x0dV3XYH2EA
FtFSjCGigTjVruJRSuyUrAimJqx4ng==
=9o0m
-----END PGP SIGNATURE-----

--Sig_/pMWwjicm33py=432zz6A3FS--

