Return-Path: <linux-next+bounces-4780-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 939729C7E21
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 23:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B2E11F2320E
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 22:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0571C18C927;
	Wed, 13 Nov 2024 22:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Kl5ovlMK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E4B18BC0A;
	Wed, 13 Nov 2024 22:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731535832; cv=none; b=M72e5cMwYM9fG0QSCu5t+Z9uNBqKsOFuaJs6Z5dC4bjQWQ02lVZDTa0V0ZGq/SP2Ay/STYlTu6yfeq63Rf5cPfWzLgLhSdPGmqfxEcKx483SfnyPQsM9ifSsC8AsEhdcYHmtecVWzZIIgGbUmz36LIP5eiE8U3JVOu4P7BFCiPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731535832; c=relaxed/simple;
	bh=4nlKL/GAI/wNHLhxaFni2Yc23qUd5r5JRyPks+7KfXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hFzVgdn9oTpXe1OembDhuzjp97WpxKdP/88H+tMb1zCNassEcyoQquxLpbyRaBg8Am2dnwjovZkjxGUdAVsoHTpe3DisAXcss6UyiktrOT49AfLBtLYgjzuDyW4TsoV9SwhF3ABxIXd4xYD2zcoIZi9KrL05SPOjlJL+jvahc0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Kl5ovlMK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731535824;
	bh=ViyKi74fZbZqqauFcX8QRPGItIFrBUPGLG5QeGrfiaA=;
	h=Date:From:To:Cc:Subject:From;
	b=Kl5ovlMKoBCcdQRrsrJtRT9TYzJ5z9rX472UURoP5vGFyURzT/imRdSdNoYLd3mvg
	 6YgehizkWl6TIefCUQ/toCziWR2ITekQpUz+4YpUq6d/MDB/G25lZ5ci0S8jO8FxvT
	 +bx7TkzZ2xMq/eiZWBvvqqxUp3zzhgNLhTN8y5tNJiMIwlTRW5lOMB7qEJ0DGCJMl8
	 A05ftQ5yYWzXrCFdmTlH3205OZ16PAFk1YmTZsklDp2tTiBYoMkdhoxXjTcopl3bjn
	 V5u7HZQeI07MufOP2Wr9D8zS3lJRquGzidryKG7KFP51WZgBUSLD+Ft+TWcSOMV1H6
	 q7Q5CS9jr6HwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xpcsp6GLlz4w2L;
	Thu, 14 Nov 2024 09:10:22 +1100 (AEDT)
Date: Thu, 14 Nov 2024 09:10:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, ARM
 <linux-arm-kernel@lists.infradead.org>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the net tree
Message-ID: <20241114091023.50a38dfe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CQy0aclGX8m_lk/oRNHiW9V";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CQy0aclGX8m_lk/oRNHiW9V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  2b99b2532593 ("MAINTAINERS: Re-add cancelled Renesas driver sections")

This is commit

  124f4f1a1869 ("MAINTAINERS: Re-add cancelled Renesas driver sections")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/CQy0aclGX8m_lk/oRNHiW9V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc1I88ACgkQAVBC80lX
0Gy5uQf+Pi/A9DUv8c2l2hDBnMVogOGKG6l7eP7S0wn2Q2JL4CY7oNHknSKv6YAI
CY7tODPcGLyoisPCgbKT3OMy0HWWxVFLK63V3pXEpuqa7P+8v6xfuQfXzHd3btgS
9q5SJOLqEQke4PXv415E36+f7/cgJuNR7mb4p3Ev3quHluGR2iRAYBCIHVXB6p7y
5aafOzipahGZ9ZxDwT5kdUcEbVaAaAioC9dVGB8Ng1KVjN8raB06kr1AXwJ/w5j6
172IGXjz+EjGpkLSwoYFADQ7xkOZX7fIn2rFzddoKhmpUJJlAD5J5iiKJ7iFjI5C
LuvZLn6APNhjafrYkUqz3O+J8dJB0w==
=dUdn
-----END PGP SIGNATURE-----

--Sig_/CQy0aclGX8m_lk/oRNHiW9V--

