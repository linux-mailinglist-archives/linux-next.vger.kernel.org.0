Return-Path: <linux-next+bounces-4387-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A83E9ABEE4
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 08:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5A461F241B3
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 06:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D98E14A0B5;
	Wed, 23 Oct 2024 06:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OREKlhcj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CB5142623;
	Wed, 23 Oct 2024 06:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665354; cv=none; b=ZOfZQcfWI7/O3JpbXPcsDATFieDrNR8Oz/IOJnoGkdWtE42KS4WuuAmTLbN43SSYGAQQnEei4EVZsBEc8PllShtVFoY5msNp5AJVqBJsGthxpg1K/Rpx84mWypu+JNjDOL/PviXhl4Duxg+xNLOMgkc0UUOihYPiFXPoGYqmCiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665354; c=relaxed/simple;
	bh=poSlN6DJGglCCcJDmjcfT8MMgqSm8TLgA7WgiDlN0zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qSNlqtp/G6aiI4m+KesQTAiKG8fXCdHdh5nxhYiWyKi1h5JGPZdjgCqHZMcGAINp1KUtpVYPClJ/NOnlelZoQVIJgV2pRW29xsf27tHuhtGtewXJQFOmMYvLaiCVqWqDUZ8OUqGSX9y7p8auo8E0bCGrVarDi/yhX7VLetv1bwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OREKlhcj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729665348;
	bh=25KfOGp5+n5dro5P1MU8b4qoNMvgeEla3yLU3SfMA1U=;
	h=Date:From:To:Cc:Subject:From;
	b=OREKlhcjEYE9PP/kBVF7VZqDOBQxcrsB8r4WsNke/Md2lmGsUompYzKSxetbT7Q0a
	 MIzerue+cXI/5fNlMQXxUxNRpD5lSRGr5dqwQ8siUyqF2g5xezQob5fp6QBBalikd7
	 Oyr7flsCf0AbqO1XTirJylnVEeHHp5RrF2TVsKd914TfHh7YCBx1134GnJgU8LGxLn
	 r8gZvGsUfBQJbM4h4uM+XqFEJ9c7SZ72rHHjmNbodddmRjFgJt9oe3gYmSeAdUMb2S
	 uvOFXvBBYg7RvvRsXI3XqeZflmNX8tAjBOXYNal+0T3bDMPFnJagk/MylzU3CWRMML
	 CWYgenHGDroEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYK782X94z4wnr;
	Wed, 23 Oct 2024 17:35:48 +1100 (AEDT)
Date: Wed, 23 Oct 2024 17:35:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20241023173549.043d4ce6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OlPpRRhWGuaZ0e0MqDUkNSN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OlPpRRhWGuaZ0e0MqDUkNSN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0c0a5a79a9cc ("smb: client: Handle kstrdup failures for passwords")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/OlPpRRhWGuaZ0e0MqDUkNSN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcYmUUACgkQAVBC80lX
0GzZYgf8DyYIdRcYQekhc+U/cPL4b9A5xmY9I8Z6EwfNBlCXuI4+cBpOHCOX1LWz
/p1BmPLGqoaRafgInY2AVTY38I/X6OydQNAyWE/kU2T8b6cvaF8LKxzpEP0E6Z+J
PgnXbP9zPOBgNL20WGktITORi7SRcuo152XsS2B44bDB31s3qLM9koz+RvfrglE/
JWTwWfJ5sLcwx6rjuu/kiOUyb1/XdvP+2tjFChOSpow5b5Y2rmATi93i253uGylG
b0fzL1e+cWvugHazB9kzgQZI7ZFe8n6klYIydNJF9AJqmUr4S+G2QVIoyLVHQBml
Hz6PQ+eyaZLr2+ZwU9pn3RyYjkXMtg==
=QiAO
-----END PGP SIGNATURE-----

--Sig_/OlPpRRhWGuaZ0e0MqDUkNSN--

