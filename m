Return-Path: <linux-next+bounces-5937-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B96A6D279
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 00:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11536188A44E
	for <lists+linux-next@lfdr.de>; Sun, 23 Mar 2025 23:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB1E19CC2E;
	Sun, 23 Mar 2025 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cYNCvyvQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E726146585;
	Sun, 23 Mar 2025 23:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742772657; cv=none; b=r59MbqrKxZzB9UZdWfHH1Au3awSxzS9fa8T1UVjlgof9H//pnUXT9mkdXcOKGzmag1r4yfTbALG4WkpAO8VqbHjplmNnECuWPGFL3ZOUeSsFPW5qrEQM2KR82MhR+64RwRUdYrIcyHYdOFBmOparzBVVyhurVBIZckV8JWuJ45s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742772657; c=relaxed/simple;
	bh=z3d7/zDRzBQTU7n1q7+dzmYulYkpTvkV4EAW327NxrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HFlQhEQ7NdzY1Ypwrx+7rbcSz3iXq+zqp/SvhLLe3OAFyDLIy4+bObGHb1iKaVBNwAZJ+N6dfR78K/bF+6BWKUdkKUWFz/b7i7rJnrIhEJ6NX8JvaKQ3Uf0jo0sFEPloMAyjXM7e3bytJUdch8BzRB7pvAzMRfCtq8IypOxPtV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cYNCvyvQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742772650;
	bh=vrGEcuzN5oSnHGMQiKEmzeFYT5jooQ0/1m8ziDbqwb8=;
	h=Date:From:To:Cc:Subject:From;
	b=cYNCvyvQ/VTcLLLZQsvbDhslGyUTgPPM87jk+t9klAsVJl4Q04gjd9EbBEp/wdKGI
	 T9D4CeOvQZRDEyNsh70lJWXLYU5NKRYHwnpbvhsnOoS6xIiOl8aMrJNeHe99agalw1
	 SttdLv8zltVRRmou1XGSs+nOeayHLef3A9YfkXOVTWyFU/FWvz9eydlSN+Wv5QLJvk
	 PjWLhgjLt1SL/lAopoEabEiy4z8lq0ZPr1PnjaE1VatP03aXzZO254p3bYmkO2s3OM
	 Cvxc9/d7WnzP0WkEY7p5f3OIcyPFCPPSw0Xv0rQYoJODp4/rTfGMN+B9OhjAUScd7L
	 li39piy4gXiVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLXVf11Hkz4x8c;
	Mon, 24 Mar 2025 10:30:50 +1100 (AEDT)
Date: Mon, 24 Mar 2025 10:30:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>
Cc: Oliver Glitta <glittao@gmail.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Alessandro Carminati
 <acarmina@redhat.com>, Guenter Roeck <linux@roeck-us.net>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kbuild tree
Message-ID: <20250324103048.3d8230f9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gLgU9aR0.hwkywv67I.byk4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gLgU9aR0.hwkywv67I.byk4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: modpost: missing MODULE_DESCRIPTION() in lib/kunit/backtrace-suppres=
sion-test.o
ERROR: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o

Caused by commits

  19f3496e6241 ("kunit: add test cases for backtrace warning suppression")

from the mm-nonmm-unstable branch of the mm tree and

  1f9f78b1b376 ("mm/slub, kunit: add a KUnit test for SLUB debugging functi=
onality")

from Linus' tree (in v5.14rc1) interacting with commit

  6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")

from the kbuild tree.

I have temporarily reverted the latter commit until the former are
fixed up.

--=20
Cheers,
Stephen Rothwell

--Sig_/gLgU9aR0.hwkywv67I.byk4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfgmagACgkQAVBC80lX
0GyaNAf+NYhP/YyGdowSBhlSNssToQ5gYkcNXEgf+4jqaaA7jtyEkW55nmDwDL2f
Fr873G+/qw3zEK0nntjdhzvbspSmKBBftiDjmBSnesdWCaSLur9Dpj96bg3l7SjI
bzQ0yuL+FSlGeSPmlSDgcqbUqdQbi6TCsDdkS0raIh2HUT6J5KBWLxqk6kvqZbsz
H6lg3Lu5CD5Y4P+OpZ8YZLcLGsdfUqhCIqcAbjFDdwViLscWKKLjg8TSffVusUFc
+9KYrADA9cRHCd3CY87OCJ9EP1vOGu1zw0AI3zqVUAnxBIl7xHAS3JHsaJma53/P
3VuU15nkx57xlsVBgmsPt/2JOnAOGg==
=fi37
-----END PGP SIGNATURE-----

--Sig_/gLgU9aR0.hwkywv67I.byk4--

