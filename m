Return-Path: <linux-next+bounces-2817-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF11C924D2E
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 03:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E7461F2342A
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 01:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1131373;
	Wed,  3 Jul 2024 01:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XC6nxYXd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806224409;
	Wed,  3 Jul 2024 01:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719970185; cv=none; b=jVozjarE1eH6ofE1iLrsgpiM00BrR32fdd/1cw5YO97mdjOIe+y0s+mizQ4sjU8fp6d2t5xiARMJlCw0XW8UgZYf3hznLEEomRK4XK/yAdf1k2vDpe9/HPqEOTdBhULMnYTTmalzJ2uT9LBlaW4ItB8aFyD/OweaB0bSlctYWK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719970185; c=relaxed/simple;
	bh=g+XXyHOzir2A2nh4K4ouH8PO9d/BcCXBpfaXdmkAeN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AhDjg/fliRWFownExQmTCR8lP/2u/8ifzReP+VG6d6EvbqoNxtMKSL5izRbpD6A4NkY99+HL+TeWAnC0XMx8tfn5KFMV00ePCPOyb/h9pQqBj9Rn8h2ps/Ubs88pETfEAjd1J7EMuwjZLZKvbwkXyFgKmnsBmNTqZv+USLhGjrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XC6nxYXd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719970179;
	bh=nIM5iPvChSeqRiNksJ2bd1KdDzBJoaJC7afh/m1jadA=;
	h=Date:From:To:Cc:Subject:From;
	b=XC6nxYXdzsXwAtOUKw73d5PjyMc7HeX7ZJoT1mjy60zHjNwsaENQxUKfuBro+MEUV
	 RA3vOaLPjOxVQ69UAkQteAu/lvlSXd2Qoi8zW9aQBaRAhpnnlAboZhUc6eGaz4ReYL
	 RuLfJpIkn0DO6NTkhM7M5Z7f46ieoyqjzBB750gApxSKQAJtv1cdsEAmahXow2fJuc
	 Nd3qqvhw5o7a/pwVi0eGXLUuXb6KYtC/Qx05Aoy+aeJOFbAiK7wOjvNxhgwQbepP4l
	 kjbFLinaKFVnU2EbfaHnue+nf/0C/56GOQkUIS0BnFyEROTMLa6kPtL44EMwzyZkuL
	 MFe3s2Thub0WQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDMdZ5cJnz4wc1;
	Wed,  3 Jul 2024 11:29:37 +1000 (AEST)
Date: Wed, 3 Jul 2024 11:29:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Jiawen Wu
 <jiawenwu@trustnetic.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20240703112936.483c1975@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_UeR91GFvX0uJsm9Y8KOSP1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_UeR91GFvX0uJsm9Y8KOSP1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/wangxun/libwx/wx_hw.c

between commit:

  bd07a9817846 ("net: txgbe: remove separate irq request for MSI and INTx")

from the net tree and commit:

  b501d261a5b3 ("net: txgbe: add FDIR ATR support")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/wangxun/libwx/wx_hw.c
index d1b682ce9c6d,44cd7a5866c1..000000000000
--- a/drivers/net/ethernet/wangxun/libwx/wx_hw.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_hw.c
@@@ -1959,7 -1977,7 +1977,8 @@@ int wx_sw_init(struct wx *wx
  	}
 =20
  	bitmap_zero(wx->state, WX_STATE_NBITS);
 +	wx->misc_irq_domain =3D false;
+ 	bitmap_zero(wx->flags, WX_PF_FLAGS_NBITS);
 =20
  	return 0;
  }

--Sig_/_UeR91GFvX0uJsm9Y8KOSP1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEqYAACgkQAVBC80lX
0GyYZAf8DxYgI5fhkZtmy+Uwo+WcOxg8hYCNADg8Ozmw0ZpfyWjjaemX75sVac8P
AV58qTSoA98P+ktBpOlJrZVgmd3vOasBB3HqIWp6HiS8oVySYqxxW5zboNC3uUut
/X3tzuUBlkggYIHZElnmyDUWJCXs7rDhUihBEkU04dOdFyTI5OhwL6Vp5M7069bY
zluk5SjeM23y0hn9WswmzOJZw7OUE6ELKCPaen+fSqKTpadDSDHLm8VuaSmlKPtc
hr3nyvPSR/SsPufnOLO30crCz8bomm5y6ashou7OPNAV3IKAOpU7QvW4k8R3w8/r
ChJtUFF6DShtJAY9KjQM2t5RthSRkg==
=HcsQ
-----END PGP SIGNATURE-----

--Sig_/_UeR91GFvX0uJsm9Y8KOSP1--

