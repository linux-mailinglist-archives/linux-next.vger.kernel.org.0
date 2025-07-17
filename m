Return-Path: <linux-next+bounces-7604-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB67B08704
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 09:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7FC918936EC
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 07:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE81214818;
	Thu, 17 Jul 2025 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="s/PlG0ww"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C01215077;
	Thu, 17 Jul 2025 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737821; cv=none; b=JwJezs9pBKDaCXK9MMcoGnGc5ctzNFFtHHqsVIq74pExfZFJryeb49Ctw/N9/6Se6I+Uurfn7qRR5OD/rFL+9aXB7G6SLv6aYXspMvIOL+K4sVtdKb3UtX5vQzufngAFdvmHqzEXm8rV+YoMJujdObJTlkZIbtgDMeKs0O6jkSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737821; c=relaxed/simple;
	bh=1RuCjg/OPH4fTauJY+gwYHngpJGCPFkyqkYtIdQthWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mC4vRM4XRyUc/ZpJ+LxXdG27sfMO0iAu2NAItsZaqIkjHSMEmBsStVSewMJoZYfDuqUxxSWFoSqDsHtf5jA4bAV80IzO3uhGXaGZP5Gv0c8ul3hyczAnbNgqewEH+MSjxM9ytsCAnXlsX0NO1TlOZXIvvptMzzpEKjICWzEpMxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=s/PlG0ww; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752737693;
	bh=caP+xYXYp04ljGKWo1siqgeQbgrx4vQVqSw9m7+C9fQ=;
	h=Date:From:To:Cc:Subject:From;
	b=s/PlG0wwAE+eqPeaXCT0RTORAgJFOJCRCBumUswfjftFmGbzS6GYbYvFpGcEVT2ea
	 Tp30QcZyy3cd6jGeTVNrSBp3fV7I3ncyfQUR6+H8fPp6jOrLGWb0hx95AWivfSpYKR
	 +zpiC0eAtT8un43i5AwjLrIKuGZUrIMkZvNN2wfhp68mIqoOoOGFJ3CwCmDzTInVbc
	 EG9Jddv5VXE39n64vT7EcTdrXZRt/WnHBR59dGEDU8yzGCUq/JZ0+0n1AFsvvc+oUm
	 MCJoRZ5iQ/z4LGn982de8AjQO0BJv/n6sWTZUwN0dPn+q1biT/WAAFPqZ2iKa1OV4s
	 MG1gw7vMAa/Yg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjPp54vtQz4w2D;
	Thu, 17 Jul 2025 17:34:53 +1000 (AEST)
Date: Thu, 17 Jul 2025 17:36:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Jann Horn <jannh@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20250717173655.10ecdce6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iNow9w4Gxn0z31wGjdLprA/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iNow9w4Gxn0z31wGjdLprA/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced these warnings:

fs/eventpoll.c:2197: warning: Function parameter or struct member 'ep' not =
described in 'ep_get_upwards_depth_proc'
fs/eventpoll.c:2197: warning: Function parameter or struct member 'depth' n=
ot described in 'ep_get_upwards_depth_proc'

Introduced by commit

  f2e467a48287 ("eventpoll: Fix semi-unbounded recursion")

--=20
Cheers,
Stephen Rothwell

--Sig_/iNow9w4Gxn0z31wGjdLprA/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh4qBcACgkQAVBC80lX
0GyEKwf/ejNrX8sU0Q7f5g1nu8ExZ7QKZVdcrK1/YFKlicV8HOITKNqTi3JJvjhO
X4ZJOYu/jn+kzk71eqUHiL44K2X7cWuZnESdtmshtiX8mWjBfHONgsceidtFxn6m
80ZDpkxDzsNsDWHPNKEpa+Drgc/Y4HkrdhyrRaktRRhz35F/2NehrJJyCbcfDc7D
96jhsjJKTNLE7EHB4dwgNN4VCBWDnOXnPSz5eIkG/3zAqE5IDXb7JkvkBIxFJiMF
5lshZlnhI4UL7TPrBpGShCjZ5n0+bcrm46lvd1Ep8TN7T2Z6VB4pdJjrrudscEQ2
iE37OGMBo6B3iwHf/6Esf1Ka1WFwLg==
=V+Bl
-----END PGP SIGNATURE-----

--Sig_/iNow9w4Gxn0z31wGjdLprA/--

