Return-Path: <linux-next+bounces-5016-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CCE9FB806
	for <lists+linux-next@lfdr.de>; Tue, 24 Dec 2024 01:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C20E91655B2
	for <lists+linux-next@lfdr.de>; Tue, 24 Dec 2024 00:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8195D15D1;
	Tue, 24 Dec 2024 00:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Uj+6LdoG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F0D139D
	for <linux-next@vger.kernel.org>; Tue, 24 Dec 2024 00:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734999580; cv=none; b=czXvsGwQ1qZlClc/C4dDp1JDMTA5/w1glRtFAK8c7PjUDCE3vcg7vlWAqcCKwvNu8l/6KxGT/Lx2MR+pSPt/BO3PUj6kguU0PEnN0+vIL/WNRcJUaaqBFfFQLJXpLDCj3wYMQD4vEPQGYaHFYN9blCBfhwFz2liVvUGXK4zbD00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734999580; c=relaxed/simple;
	bh=DTkuRnP1/tn8b42LXdkrBqcU6ORnqrq3MmW+OUAfzWY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDB0P4pOjS3Lt6wd3qLrRM1btaA67E8hLrdoN0/i17kCrIj0LUNSk+lsOrQD6sVcNbUPMtjqI3YiVdR8HeY6/YKvsgdL/GOzSRqqq1nZDjsYLe1B08eHfZFXQ9tvkbNomkKNSx4K1+3ugeVXeCNX6NRm9hkKh7uZ0QVW5K5KpRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Uj+6LdoG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734999561;
	bh=DTkuRnP1/tn8b42LXdkrBqcU6ORnqrq3MmW+OUAfzWY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Uj+6LdoGL3UEfyngb9OmHGBKGxbo2QfKdkFDtX8JMelGKBRGEYFbY4eCmh9ZRRMMe
	 qUgb2/uCfdC9XNIFFX7UeFMgNTf3eKcHCVPotfxdkZTXTmbjVDa8Q00fgKFZuqUdQx
	 id02/aiQ8LSG7IFvErvZT/YY2xTlmlMpL8eSZzx1+aYJBdyxvK/iqVDTSMVxzJtNvZ
	 +SqCnRs/ArWxJBi+U1C3VsKsU3Ci8mkK9QbYX3qHr7FU7pQL7oNoVtfoneOiNhxph1
	 bfN60U5gPlnyvdjhubqcbr0FXvjW41rqh2IwbeHl5WHmBjC72zrT/o8W5ffkiqwVzU
	 jhj4XwaO68mNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YHFr95FWHz4wvg;
	Tue, 24 Dec 2024 11:19:21 +1100 (AEDT)
Date: Tue, 24 Dec 2024 11:19:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Bondarev, Alex" <alexbnd@amazon.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Linux-next compilation and build
Message-ID: <20241224111924.14263694@canb.auug.org.au>
In-Reply-To: <94E577D3-046D-4E8F-96D6-593D4F7C808D@amazon.com>
References: <4FF05C5D-F7C0-4212-9917-0D94DF3DCA60@contoso.com>
	<vnymur42hlcdiodh2pyoikdc5646zceiuf6sizgde4jmeqd4xi@b7xt7wuq3aaz>
	<94E577D3-046D-4E8F-96D6-593D4F7C808D@amazon.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3nLty582tj/ZrBsXlPrFm.Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3nLty582tj/ZrBsXlPrFm.Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Mon, 23 Dec 2024 18:20:50 +0000 "Bondarev, Alex" <alexbnd@amazon.com> wr=
ote:
>
> On Mon, Dec 23, 2024 at 04:16:03PM +0000, Bondarev, Alex wrote:
> > I'm part of a team in AWS that uses the linux-next branch with canonica=
l's
> > ppa to test for build success.
> > git: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > ppa: ppa:canonical-kernel-team/ppa =20
>=20
> > As a result of this daily test (we try the latest available at time of
> > testing), we have almost immediate knowledge of the "goodness" of the b=
ranch
> > (if the machine doesn't boot after update of if the compilation fails).=
 We
> > are currently running build on aarch64 and x86_64 types.
> >
> > The question is should we notify via a mailing list or a single destina=
tion
> > about this failure? Will it improve the detection time for a bad merge?=
=20

Thanks for testing!

Notifications should be sent to linux-next@vger.kernel.org and cc'd to
linux-kernel@vger.kernel.org and any developers or maintainers that you
think may be involved with the code causing problems.
=20
--=20
Cheers,
Stephen Rothwell

--Sig_/3nLty582tj/ZrBsXlPrFm.Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdp/gwACgkQAVBC80lX
0GxGVQf/d1KgsOdNN0zruURwbb0uEyXMqaQ/dYXLXsTN20tG4nLxmpfW+EWK5uvB
SD5xw9N0qlB2LOqtvzY5x35ZIgqa3trMfW5OYH6hzBBu5aB5ZuA2pFK/+FXfFVq5
q3EZS4O7p3gI1Z+3jPjqHN+iY6gXBmPQaiYAF6vrKXq+0mdfUSdvwpsb+xRwuk2l
DDRCQg3LUBstXrsVKgtcXDF6tGlWd3EyO/WpNZVuw6BZDIdpK2ocdUtSmiFs7Q8i
nKbXLouF+dZlXD+hOQKOEV5XuWXqo9iqm1HKhX/w2Ys+mAxu1IFh5jJwTAd4RkuT
7EKThNYqLh1XIxfEYP9fwdBtbd+uCg==
=Ywt2
-----END PGP SIGNATURE-----

--Sig_/3nLty582tj/ZrBsXlPrFm.Z--

