Return-Path: <linux-next+bounces-4508-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 635FA9B41A1
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 05:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBFB82836CE
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 04:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0677F1DB53A;
	Tue, 29 Oct 2024 04:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HycEWYbr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724602FB2;
	Tue, 29 Oct 2024 04:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730177429; cv=none; b=mV/BiYFUHwVLlH04SW8uelj1y8+jmajJQrmOHCtGKVIeb4jOScWGJUWoILqA1nbnl9UN4P0aZu//xPuoHsocv4po4TTWgQQELOY11QQvPclEQV4ahfMfYXUcYIySVGTPH0mNtLFbBTbSGh0VSLms2KZPld6m/9HGGFNeSyCducY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730177429; c=relaxed/simple;
	bh=JyOPmA0BGHCrZsPnJA18OiK/Y00rNK2H572vJYc64Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M+C4n+frknZOjjIvCTq4/u8SEEX2Y81DAXJgdUPXIKG5B4XSIuJS/v4AIkZnNwqxvYjf55mCCdtzdtit//0JYVspyEep6cJNo4YWFNzYGybE5wYUi0qdzDZC1w2olAIZyVQKK8DxMRrFnH6TOS6n4JuwAZ0JninV5sS1CgYArKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HycEWYbr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730177421;
	bh=7zALh7Ps8DFW/WRavaEMiZdhIureRdfwU/hDHdmD4nY=;
	h=Date:From:To:Cc:Subject:From;
	b=HycEWYbrGesJTPRrOtFG0tDO+H6Wb9lkpMxE9+UjRIo2Kdbc5B4DJJwu1x4agh8gX
	 C7BNYBQ/UQ8XqyNptfFcq+51pViseabU65kh8aPD5oR59Dg3hMhqN3noxICp2g8rGH
	 Fa4tRlm1tIVcvRoauRy7+TrOs2KMF71KsIwcteqyzBh6JkNih/IBpOAbRVHzWsLjsa
	 4Z+wOnBcHhGyvI72BLP+zX6KTMGIktZ0wbfUqPwROZIs2ikMvgQISGB9q/4XgyeSKh
	 F9uM+jFseOtltjrxQAg2r51dlPaFZ/03RXnhJPoXF8Iz4oNY5x2SKubaXis4jtBPtP
	 BXVfBoE0EbNHA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcyVj3dFSz4wcy;
	Tue, 29 Oct 2024 15:50:21 +1100 (AEDT)
Date: Tue, 29 Oct 2024 15:50:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Matteo Martelli <matteomartelli3@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iio tree
Message-ID: <20241029155022.5f777572@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8ovJmLYY7eSq03w5Jf0G=Q8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8ovJmLYY7eSq03w5Jf0G=Q8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iio tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/iio/iio.h:555: warning: Function parameter or struct member '=
read_avail_release_resource' not described in 'iio_info'

Introduced by commit

  8a63e3033e72 ("iio: core: add read_avail_release_resource callback to fix=
 race")

--=20
Cheers,
Stephen Rothwell

--Sig_/8ovJmLYY7eSq03w5Jf0G=Q8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcgaY4ACgkQAVBC80lX
0GzSpwgApICw5cQKfvgazi/jQBU5mWE0lVv6lhEcIN7jGaboW+ZVo7XGITSAdxb6
tLfn3/agBP9qPW13s3Z1oKoc5M/YkdyTECaC2jYGYlxMgFxdUslrJMFJZCFUa5pO
G2qGfAQOdInLHj6tyZuN5WDIjZh8GC9hA5ZhSlZeU+Qa5oJgGfanAZ6arDvFH+mk
fmqymyOMOOy0rXVD/Ntz+t5oYbmMcD07IU3Vi4udH95BEo28LCZ5Vcw2dWckcTkd
qa/uQkvN2yBxrhxc420JAKXldL/pkbaFb0z1WS1vhDVHyFNfeUNmH4Ikt8GFJ1rH
Od9vq+onwb66CYPFjRR/lQecPhwouw==
=ln/w
-----END PGP SIGNATURE-----

--Sig_/8ovJmLYY7eSq03w5Jf0G=Q8--

