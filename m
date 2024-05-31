Return-Path: <linux-next+bounces-2429-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E904D8D58A9
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 04:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 060851C225BB
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 02:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8BE77F32;
	Fri, 31 May 2024 02:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UxBobHUs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53311F16B;
	Fri, 31 May 2024 02:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717123117; cv=none; b=WtVksWWePbUuo7FED+ePlaQtLXUIdEuzt0UkFDuFPdhUgOJqi/rFQYDwVc77hOMMZn/3etxPaQfy6Auj8nUK1GTp28w9KaM8PttXRm6yr2YxJuZ95PrlF3B+Fho4srtZJChKMaMk3qw+ZNzusuOt/YHyw6E8EzBqXDN/XUgIYYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717123117; c=relaxed/simple;
	bh=rxh9sVn7HASgC784iwT/sLpCZlAS7XWdGXXksQAs2nI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iOoAV6t3rlPc9eeMGAdVeLH3vrjCc9ZA6quKs8PmRzAD2qVD8jQihqvN3PUvWcGNADxQ73if1NnDBtPulpFyy5MOYcZsKpWd6jWo2/wFQ+T5zEGsE9+GKUA2HBYpxvHxpK9qHoyJuZaBLRbcOLwxGHrl0h7fbZU3K3xdlhoQk00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UxBobHUs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717123107;
	bh=eMFPK0u+EsMV50uPGvRYMXzeCximC+x+ai1u0XQ0Y9I=;
	h=Date:From:To:Cc:Subject:From;
	b=UxBobHUslnwQhnRqFvXypMWyXjzSaB6W4+nKmzshxM7VzuFm5POpQ7DcY51+HkKml
	 XXgphJ7juZdVuciGJXTjZaytjkNc3DKHjGzxB8tr2cFwYBmB4qBEzQmFksg/znk+Nu
	 D9DKehl0YlBvYzzwtu9XHIeVtUgl/eqs/V1B7lH0FC5u21nvkyZtoDuBldeuCJtFY2
	 ZrsAkpXywRbIARuEIpOCyD2ZiLGWWFe4tGotAWHM+EcIGj4FvdhE7GI1vyun9VAS1X
	 BKVFgTsiXuG6uFsOWkEr1hXLzUmvX5l9cuob0Vp1ZSiTRqmLdzy68fGd7ZqSXbbhgl
	 hgoJXTGUof4AQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vr6kB70Y6z4wyQ;
	Fri, 31 May 2024 12:38:26 +1000 (AEST)
Date: Fri, 31 May 2024 12:38:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, MD Danish Anwar <danishanwar@ti.com>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20240531123822.3bb7eadf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T_qxduSg5ONj0V1Rt.aIDlL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/T_qxduSg5ONj0V1Rt.aIDlL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/ti/icssg/icssg_classifier.c

between commit:

  56a5cf538c3f ("net: ti: icssg-prueth: Fix start counter for ft1 filter")

from the net tree and commit:

  abd5576b9c57 ("net: ti: icssg-prueth: Add support for ICSSG switch firmwa=
re")

from the net-next tree.

I fixed it up (I used the former (they both did effectively the same thing
in this spot) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/T_qxduSg5ONj0V1Rt.aIDlL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZZOB4ACgkQAVBC80lX
0Gy1lgf/eM2kx7/2qvfoIi/+xQqFA5KD1pNrYChv0LPgol2Bi+tsINergmWJHAJ5
JuthhHDNXnJFnVCXIlKX3tXd0suOmHHFV3RyzECxv5Alv3BGy6H+9sLbPMtQ2i/K
sbFJZFClGUG43IwFf5nbo4ce7PJ6lfbZo3PCbYqoOilKyowvVSgu9ZzGMIgDxV5Z
G2cRfVZj9JFXrXjCoTUsXKtgtQHaTBmrrs6x3qdzg4TuYtyxAyaNe0U/29xsl/aT
ppxWkeAp2fcaqha9IbxkRhQdrDpbqcmqrBRnrTHg4oldVE30SvMIFLnUrqq8Z1q9
+4a7OKXC4Y4PUyCUK/juU2ZyuvskMg==
=7LFf
-----END PGP SIGNATURE-----

--Sig_/T_qxduSg5ONj0V1Rt.aIDlL--

