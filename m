Return-Path: <linux-next+bounces-3229-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E21349473F5
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 05:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52D41B20EC7
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 03:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88AE13C906;
	Mon,  5 Aug 2024 03:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OYXBHuAe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C6063A;
	Mon,  5 Aug 2024 03:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722829199; cv=none; b=GN4jCyUz6a4S8S40MLHiH6RJvCzfrydDDVe4u3l77jP7KS57PYOdaTDXlOEC731CsRj+E0aZxwwaFASQfZRCo1cPrD06dzM1dzfYziuRh25xy8h+RIqE1SARo24A9743Mkk319iKtRfnsTtY2UTlbUhWX+pjtkbxsTLOtSi7jUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722829199; c=relaxed/simple;
	bh=jk5ETz4uCUZnp4JwqbsQF8IftxGpA9MDTUkPHd7iKT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H1Ki1OWCIqGob4PtTtQubo6KKxvTvjUZ/K75xkSd0ZOxk8VcItcvu4aQo+hXnLIGoIqZ+MQJCA4iD/FgzQkyfm4hUqQhg2VDTUQRoWv/6CA+Blhn023ngNubeLXbQT6Fw/wggnFAJjDNLE6AmLy+SBVDjRGKruIXrExB9VdD0I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OYXBHuAe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722829193;
	bh=hGDmkhZj+EihSoHS8AgTK0lSgfUP9OPKGz21OeAzPFg=;
	h=Date:From:To:Cc:Subject:From;
	b=OYXBHuAeFzR22f/o2Fyv1Ynx/Svjbz/YUHUA23GliUBfqCcIGsP2FRcwe6K8KZsbV
	 E4sNo6aXNbCagPl7Xd4ZQ3HM/rMYDw55OE8oYX+53ghvYyWpSs+mFp5z1eU8b1ms1J
	 65JFT5+fNcsRRe6moRHKrkunu0Mdpdipodolu6qyFSsou2SG4gZI1l+ihHOJSU5RCk
	 m4Xva1gQUi9hG8h5dLx80TnUCs6hDKPgoecYf/pQIjoTj5necv4gEsUy6nUYHWflsA
	 nHoFH1GR468HBcy3tENcNuondD1IQIZYOXmw6XatgH4zknFAXbFVOUb3c/MU5OxEqQ
	 CNIeXzcJDjTuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wchyd0XL3z4wd0;
	Mon,  5 Aug 2024 13:39:53 +1000 (AEST)
Date: Mon, 5 Aug 2024 13:39:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the bitmap tree with the mm tree
Message-ID: <20240805133952.478fca6b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_ZEb6uMhlAdT5SGK3ZmMKF0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_ZEb6uMhlAdT5SGK3ZmMKF0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bitmap tree got a conflict in:

  lib/test_bits.c

between commit:

  ec8f4b0906bb ("lib/test_bits.c: add tests for GENMASK_U128()")

from the mm-nonmm-unstable branch of the mm tree and commit:

  358e4153fa62 ("lib/test_bits.c: Add tests for GENMASK_U128()")

from the bitmap tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/_ZEb6uMhlAdT5SGK3ZmMKF0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmawSYgACgkQAVBC80lX
0GxGRQf/Sb3w1ffEx4vORRDjTFhMufNLrauV6+SQsiT4lIyPJ4xXi7Yg1ModghuU
97dtxiQjZ7dx9CeRXu0skxp7og30I/+x1Q5ulxQNfOsy6Y3Oj5R/zoUNQtFVKmTD
BWFtajkGMlVTInZENUQleuxX6Dc0e7NwLHdCfNkfVMvnzzzACSCiuvMMylcyBBCw
PMhjgLE34uVmCZDIJNAreMcW4Tdu3LAKMz/BNUs5706HDM2UYx0eOfaD9WLSELBc
ralgQroGKXc9Cf6oFrwgp6Huq22MGhUemaNFXeYVIhHX0fq1cXLPu/9HHn3luXHB
/trxumhS4l1h3vrarhyw9qFanUG1/w==
=pJ5A
-----END PGP SIGNATURE-----

--Sig_/_ZEb6uMhlAdT5SGK3ZmMKF0--

