Return-Path: <linux-next+bounces-5159-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2990A0ABE3
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2025 21:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5ADF165F02
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2025 20:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6034C1547E8;
	Sun, 12 Jan 2025 20:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kdgMW2rI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3C73C1F;
	Sun, 12 Jan 2025 20:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736714974; cv=none; b=O8oDoJnY80JC9oltilNPPcmgC6eDV7cI4979bSBBRQWP2kYwhxYR5dXKBpSqsGMBx4YH+r20xkDyMlg6EqhlBCrCIY08/0sk16uqhVNFyeKq9gjUtqaQMFAdpoF0wez9JxpZ6bXJ8gunx71j5e2qASidf2hRm7SSlzE1s5VrhEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736714974; c=relaxed/simple;
	bh=4m94Y7dMr8mlM4bn/8KZ0/JKhzKn2IzSSwRg3vtvsAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fKpBvHczPclTxuIe4bALGl4V9FwWEEt7HYu7V0jp2a2ceT7/XENVPFVSngFLwulsLXymIQQXNyi3idn0EB8mrfapfd+/x/JV/K3HYuJjAJYcPDx7WUi7+pBFRw7VxWQZ0mBAQcc06DQOIuiEL4kAv/CDYfxcbjjqIW4+hpnFq/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kdgMW2rI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736714962;
	bh=UatiSmGN33baRLbCQSNLDAXEKo68cu+JrlH0GWw9DjM=;
	h=Date:From:To:Cc:Subject:From;
	b=kdgMW2rIwNDATfq35GHjspOcP/DzZduppEHvqdpbuHNAhInhUaLwM/UndXjt3Gw8X
	 oNE/qf2nEAHO4bZxRLq2rfAJ2NFtTfd5YWrGtTy3gmJmSPZbUKCvkgFkwyLIZ03h25
	 UdTOBZsUI3VX6JUZ4xY5YFXVVYI70sUdy4yWdgcMkuVxaysJzhjTHIO4ZnBJuWYQRt
	 WxfKNtMLniALy8utaPhCLgGZGN8CA4ajs6W2AtcSURCFxlBarLAD7mrQdJ9kqXtWlq
	 h3N2lbVx6rq0mIHoVv3AUow4AR7P1r8SHYNgG7V4sWVs8AB4jLxI6s1//8mA1dub7Z
	 P/Irc1s2Hjgkg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWSDf2Ts9z4w2R;
	Mon, 13 Jan 2025 07:49:21 +1100 (AEDT)
Date: Mon, 13 Jan 2025 07:49:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the devfreq tree
Message-ID: <20250113074928.316be5e9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5Jwpi=+mGSNX4DgaY9y.JaY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5Jwpi=+mGSNX4DgaY9y.JaY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f3253b23535f ("PM / devfreq: exynos: remove unused function parameter")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/5Jwpi=+mGSNX4DgaY9y.JaY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEKtgACgkQAVBC80lX
0GwPqgf+Nb41y1MJ90pajKQ9efrsAWpJ59zCf1aLkhc17HiTT2mNYArYJTnKfySa
BxLIsp7fvzhmMwu7imsx5TnoiOK41UkpNeGB5Ib3uPKjCJu1I7IdN6W22NPyh3sK
7SBMK9dYkQRxPKq/j6b2oh/CtvPPzjDgEscH6uTXyBM/TtjkRBGe6grmnX+55+V0
Bz+OuGeiHOI1NP+SLmLgFSNY/1TAVafSw8v+GWVI92X2RzIUgZWf+ESz04Gl5j9c
EacfALK83KYzkHizbpZh/RmKnPX35pMMToHX6pdrU/InjItwhTB8AZqdBnQ6vkRy
mXVNO/l58hoMExRkHt3YhiwfvZEIiQ==
=YLPc
-----END PGP SIGNATURE-----

--Sig_/5Jwpi=+mGSNX4DgaY9y.JaY--

