Return-Path: <linux-next+bounces-3348-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DDD956079
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 02:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F01E281B0F
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 00:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9422179A7;
	Mon, 19 Aug 2024 00:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lVDctN4E"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA4E17991;
	Mon, 19 Aug 2024 00:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724026370; cv=none; b=s8yzxLkpQaM63pWE4/nE2wnojGVnAJaQAUM0CvTEDMGo1uwnw56EN8OBrIqA8S+OioK9vLdosrICXrgKc4w6ff2itMX7haTPSq6MsuGP9icFuu4E72pb4iG2pPBdOzG0yDWyLC5y6d0koBHGn+mMkoD2sOxBIK2zhM4ak9dbv5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724026370; c=relaxed/simple;
	bh=11IahPuJPcnaMnsuQQR5ZKNc90NZRqvzcdbYSbJnD1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dq4ijevIhld/4rXq5kRdKrJg/eN6xMBgyVEakvCXfKkAa1GHJAqXqib0IEttDSkW695ZHubldgL0PuTT1T1KCaRbMcLqxdKfrSNq5xjGMGWXOOzeKgKlmw/ht/R03vd0BFu4rBkOJKkiM7Ul9svHbaoSrXqeQSK1nTekK/Qgw1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lVDctN4E; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724026363;
	bh=8anS34qnN0004SapJIxvdcpRkD2p5t34sEltuNOvoR0=;
	h=Date:From:To:Cc:Subject:From;
	b=lVDctN4E0Z4f3RvEQY0Lgr+sVBmqUNSfcYseL5A3NeBw+7W3m81/1yxdooGFWhPAs
	 Z0KhE3T6pnKGDiD/9BFPUHcdLHAkR0XQ0xc4QeTVsCecK+wOAoxhj3JcdlZRzkIJ0r
	 PhzfXOyxC1kBzh0lEutLNhwaRB0/N2VX7irtmTqpeOicLxKPI15RODTUEYe2Mp/rt8
	 nYABRInhfElwEaAail0h/8FTDjCaC+y2wbpWn6efpF7506gDYswaAIpLqqCk2lz15W
	 QsH1PB1lr4tjYcsRo/R22zm2Z8uA/6TOH40kX/P/KnHZ4e3imNY9FxluWE2nt8M8Hb
	 6U8sjKrFv1ZhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WnCj70s6vz4wcl;
	Mon, 19 Aug 2024 10:12:42 +1000 (AEST)
Date: Mon, 19 Aug 2024 10:12:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Daniel Yang <danielyangkang@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Shibu
 Kumar <shibukumar.bit@gmail.com>
Subject: linux-next: manual merge of the jc_docs tree with Linus' tree
Message-ID: <20240819101242.5e85a0fb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z+yBEorBEIpzOrxd2.h7TdU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Z+yBEorBEIpzOrxd2.h7TdU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/admin-guide/device-mapper/dm-crypt.rst

between commit:

  86cfa9a85fb0 ("Documentation: dm-crypt.rst warning + error fix")

from Linus' tree and commit:

  e9c7acd72312 ("docs: dm-crypt: Removal of unexpected indentation error")

from the jc_docs tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

BTW, the author Signed-off-by in the latter lacks angle brackets.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z+yBEorBEIpzOrxd2.h7TdU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbCjfoACgkQAVBC80lX
0GzpyAf9FbUpuvSXlcba2O2G/STUYq1cOMZ9TNF7/ebH70eb0atYGU4pkC+Pk8xi
qE4ZlmjqJOalXYEnDGSWHHlRirauVAMMMDItlWJNr97fFWGu9sIvWQ4vuZV8kOmy
qJc7Je8LkExVp/ceaJMsO7esZtG+4OHeGcLLEtJ6/J3DWac3yuFayb9xQhrJrBZI
2i7IcVPFWoQYm7ITBh9n7Niq882YswaKT6YUg4Ioi/rEDCgg5Ij2BPgGTR4l5s2H
hE7X+8kpkG27GyPE5N3XnPUX07TUnY5d6QKmh8Tska5zROYHOQdzL5fDBGWu4jvI
vD73utqXK9ef0PLZ9ENYJkVYpjCoMw==
=p57d
-----END PGP SIGNATURE-----

--Sig_/Z+yBEorBEIpzOrxd2.h7TdU--

