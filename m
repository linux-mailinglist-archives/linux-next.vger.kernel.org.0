Return-Path: <linux-next+bounces-7173-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E89ADF9E1
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 01:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C68B3BEFCB
	for <lists+linux-next@lfdr.de>; Wed, 18 Jun 2025 23:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB672E4241;
	Wed, 18 Jun 2025 23:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eN2jeEd3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE23281505;
	Wed, 18 Jun 2025 23:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750290315; cv=none; b=c5ykOqr26b/qkBzVu6PiVC+SxVg9WuqonbGBDt4Q1NXsRuq1dKTmbIfVPF+CZ/RZhnVJsgQZEVYyJvQQkedvYuUdbQ6IZxdQLgeU086P9aTFpdhScLkU9JwGXOACai9isO4KLCPpkl6EOxgD9qUB5elthdGeyGP4QgUCNZUvZ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750290315; c=relaxed/simple;
	bh=LV12kqiZ+M0ktOH8/6qP8t8t/WIbXN71BhQNLY7Y8yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lWGaN5ySkeYCil8iZLDxyNOlGYo/8vk2H1W24lU5HVGls92yvFURIEpiKrD+dXq/QmJgSbEP5oRg4w3L4ZYGDEdoO99MBmJBaQ1BGE7BhmfXRLKFLQMq1GRjQYnoOKiOUxeQhjk4sxnneQeAhIS4DkPFfgTUwnuHDAyZMA7ri3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eN2jeEd3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750290304;
	bh=sp8RORsmVOmCkt0MlvTI/mSa0UWrxXCzzbOxk40qWoc=;
	h=Date:From:To:Cc:Subject:From;
	b=eN2jeEd3whqzP3PV3SXY71NtjSIgkiMSRRVyNxfMWrdx8rsZx6Q2HgttQ5n0Npjdu
	 Zoyr0uDY5iD4XGPtF9zk3b7RsSnmNNhrm/+z5zw5tl/7meSs87a/oZDcqIilccdtQD
	 9GLdiifuGd2LXVgX53W85D3GhN91iM7vK55vcxfnrm69rtx5Dl3ocra1rTuF/FU/RQ
	 CA0JVfDVbSgi1dzvVBe1rVtmLmWATYsvSqUI3nOo36/pa78CZ3fpgK0sz2msOhPtO4
	 kwIpsKJSognlLB4N7pghS+btDaz1ps7y0rXqSFZmPIgLyQVigbnEx2rHHIX7D2MO8d
	 k5Z2Fl99/b+Ag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bN0hw4tXKz4x8P;
	Thu, 19 Jun 2025 09:45:04 +1000 (AEST)
Date: Thu, 19 Jun 2025 09:45:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250619094504.20612222@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iWCyZp27I1N94AatKQ=+1.M";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iWCyZp27I1N94AatKQ=+1.M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/ubifs/file.c: In function 'ubifs_file_mmap_prepare':
fs/ubifs/file.c:1589:9: error: 'vma' undeclared (first use in this function=
); did you mean 'cma'?
 1589 |         vma->vm_ops =3D &ubifs_file_vm_ops;
      |         ^~~
      |         cma

Caused by commit

  a5ee9a82981d ("fs: convert most other generic_file_*mmap() users to .mmap=
_prepare()")

I have used the vfs-brauner tree form next-20250618 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/iWCyZp27I1N94AatKQ=+1.M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhTT4AACgkQAVBC80lX
0Gy3Dgf7BFdm0CjFY43EqOUat8cPJbBdjtQQ49nj/n/fi1J0hbZoKzbJEgNWWFJN
YjlLOReJY5SzBkZYqB8q8ilb1NO/qvzIhknVOnQ58LDv8ZC2dn3R6bFPdc4CxFDp
+fzwOhIMYJN3q/BIVure8kLOBrNY/0GEw2Oc6h8bvSBHz/FtzIh8h3jQC5uyOnOx
Q8SDVmKjeZMvE1tyX6CqSKwc6UhITSw3FtQq27J/Yz7E++Q9PcRVkNQe2J5WPdVV
5JQ0z5JhYM5mL7ioxghKUm9+NicOOXzmyb0otSuGaiqWHNmQRACt5bR3E4tfcERX
hMNNhEKFlmAAQPYjzZfalo0EhGLFgg==
=vVCp
-----END PGP SIGNATURE-----

--Sig_/iWCyZp27I1N94AatKQ=+1.M--

