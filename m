Return-Path: <linux-next+bounces-6165-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDA8A7D090
	for <lists+linux-next@lfdr.de>; Sun,  6 Apr 2025 22:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A46DB3A8A15
	for <lists+linux-next@lfdr.de>; Sun,  6 Apr 2025 20:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332E31509A0;
	Sun,  6 Apr 2025 20:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="d0MzbfiJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F8413D62B;
	Sun,  6 Apr 2025 20:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743973169; cv=none; b=NWKbaIkRjFYk03QK8kH6KRocsskKCL5jbpmrTur6m0r6Lje/HUz0DtG3zfP6Z8372Ot7o2NU94usrHco4bpvX1xT/uZbkBSD7FdnnybWMgyfs6762JyQ47aHDxtRKquOl/lvoNUZvHn/9kWNdp1uPd+2HtFsQac02QDG4sJynk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743973169; c=relaxed/simple;
	bh=nmJpqq6DUNwbVG/lA9zLLpCUNTC3VyFHX3JhoK4Ym4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t815mfffPDTiexSq6RNriJHLXLh6m2k+3VMEBhF774/mwDa2nUd47hPFkea7ylo1VWWGkPbHqsGISBfoXfdD7BPtOfpFdIu2Z1dubGRhncZWD67xRGVHCB8FqKlRVsltlbes40ReCYYHGXG0+K0w0j6NhQ/VUbYAsmnljBkvYmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=d0MzbfiJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743973164;
	bh=djK3VSCaU4yliHfHXzzTGKVkCklHGpjv8ZW9UgFZHWc=;
	h=Date:From:To:Cc:Subject:From;
	b=d0MzbfiJ4NYxCYHK1aqO9hRYxz+eaoUFvqyuqZFuqdZbN3lnA+J0zb0MBRi0SRpCb
	 KcGziefNtZMCgLKFzba/CoRhlr/DH3y7KqCBlRxOVV1rV7Od5rkaaOoXUBEQelPSKy
	 KkXOiPmsTHjCuki1FHD/Ad94hVk8mA9bCJs8vQnU4zPQFei4sTlinIIqEuVpv2yD0s
	 Yl9wPWwCl0//p2etVvQON0fGPNXQpnZd+OPl234sGc1ZAr5auH0+6QTx/XRgTd9zfW
	 L5mJvb76Eztbiq6NUsXqkPqqJ6Yd84IcTuuEyXddJPNYIaZd7/i4Us3aJOhEjYfA33
	 zytk2aWyJioLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZW4TS23Rzz4x8P;
	Mon,  7 Apr 2025 06:59:24 +1000 (AEST)
Date: Mon, 7 Apr 2025 06:59:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Len Brown <lenb@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the turbostat tree
Message-ID: <20250407065923.47f0049c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3qdsR6x89m8NQ4N7Jx0n_bV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3qdsR6x89m8NQ4N7Jx0n_bV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  447c98c1ca4a ("tools/power turbostat: Add idle governor statistics report=
ing")

This is commit

  ed625c61b85c ("tools/power turbostat: Add idle governor statistics report=
ing")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/3qdsR6x89m8NQ4N7Jx0n_bV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfy6ysACgkQAVBC80lX
0GweiQgAmxTQr4yzuu00G1simdp9NYuyolgy05eWR1x8CvinvM+jQe/v47QhSThh
Q2g6S4ty8UEa3UwXQSIwMEIUU34Vg3uSbda7d7AwpPnV5PSQ/H01wJgLbeLqBMm7
xwioXsCkEv0VTSJyKiDPpzvYXUEgLgQ9KlgySXxPOSKNNNqmTirXSBCml7rGORWF
ndS6zSbby/62fksNbiQlJ481PAR2QKEaxNS+mEJi23NuO+nBmBpPZLeA3scb9CUy
jnbPyXZ0YluJPbSd88MKD9Ek5RqcR7bH/6ItFHygFY8qjMrDJ1MKsBloMs3hsFQi
5HjthopAAYggtdQ+Jm1EifIhIK5CEg==
=3gfQ
-----END PGP SIGNATURE-----

--Sig_/3qdsR6x89m8NQ4N7Jx0n_bV--

