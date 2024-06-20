Return-Path: <linux-next+bounces-2611-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F7910AC1
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 17:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5974F28156C
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 15:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24A61AF695;
	Thu, 20 Jun 2024 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqWR3Stg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA550171A5;
	Thu, 20 Jun 2024 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718898883; cv=none; b=Uwn8Iu2sPtdju6dA8P0Sk8OhJjCFXw8eg8cWxEjJ0OZbP8YbUHHuc2ayApZrPmeFNnBaJ6lRFILG4ECGm8DP4QdgFSTHPZF0OczMu6l+73U59DihwIQr+Fh5Y+qzbOex2y6H2WqkQTyyIN9CF+x0+R+Uo3E1TbjQdB6RQt81Uo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718898883; c=relaxed/simple;
	bh=2tp22RCvOuiLWgdRY2kEpdBuhkrIPjuRZalWBGnpZY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CxSHcEArshHXyyzU7J2fSZtzfvxPTKHO4YOfTmAtR4njZxWAM9HWl4M3pa8REJIsgon/4xoK35H91+kEwMeUhP/RalgW8lGGQmBj3ZgK1Xe3lZnQDmmhywhpVQugEAG+0cQGvUPUB3cLqzrpXNOKEE3Gnz329vYsObSCZhBzgOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqWR3Stg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24467C2BD10;
	Thu, 20 Jun 2024 15:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718898883;
	bh=2tp22RCvOuiLWgdRY2kEpdBuhkrIPjuRZalWBGnpZY4=;
	h=Date:From:To:Cc:Subject:From;
	b=tqWR3Stgd3tUBuWRK2Blx0UXTQrcMnTn7oHlTUxpvayEVqo7c/SUtSweqejJ56Eqi
	 R+1p2boO/QTu2owP7Z7tzP7BQWXC9Anm59m1L12QJhOTAOmz8ZCOJJh5Iw2hTIuD29
	 Vx2AV2EtGYBg+4A4wd+kmIuM99cliewxTlOlCO52sK9SroniZOyKjgD9uXEqCRm1qg
	 7U/93UVlq34jBwxogTTWtjkuUaoubGUCEGWGk3OwPDZWJy9dXjSydb7dp9pKiVimS3
	 CZ+LQ3w0fFT7JXS+3E8sUopsKCItxOZI1Efhgra7EN60Vi5ZgcOZ11a4EdzcHupG1h
	 oMD+nRyGjWFDw==
Date: Thu, 20 Jun 2024 16:54:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: James Gowans <jgowans@amazon.com>, Jan Beulich <jbeulich@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the memblock tree with the origin tree
Message-ID: <ZnRQv-EVf2LQ1Cjv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J5Vnv3MRBTlrDgal"
Content-Disposition: inline


--J5Vnv3MRBTlrDgal
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the memblock tree got a conflict in:

  mm/memblock.c

between commit:

  e0eec24e2e199 ("memblock: make memblock_set_node() also warn about use of=
 MAX_NUMNODES")

=66rom the origin tree and commit:

  94ff46de4a738 ("memblock: Move late alloc warning down to phys alloc")

=66rom the memblock tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc mm/memblock.c
index e81fb68f7f888,692dc551c0fde..0000000000000
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@@ -1441,6 -1446,20 +1439,9 @@@ phys_addr_t __init memblock_alloc_range
  	enum memblock_flags flags =3D choose_memblock_flags();
  	phys_addr_t found;
 =20
+ 	if (WARN_ONCE(nid =3D=3D MAX_NUMNODES, "Usage of MAX_NUMNODES is depreca=
ted. Use NUMA_NO_NODE instead\n"))
+ 		nid =3D NUMA_NO_NODE;
+=20
 -	/*
 -	 * Detect any accidental use of these APIs after slab is ready, as at
 -	 * this moment memblock may be deinitialized already and its
 -	 * internal data may be destroyed (after execution of memblock_free_all)
 -	 */
 -	if (WARN_ON_ONCE(slab_is_available())) {
 -		void *vaddr =3D kzalloc_node(size, GFP_NOWAIT, nid);
 -
 -		return vaddr ? virt_to_phys(vaddr) : 0;
 -	}
 -
  	if (!align) {
  		/* Can't use WARNs this early in boot on powerpc */
  		dump_stack();

--J5Vnv3MRBTlrDgal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ0UL4ACgkQJNaLcl1U
h9DOGQf/ROe7zNja31gTL++T7XT9JbYwuPY65LY/F0wSSfRZeuWmJYd5UWhx87Q9
yIEd9bK32FJ6aThN5B6LdFYWtgsBwd4TkiVapYn3KKPX3qTr43cIL0Z4kz3uLPUC
cXJg5unc0jtT3o1gC7f5KgEnUHjZGZYoMRByhValUaQ4A+mFPatRAFEJpRoU59W1
hWrJ8qyhIQMAAj0xi51mCbFGPLYwppdvKvtrwYrpL+5ssEoe94n/aO2+JvueIN3g
MMmOhskEv126QluNsQbnV80bURIS9bnmCKcERgrwtR9C4ThHb1NTk5PHRpmzS50g
Q0xoNrXKXoRQu3fdBNFkZMkfxnQ0Ow==
=/JZ/
-----END PGP SIGNATURE-----

--J5Vnv3MRBTlrDgal--

