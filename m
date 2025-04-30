Return-Path: <linux-next+bounces-6452-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C25AA4450
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 09:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5255A7B6E79
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 07:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A73211A35;
	Wed, 30 Apr 2025 07:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Xxp2xru4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F320C00B;
	Wed, 30 Apr 2025 07:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999256; cv=none; b=U6iikTNFUOCWkMSgJ6JveyNXW1yxKC9YsDGxtAlQ46bccfw0p7zOkvpRCXZ/YV3t0r/ChwB3ZwaamLkpX3t+KDmWFlZl/UsJ5kT+x7qewchFJOTzNhgVG7Jnw8Jad+rqtwVG+3BaKnCQ/hDu6ecH4oaziJ5Yh2TBrS0kmCiN8rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999256; c=relaxed/simple;
	bh=oKrMy03R7EON8P9c6e0HhT3End1MvR9GsI5WL8WeQZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d+BKbMncvnHhUrRBVvWSTHSMqGy+X2ax75KAwUuGKraSO5C1buaCoZJkHtIXZbxnVf86zMWjLdKwuCbXrdnkJ86F3DSfu5FGQM+vwq5AbxSUexwXg718SnyhImfEpFctaSZ/WplRJW6GmrbSgWYaPnnyLnqv0xkD8aPXwU/V1cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Xxp2xru4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745999248;
	bh=14ugZcJxJnV2oeGJfswVAJSKJt3faqsSaduaclz3ZFw=;
	h=Date:From:To:Cc:Subject:From;
	b=Xxp2xru4p7Rm9pcgaXBwnJqBLidu0xzlnvcG6mIas8nU+7/4YQUwYZn5Z/y7onyH7
	 0VJk0g3EmYtwHZkmIQwJPkXmygYd5EPwQFQEfTp8FkoeXoKcTYTXdC0Vot/NYei2Om
	 jutxhpPzvUBLwioxo+QDqnOx2k7Jp0JCaQZlL9UZLskl+1oZfBv2cOvwXUE9Pr7lOG
	 FX8r/4XTwBmGRD/MSfP57zKHOsYbdnmZwfUUJCL5Y8n1OCVPeh4/Qnk43nsNYPsJAj
	 blKcFSHA/0nrQSD3dO8Yv/9xQSINu9dRgIhNpn1ME9CpW+lLp+yO69ZxcyQr0K1udb
	 wtHqFUzSpL0qw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnTmb65lfz4w2Q;
	Wed, 30 Apr 2025 17:47:27 +1000 (AEST)
Date: Wed, 30 Apr 2025 17:47:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the driver-core tree
Message-ID: <20250430174726.0322f461@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ze5Euap=7oKC5sLnnjTzt/t";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ze5Euap=7oKC5sLnnjTzt/t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the pm tree as a different commit (but
the same patch):

  142ba31d8b4a ("PM: wakeup: Do not expose 4 device wakeup source APIs")

This is commit

  150b374b9ff9 ("PM: wakeup: Define four low-level functions as static")

in the pm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ze5Euap=7oKC5sLnnjTzt/t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgR1Y4ACgkQAVBC80lX
0GzzzQf/U00weH1QUMdEA095skRzd139nnBmlaY9Eyeee+bcQxR8VlvRexJhWG97
gqeLjwpvVoSL7NShOp/NT3pbvfi0d+eH21NlPPWF0VHG3L8xw5UmlXunkhQnK225
FUOvkjbf3EIEULnqJ3DZOayr5zWeAQ7U85m04mv7ZMxQJlan5gLI8mI20N5ih0AG
gRyzqafamPwlVVGJX+o2UftPloCje26SWJMpOXrfjeeUdLyH1GlCtoLQUjrk9t0K
C0fu5U1VjLL4cvZTrvWLLw1NS1ZsTVEnnKIP/FmJfJSq8dmS484dLo8yOl6xOMT9
RiMpsLJ1ioIKhxReRXVfol/kmKL3uw==
=AuFZ
-----END PGP SIGNATURE-----

--Sig_/ze5Euap=7oKC5sLnnjTzt/t--

