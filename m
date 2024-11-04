Return-Path: <linux-next+bounces-4613-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB3B9BBFC5
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 22:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA1F5B226A1
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 21:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E83A1FA271;
	Mon,  4 Nov 2024 21:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rCdchzMw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8933D1C57A5;
	Mon,  4 Nov 2024 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730754728; cv=none; b=W6nM4RovbmaT7LhC4J4kPppRqxx09Hq1KUxNal9MB63kYLOkfJY8tzexSrTff8k43hHxZMjMzin41ypV06sBYUHjP8Rd9HugdBG/QltqZ2dLVM//ILHBvBhkXC33pGn0SRF+GY3pbhIoupu3ZUIkpGk7fDfpHdKWruSB1iVVFDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730754728; c=relaxed/simple;
	bh=hjWH10lrbU4DDmaDAmqcxuRqav69Icr/x/By7dMoYnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Maw2d7aUK670JEjJludYZbWA3Bu8Ycvy5cZnaDtyLVCp78Qq9tBRcoS48y+fln3eXx6JuJmTw5/Y+lIg0tR83x+DfpyN0gI6yKK3BjqsxUqsTT7eOTi+D8AzVMnklSWekVwOLTeNg/nl/cwH7ZMCSzWaEYywpREkiLFMmwl3iek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rCdchzMw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730754713;
	bh=Gkk6Hlqok5pTjGeiQOu5tyVzPCHTl3NAgMbLulsak6M=;
	h=Date:From:To:Cc:Subject:From;
	b=rCdchzMwi1NHmjAsTy5GFfUt5+n/wVyPKHEPeGiq2hxyRTW1mG42S6qNLji/nRfU7
	 75q5pdB9bHIMBvrh3EnRw+uHJ23GvT37/uxNkUUkhwddHt5jYXA7avM670RIBmH2JT
	 8nSvgFF2S6fo9/U7SQ0S4xS7YRtqr4EFyj2fqUP+Q31F5Ux/dBQyIP1daFuploEyK6
	 9HHgX4skbf7Tq2Tjc9VucU1+3ax+Mh7NuNC/efj5ni4foUZL73gIMxeTF8I6S29seD
	 EoBzg10TTQ/0MN2qegf928d6KsolakGegMSOr4sMARK77Pnx4KoXjOEcFLbBVR6ow5
	 du9I9PqfE8PrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xj40T1Dbxz4x8p;
	Tue,  5 Nov 2024 08:11:52 +1100 (AEDT)
Date: Tue, 5 Nov 2024 08:11:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pinctrl-intel
 tree
Message-ID: <20241105081154.54f66e15@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w01wY_n6GG4Lji93LAxv+Q/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w01wY_n6GG4Lji93LAxv+Q/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  1bedd6dc7f44 ("pinctrl: elkhartlake: Add support for DSW community")
  5d6f65a5cbbc ("pinctrl: intel: Add a human readable decoder for pull bias=
 values")

are missing a Signed-off-by from their committers.

It looks like they were rebased back onto v6.12-rc1 (from -rc4) for some
reason, but the new commiter's SOB was missed.

--=20
Cheers,
Stephen Rothwell

--Sig_/w01wY_n6GG4Lji93LAxv+Q/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcpOJoACgkQAVBC80lX
0GylRgf+JfmltLhSArQJtbJeBiaUV8VKcaglPTBI5rGC0fM/egjpNxg2WTwdqT5q
mAQ1Fg7sdA+7FD+m9dqXIGPfCR2hy1oaDnVZQPZ921PLYZTBmb0P/6X87Xn0JsuP
Rhx6ts3WNAfKlPAcCEs7ks7k20e2k7HoZjRItv/gLnmhF5LqbExrjoRbyYFiAWN6
CNBrSqDukfpJkJEDqB9QTMGe3IxeenMmer+fvncF39/EnwOrJ6NlQquzPle1/App
tOk5D2Dde0FNT8ZD92yvt2f5c7+kXjMAKylYYPlLtZLXKGLGjS1qi2u9DGA5IJec
EqpnzMXpHAqTxrNbnHunWxJt8jk9pQ==
=CF85
-----END PGP SIGNATURE-----

--Sig_/w01wY_n6GG4Lji93LAxv+Q/--

