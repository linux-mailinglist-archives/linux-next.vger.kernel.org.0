Return-Path: <linux-next+bounces-8227-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 744DEB48660
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 10:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27221189A4C2
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 08:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41F32E7BB5;
	Mon,  8 Sep 2025 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TtGOTH4V"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89491D63EF;
	Mon,  8 Sep 2025 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757318795; cv=none; b=sPwn98IoO+zh2467Cfon+MnX4xY5G9D2MH3mRS8nkFFiLL6+QXzOfrrMeeamyZTIB/NN4/J6vTdJ7dPrRiWuip3Uu17XlgZT3PfdxTpnbTBlx+8d0P73ARM9yXgj6tUbxcuKqUOYxdaYaHOOe4MrcYZnBaoIaUyxXZKuGhkjDfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757318795; c=relaxed/simple;
	bh=ka8GlkxTCy83owtn+XSK9LfX0yLrjwJrVs7IxepHo08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WN83mf7+KKEAmQh9D/C6/tLl5jopWqf/caWZzLkqAPp/f72wVwVQK8wSUeN/DWIWQY0EwUy1SjmAiubprs40x2a1XcwbYTF8HCKQcVTCcIHyfoKuMOclagtKiCh6KJ4sFY5G87YXbsXDIccwfvvbexPjL8PAkPcBxbnS/4Vrb6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TtGOTH4V; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757318790;
	bh=3jFIAtd7ULVNBeq8F9dt1ianoECYMw0mZEed9e/JDSc=;
	h=Date:From:To:Cc:Subject:From;
	b=TtGOTH4VGz5j/ocRtljOYfc1+YDfiUeYLbLELbrh4FvfeAtjOsAbfuqOBGMbgiR4l
	 dZwsEZQwk+y8Sq4xAJi++4nJ1FTpGIndge55Tc2SkTvG8z/7KQx2QIApU9pUWOXgpq
	 gO3J2WtRVya6SV6MhA9YbjQYoPaDa6HFU1iy30Y0ely/NyMdEClTtiACD9DJcvdZRa
	 WVzGUA8WI9rreRLp/hel4bCoA1adj+bMUypE6B0g7yUQ/RO4ZQmlcwwJr74Zhe78qc
	 /rK3HmXG+ErMJLgvpqN3JYdyCvpAqJ8CKinN9ZasPwp3HxvA1Vb4ncxbhLst/6/hkM
	 zaDXbBXN8Vdfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cL0061HS9z4wBM;
	Mon,  8 Sep 2025 18:06:29 +1000 (AEST)
Date: Mon, 8 Sep 2025 18:06:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20250908180629.504ecfc9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LJVXs/YUaU1Yqc7.062wghi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LJVXs/YUaU1Yqc7.062wghi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/hwmon/hwmon-kernel-api.rst:85: ERROR: Unknown target name: "d=
evm". [docutils]

Introduced by commit

  c387594bb99b ("hwmon: Serialize accesses in hwmon core")

--=20
Cheers,
Stephen Rothwell

--Sig_/LJVXs/YUaU1Yqc7.062wghi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+joUACgkQAVBC80lX
0Gw1sggAjnpwGKk4G9O6Xb0ZL/tS7ecffJhGk2HDtvgDHyAF/Ne2KNB4MHhvjsMW
3HOyFBoOY5XrG4tf5/U/exhxtJfpjlTYZ6vh8QBNE1+fguxEv0TGIcl4V0M7+Q9m
GyfBxv3hR0I4HQ0lWA5iPCmwSrGLOqGyq3gCz+iswUjcCPo0mBY7n1OOait+/RJA
56T/KM/hyfh8qsS/iBGckeSWyqNYxkzCin6DAqHyxpFxLZ0b+7/J9pLhIeVNYO5m
Y1bJxlwDlEpdg2YQiRJXFnpx6kbJEcXZBqpgNYodxBcawE1FixBE8Dwj40kmYVki
5aAl0IMKGFe++McfDj5ktYYKX00/RA==
=E6HF
-----END PGP SIGNATURE-----

--Sig_/LJVXs/YUaU1Yqc7.062wghi--

