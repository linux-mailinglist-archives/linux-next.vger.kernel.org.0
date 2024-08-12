Return-Path: <linux-next+bounces-3288-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8060E94E58D
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 05:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 233441F2210A
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 03:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B151482E2;
	Mon, 12 Aug 2024 03:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LGo+iq+d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FBA146D69;
	Mon, 12 Aug 2024 03:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723433406; cv=none; b=IuP2DY/KG4jVMeVGJCuz6lo6LD2/YPHdKseVTmtOx9xfThgVsilrPc5pux0JD+lKvTjqON9Wga7gsK1KHONKqeBhM50HHhmmkUGkg+Qa2Gde3ttPwQpFRi9DmZdR+ZKy6+jbyhzxUTftfCRk9RywW5SJBHot5jB5SRN0oKh1n9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723433406; c=relaxed/simple;
	bh=Dj3vu2UWwT8uVcLAkZiuE0gyy0nJV9mSuK0SOznWXxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hNxR/tDYIlnCYL5NKqzDxBXaPMpA1qJvDHcH1tDA9NgJuJb4Ub+Uqfbl94lrMMA69p8ARcwrTNGVEQSmgAJtIkDkYKyvocbB7XEbKt2heJYhGzGFEGjkGETILW8Iiu26hIpJFKL9RtNf0oVhkbIxlx82HnOGJWhrNsaSW2uYOIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LGo+iq+d; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723433401;
	bh=qGKr37Vn3DO2r+jbTDhnxMHbku9+PiGerDKDRY2zcUc=;
	h=Date:From:To:Cc:Subject:From;
	b=LGo+iq+dg1WhGEhSs7wQ3ABzqwRg75oS8mKH8mUVjRkCkgyakDgiY+lF412qauK9q
	 uA4e4K4KSPOA44RpxnBraTuoNaP3LbRzM6njKxwfb/Zx/O+iJO/jFmc8gsJlxeL3rJ
	 vfobWpJQMPn2FEBwjGxwY+ocNJ2ql8d6uN51RknK1S8tS7DqlnXXZcPN9qsMV8QhpA
	 VzKTODDZFK9EuOawqR3SyOY7cOQKYqQeY9lvCBwQVgxWfl0eYysITTPnT1XxPdHJn5
	 jD7k3cG3W+kWj+BvnDp2eIb1WL6FGEmZbbk2BU0jcGmcZ52FOrSO/BzzaJqOj9dHu6
	 zOxTOhETSs9yg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wj0Q11TNBz4x8M;
	Mon, 12 Aug 2024 13:30:01 +1000 (AEST)
Date: Mon, 12 Aug 2024 13:30:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Saurabh Sengar <ssengar@linux.microsoft.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20240812133000.59660575@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kQpeuhBgs58np4sDpxN44Ri";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kQpeuhBgs58np4sDpxN44Ri
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (x86_64 allnoconfig
and various other configs) produced this warning:

mm/vmstat.c:34:12: warning: 'vmstat_late_init_done' defined but not used [-=
Wunused-variable]
   34 | static int vmstat_late_init_done;
      |            ^~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  ef534a0d5198 ("mm/vmstat: defer the refresh_zone_stat_thresholds after al=
l CPUs bringup")

from the mm-unstable branch of the mm tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/kQpeuhBgs58np4sDpxN44Ri
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5gbgACgkQAVBC80lX
0Gxqagf+O+hpQp485n/SyYpYKV1ayOWJFqKpPP3irUO/Te96cKihPFfton+EyWW9
aOn8z24CVpmQyWeetfoi+MP+gDF1LLRPNeEUrJ1hQIJZqeS/blFfTHSGFZSTl2Sw
JYZ5RkfVAAx3OFAf8eZcuu4nF79N9zssjvg2hAFDgYOzeE5zS1ZMoeKT4gBxQUir
qWDyphTkEihjM81xXFM/uXViYlG5aDi4uJfvN2peSRzryaUDU+Ve7JmPkv+wOdrS
Nv82k1zp0vjgyDGu7eMdnu3Wm5hRmPT3fY772XpbgwFP68p06RMjf7XPrcUE6kxu
JHSm6Sc/IMs80cxi61y3AA0WLN8e+A==
=c16i
-----END PGP SIGNATURE-----

--Sig_/kQpeuhBgs58np4sDpxN44Ri--

