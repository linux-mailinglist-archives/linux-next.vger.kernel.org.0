Return-Path: <linux-next+bounces-4796-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 644289D06AE
	for <lists+linux-next@lfdr.de>; Sun, 17 Nov 2024 23:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E78FE281F4B
	for <lists+linux-next@lfdr.de>; Sun, 17 Nov 2024 22:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688B417C208;
	Sun, 17 Nov 2024 22:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZmnQ6Upt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30316144D1A;
	Sun, 17 Nov 2024 22:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731883013; cv=none; b=nYqsoQ9W4YOoUBcedSxW/x0lBzGx+nPFQ9kIkDODgQl+1BLrPofmTe0bQb1S9js3dGi9F4MFEo60uNLJu2tTwqtuxlHVaWAhu4ax11GUSljeuJhblLnW9dFOimHeBGqWMDX4dNENcqoMvJy5ZunFqpBQkN9wp1/vAyxb+48Fo+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731883013; c=relaxed/simple;
	bh=w5MdG8IW4BU5pp2JrbfjHkODzvResJ01HbXbnboGzVs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=FbCwDi87u2mPX01AvQ9HVUuhbTDB/aIZId6L6R+4teUDztoWIRqX8yIamFZH1fyFJtOjvp/Tw7E/bEr/zhpRQoTF9LeMwpqnb72JcthOiyrp63fvnqn0koGBPfm8ClSj904NxnnMzSkp/5YuhoJMZPWbnFmL6P+r+zCHgRpNbvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZmnQ6Upt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731883003;
	bh=Q4Tur9kCBk14yNgCniuN3lDSy7U2IIQ1367+stZEThU=;
	h=Date:From:To:Subject:From;
	b=ZmnQ6Uptl2oWww/TYFkOT9RJnylNcqajzBOFpRiCDL1BHnlnpZBCNIL9uLVqQLJ1W
	 dxxFAI61p94MVxGrv3uPLOLGYAlbIniuumkPLGL+krKksamCUl0FAvieKZc/y15b7w
	 7gqjIJjIgqrqDrzBqHmi0UszP9pIK2G7bGL800EEg4xgxg82xdUvFBDXKFkFg31apB
	 LueutgwDu9zzZfQ4p6cueKR+S8cl+NFlRfqn20/B5YtqHJ/1DR9H31LjqXPqkexQPQ
	 GRuog69AdnkqwLxBxJE5HELQb4gRVi9FxeRCQufZu4lVS6OQHCbWdQCVQQP26XPBGW
	 xegAUWk+gc3mg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xs5GM0NKBz4xfS;
	Mon, 18 Nov 2024 09:36:43 +1100 (AEDT)
Date: Mon, 18 Nov 2024 09:36:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux-kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: the merge window is open
Message-ID: <20241118093645.236991df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l=q5abJgfLJg.DX8/wo0iEj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l=q5abJgfLJg.DX8/wo0iEj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Please do not add any material intended for v6.14 to your linux-next
included branches until after v6.13-rc1 has been released.  Also if
there are commits in your linux-next included branches that will now
not be merged during the current merge window, please remove them.

Bug fixes are always welcome, of course.
--=20
Cheers,
Stephen Rothwell

--Sig_/l=q5abJgfLJg.DX8/wo0iEj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc6b/0ACgkQAVBC80lX
0GzfEwf/U+Cl4wL/THmaj32qNUjCMCrz8CSRpfCtc7COqqMF9iqVDxrYCiCbZLyi
FH2qb9LM2wxuTSSLvjml5NJ/RVxkJFp8GSuyH1h9Wvu7UVGmE/66kV5l4T8ifUra
vKuKJ8PRPh1bdvYyLMabaxHHHqKZSfvQTGK6e+uXoEXtjYXkdBh3WLFTtzOD0pkL
pN1QyK2ctfdBAbuf0HZ+nmQu6glaQqtyBlGum0RxzGxeCqk+WzWsmPKvzWl77uSD
MDOWnNN/Cl9nhQEn2X2wKsbzTwmRzaXZdpF6MBeEgftLvzD2dvpI119+1TL5el0A
Gt9Zvi+pTfKyLnv+P+/yDNw6RY90Cg==
=nLnU
-----END PGP SIGNATURE-----

--Sig_/l=q5abJgfLJg.DX8/wo0iEj--

