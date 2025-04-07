Return-Path: <linux-next+bounces-6174-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 828D0A7EFFC
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 23:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50F451884B86
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 21:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5AF1C84C1;
	Mon,  7 Apr 2025 21:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Hdm4x17V"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3172F15B554;
	Mon,  7 Apr 2025 21:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744062935; cv=none; b=JSxcLdrgqSHy7NCFG2EujOfITxP7SOSJlfeDFy2cAm9nhnLzyK4PrxE/E+6oC/8WdJ7jtTucsgLFAISZib1nn4ojFri3VrwIfN9FKdPd1QaFGBycfjcd9/RCMKXs3AyeTe52K7PuTE6IuL8Bu+la0hhZ6y3dkyasBkMb7TbxKqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744062935; c=relaxed/simple;
	bh=bkH2uSaer9eBquNpQpw7ZxqqYZXCerxg7bpVDmxrtvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D0gqAdSw5sYLwJbHM415rrIkkeHHBqWq/j+fXfBV2bDiSGSIjqgJilisKGkw2gTDoAvtIn4UdKYwRIAdAYXBX9Wu0WtdckAqSycBUpipwGxnnPgaYB/ODLOQWKA4dKpVkhNdiFzT8TpB2quzbVgHrFOj9+SHPP6PcxHPF7os7AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Hdm4x17V; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744062920;
	bh=xTGuWH/wDMqbTn7jRysmx9B/1EhJBg3ZH5/JjDsLV3g=;
	h=Date:From:To:Cc:Subject:From;
	b=Hdm4x17V8a82ora4jaRVxO+rLhejlFUjNOzBaXvo6mLZp3veXABVpO8htISP6o/fL
	 Z7kB8KHtA3pm9IHQvNv01DX5lUGU36SqKSZL7Zh1NhB120uY8kE0dWppusWyqgUsRg
	 xyJ/nw0b2Bqi6ZiIEDGsGggTtPfu8g0FOB7h0Eit7oTtYqZJTIaBJaEMTsahZX+/+g
	 kmNMomqMtDRA8LklEGgChAb+O8/Xbumd0bKcTUQU6j9JJxbTCS7HNbV6WasqImzz7Z
	 ikC94fXbDSwXZFRPvCXi9+Oebm5Y71QPOs6Y+6Kl9E93Jgm735zCFR+WoYebA9yKCq
	 GrP8P8yfmj5Zw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZWjgW74FVz4wcZ;
	Tue,  8 Apr 2025 07:55:19 +1000 (AEST)
Date: Tue, 8 Apr 2025 07:55:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Tony Yi <Tony.Yi@amd.com>, Victor Skvortsov <Victor.Skvortsov@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the amdgpu tree
Message-ID: <20250408075518.3a86e064@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9/9qPQIHANNoq20Tf0iP09W";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9/9qPQIHANNoq20Tf0iP09W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  46f572345cf5 ("drm/amdgpu: Fix CPER error handling on VFs")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/9/9qPQIHANNoq20Tf0iP09W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf0ScYACgkQAVBC80lX
0GyHLwf+IxCe0ZOgN32aZuWpInFJLLRrUlvMpILN6Z0fo/sI5rBmTG15LHN1zWKa
AyXzokKZ8iIM6iADQ9IfpS0gIDGQMHK1RJSAmBAQ19JYkSEHyZP5AP1bJpqD+6CH
U41QG9aWMw8oTEr5hd7UqtSQ5tDvbIsplR06XHNm6JvwoqUAaTvprhoSq2a3O7y7
KER1qfuH0LeLsi7ma8gAoLeBWLETQ5hS46MTFrblxtxJJQND92KCH72asRmHK2NC
F6XyozBQ4dmCi9Uf69tZwz7EYc8WBCYsrJ1RuNQ8RtpUtZD6RSnP3WpLwyhTxrwb
mLdIT9rYSqGYMoamxFOQcB04fi552w==
=hLZS
-----END PGP SIGNATURE-----

--Sig_/9/9qPQIHANNoq20Tf0iP09W--

