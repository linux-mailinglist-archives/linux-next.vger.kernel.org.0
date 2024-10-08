Return-Path: <linux-next+bounces-4151-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D62D999581E
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 22:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 127D41C211CE
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 20:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8561F213EDF;
	Tue,  8 Oct 2024 20:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hSXtQEJg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A2A20CCF7;
	Tue,  8 Oct 2024 20:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418061; cv=none; b=VFZkHi4sGmjShF3uE1k4xjRVNpqvL1yhc8mjDGkAFRBJRgspoj/vJZcwvapgHkhW4HQsEMbnVd07fHIgwfeE4Ve2cZGiSAyRc12yXxt2qW/HletmAWIz76cYrBQ/Wemm3/1hQqrDm8gMyb8SHL8NL3xesUWruQuFCqPfviPRVGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418061; c=relaxed/simple;
	bh=M1e/aMUtLM4yFFAbvRZq+IyGYuj6ViTOuvgsS/hjb1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DZ0KUqY4AZw+ksajnaLbnrszCpFswmF7TKWvVM4ELKiy/1uICy+tv2X/kQdODScbA5J11haPSX8liwQMiu66OFWcAazLyu4tFi0tw3gw07l8b7mQDCAU62SlEjUd6jC5BpyloAlp5wF/3rQG44ABHmqpElsBlIJzSeocJDkk2TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hSXtQEJg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728418055;
	bh=zd+ax9z0iRo6xrmQG0tkM50wwVj66gplEWX+gx0h/cU=;
	h=Date:From:To:Cc:Subject:From;
	b=hSXtQEJgvgYn3HoVRtyvAQDftljAkMBweG9BabXa0xglQllLfh2wTmLoTZfApCmzj
	 OWHBlUNy36kiKPAmOaJ1h21IipAV71P0LkjPEQqR9NhWZ1GRZS7/zeOO0UNSWD9Lfj
	 kC2ilV/N4AHqbfZ5mexkhS9TiYaByjEkJ8Qgq6vEzjnIq4BbfcA7IL/qhbCj8PZ9Xs
	 w99/6TZRmNS0nFsPnr8XCqcBJfXQ72rqvDSbHEAGNCTFS2Fwut/QnqJBjya0Ewfep/
	 RZxfzMDQA8YQUVJm8Id8PpH9iDqyhXGfOxbpBFGaMZP2aW55nIkpXWIuKNjvGlRjQ7
	 ZkekgkQpthGZw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNRrl2X88z4x3J;
	Wed,  9 Oct 2024 07:07:35 +1100 (AEDT)
Date: Wed, 9 Oct 2024 07:07:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Chinner <david@fromorbit.com>, Carlos@web.codeaurora.org,
	"Maiolino <cem"@kernel.org, "Darrick J. Wong" <djwong@kernel.org>
Cc: <linux-xfs@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: adding Carlos and Darrick as contacts for the xfs tree
Message-ID: <20241009070735.166eb5e9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9DdGHV.z+Ul_/EQryf6Hsh3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9DdGHV.z+Ul_/EQryf6Hsh3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

I have added Carlos and Darrick as contacts for linux-next problems with
the xfs tree.  I hope that makes sense.

--=20
Cheers,
Stephen Rothwell

--Sig_/9DdGHV.z+Ul_/EQryf6Hsh3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcFkQcACgkQAVBC80lX
0GzgtAf/Q1szFw6B7M5/tAvthhy12BJ+Okh25cZ/z34JFvXRnXIbU5cDJTbM6k6T
Muzq3V3ri/izaQLBYZSjhbq3VpnUiwk1Q9G+OGPQHUIf/7B0NbcmtchadMqiM2VI
qRZCdpANLkp340/M6fmU0dmJ9wuBnpiV4f4vNoCe+EcJiAZRT+lbLTd2qtfioCHD
2nGMEV0Sz8CtqM2jkfv+3EysZl43gYMFCzSzLaiY/DwPWpdtYW7Mlo0BNR3vr/vX
qUXYcpSai/JfUnjdSzXFjBdsPHCDdK+3IJrOoD9gpWApHBTbDOJRPofMqiUDZOYE
s00w68wy/+zwwBrCgn0ujjC1Cv3b3Q==
=V/Vz
-----END PGP SIGNATURE-----

--Sig_/9DdGHV.z+Ul_/EQryf6Hsh3--

