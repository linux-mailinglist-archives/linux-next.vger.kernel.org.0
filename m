Return-Path: <linux-next+bounces-177-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FBD8001FE
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 04:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCC8D1C20B2A
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 03:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356E517F7;
	Fri,  1 Dec 2023 03:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oahB17xn"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7D5A0;
	Thu, 30 Nov 2023 19:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701400621;
	bh=DpVmHZSbq3k9anbLD3zS7d+t6iwawrg86La9tsyDVgA=;
	h=Date:From:To:Cc:Subject:From;
	b=oahB17xnXPXYM2z+Lq43qCfExlPnF/VN48aIYTvhwwzI183TeINZpqdHhYzvfw9YJ
	 vENSFwreWNg8FRUdkGW/8Chi+YMTuUdt9U1L40Dh1JlFi2ykd7bu5BvAk3AULYshVw
	 t9C5fSEId9kEUf/ZY0lpY6u/Xl1xhWdymMFFru46Z/4ZmruSendI/TuRes1FzK7qgO
	 0qSM+FPkwxH9ffXqC6vkZBgMYK0H/FsBQebT75ymrFMFAC5S/RTU/cT81DTq2Z275g
	 e1jAAkDUcdevZ+sc9f4U+d0HAw0fpbOg4h1i1bsKUT1S5Zbwn/W7ojMWMwwQXoVced
	 H9p850W+P1AYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ShJBj2N56z4x5q;
	Fri,  1 Dec 2023 14:17:01 +1100 (AEDT)
Date: Fri, 1 Dec 2023 14:16:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the perf tree
Message-ID: <20231201141659.4de7f514@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jjAIfHAYGEUPqrGTGTBx0Xe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jjAIfHAYGEUPqrGTGTBx0Xe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  a399ee6773d6 ("tools: Disable __packed attribute compiler warning due to =
-Werror=3Dattributes")

This is commit

  57686a72da08 ("tools: Disable __packed attribute compiler warning due to =
-Werror=3Dattributes")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/jjAIfHAYGEUPqrGTGTBx0Xe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVpUCsACgkQAVBC80lX
0GyupQf+Mzp8m/j6t+QPPAb/KWuqgVsWJB2vYjdJ1Qly8xD59cXdZi1cOq2JMjoe
UL0RYbh7JdKvdUQgxLmNr5becm3HsFe+ShV0InkE5wLRH+3aZhP6Y5a0x0FGV/Yx
yu62aluPbUIo5SNSJjJ8zlEBUhidEt7p8GzfhOXq7cypZII8t3gyVE34/NFqcwL2
o2oJ30rSMydiywNxij7hpzJb0Sz39atzRCixhZlh2J13eMFzRnrIQRrXLdFUTuAi
SqVF16WguINNXVDms56yPap8u72t7GLoCD6Iv4c8HEmfb1LflBCYt6d/YvJiUAsH
6znObbpQxLUODc/UPpVczP6mpwkHFw==
=jt7F
-----END PGP SIGNATURE-----

--Sig_/jjAIfHAYGEUPqrGTGTBx0Xe--

