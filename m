Return-Path: <linux-next+bounces-4926-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35A69EA221
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 23:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 367D9281AEC
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 22:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0B01991C8;
	Mon,  9 Dec 2024 22:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UhzPy/Ie"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB3C2C9A;
	Mon,  9 Dec 2024 22:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733784720; cv=none; b=g4P8tQGOASMvIJDLpJdA7RCjVo58f5nn6WyKBcN/cUFAB1HJT87W6bl8I8PgxcQ3THHQZReAp99vIn0iNsbGTzocoi50CLMb6Gb08qDg3UwXew59h/1bxXSAIacFmQvD35ZrtXWyeLonswhWw0M16QqiYmfjUbA9ujhvcVaP4j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733784720; c=relaxed/simple;
	bh=EDSSmjoUOrd5pxmaOj11ch1Jng29oVuGXF8cZ/u17P4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uwAEHnZcuHuL/qc+iXiu5Ij6svSAL6TDw1Vpe5va9ZBMxauh7Oh9dP3Aa6U0xt6CqoyH9N01obuaeAK6CQJrQh8ps2izcx/7kiYj7eDIT7j87ccdJEvCvk80hKqV2qL40wYf9vddJz3IL30Bpl0SJJ1VAV1MyHVAelksuDIvylQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UhzPy/Ie; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733784702;
	bh=Jhl+2HIuYXqcn0cvtXYPzxvSnWib81OMoFZf9k5q1kc=;
	h=Date:From:To:Cc:Subject:From;
	b=UhzPy/Iemzy7yAyx/g56A5lNcj9jqXJdbtIS6zKfacOUOlz+MNMWlqSoe3ockYhha
	 oXrZ+BrdaMW5mwAbVX1kJwTkhOnYuSTLrtQYGF9a5qCfuHn+FtcRgBxGdu8fDC3GYf
	 fn74ZHJ4JvBnYolKpMeVgg+U/t/7R5mDET7G2knFplyOo2DJcCHtlrC9FGssfZvf9/
	 gWUUvPXSfj6MfwGukYosaZ2boF7oXl9o8ER9uH6bnb+Kuma4JUpcQ/bSBfXsFTUb5O
	 llXz2xFtY8DmsBbNGPdZGWMr/DOlnt982B8BF4o/rY7u00EdBSEhgXPVzv5ZPtxeEt
	 Jp/gRwxh6aSiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y6cYV2w0Gz4wcD;
	Tue, 10 Dec 2024 09:51:42 +1100 (AEDT)
Date: Tue, 10 Dec 2024 09:51:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the auxdisplay tree
Message-ID: <20241210095145.43be58b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FI6zYq=rV=+tSxdwxmgvVG0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FI6zYq=rV=+tSxdwxmgvVG0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  fcfadc7fef8c ("auxdisplay: img-ascii-lcd: Constify struct img_ascii_lcd_c=
onfig")
  3b362560d9a3 ("auxdisplay: img-ascii-lcd: Remove an unused field in struc=
t img_ascii_lcd_ctx")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/FI6zYq=rV=+tSxdwxmgvVG0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdXdIEACgkQAVBC80lX
0GwxMAgAhC09mEiflcpZuHXFp6mT2BSlbGZgRERAE7pbUV4+OhLA8TkCO/Lu+r+d
HdmqisNZcHq6oYQCpuXLWf9MBKn3pS00+SEVZgNAfNXpTiPGSBRxbM77nZDdrZmM
uBtJ0wcW3GGDKxaBmHPx/fnza1GD6zrDH0Gw2Z+eHZo4aaLvNBa3jenL2bpcQSYi
CB2r1Fp71eJ/HFhqR6bl4YyE6oJVe5Rhlz/G3weCUtrGt68i3hHGA+t6GM0uz8i+
Mc+1H6COeHq3kqiGREHNpQPPCKr1R+HC9VWiWpBRaxKBtnZ73qCJuFIGvuHDVaUc
BkN7tBHbYKrzRyKchS6zy8f0OZ8uPA==
=55Fi
-----END PGP SIGNATURE-----

--Sig_/FI6zYq=rV=+tSxdwxmgvVG0--

