Return-Path: <linux-next+bounces-7161-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF26ADC173
	for <lists+linux-next@lfdr.de>; Tue, 17 Jun 2025 07:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E59C118959DD
	for <lists+linux-next@lfdr.de>; Tue, 17 Jun 2025 05:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F2F23B618;
	Tue, 17 Jun 2025 05:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VZ9tEvi3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3F523B62F;
	Tue, 17 Jun 2025 05:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750137139; cv=none; b=eJfqzPcdxuLqC4zqgKGuE+7cCgUqAzTZh5lcsFgzk1XgHHtDYKzkxn7yYFz5+Mn6y/zZHLBQ213Ey6iamlZI7HoCE3DMvCz5gsWqkMhHd4fMpAru+iQy9MbmhxYruCasy3oQoh2o3njx9a1b+yvJl/a7lo0ag5Ns21F6qrXf4o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750137139; c=relaxed/simple;
	bh=38MrfLEMkr2Z6s1k0n532lMWRaz4ITXW5CRMdd1weKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WjJmnDUkajR1wPce7aCLsSfTD5vyvyzThtFc2SHGIvFfOXJXHA9235pQDc7qhxd4obin07CZYCNbhpZmYHhsMTgt8k2QpHNkwbKEZ9c0ZtSeS/5mUF/71eG42QH7DzJkSBc69O8AKledEOVlXb3VNbQ4vb6PqHcWWjm1cwadhls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VZ9tEvi3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750137126;
	bh=wM8XpvZDfbyjLt097fNH9pwsD/DyzJjkPC4GPh5Ifys=;
	h=Date:From:To:Cc:Subject:From;
	b=VZ9tEvi3f3QpiH+6pFCvPSskpHuX9/jxCt3c+7Z0DTRmlp2ECwRc11lLHxgeqblmZ
	 1MWQFiYy8DIbTlYEAGsjwx9GESheZBDzGKhF1xxoKef1+pEol7IuILj76gjFs7FTZr
	 xI/bNrBNmuviWmkAGnQxXJHDJOspUz+s5yHTHmVKxsSZFs9Gh0fcB7yxkrDVHbJuxH
	 DDNltDkmo+m8iKY9cipkmesU9+z6TQtAkpOuqXAcBgsKoOCSFiHleKlbD5uf1d0ohW
	 E3J8x5hqOPQ+I8JoTMm/myKpQOlaJBg2jZfQZlOc/JrQbokgsNQc+5ds55SDaSwAge
	 KR58P8rIFbitg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bLw3B5llzz4wyV;
	Tue, 17 Jun 2025 15:12:06 +1000 (AEST)
Date: Tue, 17 Jun 2025 15:12:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20250617151205.617697ff@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8O4uT592qe+rF9QvW_FLHrY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8O4uT592qe+rF9QvW_FLHrY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/fs.h:3280: warning: Function parameter or struct member 'name=
' not described in 'name_contains_dotdot'

Introduced by commit

  0da3e3822cfa ("fs: move name_contains_dotdot() to header")

--=20
Cheers,
Stephen Rothwell

--Sig_/8O4uT592qe+rF9QvW_FLHrY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhQ+SUACgkQAVBC80lX
0GwwGQgAmBm4yEixLTZGqALq24g6rbLpYyuO/3zKewwzV28tCU/69rFiW8aLqVr8
VEQbmYMHdmmVtNDaURFr36tMGBbXxkReZ7an7UIuvCvqWbJw51m6slWYXLUPCtz4
jIpHSpEENQ+lKRLZJ3KgGJSMzcn+mv4eb1fHjHzHFIiMmGa9zcnVCvHcQj/qLTtC
Aflq3KO4l9DXkVKrZbypjstP33Xd0LoXhcWx7rWs4zlBVDGrzhvXRcL6pa1ylJBL
CDb5pXm/FAfVbYeNW6bUYlNftRhV7+dAtGhZwfbRaM9aEX6zxByjZ3Y3Ahyh4wOv
K6DiAeRj8jAcE1unM0IZ04QK9Gvk2Q==
=ndsN
-----END PGP SIGNATURE-----

--Sig_/8O4uT592qe+rF9QvW_FLHrY--

