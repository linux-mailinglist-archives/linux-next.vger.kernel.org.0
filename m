Return-Path: <linux-next+bounces-3885-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F15EB97AA6A
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 05:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A8901F281BB
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 03:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA0C49659;
	Tue, 17 Sep 2024 03:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VOqXjtmB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77BB49625;
	Tue, 17 Sep 2024 03:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726542218; cv=none; b=dhmpn7zpoYMt5RKQdHN5QU6pAic6PwYN7BkNsnr6c/kxxdjZAUhmMC7NjKv62xs8mQF44h8EWXLJFeU9LkL2xoKBaVUwHqkXGHNw2aMN4v1K6e7huBA1iMvhMjl2jebmZaRZljGSrIS4YKl+UDLOuzgokxsQyqWFjG8Rjvth0rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726542218; c=relaxed/simple;
	bh=Ir83WJWCHpsMRbAbsjXxMFLBw4Mv2RkETk4uwBzh46k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ISq5N5+V87YWITQabrnqFMEppeCIuVOF+to3pASyMnSoZKfYMN3LbdShhJztY+nda3zoiPzqDpu4a6pW5Wx3em0xeuoPiXyEJ1KrgeDlXCYhbub+IDhtOKB3GclsldMNQ1yYlsPmPXpZDAbgtvSJSK6Mx6u9QhO/HwpkitjD3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VOqXjtmB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726542209;
	bh=sxN7UW/uf8V1inCK8hH+Of4ach6T482hB/M64KESMWE=;
	h=Date:From:To:Cc:Subject:From;
	b=VOqXjtmBdr7lxA+ihPl0mBsF+g+d0Ymic14gKfN4+bU/o9uUFto2cHwLhgliWiQ1T
	 60TojwWkA3IXpcbzM2Fp+85dqfpUqF8bMXGd6/ho6uAFZJIxxb9jDcVin56rOTOrwL
	 95uFFbLc7iRh9f1YuGNEH92+A7N8bmYg1n3NyCaJNL6YjXeJYcBNK24rp5AxiKzkfS
	 +O+P2YfgMuRyffl5QYqGJzceFZCvVi6YkWDpcJzOkTSeFiXTD2AYgj4dCRi5mqGnd9
	 AWxUjR+FpFy22VJqWcvaiCU2uYNlIVwDsxOkjUT6lMrw5oa+H6NiogfzojwxDielN7
	 OfEvozVsD5Klw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X766l2NmMz4x5M;
	Tue, 17 Sep 2024 13:03:26 +1000 (AEST)
Date: Tue, 17 Sep 2024 13:03:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wim Van Sebroeck <wim@iguana.be>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the watchdog tree
Message-ID: <20240917130325.0460eebf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bmz+PYHM_z=KqzW8CYquIW5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Bmz+PYHM_z=KqzW8CYquIW5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  f0764bb2a7b6 ("wdt: ts72xx: add DT support for ts72xx")

This is commit

  177c20d761c5 ("wdt: ts72xx: add DT support for ts72xx")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Bmz+PYHM_z=KqzW8CYquIW5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbo8X0ACgkQAVBC80lX
0Gz4ywgAgEpu0B3KR7TU1aQm21B+JNtkFrNcsYIgu+00Y620AT2pi76WgsNLt5rK
4ZnEMR5++2P9uy0TA9gqHHMGrcP7IAtHN2kX7hPNo4JCQfTBih3P9FoWY1Nv561M
Rx42JJxWKeGyFmTkkdOzjzRhCXVwOnK1lkzyXYi77VvL6fOD6Xu7+FQHchl3bb0O
gdBNK3HFEFCT7X2Vnr87HoFxKdSmSvso17KTBiFg5dTD8YrNmol1YSGG9x2qSZKA
X79yNidCL/+adJAY//ciFzKZ6dPQpCHeCbyY2N5OHnPQ6C7lFF0GUzfJ49jUNi4Q
xSBQo7AdQobBt08CXi5c5u/zBdqlyQ==
=uh/H
-----END PGP SIGNATURE-----

--Sig_/Bmz+PYHM_z=KqzW8CYquIW5--

