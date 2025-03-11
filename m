Return-Path: <linux-next+bounces-5736-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 733A3A5BF7A
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 12:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B36A6176300
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 11:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8A7254857;
	Tue, 11 Mar 2025 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Cj2SWWp2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA7253B6D;
	Tue, 11 Mar 2025 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741693428; cv=none; b=eG7YbVsEmXQQQEdpQpaA5/9eku03UHcWP7NNMuBXFChn5LahlmE51z9Kue8j80fBUBAUcAmTo2DmEGWTvgW7paByTUSI63jFdke1Jy3GyjgYggTLGMRf37HZ1i4MjEw0IT/UpfkdN/+/qFIy2CKacT49PQr3mAQPdPf0dU3ufDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741693428; c=relaxed/simple;
	bh=tiiSNXH8astLCEcpQWRF/X3PWSabiebyjhRPE4VxtdE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VcHROo5g+EoFXEZk5D38aUYqlqHDZ2r1kPIzXx07zG9A7q0+qww2ViPBicrEPMdCc54etPdfkRYGmhEHIRbmbc2hZtqjnSi/nH6KogvHLeiPqToWpD81wcepDfpiyMpYNigm+VDc5pnoY1fPLW3eaoDpTI8Xez2s55a94uudLQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Cj2SWWp2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741693421;
	bh=WsyUb2XK4Cw3dOV4qMVQvr7j/+Y+1YuVL5aK/Xh2QY4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Cj2SWWp2xy5H0JtaqeMl+vDqMhL9wl+QW+MNMTLWQ/WpHJPLwG7NiDM3qYMo5zw3z
	 4QL54mE8eMX0oA8KIwEuOsQtCumeAg+UWEWjy2M2Vye7vjCadHNtUsZeUQyFGfqFSE
	 EAoRjn3qLGNpcBvLOBiuGNUtJgp2iJGbY8g6WRIvvjHJDbWRCmMXFTEPIcz3rEX8xc
	 WM5dfgX+C9ex7YqJVtpv6DQgOmV7/V9OtDLfTaQFLXQVn3g7C+t4REFMHQ9ADnd7vQ
	 8bA8JZkucwF7HP/u4UoO61o2f0dM4yIlsOyLg8dmKNEeNTMk5jvA5SgpUJYTktqRH1
	 Q1YHP2fQKHafg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBsND3zGTz4x3p;
	Tue, 11 Mar 2025 22:43:40 +1100 (AEDT)
Date: Tue, 11 Mar 2025 22:43:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the tip tree
Message-ID: <20250311224338.4baf583c@canb.auug.org.au>
In-Reply-To: <20250311020240.3b8c34b155f76fff5cccee01@linux-foundation.org>
References: <20250311150847.5a63db36@canb.auug.org.au>
	<20250311020240.3b8c34b155f76fff5cccee01@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o/14pxANLDyZHU/__F4tjui";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/o/14pxANLDyZHU/__F4tjui
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, 11 Mar 2025 02:02:40 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> Yup, thanks.  I trust it's not too much effort to simply skip the
> mm.git copies?

Not now that I have done it once ("git rerere" remembers my previous
merge resolutions).  Unless, of course, more changes are made to the
files involved ...

> There's presumably a better way of doing this, but it's really the
> first time it has happened in N years so it isn't obviously worth
> investing in setting something up.

This is why we have shared stable branches.  If the tip guys have all
those commits in a branch that they guarantee will not rebase (or be
rewritten), then you could fetch that branch and merge it into your
tree somewhere.  In this case, since we are beyond -rc6 and I presume
you are starting to think about your stable branches, you could start
mm-stable and merge it in there.  I assume that mm-unstable is always
based on top of mm-stable, right?  So the patches that depend on (or
clash with) the common commits will be rebased on top of the common
branch.

--=20
Cheers,
Stephen Rothwell

--Sig_/o/14pxANLDyZHU/__F4tjui
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfQIeoACgkQAVBC80lX
0GxSiQgAi1DEBGs/ulq3u5iUAbfqunrH94ztIiCULBACe1SMtGUsg4+DNDWvOWG0
xmdfLajz17RG+z9N7ITm7H10ekezzKob2E9yVOcVzadACzBboePmYVPgM5kR4ndf
gKxEbNabPJlSh1IMeslUQrsB+evdOATpRv4nZHIlnszh3NYVWxiux6ERDP2xzs4+
bkd6Jusp/UbeqnRezs5u/JSeAq0o1Y4yZb3KD7F5Mx+CPopW6DLJbII4IY+rnvaL
h9RcoFtZqE7NPclzhY9/0YbI/sjBl+1Spu+JRnjUjskWpDEZssRnmJkuXz8CExtW
sgy17BQoJalzfWqojDeIjqs6LPTxuQ==
=l9do
-----END PGP SIGNATURE-----

--Sig_/o/14pxANLDyZHU/__F4tjui--

