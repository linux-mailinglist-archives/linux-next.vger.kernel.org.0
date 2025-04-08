Return-Path: <linux-next+bounces-6180-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75403A7F27E
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 03:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26C55175172
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 01:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FA039ACC;
	Tue,  8 Apr 2025 01:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tBL8B2tg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F653363;
	Tue,  8 Apr 2025 01:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744077503; cv=none; b=OnGI2njWw3sFA348CxiBu9bfOGCH5pFJpcsk9pWeJfZe3bg+fN8AV/daLNdqJPMb/nIbHZrV3vRIPn1dxF0RivafNxGHeWIdhN6IsUr4EonDRybff7wSmeKTW3+BhAR3jHFZgADnoEfmmDl53KCdV7q7cLe9FE38zF6AthR6xq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744077503; c=relaxed/simple;
	bh=0IVdnC2QG+tJxr03vjzQgC55haYDeCWt5NUlb5oJlUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZkQCWHGIIdQD02Avcz0oPd73bLq+Y9jIK5pS6jlYS5qLOJ1z/4HfqRMWfUOktEvQAIh6xmwibHRI1ml5WSHtpWXx6MkweQk9jRjA3DJjmdaDURiFLKtC43465C4Oi8hv1rbOBX/XzKixkDcDaoFODwuEn2QNk3qojVFbTwe8bzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tBL8B2tg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744077494;
	bh=qnLYYmYvnpLXTLKkHmioRRUvl7SLbInyp4kptnR45Yw=;
	h=Date:From:To:Cc:Subject:From;
	b=tBL8B2tgStLHvHWmwqXWGaSc+oIewgPKObOeyBmIT5wMeIh3ZZY4pOvzeli0IjiIT
	 NzP5XtCAjoUtAXvWEiBOhJCwlrYnLoeMii941WBPE1S3X0yg6K7d4ctTDF8I3Bz6h/
	 4me65N+gmEFubDjqxAIalTE3laGjCpVq9uhkDY4no5iQG/ozCYQ3JDztgJ5myG+Qn4
	 ayJ97AlCeuXSTDq3P90ANOmRqwlKl2KkwkI+75YeGMCvtFi2tTrNqbdtibVREN8n4L
	 c0/uyACpyD5qx34kLGEQEk3hZyZC+7T++shwss5y8SlJfb8+tYb3/oZL9x6mSgjVcn
	 cT58gq+HsAFow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZWq3n6VGBz4xD3;
	Tue,  8 Apr 2025 11:58:13 +1000 (AEST)
Date: Tue, 8 Apr 2025 11:58:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Xen Devel
 <xen-devel@lists.xenproject.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the xen-tip tree with the mm-hotfixes
 tree
Message-ID: <20250408115813.0a5365ef@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1wsli=Gj.rBDPyMX/OFziTq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1wsli=Gj.rBDPyMX/OFziTq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  drivers/xen/xenbus/xenbus_probe_frontend.c

between commit:

  5be5772b1f96 ("xenbus: add module description")

from the mm-hotfixes tree and commit:

  b40c54648158 ("xenbus: add module description")

from the xen-tip tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/1wsli=Gj.rBDPyMX/OFziTq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf0grUACgkQAVBC80lX
0GyZmgf+KunX/Z/1JkX41sS/t6EuxwP5hAu4bZm1qBZSLS56Hjd2GFLUMfvzz0Yd
TXxXxEqtmPwVdAR3VppX9R85PsQS4xJszzjf+PfYnq1My7Kk0qT1vQ6IDESkdPJ4
//SzYnNbjIpE/gC0fDDM1fEfJ+E9qx8nXUR9pl/CzanjBsdgWApS/0auRAzdDcL/
C9yMUg8SaR8HNYHrl/8dtsTL5TgKf6sh+Y0DLk6iKdFW/GNjBmosNB9RQnP92o6B
9mVVGbw3cZBggk5H1qdOmeevvH+kdGTcfXsD/ra2ulM9eyUDHr9IBlMYQkAv/wh4
oZlGaRaDmq+e9e2NgzJxDwB7OP9s1g==
=/eeY
-----END PGP SIGNATURE-----

--Sig_/1wsli=Gj.rBDPyMX/OFziTq--

