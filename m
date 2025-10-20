Return-Path: <linux-next+bounces-8663-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA24BF37DE
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 22:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754AC421EDF
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 20:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C429B2D594D;
	Mon, 20 Oct 2025 20:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rPeB8dmu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8B21F37A1;
	Mon, 20 Oct 2025 20:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993226; cv=none; b=pzFk/i515nCDCxi4wDa6B3e6v6pc3ZRflE6bnMlsBRzJLNnlzhhyAXry0IF4iX9vwGdzDkH2fq8uossy3SKwRrxG4jAuqtLVPtmskyjqzv5RVMn6uDrNQ34h7vWNzN/7rHtx26M2P1Uif68OA6MSyLhASjI9xPSEdiPtiS2qf8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993226; c=relaxed/simple;
	bh=ltWR9YU1+QTGJhueWegCLfau8LwYBqtR4kM1pC5BoRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OzqGFe0pxpdt5P/FmNBntufT5GVy/jJzvkyoCJKZZLUptGQGYoIuJJGarj+19SIUBl4EY8tax35LTFSnOGmml9LpO7IwgJYrs4FqILQJST9LXp21gAMUO+U7oGq2Z5hrzImAXfdmvOg9NN2sKUPfuI/1If0Ah+mYFVx4oGq265o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rPeB8dmu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760993214;
	bh=fnR7LJf3UQjjJn3pYCA3XCLJhOsSpjAAMyd+FYQBuE4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rPeB8dmud4U5QfqGxX4exeV5CvrvtnBh5uG2MV6pIo9tm1vPGaUtXp5YE5kUGju0f
	 tS8gz+zXi/CVEKelqpbpoSCbg6U627L9B7/hEN7hh2kY4yVSzOfXFmRqXv5zQpGVzH
	 IfCicvQWkqS0tXsCMUKKlZsWMMppECqNkJgEvtnOqKlztxRhEnRgtw8Bsunzh938ez
	 SCc2XibSLibjKtwqyDSug0JACUbAuf/hKEkN6wDD5zhfhXa0948UztJvJCbfo/V4iZ
	 W9QVE/ITV4TXUiJY4v0SCDkByoFJ9BWP7ug4E/+ZL8PBrOPsh1kuH6GHndawXYJhVN
	 IMiiuJfF84NQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cr6t66L60z4w9p;
	Tue, 21 Oct 2025 07:46:54 +1100 (AEDT)
Date: Tue, 21 Oct 2025 07:46:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: failed to fetch the capabilities-next tree
Message-ID: <20251021074654.25a18582@canb.auug.org.au>
In-Reply-To: <aPaUj1rENWJr+fvX@mail.hallyn.com>
References: <20251020075738.2de7288c@canb.auug.org.au>
	<aPWPWEfPpyE94qcs@mail.hallyn.com>
	<20251020140947.0dfa07c9@canb.auug.org.au>
	<aPaUj1rENWJr+fvX@mail.hallyn.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OYe4VDUkVrxtqM6YKXFV1q=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OYe4VDUkVrxtqM6YKXFV1q=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Serge,

On Mon, 20 Oct 2025 14:59:11 -0500 "Serge E. Hallyn" <serge@hallyn.com> wro=
te:
>
> Done, and I'm adding a note to my process notes so I don't forget.  Sorry
> for the inconvenience.

Thanks.  It is not a big problem, it just gets flagged when I fetch and
I use the version of the tree I have (which may be out of date).

--=20
Cheers,
Stephen Rothwell

--Sig_/OYe4VDUkVrxtqM6YKXFV1q=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj2n74ACgkQAVBC80lX
0Gw0Pwf/dYCn1mzRw4SlmIQiYUyXl7F2zyMq4QxF2tIQ5R4Yef3CTDrHB7KRLBRd
Wv49+B9mUOCHmBJ62h8n21NH37T1PyfIjbTJqMP2HXb+VqmBI0Z4eK/45BAbbNQm
3QKeUnRYCyvRSuqg/YGhfFVwxnOwoOs013i9YCsfp21z3Fo52DSrFlAgVnv+jp+5
YXmR20SQjq7J965To0gipZmu7FEMQ0gz0Po6i9PWGPmJ6/a1ZubsqWn5/VMkSvgC
2sizXJi/s9oBOc5+fDSDuGchTZoHn0q9PExMyzCmWYnMUSPWA+qMHFY3RMgIEEsn
6oZM60LxE0fR0evc2S9ROrfm+DQPLQ==
=n7pV
-----END PGP SIGNATURE-----

--Sig_/OYe4VDUkVrxtqM6YKXFV1q=--

