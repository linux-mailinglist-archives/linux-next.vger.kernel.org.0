Return-Path: <linux-next+bounces-9652-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E176D1BFA0
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 02:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F1F33014AC9
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 01:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABCD2D46A1;
	Wed, 14 Jan 2026 01:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X6jyPRjG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A36A21B191;
	Wed, 14 Jan 2026 01:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355013; cv=none; b=TP+d6x3ZlnXXprxjpvHvBHd7ubiZJcy2bwGakbIs5GhzSCgubTE12KIPZLS7gmK/fNUxCWwcqLJUBVQtGjxAK3kX4F+i1hfl5IJavWFkMznLYWeo0fFFDQqTtROomSE7I9/kEd2p8xmpUHTKdEsQHlCliurJTfGxGCPONaq4PwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355013; c=relaxed/simple;
	bh=ijOIFAU36LmC8X8xueVrDgW389vlUNqTMEP+n+vCBbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SAkXf4JX9VSZNfcAVkuzYJV0pi4x4EeO5w32OLs4Wr8asehME8WZfFLPd092cypJrZTkGoLoOiuSh/AUdgnEFzdtzc7RerIZZYurQF+WX1/n0oHWMWQE0YJE0HfNe8ig7+Me18d0dkJwj2cIohvevV42gxnmamRd4a6+ZFiYxHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=X6jyPRjG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768355009;
	bh=/dbw1YO8+J9+QcOWlt7elilxRYqgD9C6r9hmrLo2Au4=;
	h=Date:From:To:Cc:Subject:From;
	b=X6jyPRjGlJJoPiNrW9uVOCI2tqVgVlbUD5j6kKjHafpOcAG4J7MYYcXxqxdbDcQxO
	 wBPGQB1/RH4wSWK/4GdR1lVefpW335uhmTn7T0MnswUCY+dS3ZWRvCw/uJR23PA3gq
	 9h1vootAsTs5Niqzfn4uX6lP/0q8zLTfolQqOhUVXuSup73IeWpaA+QG9xSGmcPkeY
	 1rV3dLSArxR1jEgpCE2x0WWAWcQTm8CJBPFvkw4WoHoMp7oAcaZ98Mo1uPTGJ7YAeB
	 JzbbW0DwvwmTrRNRIo2UIBWK+DJVTcITqPO/1cgVsR3rBHLAcvYozhVb5ewgc/qYMI
	 TSxvIGaXT/oBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4drTR524CFz4wR5;
	Wed, 14 Jan 2026 12:43:29 +1100 (AEDT)
Date: Wed, 14 Jan 2026 12:43:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the i2c-host tree
Message-ID: <20260114124328.2a986593@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.uQ6TnCuB64oCwvRnjIykNP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.uQ6TnCuB64oCwvRnjIykNP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the i2c tree as a different commit
(but the same patch):

  e2370b8b2cf1 ("dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c=
")

This is commit

  4fc8450a3495 ("dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c=
")

in the i2c tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.uQ6TnCuB64oCwvRnjIykNP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlm9MAACgkQAVBC80lX
0GxarQf/dBrUyVzm+W48s5b8YG9Os+Mpe3bPmTGP/nAPg534TKmnTcUkh4VnavPC
vPRQBaZYcMxCUCjPEAC+KNMCx3jT9INQUzcAPxhW9C65zD6srtNFeCMKzbw+55dE
QUopGhS0ppRLIm1+GkBDV6ihZM9utdfpyD14om/T8OFkzqkhX045rvPGBCl6BS0V
iqxSEuFMb1PRhRFfUtEf+LeXvcZFQ6+dFgBhSKYxaf/EQB1Ixs/izb+DAnpe7CQC
AlELw246GrvuauNiFMV3a2se6MCA7x/LJA/bck8FN/zkptUi+NzxbxQYGbUkO2Re
+5J8c0jS8w+vDR5rbkeeJ+1hsF6D1g==
=xoO/
-----END PGP SIGNATURE-----

--Sig_/.uQ6TnCuB64oCwvRnjIykNP--

