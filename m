Return-Path: <linux-next+bounces-9411-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A43CC0685
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 02:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83C49300F8B8
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFA9495E5;
	Tue, 16 Dec 2025 01:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nD8mDo1v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C63E22097;
	Tue, 16 Dec 2025 01:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765846854; cv=none; b=RpSPfTxnN32s5Ac3WST+DDeE8jtntajnSROScSws1EgoaGlN6HVdfypZiaQam8fw1NuztgBhr+JEJz/jUZoWRjxJkHOFaqmqXvkHz/GUpmvnxuBX3QCciSuBhdojdwQOa/MolE08JWMqcGEg9MB6PHXwENa8cbjgsKnZ1SodtmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765846854; c=relaxed/simple;
	bh=7uDUSswflyWBpFEXIl/AHINq7N6nnrZraqq0SHHayco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jALG/cMEN+9ODJKGfJC48D2CCNddiAVNoXaTQ3KT9QiGlEKIoP7pAPzrw4cgx8lGQoJ1Zttm3yzdkSbP3Glz07b2CugwXpFkDYFVTP+TCHxWIW9Di+lDcsZZ69e9hnqhsSDOG1vcrIKdP/jJrmMCuTPmcEU6LBOjgYoyabvBdJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nD8mDo1v; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765846850;
	bh=Cv4u7qnmLy7vGK/p4d5x+IySSpkPGcj+fF/6/Oc/dZs=;
	h=Date:From:To:Cc:Subject:From;
	b=nD8mDo1vKWco4VgBtc8WugZwfVsrdSaXrRGNhcaE8CDJTgIAfj+by0hORbDOfAyqv
	 d5WCUCy/Q7EZaP+RdsadCv47/MaNUqrRClon7qGjlxeomm6TmqNLVoAw/GeB7BDoaN
	 JaigaDbL6ZVHMCc1bnCXkmrwbOIclB/79rFLKivm1z9m1Qt+2CNKd0HBpMneVIV70+
	 yzCnnoOHVnn4IRq/k/ssts89IaMPt6AhD4hhU7EDQPaN0Csv4KJBnRLbdfeqRgvDCg
	 0N6+GAo/cXqK5bfkYdfEK4C2/xFHVsrG4ID8UJA6ld0zE1Mb0MyD7eigs61CRi1kQY
	 DEHnGXocnCx4w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVdsG1sDwz4wCm;
	Tue, 16 Dec 2025 12:00:50 +1100 (AEDT)
Date: Tue, 16 Dec 2025 12:00:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20251216120049.3ed7e06e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hdpqtc.waxuJu+vBtY.SYSp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Hdpqtc.waxuJu+vBtY.SYSp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: include/uapi/drm/panthor_drm.h:375 struct member 'selected_coheren=
cy' not described in 'drm_panthor_gpu_info'

Introduced by commit

  ea78ec982653 ("drm/panthor: Expose the selected coherency protocol to the=
 UMD")

--=20
Cheers,
Stephen Rothwell

--Sig_/Hdpqtc.waxuJu+vBtY.SYSp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAr0EACgkQAVBC80lX
0GwHXgf8DegMLO5Nxpgf9SMwHY/jg4r0/hvub183+z9jhtHtSZNOaEQekaYSz0lT
i6WtlMxmI7zmf3LNTg4P1eisHconDHchDAtJ0eoyIVi5X8wy77GR/j0IRdz8XqMR
+kniGtC6CWeP6a/E3I6lWxExYIb87rFb4I045nBCVqB/BBre4lVyaCHi2pH6Hbfx
relCBlIAVI1rSAqi2oA3Rl2w1vRUs1dsIHGCoRBgBP6s5mr9mVwi6vGvwzALLis9
t0ny8hfmY+iobbbndHNcvQAr1bCgde/hK1wAVT+ZmAvqsYFWDGHjiXwQH2htmJHs
0Jb5QtzpGURcE6t5eO7cGH3t4edftA==
=chMS
-----END PGP SIGNATURE-----

--Sig_/Hdpqtc.waxuJu+vBtY.SYSp--

