Return-Path: <linux-next+bounces-3881-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A874197A98B
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 01:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB7041C26E66
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 23:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B2915AAC8;
	Mon, 16 Sep 2024 23:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bfRQYTHC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD36154C0A;
	Mon, 16 Sep 2024 23:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726529269; cv=none; b=jveGVuzX22y/S4Q+aSnPN/xH5Lj6vK7t9reGYUq0B9C0DQ1NnbJAgQxMwLrEvZUjm2Ekb+ScI5Wu1YbaBuUNJ0vGalAnZviliXz9KEKL0ZztiUynbcSZ04uGOg8AO0rQB7x/QAGWs5rZ2SctiXSNJZLVu+kcbYIdgX31ghwJI/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726529269; c=relaxed/simple;
	bh=eS5mXzyay54RrFeFKlbDWpPhfe+/b0DHL59FavkHmlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tCVWPSwGeNfvnD3NH4rfTuP4WVZqxjtnMlm41keHepTA8Yhlb/1yYVF9hwou1pd+we/6u2nqoaiu8iJewYTAg80iWv8zFyMWQna8T052mHtSdSgAzYYzJ+7r9uBblP1lzkKUW1jw8LGrdHi5i6WlWccEuM/ockp4Kw4QaN558sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bfRQYTHC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726529260;
	bh=0iHG+qFpDAfdv106DB98x1kCN9SpMtHuspp+hn1Tt3I=;
	h=Date:From:To:Cc:Subject:From;
	b=bfRQYTHCD6LpQPEpgtx5AKfkEp4U1KtieL/eWNFWlyhIJhGuOP/CyfhXh1qr1PkOm
	 7yVPMnZy2/CUKCnViD7ibNnCRNxyoWCFldciSDrqXm9IuU8Cs4V4faO2anCX61FX3j
	 /ROPnrz4zUU1d5JWjROv8qfTBo+NqIVSSEpJhMbiufZUYNCROTWP2227Zpf4DhyFgU
	 8z8W+cjQZdsfzBS9a0DW8m+0A9nC7RsE9+EMCZfk6pe9IBSNgj8NfMANX/1FQ6UVED
	 PgMgfmteGtH19LEwiOfuW4BT762MRWpCxgHy+35TpfukFD8HFinZoGVnbJxL5k4OLb
	 KUOVSAzplH2zQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X71Km37fZz4xQQ;
	Tue, 17 Sep 2024 09:27:40 +1000 (AEST)
Date: Tue, 17 Sep 2024 09:27:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, Sven Schnelle
 <svens@linux.ibm.com>
Subject: linux-next: manual merge of the mm tree with Linus' tree
Message-ID: <20240917092739.46dcf943@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q0ywPg09jZlVOhK_Xs9crCt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/q0ywPg09jZlVOhK_Xs9crCt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm tree got a conflict in:

  kernel/events/uprobes.c

between commit:

  e240b0fde52f ("uprobes: Use kzalloc to allocate xol area")

from Linus' tree and commits:

  33a5eafea601 ("Revert "uprobes: use vm_special_mapping close() functional=
ity"")
  073317dc2f28 ("uprobes: introduce the global struct vm_special_mapping xo=
l_mapping")
  efb93ed4c836 ("uprobes: turn xol_area->pages[2] into xol_area->page")

from the mm tree.

I fixed it up (I used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/q0ywPg09jZlVOhK_Xs9crCt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbovusACgkQAVBC80lX
0Gx3XggApVtXoFOwd53BdJjZ81EpkG60YqSbrnAuW03AiQKASAaWfeN2J+nb4Yoj
4vCE9HQ36lay7sAm8u/Cnbhn25rKP0jQSo/ZN+V2IND9c0+isa7QlEBDPCwyOCmV
aPi9Gm3Kdkhiw/F2AFxtfLCuQ4KyMyPAZQVubZ6H8LWpMwmXkfmmc2QvYqZZibBP
XNivbQILcwc+gLSlye+SJ9KbCEDbWLDIO8zgeGRmfONC9LKSuAskkZ8tQd0zEsKV
1f51QDBbRl757ynZ+97TKuYtgpiKcZmPRXjZrIVE9lq37HXHCXwsA7kybTDztdOU
GFSEbtgyUVYjixY/b2j6G2biF4y/mg==
=KNaM
-----END PGP SIGNATURE-----

--Sig_/q0ywPg09jZlVOhK_Xs9crCt--

