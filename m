Return-Path: <linux-next+bounces-5753-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 150BEA5D201
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 22:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85C4A7A28E8
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 21:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDCC264A68;
	Tue, 11 Mar 2025 21:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="L1OwFySP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBFE228C8D;
	Tue, 11 Mar 2025 21:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741729870; cv=none; b=bX3ZwO9d/HlB+qi8mc3W1gBhq5PK/W2t5eW+i/wZS2MV35UqjsVhi3rdDNElGNdC77wWO7jSBcFiE/1Wub+YCApDwfoG0PmVYRVhcMvK1iVvvvmgLXSTRxc8v2vPdR2zU3YI5DtRTPLdDtgV3Sfs+fTib6BFmoXPwW8ZPo67awA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741729870; c=relaxed/simple;
	bh=iPijpG+Ein0l65BI0jDKoR2fUUogRl5NRwPh6/WZaI4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yqseo+ndzNbf2NAvkNHeF7+kPEj4+b6COuRB44LXK2oocQwr4RJq35513kpKP3cq/FcTc2uSSzgqdyNYWZse9LOjsp3mPIoh7d9Qp6kptnRsWXtc2Fu0iuHAvIDTrpVrIoosgTDqLngHrNv27yIqC9tVfGaxFT/yRLE2lzDiOPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=L1OwFySP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741729863;
	bh=Jn9nRcpdljEQSc2Pubr9/mhILU/2Se6kmSyL0z/RxvA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L1OwFySPcoRPj25ahpMT27FgIeAV5k7JdpXSIY/cgdjf5BiTeypCTsCJ5yiffwmUr
	 5lyZpRH1gW9nH/0pgmNq79guntxK81z8vwKCz7kR0nut1hNSHjbsAb2lqKcsqb/xic
	 Jmw6JelKXAMFEypUkJFpGe8Xh35yoRwxuw4MZgwQgjbH6xaF9HTtD8pJw4pqBzwx4N
	 PzCFclANprpXoLaUP3oKczsu9aucsdufP3KHUODzAJ3I3EgGApMTrFjXnUsO5/98R5
	 XtTi665uqqjnJSL+IkngD8B+pmepmlbZfFVo94P+ktcCBjKMC0G8cBWky1+XCBA9Tv
	 z12LF+jc/DpEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZC6s21ZXQz4xD9;
	Wed, 12 Mar 2025 08:51:02 +1100 (AEDT)
Date: Wed, 12 Mar 2025 08:51:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Heiko Stuebner
 <heiko@sntech.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: linux-next: manual merge of the scsi tree with the rockchip
 tree
Message-ID: <20250312085101.58cdd1e5@canb.auug.org.au>
In-Reply-To: <6134949.lOV4Wx5bFT@earth>
References: <20250311183524.38989e83@canb.auug.org.au>
	<6134949.lOV4Wx5bFT@earth>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FN7Hn/ikkX16Gy1WEVHGBJi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FN7Hn/ikkX16Gy1WEVHGBJi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Detlev,

On Tue, 11 Mar 2025 12:24:25 -0400 Detlev Casanova <detlev.casanova@collabo=
ra.com> wrote:
>
> Unfortunately, this fix is incorrect as nodes must be in address order, s=
o=20
> ufshc: ufshc@2a2d0000 must be above sfc1: spi@2a300000.

OK, I have switched it around in my resolution.

> As we are close the the merge window, I won't mind if the patches have to=
 be=20
> postponed to the next cycle, but some device trees won't build anymore.
>=20
> This can also be left as is with a new patch to fix the order (to be back=
ported=20
> if needed)

This merge resolution will be redone by Linus when the trees are merged
during the merge window.  Someone just needs to mention it to him.

--=20
Cheers,
Stephen Rothwell

--Sig_/FN7Hn/ikkX16Gy1WEVHGBJi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfQsEUACgkQAVBC80lX
0Gz7JAf8Cr8W6S71rnAzMEatJm4e/1EyZ4wa2VCifV0GXp8uDevRFwYDvTLvarLf
DS+Z3zqv07TMkHaVTtonHloI+Kx52IC4PIvFa5S+98VJtQ2Uid56FHuMCwmsQm0U
K6Ved+GpKYm2Kx7kxhHjcVhiePlMb1/ALbfzM009yORFFhKm1JrW1589tSXWYnr0
VcVRzCSUaiFvFY26UOvlEWbyhlzSlTUyLMQZaFHqq0q/oKKUEZ6Ah+Z6Iv1aCMMe
3YC/6l+FtPSVdVoeFDTxwN2C0cHN+K87bRXfEA6z+GEbckrCN9R6HbBU6YBXGgIq
pz9ltSKtuCxknO6vTVZkdh5Zg6+Rlg==
=EcRW
-----END PGP SIGNATURE-----

--Sig_/FN7Hn/ikkX16Gy1WEVHGBJi--

