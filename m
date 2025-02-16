Return-Path: <linux-next+bounces-5463-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2B4A37862
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 00:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41D7B3AFC4F
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 23:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8FE1A5B8C;
	Sun, 16 Feb 2025 23:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="k6Z3oVEk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904D6C2EF;
	Sun, 16 Feb 2025 23:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739747701; cv=none; b=cs0nRkYGXMHUyPPIU0DMZu2q+TW+1OAWC0l9cKrApKAEFKvJlY1Lltz7SMlp2Y434wEWokHlJfjllTQ8I83K7K3T+5PXpLwmP96ghlPlMfUjTkB8rJZT+OeTiDDPmHXmAwPndU4pFLtLEl7yMpFtw1cUBKE9GyN/0+0qzCu/TJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739747701; c=relaxed/simple;
	bh=h6rJDHL1Z2nYkUHU8S1LDBR+3J3CZDQKRKaOWX52248=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F+WIe4684QFxXVZRHKJAzMj0BPqsJG9sKrHI+eVk96n/UxVgfMNXURClPlhX+IWAAIpJogb7jtPj5OgEZcKi4Z3ZJQzf/3JEqk7DMW9H2SYNIrDOt8MiW1euE/f3S0uZaylMVXy4RUTsqFsu8M3DwaGwbk/MI1cnBAJeonPtEz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=k6Z3oVEk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739747695;
	bh=Rb7EBlM6/x6Acp/ztXV/Q38lXBxR/5tq1BynVQHwOPw=;
	h=Date:From:To:Cc:Subject:From;
	b=k6Z3oVEkfuxWcPt2PYcCZoe+8vVAQSDXNEv/SewWmvAxo92OLBVHA9So+jw1BgMI4
	 A5xEUGzMg2NlztS3+qiHDH8qUoUUO6LU51xokSvBSSOk16rxX5ptAtPRmQdqg3BzlI
	 WEf1yQJB+RK+oaCsHOYsD7LTXcoXbyb1UkE9C3K1oUKaE8dSx9Rm1uFYLWdKnDt7To
	 sDEs5NoY9/7gt/lGBSmxWsZl+WXkguQfMTFtLOXZ06v0sEl+qaYULR8bUUHPncJhYi
	 y/0uclVBre48IID+xYmCIoIxrePlQ1y8t6uaLsT4CXG9T45V895UaJu3oAJLbaz8Zt
	 FOlae0FEk18gw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yx1pQ6S6Zz4wy1;
	Mon, 17 Feb 2025 10:14:54 +1100 (AEDT)
Date: Mon, 17 Feb 2025 10:14:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20250217101453.34720e6f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LZnPDJsuWabi+7atH/9JiY5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LZnPDJsuWabi+7atH/9JiY5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (powerpc native perf)
failed like this:

In file included from threadmap.c:4:
tools/include/linux/refcount.h: In function 'refcount_set_release':
tools/include/linux/refcount.h:65:9: error: implicit declaration of functio=
n 'atomic_set_release'; did you mean 'refcount_set_release'? [-Wimplicit-fu=
nction-declaration]
   65 |         atomic_set_release(&r->refs, n);
      |         ^~~~~~~~~~~~~~~~~~
      |         refcount_set_release
tools/include/linux/refcount.h:65:9: error: nested extern declaration of 'a=
tomic_set_release' [-Werror=3Dnested-externs]
cc1: all warnings being treated as errors

(and several more similar)

Caused by commit

  1465347e498f ("mm: make vma cache SLAB_TYPESAFE_BY_RCU")

from the mm-unstable branch of the mm tree.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/LZnPDJsuWabi+7atH/9JiY5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeycW4ACgkQAVBC80lX
0GypUAf+KPhuTCv9/maTIsKt+g4VqYwmN42e14ui7h6wIpuHdAMVW/QufwJj2tI6
0c13ljDO6DLWq56GumaC2vLuSeREm/9imlvRjz7/b8Mgu3tNSafX3krMKZ1QlpIe
dQdUderIs2BZn+bn2XICfyveGsLDslGqPuuUqS7W8fWOAQ5PL0KHpcoLhZvqIyDM
CzZkdE4QGdV40u/tdspSfKMswZmlFZS4Cqw1lb5cDsinwM1OGmElN2d0MTzTqYMq
YO12wHskWLbaI1ZyxWg4yU11P0Tzn+4P4uQhUtBAoi3IwjKuqumVuUY/ZDrtnVvr
LDcY2YPVZ2ACJMeV5X0I13Szm0lWnw==
=eDof
-----END PGP SIGNATURE-----

--Sig_/LZnPDJsuWabi+7atH/9JiY5--

