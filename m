Return-Path: <linux-next+bounces-4906-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD3C9E892A
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 03:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C5B328108E
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 02:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C8F374D1;
	Mon,  9 Dec 2024 02:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TkfkhObo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292299474;
	Mon,  9 Dec 2024 02:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733711096; cv=none; b=fObz5hcEElT5Owv2fiSSeqdC6Xtvc2WdDN6Z0QEsdGyESWSKX+NbGpxawYfILwHJNndYfWi5JwZkRzomsJLp/CRa4tj8N1RDVfNemGJciL1m5h8i/n5NrQdp1vQvQ5lGHE2yPcOiiTk9RffOHqC0b1KpaoyLLvhUE88IKO9ZTAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733711096; c=relaxed/simple;
	bh=l8wBarl3KRcwkUlJfSMLf+OI4V0RDXrFf846BNVjBfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Y0p8tams1I7jmEBvAooVncwIdPeMSdEJNz0IimkFxAPNfAPp37F858qyduhcIPxRMa6JHI2z6Px9nLAmpBX1Q0veOey1yVC5M7NDyl/34DaihuYVy6bKizck4wfODtT2Ev05L+hX7Gdn25uw82lvmMY00/1b7u2XlCucsFS3RIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TkfkhObo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733711084;
	bh=EsE2NHK2S30FqP7AInRavBptTNivjmfPlKgjkLP5m3o=;
	h=Date:From:To:Cc:Subject:From;
	b=TkfkhObojHxIOfho8IdGJzdEFQb6YET1YtaHIZ6iea8FlfPZgVIdUq5LL11wcZxt7
	 wDKzvedJSTVCkoJUZijqUJRYw//bNoCR1iHYt0W17KgSxJacE/2T2x6lKGjaG6+gl4
	 pHybteVZy75CcvB9jw5zn8NMRk8VKUOnjHYKlLKeOH6qBf/tjP4lhEJ7a1y1YlhJmo
	 16PV5aaMg0gpm/CzPyLaXqmJiyzemOF6hBgeNPfn+j5hZKQJ4GB6lTKgjZnsjvTHQg
	 5UVkK/VUt0AvIJ1qURDiE7LpwkG1WwhbUqzgpBG0Ino1SF5z/XntyNO9RovOVjjZm7
	 HnPPoNNimPUjw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y65Kl33vkz4wcj;
	Mon,  9 Dec 2024 13:24:43 +1100 (AEDT)
Date: Mon, 9 Dec 2024 13:24:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Suren Baghdasaryan
 <surenb@google.com>
Subject: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20241209132446.77fcb14b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OK85QY0+UJ4MjZumhsKUP_/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OK85QY0+UJ4MjZumhsKUP_/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  include/linux/mm.h
  include/linux/mm_types.h
  kernel/fork.c
  tools/testing/vma/vma_internal.h

between commits:

  5f0d64389e1f ("mm: convert mm_lock_seq to a proper seqcount")
  062111898568 ("mm: move per-vma lock into vm_area_struct")
  85ad413389ae ("mm: make vma cache SLAB_TYPESAFE_BY_RCU")

from the mm-unstable branch of the mm tree and commit:

  eb449bd96954 ("mm: convert mm_lock_seq to a proper seqcount")

from the tip tree.

Note that commits 5f0d64389e1f and eb449bd96954 are identical patches.

I fixed it up (I used the mm tree version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/OK85QY0+UJ4MjZumhsKUP_/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWVO4ACgkQAVBC80lX
0GwV2Af/Qh08sTTeSY9cv3kqmAm64nsqJz9qaG9JrlNXWOAAw07j3oN1JBb7lzOW
50a8Yodssbr3q3dked36PemxBk1OxmFuQARtEhkdG0Icnf2T/DzAql0SZ2+RJhD4
8uJOURfe9FK5tfJ3GPful5lrm5Y82l5vnaHg8XXEXD1V4hWk4RBNqeXea418Wz/y
u/pDEz97yHWy4od6hbWo39ywItm61Kii8BiSS9mv6n4obi8rNfX5DC+L6O2VxMgL
2Jd8ppuOgfmFhojXVJSMX1+UyXNUYu4RWnz9rq7nGyLOVymuaq0wpxHg0N6ZzIVi
sMxPpxG7L4V5tPF1kvtLnPBHOWnTfg==
=1cuV
-----END PGP SIGNATURE-----

--Sig_/OK85QY0+UJ4MjZumhsKUP_/--

