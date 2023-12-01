Return-Path: <linux-next+bounces-173-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6313880015A
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 02:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E715AB20E7E
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 01:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A8715B2;
	Fri,  1 Dec 2023 01:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="meGaVaP6"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEE21716;
	Thu, 30 Nov 2023 17:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701395810;
	bh=eVODzEGXfAJB7NTzo5d2nrI+hsOA04iJWQ+eWYFdKJk=;
	h=Date:From:To:Cc:Subject:From;
	b=meGaVaP6LMy7I12JExNKjmHTnJD14Sr+/zAOMxQNwMUqY2XU8iezDZNqTSEixCFhT
	 DmJRAJLTxq7zKdC+XVBC7QxOwznEPE0qh/m/JJddkq56gaplzSrfGUHr5naA3A1Rfq
	 6horgcJjr9mOluPrDB0e3ITASo2R7y3N5RD3hKL/KDhoY8KM6Rl3eyXfvIYLweDK6g
	 YzOrMsUY51d6dGf+PclmfSthZYw3jABgkZv6gkEjrLM2POJvcfYZcCSPdPofY1IyAL
	 1+0dnDUnD+3qwqU1Kv/KEJ5q5sJwHPaH6VAVMX6siISaAtVWLJdl6CHrdk0tK7rtZF
	 HPn8KzvQs03jA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ShGQB2Whqz4wb2;
	Fri,  1 Dec 2023 12:56:50 +1100 (AEDT)
Date: Fri, 1 Dec 2023 12:56:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon 
 <boris.brezillon@collabora.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, David Regan
 <dregan@broadcom.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the nand tree
Message-ID: <20231201125648.71d7586d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DXzDsg5QMDalYXPT7LXeEVD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DXzDsg5QMDalYXPT7LXeEVD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/mtd/rawnand.h:1016: warning: Function parameter or member 'de=
assert_wp' not described in 'nand_operation'

Introduced by commit

  e82a5a014dd5 ("mtd: rawnand: Add destructive operation")

--=20
Cheers,
Stephen Rothwell

--Sig_/DXzDsg5QMDalYXPT7LXeEVD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVpPWAACgkQAVBC80lX
0Gx97wgAnrWTrNcrOSb15OMquaUPAx1711NPe4HrOKNKUVWRJ5ftr7Gj7TATEmXu
qL0tWdBfrYzSVk2CJCYbccbGjS9Tu/Z5Z40jK6m9aiKkfQ5/vfF2xzllHrnVZUkn
fInL8f9HiKpYVpFZXlSz+q7Vwrgk2ipnUTxJOCJc4GulBfL/uCHEv6Q1Jpsr9gVA
fV9izB/hpLGhK0+tz+RA6yYI1U3lIKRYslBpHSEUdKzovzdvIL2NS9WdzQCvpjzZ
84ICHEtK2C4Uqbcm93KLCfVAmz0j3qitcx49YeAbo+CABJwpmJBiKntj7n1AgmWb
uPm+yGpQ9XjZOhfvGYGXY82VbRuD+w==
=NkAx
-----END PGP SIGNATURE-----

--Sig_/DXzDsg5QMDalYXPT7LXeEVD--

