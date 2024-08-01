Return-Path: <linux-next+bounces-3192-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538909442EE
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 07:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 859301C21894
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 05:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A330F18E0E;
	Thu,  1 Aug 2024 05:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NH+yo4wd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974221EB490;
	Thu,  1 Aug 2024 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722491726; cv=none; b=gRUPnw/p1CjaONybPf4p/CdoqR+mdePrJZcWJM71NP+8/Qfm1IxZOP6bmIho7f1hKHU1RN69YwTX6dQhjqisGUeWGHTB1eGYMNBRp2GMKieGJ3Q40yG0+29EJySCGYe8CKPiMLEBh4v5kU0Z/V+gxEy/zTIvmg02e2aT57vqraM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722491726; c=relaxed/simple;
	bh=IafS123+6AiZYHXg+/8aFpr7NPGxI4oqDcdqJSgiM8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Sro6vWgfYQdqg/HMUgX/oLRr7d8UMLMhEDmjzTF5RTDfUPHLh+bZfhBhDZ3UojAvd9f9iSwimAhjWC+RgJ/8JEs1x9/ZSQt7SyW1rxmrRXR9lhyfhlZbUjgvxYQxpmCw5gpeZ7lrodiWoxLn1dm/GHmumGelJe8X6vMor7UIx/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NH+yo4wd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722491723;
	bh=3bwP1yEgMu8CDCP4dUZFpC0795uR97IGzT3Q6cnHTnk=;
	h=Date:From:To:Cc:Subject:From;
	b=NH+yo4wdFm79nFSanbrOcTbRQ85r7rQTU5y0TC1xKeDCtgPPEwZu74Slvsou6RWZm
	 18p2tW7gYKGl1ZXN14q4kHgij+vFYFQ/sN+K+P1oONGTiUBDAie8rPr2XBa8UU4CV5
	 2p6TdSf5kWCZw5fGAvDGBXoQAZBC4DpSq9d29IEsfWLyoXdelhDEPVOn2w5IulW3sj
	 YAO8kdGm1+KXwh5yaVRimxGjcixJp2HT/iGR8lsSYQKePjTYZ+T/aYdl3m1VWi5ik/
	 KRvXmSQC9nYS3LdOZYQvLlmiIxkwuMiTJ0wdN/S9JHQIDTBhF+S8GtGemcHFu+d8w0
	 kwsuvRqVg0V3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZJ8p6jrBz4x6r;
	Thu,  1 Aug 2024 15:55:22 +1000 (AEST)
Date: Thu, 1 Aug 2024 15:55:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240801155522.37ba7641@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YDL4+sBJ_jmVkYYSMqs08tX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YDL4+sBJ_jmVkYYSMqs08tX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/multigrain-ts.rst:83: WARNING: duplicate label fi=
lesystems/multigrain-ts:multigrain timestamps, other instance in Documentat=
ion/filesystems/multigrain-ts.rst

Introduced by commit

  f9cb86069bad ("Documentation: add a new file documenting multigrain times=
tamps")

--=20
Cheers,
Stephen Rothwell

--Sig_/YDL4+sBJ_jmVkYYSMqs08tX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmarI0oACgkQAVBC80lX
0GyrKAgAhmDqpP/baJeHZm2Lgy7dQpq7VKTUSOEBnNFdPsLTP/bIuu0C0SZMWuYa
80lfDYIpmPfOZspwRmyGUy9aUpU6fkLnn9Vbz0/IAY2N6qKvDjNigbwHdsQ3gI2z
4qf/n4xd0zh6/PdmKPrV9qaP8SnWlyYmAzJqopuoLIW2rApo3jLIYLHQSEGvc1hP
3/518bMxwQ0tfL08uSjHi9xHvZzo2pt9/yMUNRCciRVHp1iSu6OsJoxBbLWeq83q
2fXPzAyhPG/RSMa75ETfHIGK7Ho7hjWtrlR2Ii+dDKNBOVKCsprGuZefwhsVOkxr
tK+R3xE8NAq/TIe63J7nPrESkG8ojA==
=3mLS
-----END PGP SIGNATURE-----

--Sig_/YDL4+sBJ_jmVkYYSMqs08tX--

