Return-Path: <linux-next+bounces-73-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E8C7F96EC
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 01:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B19141C203A7
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 00:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7955A44;
	Mon, 27 Nov 2023 00:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lUHZ3bBD"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F6710F;
	Sun, 26 Nov 2023 16:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701046640;
	bh=II8fvvTebl5wXTs9nSR8kOFZ05zYuS72F34TwSUPL8E=;
	h=Date:From:To:Cc:Subject:From;
	b=lUHZ3bBDN9SyBT9RxrRmmb5xKgA5u3W/HxOjN7dV3h5gKREjzFw7FV5CcAAmi5mL6
	 oBEJ+ExvTmjv8trXTlZ62ktp7lk7+geue9gK1AD8MtHuj1jwoVEyI8BMDKYH9q0+kn
	 dYO2VVD3zKem4/1EBz/RbPf3r37N3a7SeqBKsLACBV4NF9oOqk9D3uK+20KANh6NlY
	 KjPuvOzLD1/qiSRDGRbnu0xRWf5tfSR+SSkm3FH/S2Eg8EWBpXdh1torwUDyJlWKO7
	 yiEFdXBwf0FOXSIBuAskyTUTY8sx+1rsgfSNWvUBlZUSsTxAENWDcRt6c243QtqdN+
	 J+2YjIe/b1w5A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SdnHM6p67z4wcJ;
	Mon, 27 Nov 2023 11:57:19 +1100 (AEDT)
Date: Mon, 27 Nov 2023 11:57:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tty tree
Message-ID: <20231127115718.7ad1701c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oQAv.DhzXwzFCqvxo+6.wSk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oQAv.DhzXwzFCqvxo+6.wSk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the powerpc tree as a different commit
(but the same patch):

  aa46b225ebbf ("tty: hvc: hvc_opal: Convert to platform remove callback re=
turning void")

This is commit

  f99c0e0d0859 ("tty: hvc: hvc_opal: Convert to platform remove callback re=
turning void")

in the powerpc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/oQAv.DhzXwzFCqvxo+6.wSk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVj6W4ACgkQAVBC80lX
0Gy1/wf/ULmxrjVr+fgWd9sVztutaB0Ip1E1fEfjkOmSIrkxpttpKAzRlgE52fPj
lDZH50AEXW1NyH62UgTNZ2qa4nXvDopQqPvmC9Bne7yo6tcabdDZ9bk67W6bnrH3
92w0gea8whfiDiivrnxAd+wQ7YMDuIA870f7DS0AIax6/lj8JLaJTPGBNgyUtDIy
tyPGNo4auCrIiynAjiRqT3l7MYjLkjT3goAsgnJwNbMqTv7mCirAutum2DVHUHDG
ZRvUR06zoZUXs/Q1isAhgZU/Ltv/BFTXSnZOlC2MX6/MorbY/Lt954tGoTZJpXZJ
+Y1jyZuRLwIisfPrt8qmyIVfaxqVLw==
=5e0j
-----END PGP SIGNATURE-----

--Sig_/oQAv.DhzXwzFCqvxo+6.wSk--

