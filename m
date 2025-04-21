Return-Path: <linux-next+bounces-6296-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E594A959C1
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 01:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22D973AA2F4
	for <lists+linux-next@lfdr.de>; Mon, 21 Apr 2025 23:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EAB224887;
	Mon, 21 Apr 2025 23:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lN0jjSIN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EB31DDA0E;
	Mon, 21 Apr 2025 23:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745277802; cv=none; b=gFR9/0HzJOm80Dx7IgSOWvwDxbpK3U0cHCJxjB9HF2TrRrszmQ0P58x3l4C2HOm1N3FT63sgRUjjSc/y8I9+E6VB38eyhvcQp5U9CVteJdZRbSMxUB3lFgAhdA74kuKdofdoyGdfmwdBmOQghzNpGh6SOGDKgn9ZFtmGFVzCV6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745277802; c=relaxed/simple;
	bh=RtYChrYXdfSeg/z3G1wWknkCayWFSB4vAAEQvO5PnG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E7xyds8TB9p3FsgRQLgYOIWonx6DRaVXnyWzfIdXVqXemqtnmLVcQ65SP+J3Ke3N3jPw74O1Gw3o3X8+rBSsKtxHJPif/GlknKUvRShCC+dPYws2GcNgXwd7HHMM553GEFKfQj2nAw3IsQ7y0/wRgsbrwaiLAbbwXCFYxWN2JZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lN0jjSIN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745277786;
	bh=yofbHsV2aSMItegkK82Pbh/TE5oru+0ZMWvrJaN3JIs=;
	h=Date:From:To:Cc:Subject:From;
	b=lN0jjSINH9giHxFCX0o4aUYk6faRgGRFJSdv+rncOlpX6HuQspOluFAKa/i7hQdvn
	 Ijqhd3owypEb9sSLlesOvRP1qhGltoDT6Mc83saObROXoCEkbeMwV1HZVZxKxYG1MK
	 Q1r1ZOCB4ph8bOQA8SUvi+0Hlp7RrC74VKeYDBo/KmtJO8X9mQpnnppj8yIXzuJUWh
	 ud2/Z4eq1P+29gbZ65/bQZMz1N6ZjIaFPDMf0hMSDxK/3kMFOa6NQeb9x/PD8oOgIR
	 S6UiJAkG9XpSCg5ugUGkdL30yW7sZhonFts2yekL3QsMftg85GV6e5Lu6emNCXRfD1
	 144EgodyrOzxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhLyL03D1z4wby;
	Tue, 22 Apr 2025 09:23:05 +1000 (AEST)
Date: Tue, 22 Apr 2025 09:22:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Gruenbacher <agruenba@redhat.com>, Steven Whitehouse
 <swhiteho@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the gfs2 tree
Message-ID: <20250422092250.71bd2347@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bpY=BG2TXldAtspzLVWywwr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bpY=BG2TXldAtspzLVWywwr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ae1d809fd0f0 ("gfs2: deallocate inode in gfs2_create_inode")

Fixes tag

  Fixes: f1046a472b70 ("gfs2: gl_object races fix")

has these problem(s):

  - Target SHA1 does not exist

Mayeb you meant

Fixes: 9ffa18884cce ("gfs2: gl_object races fix")

--=20
Cheers,
Stephen Rothwell

--Sig_/bpY=BG2TXldAtspzLVWywwr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgG00oACgkQAVBC80lX
0GylLQf/UedYbeFPXr+lco/qIpwryzIQ8r+OqGrEAZ987BhsujQSXwHubprCiPLs
YkbqtFAPLcir0Ip/sI09bEu+owUkLFHrn8oeEVPCbF1GLy1+bB++5IakazpgKRGt
shoWB16cd0Stk8cq1ZplGmB3XwgygS6mrQxa2jU74NnBdRmC6VF/utXDLf5T2kEV
n/6VBw33jucUjHlbzJcUj5UJ6g6FoEyjkcyuecmB8/FeEwYDkb2nXR0DqT3ENJJ2
CurlJb0nIEU/uQEafnVlox4gLqHX0d8xrKGkjqedRaZmX4T/AfRgK9Sd/C8VIfWr
RrelYlxHYK3gz8X1luEAX7Hu6RqYjQ==
=UQ1X
-----END PGP SIGNATURE-----

--Sig_/bpY=BG2TXldAtspzLVWywwr--

