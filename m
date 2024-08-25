Return-Path: <linux-next+bounces-3411-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 167FC95E58C
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 00:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F69C1C209E0
	for <lists+linux-next@lfdr.de>; Sun, 25 Aug 2024 22:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089FA3B2BB;
	Sun, 25 Aug 2024 22:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sRm/qMHx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA592A59;
	Sun, 25 Aug 2024 22:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724624736; cv=none; b=ktwlbyY/ybF/Bkn/kmPjDhjwiI+1nVKM2GXrqQ8v/Axv/9m+iJmlx1M1gqZTKV8ERDS77ll8Pn3Y/NdJJmIQ9cMT+oO3lEFPusczNv/31njcLZA6TsNdw9ScEvobA/HCPh6RokJ6A6pEGwHKDS2yHzDSsta+eut23tuBlj8vklk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724624736; c=relaxed/simple;
	bh=mxzc51XfDXIUZfHLj0FhPJO7mbVrL6NL4GJoPI0g6lA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=exL3hQOq2yfkPUlb46SXS5lgk+VBb9EO1g5Hx9invLLzZhxXGVz4PbHT47z23gf123Z0YJkoYST8SQBDaB/GZIN/pyx5uTjyUjxdU7thYVEkYpwrWT9PF/JflWUs6WSqqWfWhDOr/EBepvi4+YpwKYw9UNLryzOlFmoxZPg4d7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sRm/qMHx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724624731;
	bh=P3Gy0CkOxIVW39ZpjK6tJ0BCykbPrhNwz0Cd6RhbYVA=;
	h=Date:From:To:Cc:Subject:From;
	b=sRm/qMHxDV1TVaxFRmMSSkF/wCOR5wFRv+VcpL6XVJHCctJEo3pZIXeLCDxqba7Xf
	 vj4phhErIoK5Hk3y/OJPwFsjvIyZlBtI3+sYfZLC4aEWvssGL1VXdeLfJxtEDcKtPI
	 Fcg7d8bSdo8ALMMxZp4+1jztlC+lwo+Yhk2YsSARaUgX2YinAlNIFtrFMOuIpP4xeu
	 cmZrDhOvyQ6mAkAR2AecHAL5mSpQ0CNWkjFOVICV+9QfHtnBvDOv7LPh1sQHvAcCMj
	 pNswjtRLNDtI3F+Wi3iopjuj89mT1Vav7bvh7JJvwfe+6YD9i9X1sYrfaq5AimM5vV
	 AqFrUvtJRq6dA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WsT0B1Xwcz4x3d;
	Mon, 26 Aug 2024 08:25:30 +1000 (AEST)
Date: Mon, 26 Aug 2024 08:24:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20240826082448.557c2c3b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Nlc9lmJRyINc1kQs_xHcg6V";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Nlc9lmJRyINc1kQs_xHcg6V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the ntfs3 tree as a different commit
(but the same patch):

  c4c9c89c8c8e ("ntfs3: Remove reset_log_file()")

This is commit

  3205fe852665 ("fs/ntfs3: Remove reset_log_file()")

in the ntfs3 tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Nlc9lmJRyINc1kQs_xHcg6V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbLrzAACgkQAVBC80lX
0GyI1Qf/WFE5VwY8RpCk0K/Ry33c6cNvL4+/5/76sJsWTfr63sXA0lrc4ba2j5HV
VDZYz3G5D5YnepVtlk1Ch8YJghXZPytG0nd52AsNlNUB3N6Q4NQ9FWczZXTwGFma
gWmoyKqxAEoGIgFGe+fUORZcc5lOPop4yC21/hFiUprxPoPSYUh2ZwLIwvk2Pt0J
o0ZuOU0m6mqyO6pa7oPnFDEI8auGUx/xwffG0QUxB1jn5mKVzkeWTIx/Ee/fxksZ
4WMdVn4HUs9OiVvEp5twf2etmJs5QtmTvjALOubSNauvhcozEFfdw/+ml4gCul9s
OgdCMD86cIG/Y13w2mWgblRykdT6Ww==
=/5Ae
-----END PGP SIGNATURE-----

--Sig_/Nlc9lmJRyINc1kQs_xHcg6V--

