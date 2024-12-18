Return-Path: <linux-next+bounces-4993-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C929F6F4F
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 22:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B599516873D
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 21:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9901FC7DF;
	Wed, 18 Dec 2024 21:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UsyGK+lB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D791FD784;
	Wed, 18 Dec 2024 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734556452; cv=none; b=qDfwWdxSMasEpq+6arKRwI23vgytWiBy6ypT9PQ/utz0CP0pu8cHxOtm1tFf4qPEWxofdPDc33JgsiI8vXr9QwdRxp6ftUZaNWDEe/iv6kM+iZTHElTvaG2csCf+lJ+5zydQWMOaEoNm7j9sPwwL0rkgP2VbM3G2/KIqWbxLXiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734556452; c=relaxed/simple;
	bh=9YZkt379BzdyIbTtvUX5Wd43JLD1NzVhiyvi6cQbYgY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bk4krQeER3LfWTbxrflt3ATbcfgGEV6tYDaQg167M6KovKkqN7/BzYwCZT4Zao90QA7NaFI5rBqVqx/XDIfognBsbKZrOWIBzGEj2InlOqVZFces5hMci0b0BTVmiz/sb38KIA5i4xtVF8yFiWYi3Z50nbQaCVVamDJEmkA1uuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UsyGK+lB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734556441;
	bh=mzwXArFBynQo4Abs235UmkVmOJuzrfvILYuexZn5W3k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UsyGK+lBLW86/Dt99fpsEHQXojo0i3q2NbqZm6io5/xU8GvZ+MZq34Di2jGGSoH2+
	 rdHT0Cbus0kkBSjLxA8nBofFQ3t5KOa2M5+65AvYEyBpFqHCw96g6uXavIW6Es9RCa
	 Uh7YMD8AFL15qIhHuxfImebvBdQPgkCNkmU484r9uqeOWafBNwYorYcW5Y82THzt6N
	 wxZLhFwohADgsix550jxKJC+LTmUJTN9j99xlRDG8ESoaNN17Ts68dXXlpNubCQX+p
	 j2ZIPIZEExdVPPrjukcen7jk4GFn1qwjJI5YSCl3BaXs415S5SUAiethwE7oCMuhUE
	 kw1uSE6cUuTnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YD5yc6hwQz4xdw;
	Thu, 19 Dec 2024 08:14:00 +1100 (AEDT)
Date: Thu, 19 Dec 2024 08:14:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Dec 18
Message-ID: <20241219081404.28cc069a@canb.auug.org.au>
In-Reply-To: <6242bac5-bf75-4cf2-8baf-62df8d159792@sirena.org.uk>
References: <20241218153228.695ee650@canb.auug.org.au>
	<6242bac5-bf75-4cf2-8baf-62df8d159792@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+H/mOBNUxWluMXMLrE4b+Yk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+H/mOBNUxWluMXMLrE4b+Yk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, 18 Dec 2024 14:28:11 +0000 Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Dec 18, 2024 at 03:32:28PM +1100, Stephen Rothwell wrote:
>=20
> > News: there will be no linux-next releases after this week until
> > January 6. =20
>=20
> I'm taking similar holidays, it's possible I might do some runs but I'd
> not count on it.

No worries, hopefully it will be pretty quiet anyway.  There is plenty
of time for me to catch up in January.  Have a good break.

--=20
Cheers,
Stephen Rothwell

--Sig_/+H/mOBNUxWluMXMLrE4b+Yk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdjOxwACgkQAVBC80lX
0Gw7QQf9F6f04lf3e4pdU93EYTIxdHSdmhld/xtKuYWPjqruxPQJ4AjacHcbZ8zF
yMfsImmGd6ZbhpRQKfKY4puTdynJz1H25xQo66ByZtH7NyKJPswS5RLC3t53fN83
XGavw+JFXrjjBbNGX+/C0eCxo1p6PJWYmibRfvhILSP5ZyAUqo7kQNoO4+3hQ9i5
oeESPS5+fsnxG/Mwrkw8Vw4115Sb76JQ4d8eAJhwcy4QX0D3ARIpNFgacW3W/VtO
O7fF9L+mUbkPWfgC1AHCqOSC/T80Fg9nD8ylNsi6kYhvb4YR+dxOn8F1jh7wZuga
qEYbpI5hym3jV6JzCG7Kn87A5jk1PA==
=pI9V
-----END PGP SIGNATURE-----

--Sig_/+H/mOBNUxWluMXMLrE4b+Yk--

