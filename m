Return-Path: <linux-next+bounces-3789-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 280439767DD
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 13:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBB18281593
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 11:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4100D19F413;
	Thu, 12 Sep 2024 11:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VDc4kR/f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34DD19F43A;
	Thu, 12 Sep 2024 11:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726140266; cv=none; b=bfdrDbVL7f/6FVFMqVWZZNvZ8MKq0hrBTxAHzaYHV86f9QpZV/EKb5PhQzOSq5jEsyEgI/J4FJU709kVwEKm8Z4NWnQ6nCggaBSG5ZRVbmJ+VfoYM5mp2q3DMkhDU5I5VYMr1KTOJ+7pMqDlXsBVX5dV5lg4cKpAiD/7HuLpRL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726140266; c=relaxed/simple;
	bh=HXfcRAqMsJ8TJ0YfPRomz/VuEUTfeYPD/H/xYPiLo1U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=odPilf/Cz2HPoEjYd523JxD8orPZP5QRkPruA1/UFAx6aXMyGOLOsZj1w83MFl842WNhkIawVwPKZkOTDc2+dEtV3e6oUmH8WTApEdI1tDFnizkn7BU70+s4tAsWv/X2wDlajoVC53cYOJw1JsxYcokQSDslX0HB6EX7SuvhgAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VDc4kR/f; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726140259;
	bh=HXfcRAqMsJ8TJ0YfPRomz/VuEUTfeYPD/H/xYPiLo1U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VDc4kR/fKX3RJfuDXwFwjSApzZmLsG5nWyqTTnfwJMhs/shD3KIJno53PmaLX+xc1
	 egSubtaOe+OouXcsawS0CAR7RXwtooysr3BI30a4/hSaxDDJEssYJlRXUab8UlCXcu
	 tJ6Y9DoP9XrAv6ySa0nTSQvLSc0WQ8aIv7Xlhj+bRJ3TscJ8fnd36zXtjM4dkzT5w1
	 HyiQ3J8HdVDRl8x0ySJ2T4CJPgQeoPoB3bogr5ifqO9pDBm77ABoPItvwO+VKI0RqM
	 B7+lpYszjF6eZ10PVSD6u+o4Rn7ULRVQYx6U6NJc49h0dToIEzSDmTZDibn1aoFLD8
	 ISVUfmn5ue0oQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4FSz2tKzz4wb0;
	Thu, 12 Sep 2024 21:24:19 +1000 (AEST)
Date: Thu, 12 Sep 2024 21:24:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Aleksa Sarai
 <cyphar@cyphar.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240912212418.44ee116f@canb.auug.org.au>
In-Reply-To: <20240912-schund-hofft-e935401be71a@brauner>
References: <20240903092745.370fc0c6@canb.auug.org.au>
	<20240903.020556-bouncing.saws.daring.donor-5KuFrSsG4K2W@cyphar.com>
	<20240905105809.6585eec2@canb.auug.org.au>
	<20240910102332.4f171bde@canb.auug.org.au>
	<20240910-donnerstag-feucht-2e1aaf9ae8af@brauner>
	<20240910211236.3110457a@oak>
	<20240912-schund-hofft-e935401be71a@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uQTqqi=gB7SyQLgnxeo/xwr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uQTqqi=gB7SyQLgnxeo/xwr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Thu, 12 Sep 2024 12:23:35 +0200 Christian Brauner <brauner@kernel.org> w=
rote:
>
> Stephen, did you see any build failures after this? If so I would need
> to fold down your fix or at least mention it to Linus.

Sorry, yes, it builds fine without my patch.

--=20
Cheers,
Stephen Rothwell

--Sig_/uQTqqi=gB7SyQLgnxeo/xwr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiz2IACgkQAVBC80lX
0GzZ7wf/WJ9FtDkuaMxxgEJSekIn9FxpxT4FxJzomYxlff2Aa/bl5mF3jTSYO0Ks
L3deT/mlQdcO2XNurGhnzeSCD4raRJ4hpwkbK2cYvEuufj6L9GmKnnpZedKsOQBn
yjDai5ruTlpyFO78x3SIcumoQLcb9bnHR9KpUd925rF4VlguOSqpEpo6OonZS2Vi
AnJqT3wa+8akU1b27yilsv4Gy1BakP9nCl3/s5tI++hlD/009EnRmyApYEiaaHfv
GnxQ3X5lxtyMTxvODjDsAcU7GiyzVl9q4RageoFtvmP5UKGFokqqXs6BMXkT/GVM
JezVEqCDBckTwrMtMzvAkw4a8bbu2w==
=P07H
-----END PGP SIGNATURE-----

--Sig_/uQTqqi=gB7SyQLgnxeo/xwr--

