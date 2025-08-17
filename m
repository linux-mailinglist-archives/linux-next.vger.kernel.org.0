Return-Path: <linux-next+bounces-7962-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C37D7B295B1
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 01:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 658AA4E5B8D
	for <lists+linux-next@lfdr.de>; Sun, 17 Aug 2025 23:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DEB2165E9;
	Sun, 17 Aug 2025 23:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EHwZnONA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189842AE97;
	Sun, 17 Aug 2025 23:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755473981; cv=none; b=AVBbi+GBjeLcqwxOIVv74PxqpZDwFhdq1s8+MWmnx2QKMu7oJgGSbwOE3I8esODhzMxt3YbECgw4Ft9YjICzaAFCqnk+CoE5m7GnEp84Wurdw8J2sN6wE8ltHX07YXeaMTNfNriG2SqnR41QbPeHm5cBE6TszeMr46AqT1qxGkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755473981; c=relaxed/simple;
	bh=pzm1UjP9hE4FeJ63Ew3loKGQvv0YagQcVQJLY7SyK2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=b2cShfj5EhWHqx1gxendA3ms8plXvoowfaqRRhScWOM8H1xiWiHVb3QnuAPrJZ6d9UjpzytdBQjRUw4VW10MN1Nmwu+tdslTtEKn2rLxFy7uNO8xHQbxHjSHxgL9zvRYizh4S1j4VBWfaY6vvop4MMenMCP8U1at9/cQIKYH00c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EHwZnONA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755473975;
	bh=2AiyEpiTmSqUWOAqR3Ndw76+2MDusTeIMRaM0b84wVQ=;
	h=Date:From:To:Cc:Subject:From;
	b=EHwZnONALU4CchtbtjnGasznOm0hkakx1ZxAl0/WWbnPSzQGLLsvTUdswRCKbiQUu
	 rsSUgG0p+GK2f1OtVNVPJJeVWe8ARmQ4hEDFX4MD8bYkroqG4z7Zi7afDNqP4tE/20
	 pKFZ9tcvZfNL3tzZVj0xtSGz9KClUwFNlzr323r3hcbH2ahv8BrTjVYivolunafAht
	 VZU/L5H5qwl78IV+khkwOMCQe/KZLzaGVN+m92mqPhs5ox2uFjS2W9voyKkQTpmxf+
	 W64pHarTvQYLg21eGpomKoXgzHZa3cHqGJV857USonAko/1wpSF48XXsBVkhpQlsu/
	 7pBZVFL7POa0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c4skt6t25z4wcd;
	Mon, 18 Aug 2025 09:39:34 +1000 (AEST)
Date: Mon, 18 Aug 2025 09:39:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner-fixes tree
Message-ID: <20250818093934.69da263f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BlgyF174Cqgp+Mu+e5Y=TBE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BlgyF174Cqgp+Mu+e5Y=TBE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  546a40359fd2 ("iov_iter: iterate_folioq: fix handling of offset >=3D foli=
o size")

This is commit

  be8f7457123f ("iov_iter: iterate_folioq: fix handling of offset >=3D foli=
o size")

in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/BlgyF174Cqgp+Mu+e5Y=TBE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiiaDYACgkQAVBC80lX
0GyfLQf+NtGOvFHBZKpVe3HFyQmoxtPhCEArotpZyXx9YGfP/zvzOpIhx+7BOrDh
6yXY7fLAk0esmSMwcDt38zF1u0JTVcKA2QSclO3M6SFMCIqjyYmFLtd/aTR79FyV
GySTgvYgjcmC4mstTjkQ8YUXxHZjC1PmSTDnVYRZ+uPUmC/dxJbIqmcAlzgwPJXL
GAVRo2Sl7mVmJXi+QzhdU683k/huTFLSiZ6K43k40NInVDckf7IkO3jQ49mM2Ynq
NN+DzVHbDaK2FB+eMrl+b2GV2uxTiySHHFMvvruw7EDJZwlIYJbaSvQEZKzpxV1D
ijsF2ebuIjpQu6pb9Frw2IVpcIP3PA==
=XD1x
-----END PGP SIGNATURE-----

--Sig_/BlgyF174Cqgp+Mu+e5Y=TBE--

