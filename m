Return-Path: <linux-next+bounces-2987-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C97930BFC
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 00:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 133191C20B84
	for <lists+linux-next@lfdr.de>; Sun, 14 Jul 2024 22:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2DF3FE4A;
	Sun, 14 Jul 2024 22:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bAdzB1ao"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2932714386B;
	Sun, 14 Jul 2024 22:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720996986; cv=none; b=jOhiH7exjxpN7c1qyni+kcPY38JR36MYs6mNarBfwRSguPw9G1C9y+8nv7XskkHQgZ9KFcRYs3bDDezCF1jm6Yo81iFhgE12UEmDevSRvbcpzFyKo8OZeRSZMHPaoxGevsYBvoTEeOXtWs5HBkHtWfn5ptrOf0hzBVZZMRyuVBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720996986; c=relaxed/simple;
	bh=gt2YEbL0HPVuwF7HgzQz6uVwQgZxohlOAd8A1sF5gPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d8nlAbX/vjh2rJzSmaEon0oJWUOrDNlA11ClFiZ3NrfKw7WiJdsn/9dCePpfGHcKs5rrJJHcwa0Evh+/li5cilme4NlAJMj5IrALGIdX72Us6nim+OYiqzeBMIzP2vKSUFfl3ogI4T5tHvZL/GYlnsOZXFORBJCzlFHXHTKYFM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bAdzB1ao; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720996978;
	bh=/BlsZzTOjxdQO/NvxfH5GB6oaugSxVJTpOd44b9JnJ0=;
	h=Date:From:To:Cc:Subject:From;
	b=bAdzB1aoJPjRCXeOqcvi3xiG8t+SCDCNnHcn64J9W+LTVaXWnWvWTCfymPr/46SPv
	 xUKBw8/h9FJGiBdMd68f6cHaAZZviK4UuBvuPTbRsJ1bmClWooRgcMVds1g1s5ZObt
	 FoMM61njxu6O7lSviKvGI1rA5XKtW4fz4hwl7rz8IMYcFQtqSgN6e2FKpF08tWJSq9
	 Y4Tkzoh0C0QVhB0R3YTFKVlklfnY+xw7imBoUXMPBOFKXhFEb83zVZX32ogBGD2aB4
	 ctdoICrT+sQIK1PAAJtXivfW0updNMLubg41hII2UroJrW63l1eBR1zHYzje6o9kQL
	 Z6oJjwlHn/puQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMgMk0XDPz4x04;
	Mon, 15 Jul 2024 08:42:57 +1000 (AEST)
Date: Mon, 15 Jul 2024 08:42:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Miaohe Lin
 <linmiaohe@huawei.com>
Subject: linux-next: manual merge of the mm-stable tree with Linus' tree
Message-ID: <20240715084239.685491ee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//zwZmi9EUczEKzARw/rL4a8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//zwZmi9EUczEKzARw/rL4a8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-stable tree got a conflict in:

  mm/hugetlb.c

between commit:

  5596d9e8b553 ("mm/hugetlb: fix potential race in __update_and_free_hugetl=
b_folio()")

from Linus' tree and commit:

  a81fa1dc5db2 ("mm/hugetlb: fix potential race with try_memory_failure_hug=
etlb()")

from the mm-stable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/hugetlb.c
index 43e1af868cfd,740df0b377aa..000000000000
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@@ -1725,6 -1722,20 +1722,13 @@@ static void __update_and_free_hugetlb_f
  		return;
  	}
 =20
+ 	/*
+ 	 * If we don't know which subpages are hwpoisoned, we can't free
+ 	 * the hugepage, so it's leaked intentionally.
+ 	 */
+ 	if (folio_test_hugetlb_raw_hwp_unreliable(folio))
+ 		return;
+=20
 -	/*
 -	 * Move PageHWPoison flag from head page to the raw error pages,
 -	 * which makes any healthy subpages reusable.
 -	 */
 -	if (unlikely(folio_test_hwpoison(folio)))
 -		folio_clear_hugetlb_hwpoison(folio);
 -
  	/*
  	 * If vmemmap pages were allocated above, then we need to clear the
  	 * hugetlb flag under the hugetlb lock.

--Sig_//zwZmi9EUczEKzARw/rL4a8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUVGAACgkQAVBC80lX
0Gxr0Qf8CTbO61aQHoirS1YI/nelWcVnjtXA+7zmaRsFkBsXLpCwBS3aOWKtbI+x
uBW1R7D87fxzqjfPnff1v5bP4EgH/ucURw2nKCmCgZQxaKt4JidlrVX2PIqNUs8e
20ThyvoFHH3VYMHtOB/X03AScByCZXxknX9ZvmntoOCIsLHko7gPGWwXZcSxwfsg
mfQloG/sWzXx+rOisDxqIQ9jWJmcwwm0qc7/Q5Ju3WrwoJ1tesKjLNkv2KoPVClZ
C7Fj4M33TZy+INDedHXKBNRYwRguC2f5IkuUIR70v1ZU4++LQuRVuShiTC8tapWA
KL+i1VOuudfoku4WAr8axRjSM+xxlQ==
=cOmS
-----END PGP SIGNATURE-----

--Sig_//zwZmi9EUczEKzARw/rL4a8--

