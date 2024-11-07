Return-Path: <linux-next+bounces-4694-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EFA9C1100
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 22:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCAAF1C22684
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 21:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616C2194C92;
	Thu,  7 Nov 2024 21:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AgAoy19J"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4313FC08;
	Thu,  7 Nov 2024 21:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731015162; cv=none; b=iepX1iCyVTytbX4GJ8ofuU5OLH7kIUTjTaid9BEOF6ptD27nj6sU7ikolF/4xKtrwu/ynmGfkRID7qG4rqTDiv6uv/lcxaMkNy53cA0E9uTr/DXNX0Eu7CA0ysqaxjyVTDgrOQ7/aCBR06DzPSwaEnTTzdlrrQooGCTs+iXNYH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731015162; c=relaxed/simple;
	bh=fLUMpZE4KVohXe2BrJG1lxCr7XeS3+OIr2eK3EvT6L4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XcBCI6stqAPV+BFc7O/QewFUzg4qxZYMQWlev3MI9LZbui3kIJjFpZJvU64hq8RnGNj+rxoaMs6BhoBHIq+q91+SfMNRISJhvBrXwYnLVlNuNpm4FCSeLacd+7leKz4ZZ/k/S3foS3v3qP6no+61puGeE0XB7gthieQinDHNNkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AgAoy19J; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731015154;
	bh=KKhgicMpL5VrtMahHOSsNk5VTX3KdW+Yr/4+MEh3Wjg=;
	h=Date:From:To:Cc:Subject:From;
	b=AgAoy19JUC1WzvcSGQY/giK7Y8LaMUzNY5vTOmqfjmMAOvyk/KEe5h8WBbqRHtEbQ
	 wIlHw6isBfJPfTyptdKG9JINKdYdy3zTeQfdP+6tM3RpR6Z2LxoBzfeqCIUEgIsbiI
	 q5gZhqswbtm6BrMfckcbHp126FRSlZD4IoDn0A9lodszuvLli2sz+2c2jUCsW/7cQR
	 SIc0i8678tcF+WGkGjIyl35c4RBd7R8PJpYw1B3YhX+x8cF52ePiY5Ezv5xJ/baCg4
	 WEcHhzTA/CqBuQaEsV504vLvrio+p7I1hoQMRZ+IJy9Yi43p/ORtd9rlZ8HE8hhMIv
	 oYrfzutsrIlJA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkwJy2CC9z4x1w;
	Fri,  8 Nov 2024 08:32:34 +1100 (AEDT)
Date: Fri, 8 Nov 2024 08:32:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-hotfixes tree
Message-ID: <20241108083235.6165fa8e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mbpYcwq46LHXFuPeepUpvFs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mbpYcwq46LHXFuPeepUpvFs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  b27b8cf966c1 ("MAINTAINERS: remove Florian from DSA entry")

from the mm-hotfixes-unstable branch of the mm=3Dhotfixes tree.  This is
commit

  be31ec5c8efa ("MAINTAINERS: Remove self from DSA entry")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/mbpYcwq46LHXFuPeepUpvFs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmctMfMACgkQAVBC80lX
0GxYaQf/feDu/OL58wQ2hhzp0fJUrwKkoT/d1FMf2qB8QM+WhlI4jfgdrFnAPFIc
m1UI09I8JCr3STISNXEWjCupr8FXmjj1Uerad8pewHYWmVIf3JMO9y41aaDpZJSm
y9447bq0PkDxgeHJ1rS7Q2ErLdSwmKKTL3gX6ZzVoHM0llnH59NPOkXSxzddK+wQ
lHuNe1EeO7AqRUnuGWHebEV36tPrsAZbg1ut9aYLI2iHMgpVllZAtlUfaXkWqDcD
6zXVyN3+jWURY15/Wo+8IrnH3F/Tw6BT4x/IVAQVBe7Gg6K4964PHsXwkCih2YAJ
E0+bAT0R2zXT09tFFz9FRfRabY4lqA==
=Rn7R
-----END PGP SIGNATURE-----

--Sig_/mbpYcwq46LHXFuPeepUpvFs--

