Return-Path: <linux-next+bounces-2730-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0218291D578
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 02:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE0161F21620
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 00:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B8523A0;
	Mon,  1 Jul 2024 00:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UIz7LUZ1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0E5184D;
	Mon,  1 Jul 2024 00:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719793009; cv=none; b=nN4BsfIt5Lwa+9C6mvMSb/ZebKMpsl/dK+hpb7d4F6VS5HHAHN1cAYIOvbv1i92rzX3PM5K7CkIz/P5RS3MYAuA5y2DNa0a6K87/iTxgodGmlVGLnwevpCpXgcwkRPHXEirIVWEHmfowU1wtR92vns9Sm8PVmKx82OqxWV3Uj34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719793009; c=relaxed/simple;
	bh=Shv05OIrt4jOySfzRW6mAphbqW67+QmTPRb24yysNJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L0GbF5H0Y3GJ9gm5QgLkMnDa+Ju8rIeICOgv5gcqpav5H+mexkoKorVI6E1K5L43JBv6s+o15t+e5hCdxzIDndoQHFp4qQ6Qjlo/rhcFVEGFRPl43ZDChOkUbWgydHm+i0BEQD4RhbNYVauaL1PCflYqUVIUfW8SB+3C+2/nbD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UIz7LUZ1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719793003;
	bh=ObtFuimfQEVuHfXYdkPCbgWg0Y5Fn66sqBdhV3hm14o=;
	h=Date:From:To:Cc:Subject:From;
	b=UIz7LUZ1h7YW1RG1oYGZHEhcgRtXrduzeNY/Frgdg9/0X4orcwHnwc0P4kE7toz9r
	 f5Uo3rP9z4kB7/diPLaFxsGkD/A8SdrB+pw2t8HqjSbTU2JYPqvHpR9CoKvjl8kKCH
	 1+6DmP56Q+nXvs5j32vT1BunqYv0x6Xos6uU4b7L28l+31i44jpc0gvJABnfmTXn4l
	 QvOb5e7MMScNkQs34eXHJphDlpOeRLS1Wek08ZQJoNxnGeNzP8+7gaQ8lHYjfXj+zw
	 53P9RrIAxZNQvRtn+OsCoRAwaCu+OD36Bt8XSgYbbb3TEYHtBBpuIHusPDsHlbG+JP
	 zPyuIMjRrqoNA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC66L42hbz4x0C;
	Mon,  1 Jul 2024 10:16:42 +1000 (AEST)
Date: Mon, 1 Jul 2024 10:16:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yang Shi <yang@os.amperecomputing.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <20240701101641.4fea0ac2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vq9dRb+TmbBpSR9h=2Fdoy9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vq9dRb+TmbBpSR9h=2Fdoy9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-hotfixes tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

mm/gup.c: In function 'gup_hugepte':
mm/gup.c:474:25: error: implicit declaration of function 'try_grab_folio_fa=
st'; did you mean 'try_grab_folio'? [-Werror=3Dimplicit-function-declaratio=
n]
  474 |                 folio =3D try_grab_folio_fast(page, refs, flags);
      |                         ^~~~~~~~~~~~~~~~~~~
      |                         try_grab_folio
mm/gup.c:474:23: warning: assignment to 'struct folio *' from 'int' makes p=
ointer from integer without a cast [-Wint-conversion]
  474 |                 folio =3D try_grab_folio_fast(page, refs, flags);
      |                       ^
mm/gup.c: At top level:
mm/gup.c:2747:22: error: conflicting types for 'try_grab_folio_fast'; have =
'struct folio *(struct page *, int,  unsigned int)'
 2747 | static struct folio *try_grab_folio_fast(struct page *page, int ref=
s,
      |                      ^~~~~~~~~~~~~~~~~~~
mm/gup.c:474:25: note: previous implicit declaration of 'try_grab_folio_fas=
t' with type 'int()'
  474 |                 folio =3D try_grab_folio_fast(page, refs, flags);
      |                         ^~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Caused by commit

  5f408bfe0d13 ("mm: gup: stop abusing try_grab_folio")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/vq9dRb+TmbBpSR9h=2Fdoy9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaB9WkACgkQAVBC80lX
0Gzlowf+ISjNlFGRzqsS2AViJXmhi2+OaqUnV6kN1Yry4NIzi9lr1fXp0U0G97lK
BEUpOLAhRzS1hKczPZZo2wHzxPhy/Ft5nSCwKhrCaYDMP1fuBTN36RFNuTY5JQc9
95zAohd0gEBY/Z+n8WlhrpxZMf3+DYsffqXi6CDvs5wWf3V7GjuM9pyhTs0kt2HD
0+H/MwVIzFyhP8MUVS6yloegM0QwKFYZHztsXjf4giY6umXth8hBCL5gsmEN5c/E
De+iimEGzBIBpQoAjqIBebkY1q17vMf7tAwsNm9xvARoR00+oq3ywzTZlOFauVV1
kyGCh3ZjA0X4v3WdPBTwS/nvJ4Sk1A==
=6FC3
-----END PGP SIGNATURE-----

--Sig_/vq9dRb+TmbBpSR9h=2Fdoy9--

