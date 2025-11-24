Return-Path: <linux-next+bounces-9192-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23189C826AF
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 21:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C97703AD1F9
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 20:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50D5285068;
	Mon, 24 Nov 2025 20:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TkMTvSep"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042E48634F;
	Mon, 24 Nov 2025 20:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764016664; cv=none; b=OT9djnEYyePIyqjBiHp6+rVVoThK5/sRnDAJZKd56cDz7dUXdwmJIjUX6UTZGsbWKR3GxmbcEJgLKIZWyvKdomfobebyLV1th44tvsweGYe0UhbhAHczoZA6m+cIvW6xvsM541K/2nQw0n+ei2bH1Cva+jAbqWTLxfA5S7jeqZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764016664; c=relaxed/simple;
	bh=S84M1uNB7ZTM5CHAlhk3h2WC2x+drxqWQdjWhlaOmS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JJVjj9hMGEPKKln0ehUEZoaeizpPtnUT79GGXtXDuJGMH5kD6slLeN4U4sE2KhDlhlO8YUI409TmBH8lSliGwr1NnERc0Ebk/y8Iic7hJvimE+uxDjYomKyiAWBhZ8cpyVgGfiePFn4hAEQZcmJZPPt8gzgohKo5u/69yyWWsjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TkMTvSep; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764016654;
	bh=T94dFkv6VkWT1FZ0PA1kDyX2sOGGmKt+uUZoHHoeXHc=;
	h=Date:From:To:Cc:Subject:From;
	b=TkMTvSepGtDRNt0MuV6f2Cfu1j3ruLqOKqOCe1v4yq3TwXU0nHpFTO+xGixkykLyQ
	 UT68/3C6iaC6dJoTkNpWCMaR5Fx2CgTEfEwl4MKKBIyX1p1/RZe5wpQiozdOGw560Q
	 8ugMnsUDlAJePLoDez6ZiX7V6BPfVS0RHIL9faqicb/68/KdrwwIl+HsdY+LmWNyXs
	 P8GE1IfCv7PuNx3nbHK6UsrjsdI09AuYt78osgt98infHTq37Rf3AOBZi4DBeQnBWz
	 4i0FHy1AsddV1hI6UyepB1T0rFoB43a7n4vvdv4DmdMS1PfI+kiZ0Tq9Dyt5z3Jno5
	 YTvY3IyuShbQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFd1B3l4Nz4wCk;
	Tue, 25 Nov 2025 07:37:34 +1100 (AEDT)
Date: Tue, 25 Nov 2025 07:37:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-hotfixes tree
Message-ID: <20251125073732.5f4272ce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hW+L0vgjjXuF_nyOdmRsE6t";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hW+L0vgjjXuF_nyOdmRsE6t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  b11989eeb0d8 ("mm/huge_memory: Fix initialization of huge zero folio")

This is commit

  5bebe8de1926 ("mm/huge_memory: Fix initialization of huge zero folio")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/hW+L0vgjjXuF_nyOdmRsE6t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkkwg0ACgkQAVBC80lX
0Gynogf+LKAItkFf6cK0LjMMoGGAhJa/DNu84pwCZ4+TK//c/nCmeTYcf81QSh8l
MprmICKNUjllm9SG/Ta/rqAZGYlgn9T4x+R7B8EKSQFbqXEGr/oehsLCBaXnCGC0
zgt9UGfUc9btSfSwgZU+ASsqB0jTuJt4xtSVd88UaeL6/+YP4XVg3wWimjX3GZsI
7LK6fWuZr0MP98aFVM2XWlr+TmvjoHn8HMX1/P2etYqI8k+1QHY3z5zoIVmQnBJg
+7/1etanO8o6lcVAxdnpljtkI2iI61iGooy1gBI7SY2Z9omc1wZbDBTagzOJBNQB
fyTPDZ8unmZteWvEuTYnB1EoSerAYA==
=DIWu
-----END PGP SIGNATURE-----

--Sig_/hW+L0vgjjXuF_nyOdmRsE6t--

