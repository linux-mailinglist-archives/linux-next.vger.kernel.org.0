Return-Path: <linux-next+bounces-6969-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA9AC72BA
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 23:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1426918988A4
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 21:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9DB22127E;
	Wed, 28 May 2025 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="W+Ga9Pxp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA40D217F56;
	Wed, 28 May 2025 21:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748467417; cv=none; b=fJNjYzMoOagxLHTjoOssndnrBELY8ukzhC6V+ezDlXtzHmF3TpQ91A2HqMFQC+NA1Ctxf3Pmb4T/CbopLBI/K0Mahm4nXSFukw0wyJr+3ZxxaeHoCb0w/V/0I+TqWab1vIVwJ2eBHJLaSmK8uvRpmK4lWY7GTbbxPRcl0XlMOjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748467417; c=relaxed/simple;
	bh=sEPw0skD/TaeUQcRTPTRum8un1ri0JprGvSGwhxmi4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rrJxNAFE+j9WV+hZZ4vcHCtz651XNnCKEnXESA8OoNt7T/lUmwwZbgDidwbCF5tkkrksBHg4B3vvGBP7bffHxxyqZOQc0dd3xfr2oAIVGzhd/FWxe2a6XdpSD7/vIvSZPao/bSYpeDCKv6m3SP1uS3DIVO8Aa2mpYsDytseQ9lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=W+Ga9Pxp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748467413;
	bh=kt+CkWjPnldmG/fWEN6wV3UtefYC6ttn/NtviHO5eu4=;
	h=Date:From:To:Cc:Subject:From;
	b=W+Ga9PxpLcg1giDaWvIEzQJ4uL9P1XH7CSCAqNr1Rfw23z4Fu6vdyLF707zX0njdI
	 /K1FpIJuGW8yCkDmalx+jf6hMlZilCkGNz0Utf8piA86CuIH0bGpNQ9bZpp6RJI/7y
	 q3KlZhJ2SjHcg98DWhhVuY9mT7IH7GfZwqvx13oFNhSeGxudAVvqKrHtbQmeRI+IGj
	 MX5iFilluD5CAltM1PujK9ItKltBq3sHwL+jyNY83Y7nJTYKWsS1hwExmPDcKAkv8n
	 v4tyRVyKlYLCGwr5nvo6s1OhrGHJfHzOwC9L4EqbpLwd3Bl3iYVQ7RpYgOSVHFwDJb
	 lqCnMxQxB5O8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b72YJ73x2z4wy6;
	Thu, 29 May 2025 07:23:32 +1000 (AEST)
Date: Thu, 29 May 2025 07:23:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wim Van Sebroeck <wim@iguana.be>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the watchdog tree
Message-ID: <20250529072332.48808d00@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AKm9_Fw=EONj3o7SwFoYLAX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AKm9_Fw=EONj3o7SwFoYLAX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  f2019c0c8b7c ("watchdog: exar: Shorten identity name to fit correctly")

This is commit

  8e28276a569a ("watchdog: exar: Shorten identity name to fit correctly")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/AKm9_Fw=EONj3o7SwFoYLAX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg3ftQACgkQAVBC80lX
0GxZKAf/dUskEQ6du9Em+qREdpbbBt1J+iXqbb2mMejIJQ5lfriorQMmkwy3MUxp
G1xZGpR/vajQH+7oXMmlgTYWFz84cm4ncxx++qPBJWyqv2dya7KuFUo6+jHz6IuL
AWozHpK5atFKEyz0o+ypL3Q2jVpu+7DJnD6qzuPppQzPXb8EYAcRjBuIKDK/wowz
Qg5bQ088YW6sVtZ+LWvjubHbhHXH02eUNkL9sHGu4069R6TkfXf0ijsm/mW8zSKT
9Zb4nU6VprnCWpCcoFkkpBnbqHOHiz6jITJUhHBTpNLgTjaTb5fUxNK4DTIiPs77
kIy4mQdpJWYqATGWUjVyZTpcpX+cjA==
=YJgh
-----END PGP SIGNATURE-----

--Sig_/AKm9_Fw=EONj3o7SwFoYLAX--

