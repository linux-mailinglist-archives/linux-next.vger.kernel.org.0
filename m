Return-Path: <linux-next+bounces-3153-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06339940179
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 01:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A794A1F22F57
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 23:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B73145A17;
	Mon, 29 Jul 2024 23:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Xj731GaX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8613D9E;
	Mon, 29 Jul 2024 23:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722294068; cv=none; b=V6+2oSc5SxB/Z5feFgQ69bLHwRjtJSQ/xpd64gDIdOJxqajwv7z4sCFxjwCXgJd9L5kiIs3hlISqyN3+FGS7niJdY7aCaDynakuiY/oHFxFW9hTk/h8g7iP5D26vEMnFI3Ipa+AbKdV5Z4mt3b1lrfKeyo/NlpwUI/cyyc+2/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722294068; c=relaxed/simple;
	bh=sVc9oNwqCsXx2rmRDVNxqf/CZuaiLa4l8NaPPinvq38=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eURGWIt8Tb39TXbeF6ZTTLjhTBVMAT2iNxnN62xhtO85XpRuVR6yRY5TO4PfrAVo8f4zOAWkg9vzSURvWvxV7ZZQwl0sRTtxdkTCzxvsGZ85jiCzSuosfFYh5mIOy/8jw7AzJK39VHgd2SgjY94NKFpZe1hR6AgwDPX4/ywk+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Xj731GaX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722294060;
	bh=KsCYJJQihm3eoy9V9x+lN6vEZWKhHmoygszLZjvovAg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xj731GaXacy92qmoMd3qpUISKzHU+Q/1OBBqDDZbX6HTTrTDO2+VgACWmPJq1U7lH
	 a9B9RyqF95JLDKFE5ylDZ06M+2ffaVecEdcyWhNO20Ygag+bYbD1h09AJsYoavp571
	 sQ6ulNG7HMYmEat/QtIcQvxXciXVR8qLebm3vKFiDWtGJqsmacJMgVZBoayjNwI/kZ
	 cfuVDcozmpnTXqG4mOvkKbZ8hEP0/t1aDaZfQG/ZIeqtOwW6Aye3BpaU13EFX1fsU5
	 E1G3PG6Cb0BAdGVE/hgV3Q8qZoysVYqBhmP5fB1tNCtu6DZ4zwhtHP+y1dFsfdsFcK
	 swJcdrGArpN/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WXv3c35vnz4x3d;
	Tue, 30 Jul 2024 09:01:00 +1000 (AEST)
Date: Tue, 30 Jul 2024 09:00:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240730090059.721de7cf@canb.auug.org.au>
In-Reply-To: <20240726100041.142b6e35@canb.auug.org.au>
References: <20240726100041.142b6e35@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X=vdSS4TR6IfNbo=xg2PegG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/X=vdSS4TR6IfNbo=xg2PegG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 26 Jul 2024 10:00:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the vfs-brauner tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> In file included from fs/smb/server/unicode.c:14:
> fs/smb/server/smb_common.h:46: error: "F_CREATED" redefined [-Werror]
>    46 | #define F_CREATED       2
>       |=20
> In file included from include/linux/fcntl.h:6,
>                  from include/linux/fs.h:26,
>                  from fs/smb/server/unicode.c:9:
> include/uapi/linux/fcntl.h:20: note: this is the location of the previous=
 definition
>    20 | #define F_CREATED       (F_LINUX_SPECIFIC_BASE + 4)
>       |=20
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   a621ce4eed14 ("fcntl: add F_CREATED")
>=20
> Is that commit really intended for this merge window?
>=20
> I have used the vfs-brauner tree from next-20240725 for today.

I am still getting this build failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/X=vdSS4TR6IfNbo=xg2PegG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaoHysACgkQAVBC80lX
0GyBjwgAmY01w4swNykcajMmtQxkLPfMVYPJqe7bp1HlkHhFqX9xTdcx4A+8WWpJ
YsBIW2YmPuX5PJzAUQtPBLhZpoirs+yv5kYVov4HkbwRjy3hvd03tfNa+XgDp+kD
Re4uowX0ahf09OVvaNd5MVFTQbJ1PNHGX0Tr/GDaR5fZmFaycy3O9qx4r0I9gTrP
+S3FITFG3RV5Lu7tF9C+b6gQwmYvLsLkSKgySE708EnkrjUqhll/C/g089E28Knt
3OxvITR8wPccd/0kOmt6eG+UgiDZ6IIfIyD/EnQ18MuFoYkWIMfGYXtF+6DCL/yZ
ljPHRWjWpZgLWMgmqoN8qHfOd+nE9A==
=mlTo
-----END PGP SIGNATURE-----

--Sig_/X=vdSS4TR6IfNbo=xg2PegG--

