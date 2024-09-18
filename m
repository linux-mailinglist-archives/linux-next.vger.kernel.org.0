Return-Path: <linux-next+bounces-3911-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC6197C15E
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 23:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B993B1F226CD
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 21:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AB2189914;
	Wed, 18 Sep 2024 21:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HcxGfI8L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A73E15853D;
	Wed, 18 Sep 2024 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726694799; cv=none; b=HiBNL2gxtt12tJfP2K7sAXcwWecfTVGqqcVBUh9lW40kG4c3TLQVv30OXtmpJMWSkHhphRGXJSyIUQIhYDwGzlvSIVGzuBrwrGlt8ytJVVgF8W9kaMhTKAwdPvbyqcdNtIavJy/MtoXdiMl/suVLQM0YdaVPW4wtv0EIIptaUJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726694799; c=relaxed/simple;
	bh=WBLSr2hjEJISvXhFBsGx3XnEFJXJhp3z+E/EBPaqBTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cqXCqq+okIr+MDITOXlEuJLgIXid97SCD1wC6ec3WzN2fCEGZAb1WQKEUvUrEKtZw3W5YWlV33rE1C0UYqksiud/3JsyizRrwV8mEE7CObEmquxTzUhEwgm3gG3kd0xvmt7ZMFFaSUYiIvWeWwnGteGdw+mB3QWhMQPcgQVcBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HcxGfI8L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726694790;
	bh=KNGlhORW7Xn/7UJg4blVvmxkAWYMM1q2U2BSccm7cmM=;
	h=Date:From:To:Cc:Subject:From;
	b=HcxGfI8LMUSEQha54MGl1kijO8qDrsUN8hhYvVTLRsU4PXJrAQS81DAb5ux0OyvCw
	 +JAV5Zz2MAviWGBcCBm7bPYgaGfX3hxAmGE8vzRzodTyzJHHfOUi8lKTuz3miZvT68
	 okwOuKuclM0KJKoU2ht0Rt+GjS3mR2sWissw40QHJU9oj+PmCyOMjt5oF9rbQThJZz
	 CyyWrmP9zisamYgi9lz5hdaSY4IvkuAIyD61AnTdMGWhT2Vvtc0aDvl7qfXfa87Gzx
	 GI7ZPuiWc+pZyKG2vboggcnWL9ufcAtT5cKHqSh+tZp1qjJidFN8cKdiLo/uk+oD+u
	 G92AFAAPjqovg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8BY12qrKz4xQg;
	Thu, 19 Sep 2024 07:26:29 +1000 (AEST)
Date: Thu, 19 Sep 2024 07:26:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the s390 tree
Message-ID: <20240919072627.2639bbe9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/peAABJxDoLtH3VBcdN4f_CX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/peAABJxDoLtH3VBcdN4f_CX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  0147addc4fb7 ("s390/facility: Disable compile time optimization for decom=
pressor code")

This is commit

  26d4959681e3 ("s390/facility: Disable compile time optimization for decom=
pressor code")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/peAABJxDoLtH3VBcdN4f_CX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbrRYQACgkQAVBC80lX
0Gz8Ewf/b1ae7Kstr3iSudnwHPFILQReo2OHXk8Qhl7Hnw3k+6onncQ67LAwDWsS
qSNvHWEg9qQfgVGV5DDaknJhV0oqU7sRX2/cQfZRUW1uIil1v2acVQuxFzAFpyqn
WwDuHiqgkj30rzHNx11ooIL0sbidiymOeI9CU1Z5zBg47hNsUzs3rpzDK049UKhn
mg5gZubuF7MnOd2N15deLdYFPslsrHAY3tQMTuHL/Ma0DDWqTYbY7o23O7VreiTk
7KdBh5762pRBwKdXHISwR7TzBGsGBTcmQ5vk/qesBKo0v2a69aOfko2mvv1s6zHF
OW6IySXoNEFrkCFwWjGptLoIUguULg==
=AcfP
-----END PGP SIGNATURE-----

--Sig_/peAABJxDoLtH3VBcdN4f_CX--

