Return-Path: <linux-next+bounces-8972-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA4DC5AC0C
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 01:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 36B9C353B3A
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 00:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331681FFC59;
	Fri, 14 Nov 2025 00:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M8nSUy67"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C831A2392;
	Fri, 14 Nov 2025 00:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763079712; cv=none; b=r6P64Iyc1ZhQJpGiq4paIq54empihiAbdb12Bt6id8FmD0DN0ZLT7VS2KGTPkW1Py+Yl4YVACgqMdSNuiG14PBjcLEr8cGBarNtEfs1nxigB1+ghWZGa2XoaXF2zJ6KcsZukVHt23lc2vCHWeleZ4BH9i/a1LEh7H7IdjKuAxEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763079712; c=relaxed/simple;
	bh=n0ODV1COFtYBVPrSKExUwpyzLLLVg0o398NlyhP+01c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uvMlDHjBWX3bruXSbYGb8gbZ+aNq5OJsUQSmcXze3Q+4Gir4s//NNYs8x01/ItlGRYuKAgeM19WDcT8FnHKK5YbaJ7LlsrlZ/KbXpB0GA30bzIbRS3s3Vpxg0jx+9Ao1eVM7Vd6hGOHvzhwWQaLIahie/ykim9oDLQow1nfb+fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M8nSUy67; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763079706;
	bh=IGAKxssJ1gwbEfXZykU2CmJO2/msjpbtrbG47DnS3Ho=;
	h=Date:From:To:Cc:Subject:From;
	b=M8nSUy67R9a7Q6xKQufgTSiYKd9CoiN1+LY7riQwDmhgIMh8YQDpGHE8GTwZyN4S3
	 JINOFV38BDYaFb7n02g0ZsrEuhISMVe/gUHHZ1xcUMQq9phFBvdpl0HCH/DvZw0YOG
	 cWwRa5RozmksHJaDhE70wdNCTr7vpeYeWYpuFBu3rWw99LW0Z59aib/DFSGV4QW/8j
	 IsbWhoPJIBuY+ee4RS9jRvjZ1Cht8X3VRw6XkaUn2GoTE2dHXmtjLol4odrdfVMj74
	 /JtZr+5/9D6dJaCdUSCK+zIkoDKZmFR26o0c1sUjoET8olqC/YZ1b8fUlt0lsPemR/
	 oVWgSUp/fAIgQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d6yVx6bzcz4wCv;
	Fri, 14 Nov 2025 11:21:45 +1100 (AEDT)
Date: Fri, 14 Nov 2025 11:21:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, "Cc: Andrew Morton" <akpm@linux-foundation.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Chaitanya S Prakash
 <chaitanyas.prakash@arm.com>, Linu Cherian <linu.cherian@arm.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the arm64 tree with the mm-unstable
 tree
Message-ID: <20251114112144.366698c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5nBT2=p/PwN.wETa=6CrOJl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5nBT2=p/PwN.wETa=6CrOJl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/mm/mmu.c

between commit:

  2b9cdb805fcd ("mm: make INVALID_PHYS_ADDR a generic macro")

from the mm-unstable tree and commit:

  bfc184cb1ba7 ("arm64/mm: Allow __create_pgd_mapping() to propagate pgtabl=
e_alloc() errors")

from the arm64 tree.

I fixed it up (the latter moved the INVALID_PHYS_ADDR define so I removed
it from its new place, and there was no conflict left) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/5nBT2=p/PwN.wETa=6CrOJl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWdhgACgkQAVBC80lX
0GxWHQgAh3UqJ5sU7Ta/kkaAupfnjV/hSZtLq7KEuYKw7whd6jPRcxZtKQHze82O
wUxdSyFJU7g5mAqUaImIR/oumlgyr5GszknVPQYAmdDFha1aJlMLB+G5y0ctjWjL
aHEKBwOw+IO6JCGBxaQg5umHZRFaG5Mvtaix1bCRiwUjJfvxQd8OfEW5O6gN0OBz
aI6pOCkElsc4gTywj959bOrMuPxia7tugYitQxoIwkIpFelAO30CWDRrvgtCx3xl
3+/9dr2znjS9gsdstiXWtP3iWSAVddnoSGMu+YIKknATPYgN6vF7C+hfB1QVsgbY
rgHBRwcQgpL44KtwQsVA4nNmjnBM+A==
=nDHr
-----END PGP SIGNATURE-----

--Sig_/5nBT2=p/PwN.wETa=6CrOJl--

