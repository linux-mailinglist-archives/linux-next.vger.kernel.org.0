Return-Path: <linux-next+bounces-6865-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0604ABE83B
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 01:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BED34C7610
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 23:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36561DE2BF;
	Tue, 20 May 2025 23:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZYGa9yGK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA3444C7C;
	Tue, 20 May 2025 23:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747784761; cv=none; b=oODwUkzY9oxgCFI6+Mc40EwG+2NWxrOc4fC83SQgSrK+hdKUwauLkvuoCYJGfPuOt+P1Lfi7Fq8Hr5R5WegS6idhtrCbMfiAt2dkWG5l9Mm6W+QbBUvMUfQWxutzdAfsGVXRFwgssYuWEuAOv3ZCLpUxcnStJFEXHfadaCQ7uX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747784761; c=relaxed/simple;
	bh=/RFWZQDhGtifDUSbbwlF+GJ2I+lFopR/7RA2Rp1TKZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VMP6PriwYchrTACH2VOK1lA6mQiUinEeBQa4vatK+wZ9RjFfphQchIIGGtwtIsRyx+A11ImPkRuNtxUNQ8HU9EThix22aC0lQjJnmkWrm0SlHVJl/QvuL/ucFZCus/+6waexjjyAlEbrxcJolm1c8wSxVeZjoxbw6gGVYuAAL/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZYGa9yGK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747784754;
	bh=VFuJnaMpKZEdVTgg78didTYLMp4biAfJR2GU5ey2PzY=;
	h=Date:From:To:Cc:Subject:From;
	b=ZYGa9yGKOfaJts2YS+LsBr67inZ6OMegJRpbQxdz2vBrKdFU8hhB9LQ6F3bz9pUwb
	 TKSK+I1n0pbAg8+p2MNvIgaVp+cOMx0OZrVq3m+N9ZsCsX/mossspk4Ubv1P2u5Y88
	 Mn2MF4mS3isD6fl83PMaAXIPnEWYf4X9/bdsFi6BSA5LJf625Q3UQPYporLiZ9Emi0
	 KhxfqAiCa0sHRjL5WlpGJk8sVysFLhC5R8GgvjZ3E1GLlTa5D+QMIUhBxd1cgXWzxK
	 I5ko4eij4YvcgcnvIQU69Yiwa9iLZBs2vh7r8QUoELNW/hxIyPh2frqbvYMkczC5sB
	 ZMbA0SsjUV1Wg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2B5F1crpz4x5k;
	Wed, 21 May 2025 09:45:53 +1000 (AEST)
Date: Wed, 21 May 2025 09:45:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Miklos Szeredi
 <miklos@szeredi.hu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20250521094551.5c26dab0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/syM8w57xDCk.X/bpoixpDHN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/syM8w57xDCk.X/bpoixpDHN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the fuse tree as a different commit
(but the same patch):

  8d9117009dd6 ("fuse: don't allow signals to interrupt getdents copying")

This is commit

  376464b93692 ("fuse: don't allow signals to interrupt getdents copying")

in the fuse tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/syM8w57xDCk.X/bpoixpDHN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtFC8ACgkQAVBC80lX
0Gw0SQf/TdxVv+0NnWZcsryZrUSdcB65aF++jy6zKSJqZsAznv8ZTPTfZbe/6zTO
OcdEiZcAKZMhXw/RF5JZMKrL/7SKpc7SaIocxGDF2KofA8+/viEXkHAZKh7ck7pu
he2aXdJzK0zUjoCX2WcPDP+G/K9732f7GCtwwNx1mT5l2M208m5kpv3eHAGPnNUT
gNYBE29VeqrTYr36qLIwUfWJjZ6fLkX48CNL1VFwb/FXKl2VR3XleaHJ3zFOuA1A
8sAGKzXAxZyfnyMhtIRP3px7vLgWXzSD4od4kJrs7Cn2oY+ssnSAMjX6sWUaojO1
gD8w0+PiFcp+zS72fuu9M9jt6GQVNw==
=eteH
-----END PGP SIGNATURE-----

--Sig_/syM8w57xDCk.X/bpoixpDHN--

