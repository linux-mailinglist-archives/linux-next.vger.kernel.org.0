Return-Path: <linux-next+bounces-2237-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9468C0772
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 00:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A11D284604
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 22:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3E128DC0;
	Wed,  8 May 2024 22:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jRkryQon"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE42288AE;
	Wed,  8 May 2024 22:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715208178; cv=none; b=LF+L/gCtsLxSbxVdsnIOXAeW0H1XC/IdRcInvApn8XiAwFQixmtNcVm4f8GDXOECCCM1sDxdUXBhySwDIG2+vmfk0ALbK6OkTcmFoIk/ryTgRJILrlsLFnt00gXSJ4u9skx3BReSmDtoe5rla9r4ZHLIciqz8TEzklP/IqXva/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715208178; c=relaxed/simple;
	bh=H7RgnqZhY4TkuLcL8p46DGroCqZ9RVOM5l6ug8d7TYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LkaPqVsoH0aOmBGjhRlnv1h74HM1Fb7GX2Cz4UAa92U1Gfwn6Fvoup0LG/lLsK3+f5qWoPJmDVptd+X3AJ/ru+NxZWaimpCj5Veks8EKUgsOSB4FEW8m9Msn8NQJ+OCqn8Y7FExWm22OjS0tPnZYxT+atf/90Azr5C3/XGvhF4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jRkryQon; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715208173;
	bh=xofM2o14GnhZC40peSjbfvGDvqGt8usBSn68jjbJUJc=;
	h=Date:From:To:Cc:Subject:From;
	b=jRkryQony8LztAvSg3ii7zccZM8sURQS2IeBoJDhpVSBfCId4/o9Cqo+8lS7H+A7t
	 PcqVet5EOQ3SzzFneXjlR2WLil98HLkWot4d5lJtjg1hEu6+ZiZGj5Fz3VQHDIDR5f
	 FvkytvukVT4uaRFBog6Mlz5XWBUkR4OyLkoOEgB+2h5YZ+De6kMuKNZvjd/ZgDB40t
	 Gva/0n45i6DpSD2YsC9NiR9Recn7LZvovCklnU3MlsuKNhMU9f5rSviz6h//au//nL
	 SuBVg96RL0YHI3Mp8JVJrzOeriuY5PkXaV2HqHWnGJZirKASyt3I3qM5LK/ERgWhmb
	 iIKhhy9zBR9gw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZVXY2DxZz4x2k;
	Thu,  9 May 2024 08:42:53 +1000 (AEST)
Date: Thu, 9 May 2024 08:42:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bitmap tree
Message-ID: <20240509084252.3f7259af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.U/t+OcE5p2PGyCFy6Af7CV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.U/t+OcE5p2PGyCFy6Af7CV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  552467a38cf5 ("arm64: tlb: Fix TLBI RANGE operand")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/.U/t+OcE5p2PGyCFy6Af7CV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY7/+wACgkQAVBC80lX
0GwZ4wf9FjnBwpCnlGNYqe3abzNtmiAuL8yGtiOLU8Sy75ITaIviAY5EBaRdCccZ
G4OrYp2VPcjhiGU08T+wE8gBRUfiTrNPzYqcqw8W2cgMr/KNCVa/Vv+c+ivlRNSG
hyxtszQr1EOJkl1+n84L+wENKmpOnRVMiRlhiCEX5stEehLQJVFHHxkESPs5gurh
TytQD0lT+mE7Jn4tmNtVeQ0/dlA7FG/N+Ozo+NuG6Jy4LET1BRr/dahQLutCW/wL
GwAbcniUyweO6eTlTsKqrv7iKW/U9Lyh0jzM14CzWZfB/+SZoRhnjOy+5Tv0qrR7
jl3By+bjvyVieje9I3LESA28GY2MvQ==
=ecKI
-----END PGP SIGNATURE-----

--Sig_/.U/t+OcE5p2PGyCFy6Af7CV--

