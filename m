Return-Path: <linux-next+bounces-8836-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A51ABC33FBF
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 06:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5889C46202B
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 05:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8B123770A;
	Wed,  5 Nov 2025 05:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IPsOmtk9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E22208AD;
	Wed,  5 Nov 2025 05:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762320199; cv=none; b=ksuP3M5/MkkvNAuUgqZbMV6M+oBlx41wpAsjHqR5UlBILWllWG2nTjFnDJCFvqgGrFUHIv8huJAnDzPv54IS2BJTkYei+rFemIL6f0vbBGGOrx/M1ARMQcEN1DKJeW7IW4bb65vYusfLZuMTp5DDkrru5X/G1W7bpDV0PnXjx1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762320199; c=relaxed/simple;
	bh=hEH2QB1nliq7yRhagE4p9BsmINtAm36qArRs/4bLI94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CFp2ISnmdbQeDmFhNEGRyUs8fBtmImUtGknUb4LBKJ9qTpfufpP8q9Im6zP+OOpHQXyMU+YpR05bnuCZzFRkGNNwjMcoLEeNNbJ8hkdXkDsZMGWMEMQji2olCSzcuy86PexFHaSWNQyj9FA1rwjGKFjiqBdDNSf37+bm/Te8dfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IPsOmtk9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762320195;
	bh=J/lwCdgYzIrvkt2Te425UziPxfrWvc6nu599jANggbA=;
	h=Date:From:To:Cc:Subject:From;
	b=IPsOmtk9WoaPehinZwGm6qn3+JOo3H7aI445o1FXUFyzFOnCOrBL64HPPf6AtE9oD
	 Euvrppot5w+yFyYkh5mwDnf/GOVSGzmfE0Wr2ucl4mTPV2KjY6BvulZK12JxGbVdZH
	 Fm0cAKeNtuSXNwluSXtvemoEt2S1NPF5M5TvCB4X5Hd6c3NGk8dK4feSxR5J/qMDbb
	 Lf7FCkzG7N3S/w1o+xfTRymi+ZQvveI5rthaS4s+SwrZkTSnPgmpzmn+bqJTqyP2bX
	 3ejFxi/QshCO7CZnzxhjjAXc0yV0bCtEidixcKA6uZ9z7c3/fW9Nwy0gnvw1uGj8VJ
	 JfnD+tY3U9lZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1Ycy5hP1z4w93;
	Wed, 05 Nov 2025 16:23:14 +1100 (AEDT)
Date: Wed, 5 Nov 2025 16:23:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm-unstable tree
Message-ID: <20251105162314.004e2764@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I4bSLXvntDrlhHF/ZjO7bQP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/I4bSLXvntDrlhHF/ZjO7bQP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/core-api/mm-api:134: mm/huge_memory.c:3593: ERROR: Unexpected=
 indentation. [docutils]
Documentation/core-api/mm-api:134: mm/huge_memory.c:3595: WARNING: Block qu=
ote ends without a blank line; unexpected unindent. [docutils]

Introduced by commit

  95164597715a ("mm/huge_memory: fix kernel-doc comments for folio_split() =
and related")

--=20
Cheers,
Stephen Rothwell

--Sig_/I4bSLXvntDrlhHF/ZjO7bQP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkK30IACgkQAVBC80lX
0Gymsgf/eF1kiGifVbpIU8bDPX69SIK1G4fijSzaopbrEZR7dg+1dbqbMHzSHNVH
791UJkv+hLvYfSpQRVZAZWvDoIqduRLZ7DXSQSUb+hqyRhYcSqSbNfOcETrUb/ES
SzRzcI8NdW8jO0wzouosGvJrPxm+MbgjQv8ffQFUOejFaTZyi8cEb8owXTPRlybT
FzpwHt4bfuknmWbjjXbHzSIQJJajNy2m8TF/558aCJrXrA7uO5sgaj8Qaho6FbiM
Sp5gKXZoUMCYtmpVGs9cQEhwGVaFeQLpy/fCDCU2UTm7lo3P1mUwh70sMnuuT7r2
4FOkarFq31AeVN/8/CaEJ8mXJgtSfQ==
=kvde
-----END PGP SIGNATURE-----

--Sig_/I4bSLXvntDrlhHF/ZjO7bQP--

