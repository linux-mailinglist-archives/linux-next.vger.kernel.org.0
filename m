Return-Path: <linux-next+bounces-6146-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F7A79904
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 01:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8255A3B1A97
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 23:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9591F5852;
	Wed,  2 Apr 2025 23:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sqKp6OWM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329FE1F4CB8;
	Wed,  2 Apr 2025 23:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743637113; cv=none; b=MuGufjpNI/H+lgRfWPNCxWsvxOM5YV31z/OJd5qElmggu14OQCyyM750hfMy6WzMB1RxfMQ8gD2iljU2KD4vNME6GCdf8/nt7CLToxpwlQ9cpZv9gvEO+4hrnjpGHuRRJIHn4OoRAXFFYMG4fBO4XtlJVYGj0mAKQjGK/Q5VPsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743637113; c=relaxed/simple;
	bh=2XeX6reZQIkEtta33Of2B34VLo2hpft5Lu0BhoUZGwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RwCfKL2+XVXSE5VkeJF+t+s+LaBg5Cl3/pVPN8TZg1IVp8Qf72N2fHmg9Lw6XkJl66KlMZ+FaPLudiVbJSJC7t+OLqEz3qRayINb6+6o9nk4j+zgryfQLPIKqxBSsmUKqbo22OtzZRuKgKuzPy+aEfh6K7mYNguBp8RGVKKCfX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sqKp6OWM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743637099;
	bh=I60cN/LVSrQmxHMlDueTW+uQvkO4ol03jteCLzYO/hc=;
	h=Date:From:To:Cc:Subject:From;
	b=sqKp6OWMucJ6E2Oi/qZS6coURYX36YXauHHLMzougCQwNQ0/4O2L37Hl/SnUeUZZu
	 m2cy0ro7RU+mkyby/Ma4/Rxr43nbSkEovyM1tsgMHqLBwcJJZpcIeQnFUZL4JTN8iC
	 ILbCIZFnHAs6hQ8WumWBigUVeO9QXYXmkC5UkdQ5tw46YdMV/SwoeJhfmVfHxo0uJY
	 xz3uKn1tH4HgknzOqDyBp1mjp8ufF+OBQFdOD/64Y9ZSpWoxOvjGoh12tQDwJoU3Di
	 0Zwa9RPcVfy/hG6MCc4Jrab9ejiV+oh5UFp/B2wk/csJQ4AYXVW4ZskRSJTZLUr99E
	 B2GkKpqua4ZyQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZShBg3TxPz4xN1;
	Thu,  3 Apr 2025 10:38:19 +1100 (AEDT)
Date: Thu, 3 Apr 2025 10:38:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-stable tree
Message-ID: <20250403103817.1b0cb26a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.ENouaDWSfi9Rkmal1WYC=F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.ENouaDWSfi9Rkmal1WYC=F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the memblock-fixes tree as a different
commit (but the same patch):

  7790c9c9265e ("memblock: don't release high memory to page allocator when=
 HIGHMEM is off")

This is commit

  e499d00056a9 ("memblock: don't release high memory to page allocator when=
 HIGHMEM is off")

in the memblock-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.ENouaDWSfi9Rkmal1WYC=F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmftymkACgkQAVBC80lX
0GytHAf/YT2D9jgCYdKucsoovdsadHn1iVnupGKzumpLL8nsNoVC82XZdvPDWC3q
EGKtdQdIBgvqg1OBmDIbtW5i8dhKsS6+z3D67tE2c0gSBWQp/uLxyr25QhgCNrak
D0AUX4w0/6zoRqh2AqB1urb+BRUMOwGL2mMY2pBQ+cZT6gkHEmFC5HGC23p2fzPW
Zv5FiHIkvkn/Hy5K84ehyxvY+oShZlOJRHmigi46YNziaAxD8mAzsL4GcWhXsBeT
/dEmlJUX7cxQiaWjhOWb+t2EiaaL5UdZUBU7t/l9wjiKCvX4VHOtajmZXolOGals
wBYB24R/GD+ecgodgT9kBI7rYtHosg==
=PNE/
-----END PGP SIGNATURE-----

--Sig_/.ENouaDWSfi9Rkmal1WYC=F--

