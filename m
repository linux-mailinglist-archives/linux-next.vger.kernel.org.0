Return-Path: <linux-next+bounces-4073-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78198E8C9
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 05:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0650287E9C
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 03:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C5517C98;
	Thu,  3 Oct 2024 03:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Iq7hVYZf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B1E8F40;
	Thu,  3 Oct 2024 03:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727925710; cv=none; b=pmYAkwI/ITmFZSxq+fFCowloa1NqAlAsdfPuSl0eSBbgv05aA/A+M3hwCqsf7pdj1ZfutgJ6qDlb554DQrKjciBXc27BFVj5VK/Y/9U7BdS2dQS9av3OXO/rxpnu4olLXbZ9mG/kUipyzonTkd8fRA7N+asUI0IjHxjF72ogULU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727925710; c=relaxed/simple;
	bh=hHFbGDaD4d+YTpGYlmvbJRHYXH0nO6teDpyhIg26KfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qY+SvzGND/yL2TeWkMyKD+0sMPqJgnPWX2DePEyW6jkdt9X/gFeRGuZuJ8M+IRnK2mhhRMhng62Ix4xqv6EOU8iVM2ptQEi9tCTIEgnszHSRcFgJGgBCIEJXzDz6BE43Zetyh86lSo0376Zo9AqBMgnVK6f3PuIoCqVHhUCA8/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Iq7hVYZf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727925705;
	bh=3But7r1sXT2u7SMOsDvX9wPfXK/1mGmcZcspAumOfBQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Iq7hVYZf9ZuTlmjJfVhpYI+uxuFjtbqi2lDnk5amJsTPyYCwXEW6agWWC1pBfZN7g
	 2M9FVAxI5FGmhGU4HpsudjODm9w19nVacGq/sETDZijjTlIhHxVXR8pV23lz81KZke
	 +MIl8ZXFs/pVDVVJ7Oip9y0ENTXwoRLDbGcWqsnSUGcaYm0TjbYsp76+7dGayDpFTn
	 wLcrPKl4mu9rleF83PRubTuYjKhR2qLZl7MNM37U1koi5p9ekiI9BMb2kQ7Qu2sD/D
	 R7o2YO4Per+HcdkO0YgyUhgHUWjrxmrvCZZRolw9gH6JyPFgxfbINqG+rIWyjvG82z
	 wbP8o3Rnfea1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJxmS4JNhz4wcy;
	Thu,  3 Oct 2024 13:21:43 +1000 (AEST)
Date: Thu, 3 Oct 2024 13:21:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241003132143.71749ee6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wZKGET+VsnB9B5ixS4gG6Cu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wZKGET+VsnB9B5ixS4gG6Cu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/panthor.rst: WARNING: document isn't included in any toct=
ree

Introduced by commit

  6a797bdfde77 ("drm/panthor: add sysfs knob for enabling job profiling")

--=20
Cheers,
Stephen Rothwell

--Sig_/wZKGET+VsnB9B5ixS4gG6Cu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb+DccACgkQAVBC80lX
0Gw70gf8Do5sdWCHaf4ie3YV7y8ihS4QaTHdVnwPvQRjCM/GKlG8dbTa9ueiXgzL
7975AtFRSric+D+bHy6e7zb56ZlXr61EUW2ohrQ6t+A37/3Noju9mRMbKqtuE0+z
hjUVZTfwdvFxPGk8hT/PgY0Qyz65j/PPhWSAJekWi7U4YWrL295oW+wjjOmD4pVs
i5tkDVi7A8+J9FhTMpIx3omXq/codd/z3il1lOOm5wFyZkTi1Z+8gsiTECA7g1Jp
4SW2PPpDHNCGSro7/vVyqtrjWOPsUBpUYftV2KtpCw3GQ9ruhh34oH58dkXa2Ehn
D0S6NjkWQ/sZ60xtYy9ZI37+3ZuvFg==
=bEez
-----END PGP SIGNATURE-----

--Sig_/wZKGET+VsnB9B5ixS4gG6Cu--

