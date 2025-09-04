Return-Path: <linux-next+bounces-8181-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26377B42F86
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 04:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF37718957A4
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 02:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413AE1E32DB;
	Thu,  4 Sep 2025 02:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FDNu9Ycg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1931A254E;
	Thu,  4 Sep 2025 02:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952091; cv=none; b=Z4GdnWGzwgzK5zVGHhyiCdLdOJDQDYV0gZCIPbMTWurw5BV2XjKkUXjWFUcNa+q2Rjr2QeKTuyYxDQ1V3wOKOTFIudhDW16Iz4ov7biWK/XiBoFvlYL3eA6ExECmOzJ2/RNe/8dkNKhTTAui4vDGeRMdlb/QxXxsa50RUEf9/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952091; c=relaxed/simple;
	bh=JT8AdGKkZbTpsmuX1L2ova6HME3PRC4OPuu1HBJbTEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eXrN7YC4TcQY5YQe4iNK0UPsu1apSVTD4I8e85KXB6OuETMgj5lF2PLXpT1J4jO3RYyDMJjY57xQYJ0B97ZdIXZH2+M8VQ5DDNZcvTmWvoju2T7I915NLo2W6ROqa3fxix8uCxvrMqykr+LC9vclxM2g2ZwLRNS0VGjz6fzju5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FDNu9Ycg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756952079;
	bh=4WLt7s/S+00ga2h1gXl+aUR6t7lxgI/D5+OSIO8LRxo=;
	h=Date:From:To:Cc:Subject:From;
	b=FDNu9YcgN8V5n6oF80+cS1zvDI4yXK7ANsZSgvrXuFc5GincZ5onpxSdMtL98YRd7
	 hSAaDL2DJXt23JQ44we8pHNObaYqSZCe44slrEgSv3Ae1TYQzybqpQVy21TZOaYEYT
	 mR4Aa47JdhnFcHcYxmDEyqxIUYxCT5x7oEBOuKB5J6DAOPFzYjU16tfpoMnX6LQIPt
	 sePSHlwfcfVdIu6qh7DuyEsOkDvnwQ0UzOccBRhhctK29VzjnMdVkl2j1PNSFG8eJj
	 2tjzdJVO7yBnOGQyzeEB9bN+3d0aEQP0xCNMUrzOiX7/SBRj3rt+VEiElDraAquNvj
	 tW7YlfdXj5X5A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cHNMz2703z4w1h;
	Thu,  4 Sep 2025 12:14:39 +1000 (AEST)
Date: Thu, 4 Sep 2025 12:14:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Max Kellermann <max.kellermann@ionos.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <20250904121438.3d2daab2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bWcO05q0mH3WVld1=sbbgBQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bWcO05q0mH3WVld1=sbbgBQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/highmem.h:14,
                 from include/linux/bvec.h:10,
                 from include/linux/blk_types.h:10,
                 from include/linux/writeback.h:13,
                 from include/linux/memcontrol.h:23,
                 from include/linux/swap.h:9,
                 from include/linux/suspend.h:5,
                 from arch/arm/mach-highbank/pm.c:9:
include/linux/highmem-internal.h: In function 'kmap_local_folio':
include/linux/highmem-internal.h:86:46: warning: passing argument 1 of 'fol=
io_page' discards 'const' qualifier from pointer target type [-Wdiscarded-q=
ualifiers]
   86 |         const struct page *page =3D folio_page(folio, offset / PAGE=
_SIZE);
      |                                              ^~~~~
In file included from include/linux/mmzone.h:23,
                 from include/linux/swap.h:7:
include/linux/page-flags.h:319:53: note: expected 'struct folio *' but argu=
ment is of type 'const struct folio *'
  319 | static inline struct page *folio_page(struct folio *folio, unsigned=
 long n)
      |                                       ~~~~~~~~~~~~~~^~~~~

And 5.5MB more :-(

Introduced by commit

  598ad57d4b46 ("mm: constify highmem related functions for improved const-=
correctness")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/bWcO05q0mH3WVld1=sbbgBQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi49g4ACgkQAVBC80lX
0GzYRQf+Pz0Yps+Sbn4Whv9mSzaLUe5VqysOA7iUQ2ikt023g04C0Ed1sgJraXJe
6gujP20SJJrninzf521tiC7azTB4fiOrv15MtBjOzRcCYWDE2YuLuEgvAohHvSUv
Inc5jhlaRK8lA9Jo0f0g+QEM2yqpqIrN5XzUByqKM9deHboszPvmgGSm/ZGurmJr
NJ6FlU6zoPhsvS8w34sB7tufwFaCbKH8Zk7oNQs4ZNAK5Tgt9hTnyfAij9MHmnsq
q1rG5I0cmqNWIOxJjNK6TA2KdK9gJTLPhlsenNcWrulj0YDmylPgWS9leUs+e3SA
nIUp0OtybIbT6GsjXH+vAnxBLDLTHg==
=u640
-----END PGP SIGNATURE-----

--Sig_/bWcO05q0mH3WVld1=sbbgBQ--

