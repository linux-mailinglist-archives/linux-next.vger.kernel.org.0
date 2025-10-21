Return-Path: <linux-next+bounces-8667-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 693D2BF4202
	for <lists+linux-next@lfdr.de>; Tue, 21 Oct 2025 02:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 16157351ED3
	for <lists+linux-next@lfdr.de>; Tue, 21 Oct 2025 00:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07D2155C97;
	Tue, 21 Oct 2025 00:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eEk08tBG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F07800;
	Tue, 21 Oct 2025 00:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761005532; cv=none; b=BK3w1iTQvKC2ZvCHy8wZYbOEMntUgl1/apGUzsjqBG3wTl1sWaaEWtqkT8C2WsVGxyUOLmafsrXNCOsbCn2cwis0Sj+GanWpa+H7AwaTfwzgu1cM9kYEeFyy0mdmM8D+l8YI0Lm38Ly6xFlrUc6+vZOq+ugV9yvbKb83VhvIOxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761005532; c=relaxed/simple;
	bh=9tDbOcwOA7GDWYSQKMP6J7OtQ2IoXgXktiqMfQGa/ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VZ3lix+ejoRqjBYEtdyPNEc2ZYu4mxofERwLREzGRuX/hi5MLtlVba5Yh8XJjmpoeiHNJIudNDjnPD3c3Xesufn4GUFHV8mhVVJz/Q79B1G/bslum9BXG81Q00EsB4c4WEuX36oWhijMO7l6DMJd5Rr43/WuCnkw8hkSyn9l83M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eEk08tBG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761005526;
	bh=JpNIfASPanXKVDHjuQv9IM9sDkORHHX4iamOn9bGm7o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eEk08tBGX/1ZkTreg/9UiBGsr3RIfR9UmhaIpHb7ONUAsRHokjSxVTNIJguD6D8F6
	 Bu3qv5zE1nti3hd7hHv76Esb/XiSsNYbhHU84vMS3ZXLCZnCBJU1QTWyPa85Z4LLSZ
	 Yu7vmZU37Z5RULyg4QxtqYZhEX3zTKSA6alRQzmbAHtQIJ4kHO4f4uyBRNGc1ifBkz
	 O8zO3yo6ve+MF0Nrnag9P4W7bRJI37zp8/ImvyxIod+nhr5MFqlCk4YGugb3dowsWj
	 XwOmo0G5Z4NeC3P6dcKVB+C4xQp4faWfZjS20AaeLbW5UFuq4DuVzAhKqIcCz4s15x
	 jXT4tOd2o4Fgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4crCQt154Qz4wB4;
	Tue, 21 Oct 2025 11:12:05 +1100 (AEDT)
Date: Tue, 21 Oct 2025 11:12:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: failed to fetch the capabilities-next tree
Message-ID: <20251021111205.4c7e9706@canb.auug.org.au>
In-Reply-To: <20251021074654.25a18582@canb.auug.org.au>
References: <20251020075738.2de7288c@canb.auug.org.au>
	<aPWPWEfPpyE94qcs@mail.hallyn.com>
	<20251020140947.0dfa07c9@canb.auug.org.au>
	<aPaUj1rENWJr+fvX@mail.hallyn.com>
	<20251021074654.25a18582@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g6Lk1S3Pi_ogTtP7ze6rurI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/g6Lk1S3Pi_ogTtP7ze6rurI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Serge,

On Tue, 21 Oct 2025 07:46:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 20 Oct 2025 14:59:11 -0500 "Serge E. Hallyn" <serge@hallyn.com> w=
rote:
> >
> > Done, and I'm adding a note to my process notes so I don't forget.  Sor=
ry
> > for the inconvenience. =20
>=20
> Thanks.  It is not a big problem, it just gets flagged when I fetch and
> I use the version of the tree I have (which may be out of date).

It appears you now have a branch called "next" and a tag called
"caps-next", but I expect a branch called "caps-next" - unless you
would prefer I change to use the "next" branch.

--=20
Cheers,
Stephen Rothwell

--Sig_/g6Lk1S3Pi_ogTtP7ze6rurI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj2z9UACgkQAVBC80lX
0Gy4QwgAhVc9aHN0xw7uGKv5rnHiwHTt6YImOJTzTAHTbOwlEsE5nvieR0ksPFAT
70dIHPl/AJxoYXNci9GTKKSqFdfjm0+xKSXrU7CTPtmbdeE+sMbRBJBFHtluRkFV
D2uBQbkH0PKTxp/ExmkXCCUe68QfjLEDN/CzkGD2nL9jFqxVLCgPwlGgrZLP7LWU
XPMTHcRCuSt7/T2KoS/knNTIcwsqR3Ou5wLB51u/OGMsgr4ecm/wg6GFikcVD12k
4OofET6/7ms2GgGZy22qRIJlGYZ9hSCK1KVgHvfJGmVwo+/Rdp+ZwDwWgqMKst6+
DDuAwYkqTgdv9dOfmVM8P5gBXWaHvA==
=no8O
-----END PGP SIGNATURE-----

--Sig_/g6Lk1S3Pi_ogTtP7ze6rurI--

