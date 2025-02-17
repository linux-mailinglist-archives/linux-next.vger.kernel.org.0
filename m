Return-Path: <linux-next+bounces-5469-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B329BA37B2D
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 07:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87491188B766
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 06:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D081531F9;
	Mon, 17 Feb 2025 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CEj7rkkX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AE081720;
	Mon, 17 Feb 2025 06:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739772624; cv=none; b=N9+xvbl425OENOtqsT0ThQCH3n/N7M8/7a2EXiwD6S9HMFpmUFOmyvKOp2424r7jkzYeyuimJnOdFmUmkiauYFImdxAGos01Vks3Gr3XOk6ebtSgndJyleO0StrmtxaxjZkjni2X6NfubfpUgMhvrd1Lkhl89m1+d0tpMdNqz7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739772624; c=relaxed/simple;
	bh=K4OeC41l7IpXmWbXMYOCF5o+qZ2MehpHvB+IHS0bOCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ae7wh90BM3j5ZW104zsrbiEqFUwpHuXbSg1znrfFk7cwHo24LDp8fVdS45E2oMCPNzMOXpzz3VNElhgKm8FGZ7tlETEspVH7cMA6EmiUR4VYp5G9RJrlfQWwHve0Ucb+s4G2/XUE4a+NU/Ab+/KQTB+wICsR83T+A69z+5bfif0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CEj7rkkX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739772619;
	bh=0RAUI7VAgj5tpOqNTajbxsQ46PFbVSTGhEmCkFpbqTM=;
	h=Date:From:To:Cc:Subject:From;
	b=CEj7rkkXX71z8JG8xvRvbQbVfax5+55VQ9o/pvwgDsQld8jTcyT3ojb4CyZh2Kucg
	 wc4PzvYJfK4yPYuJFrjXHd0iyyw3Bw7lAfaAlV6s963nqI+0xg5fFy2OlI8ZK7GPvw
	 lq6UhMA8t8zhbdjC3YYvtMiYpwHZumTBwlxRtG+Vv7Mlv4XAaBqrciZnbioRxSTUkC
	 aUZ1RBEWc8W2MjsGw2mYNDdUOENIz06GyAq6PI6nrbcey6NFspMWM93lcV46VxtUGR
	 1GGK1wcME76jqe82loXddirkVQDaKxPPkKKeAm13QucJauRutR5sx6W1zKizya+E/h
	 jEnuwX+/yeKcA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YxC1l3fyDz4wb0;
	Mon, 17 Feb 2025 17:10:19 +1100 (AEDT)
Date: Mon, 17 Feb 2025 17:10:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm tree
Message-ID: <20250217171018.7b4f5e2e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vwhpvG6_yXUnw5_xHNJ5n.Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vwhpvG6_yXUnw5_xHNJ5n.Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/core-api/refcount-vs-atomic.rst:90: WARNING: Title underline =
too short.

case 2) - non-"Read/Modify/Write" (RMW) ops with release ordering
------------------------------------------- [docutils]
Documentation/core-api/refcount-vs-atomic.rst:142: WARNING: Title underline=
 too short.

case 6) - increment-based RMW ops with acquire ordering that return a value
----------------------------------------------------- [docutils]

Introduced by commit

  03b412c8b184 ("refcount: provide ops for cases when object's memory can b=
e reused")

--=20
Cheers,
Stephen Rothwell

--Sig_/vwhpvG6_yXUnw5_xHNJ5n.Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmey0ssACgkQAVBC80lX
0GxrPAf/YmTEhlXWdoWrpfmoAtSL9msrOhKm3WRwnlGtvVjL4kKay+B9T0qImuJP
1FCk2arfA8Sl3oliuci8F4pVeonCleA1qfx31LtAIIou/pu4cRejtyI2si1bsShn
yL+KRl/Pyzil558BlupKEwiNtpDXBNz6C9vE06+YPiEKzv6xRWS/t3s94F3vXSix
guMdKuPQ6Tr6VY5+X+7tRVQ2ehT0fXhfw46r707xg9J4+ugNwLVkJe0r/BOMMubG
f8ZL6PpMah8H8CpYxe98JCfDBqsA4clSz9roVM5T+ydNvPTI2eKHWXUuSI2b1xPD
HNkUrZeka8mCv393p199LwgwaT/ymg==
=FoWp
-----END PGP SIGNATURE-----

--Sig_/vwhpvG6_yXUnw5_xHNJ5n.Z--

