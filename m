Return-Path: <linux-next+bounces-2905-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 649A692C65A
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 00:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20D862831B9
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 22:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E192E155316;
	Tue,  9 Jul 2024 22:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="u9TA7pLC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34A414D439;
	Tue,  9 Jul 2024 22:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720565681; cv=none; b=cqf/nnRoMxW8YPN+aLpPZIY1ad7AWfcn5xWzVzrSbrOhqTTpst4DFvW0FLTdyDF6CwQWy1EMWALDwAbrNtgRZnx5ACudX2hWGIOd603dJTrgfsOxS3aiMrL+VknESoZmLsAOzM8AySfCQ4TAZmNuXIXpIT5hzKGYivCE4J9zWoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720565681; c=relaxed/simple;
	bh=SEIggbco2C94QGi/EqYhGApHskCOMgkmArjKbWCC92c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VfiH24hpBiWbz0nyyGTjJMBre7SprEHEM208TKSNKFaxpiFON6aVha0thzIYY75t8aGa2rV6lqiFLtzczXYcVY7fAB2/mKJ8vfeLmRy2QUIggeLXVDjxEy6lOAYIqL9LZbUqCrNqhkOq+eWwaW6dAkwdDoctW0pUY3W1s5wqmU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=u9TA7pLC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720565675;
	bh=iCj6ETBJ95kpMQ6CVYsleTAB7KgY44Be5efURowdjlc=;
	h=Date:From:To:Cc:Subject:From;
	b=u9TA7pLCwYsWivjr4Q20VpdZBtZmOrjs4nFuEnE9+tOkuYY6qkwq58ho6ujUY/f4Q
	 B8Ok9Q0oPzkYlDIXXpib3QQZeKj+SgIocOwTxPoh5GPJX8STA7ub8BaHPDSeAKpM9l
	 awGR+2MbNdF7XYeIzfvXjKZGwXYpkMHbnnPvGKlhv3cbUDEbp3n4nbKg/XpDeAC8wT
	 vxWS7sNFsOQmjFL66Rw8za/6Mx8A/i/nvBYauJaihKjK7MuDBZxKW2FPE19I5lm2yx
	 N0NxUq7aNhk9ZNc7dVCUafey/iGegtDzzwztV0Qx7kklmBh91hm2hHHbVdQfPakqqu
	 KQdIolAEheFag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJbsR31XDz4wcl;
	Wed, 10 Jul 2024 08:54:35 +1000 (AEST)
Date: Wed, 10 Jul 2024 08:54:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm tree
Message-ID: <20240710085434.3c21eafc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JA6JgCL0BK1L7OfZIEU3S8q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JA6JgCL0BK1L7OfZIEU3S8q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  33955c6f4d58 ("udmabuf: add CONFIG_MMU dependency")

Fixes tag

  Fixes: d1d00dd1fd2f ("udmabuf: use vmf_insert_pfn and VM_PFNMAP for handl=
ing mmap")

has these problem(s):

  - Target SHA1 does not exist

I cannot find a match with the summary in the Fixes tag.

--=20
Cheers,
Stephen Rothwell

--Sig_/JA6JgCL0BK1L7OfZIEU3S8q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaNv6oACgkQAVBC80lX
0GzwXQf/QFI3Wkd2OuBmrdywSKF0I3nCJ86WL6t/EWnKL5FaI+1BMIFCvqbSUDti
X8wW7jH1Z/BJzVZMRFuOKbaT1lhd5B+oTHj9yC8Zoo1fq0rWJzDipVQUBd/QJTdL
hp+BRP7UaVFKfdVUImkeCsvZszVCgQ05+wam1IP4BPokxcdIB7RzU7XovuSpwO5n
lw1ztSE3qxSdSJG+MphBRnRykk9Qb+8w/CKnjAOwEDA/nGc7fpMaFFgGcCqTtqku
vv93JVmWe5OGaCozwvJuOx05kiCdGL1hFvK7UQ2RiN9eMKpWuTG5af8pOeSWMQMy
K6uXRxJuFoqiZXA+Jz6onvO2EBcVMA==
=EUfu
-----END PGP SIGNATURE-----

--Sig_/JA6JgCL0BK1L7OfZIEU3S8q--

