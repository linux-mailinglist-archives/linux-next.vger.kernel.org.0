Return-Path: <linux-next+bounces-4894-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A352F9E87AF
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 21:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94AD11884E97
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 20:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BD41474B7;
	Sun,  8 Dec 2024 20:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="btxJwL9v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C651459F6;
	Sun,  8 Dec 2024 20:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733689469; cv=none; b=gBG2E2xTo0Uuhuhj/mje84Go7+h1JTSw6wTJPe444InmADvlD7LrrLLzq0b/vSx+Za6TwmHymsh++GZ/AURhxxNETMcIyc4oQLYffC1ciOvf8ZwxxAGgZp58tMor1OjtNXDzp8WKgHV2jQP1aDYYjqGMjd2J17lbWyLTML6nxNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733689469; c=relaxed/simple;
	bh=Ah3NoXVJWygQ1h1IsKMsocQLXojTDeZOt3Y58xSb8yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Kj+923HokYyhB9OO+eiX21XXq4M1fjQ0G6yWCnCFsTs+HlnHxES4iBOynjsMKGO2xWT5sP2gqAXcMVSpe4AUFg+1qKq/qbLh0nDb4aAFWfuzD/eradGZu+TuaGqbeB47fSVjmvtUHyIUT88NdfelOrnM1fRjI8H4RnCu5zM0tBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=btxJwL9v; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733689459;
	bh=z+hzQOWO/dvE89+z08jvnDN3IPqO3v4dnEON2qPMvY4=;
	h=Date:From:To:Cc:Subject:From;
	b=btxJwL9vhLSf8nPJMXNEjwb+G97vu60Ok8a6rmHFDsImGzcy67nxY+i8K8cl3NCpy
	 ih7QCdjtMnTRxoFlfRHpNwRjneysohxDOREMW17x0Mrn1fvspCfA7+nCrMgPatU8Gj
	 z6do8IiPXA6dBx0ZSPK7NusUAV831bNS3y9Me64PNFzc28PdfZwwbvDhJ0t+fWady+
	 7zrGLyuOZqCgLlf9e5JFlKu2BUtoZtLvRj9GqfF1RAanMhMWFnnNJduxRY85566N14
	 DHbew4xtV7/YEHvwNOqzzU3N3M/Hv8+f+sjac0eMXdPe/dIG7R+6viEppGJP0oHf6D
	 xZNe3435z9Y1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y5xKv1T8lz4wnp;
	Mon,  9 Dec 2024 07:24:19 +1100 (AEDT)
Date: Mon, 9 Dec 2024 07:24:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Gruenbacher <agruenba@redhat.com>, Steven Whitehouse
 <swhiteho@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the gfs2 tree
Message-ID: <20241209072422.5650f3fe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y=q.DpTmuuo9p2G.uKOB3hd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Y=q.DpTmuuo9p2G.uKOB3hd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  5e72345a34a5 ("gfs2: reorder capability check last")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Y=q.DpTmuuo9p2G.uKOB3hd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWAHYACgkQAVBC80lX
0GwxUAf8D0aFmbBMrv7LhMQH2p5m/on6xOno6B7NVuzM5qN2T8/TxVxW2ERWkjOr
cteaxmWrdk2h6ySK+elYmk26710241SQfhdbExtudNRZaA9Gzh6rkX+kE9La9hpP
XjiaRXc8nzHfPkDvHQ+1cSA4gxfVJ4iFMbgfqu/4mPcBmcTMmDgkPubrYTZXSEAh
30S2Yq4qc3BgiJtZSspQ45qlcLrzf97YxMyMmK5nKqyYmndtcsRu+9x1QhiEOWxC
9AtdC/6sEbdeDPuZnVkMy1qPk8dT9SCAT8n99lBX4Mk4S15O4a3UXC7xKSMnBrdd
RIDkV5l8Ldw73tFiTiRE7Qs8/tzrVw==
=AEUL
-----END PGP SIGNATURE-----

--Sig_/Y=q.DpTmuuo9p2G.uKOB3hd--

