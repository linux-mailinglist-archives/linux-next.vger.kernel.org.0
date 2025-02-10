Return-Path: <linux-next+bounces-5401-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CE1A2E2E7
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 04:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60A891882CD4
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 03:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A4C125B2;
	Mon, 10 Feb 2025 03:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AJkmZ+fq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83FA632;
	Mon, 10 Feb 2025 03:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739159365; cv=none; b=ndnIpXNZTxTxoU5Nc5JOq61lWW+u8gCpZG5rPENU/1zTumpZgHSaN89jFMC1xRjbeKdOW3JGQ1ymS5jSo7MBSRwsu+/4LQL8JLvoZSB4gPEYkcSLU12nmc4JjN0qx5kdhvu4ikKyj6PFmjwUhH4nKqag4QWNsa4MzByxZzibvHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739159365; c=relaxed/simple;
	bh=GJw9WF5Ut/+oo75+cEpXrreZMc/J9z2Rw+hagaDuipU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Dy5I/m93kbOQY/ODHFhvR+3JUSAAar7GZMC51Vb4QhwuFUsNcVMYZ03dvx93DsNOZtbU/9CWYm1KLnV4xyUtRwlARShEZ8hvQXfwr4SRJGx5A0j0tPhiz+8N6ZGl2jK6LCMQ8+C19YCojAfzF2WzuXcjl11NI/EWMp04C/hSw1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AJkmZ+fq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739159359;
	bh=Y43Bis08OqxQRefuffiWkrGjfO231KrPqJthseWCd0A=;
	h=Date:From:To:Cc:Subject:From;
	b=AJkmZ+fq8E/jczS3f4AfMy3lvc5doep35Jq+bMM76TA7cX9sOFoT1hJXGyBtVOoWW
	 E1H8gEN2c3OGvIVTH4v4OUMTqISo85GWXNTfMpoun730Y/FP7iK34vTEA4zwj2taAD
	 fpi7Qjtz2AiULsHdOM2ImZJfhbCohDqA0dm8KF2dofbAn5ximD/tzDGzGwTHK0IP9d
	 GVi53FtdnD2r0/wf+OuTmiIbXL77Fm84EJoUH04HxUvh55KXhTOalO68nqZw0vU3g7
	 3RzICKg13ylSjaOufxLuAJ6r3g70x7jqq0NFAWuR8jzpjEmxE3iezU7rEZW/2QQWdM
	 5RLb1HqXAwrXw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YrrDH3hbvz4wbR;
	Mon, 10 Feb 2025 14:49:19 +1100 (AEDT)
Date: Mon, 10 Feb 2025 14:49:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Graf <graf@amazon.com>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm tree
Message-ID: <20250210144918.4e0368ce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z=L9EPFRDENLIMTViaWUfwf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Z=L9EPFRDENLIMTViaWUfwf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/kho/usage.rst:10: WARNING: undefined label: 'concepts' [ref.r=
ef]
Documentation/kho/usage.rst:31: WARNING: undefined label: 'kho active phase=
' [ref.ref]

Introduced by commit

  cf8eba2f58e1 ("kexec: add documentation for KHO")

--=20
Cheers,
Stephen Rothwell

--Sig_/Z=L9EPFRDENLIMTViaWUfwf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmepdz4ACgkQAVBC80lX
0Gxl9Qf9HkCe1DtNWPmBJVw/XdIaQXPHjyX+HL7oUSpOnp6iSR/nR5SJGHQTI6Cq
wmbDAfoI1gD1e4wf/8KIaVeLuvl/W1aEBpaXoKBM/wGH69EXdtgrixndKUo8X4J+
ZmmcsjBcz6tWA+RbQk2RHRGChdZsb+4pZIE2BxZkwRMZjbAyrdPyJ5FEEnYhxCS6
NMCk03LL3nFsuvadfZt/O7jfltSnA01NVPZx+ojWyuqWq1hiHAVcJJ0U9+s4AxZa
JPMA1d0Av2oyLvLZHuBa5GaslmvMnC3CUXkg2q8gqAYonqn33gsMiMA+StkpcilZ
q/vE9fB6Fg/+V3E4cRUAEsbQme9Rhg==
=4fAM
-----END PGP SIGNATURE-----

--Sig_/Z=L9EPFRDENLIMTViaWUfwf--

