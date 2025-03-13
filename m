Return-Path: <linux-next+bounces-5782-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 120A0A5E911
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 01:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35B82189767F
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 00:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC395BE5E;
	Thu, 13 Mar 2025 00:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Recuo1bc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE55F610C;
	Thu, 13 Mar 2025 00:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741826983; cv=none; b=bU6Oc/E9iKUyIDjjlKUL8wW5xpG4odgjv0FXs4dm/zRnSAOGOcRjZFXHsL87sypc/UiiE9LEpUBAwAKuBMHtj091GsNtFAYMvFvXHEaxYJC1IESuhfWA/pIVVyKMlFk5Fpoekqe/pKJsnwqa896RjMQuT5hNKV+BCukyzX6C4iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741826983; c=relaxed/simple;
	bh=mShvun6u+c79rJKie2ctFkxfcvNB0ZNBQJ7Cbaf9Fz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qryv5ZtLRrAWJQGB7POjQcTd6WGdm6N1H0dwhP/7mpcUrcdJwEoM3l0TqklHSA7xj3LPmHh2iHGUDGQWDkTV8wZYWPlZnzxyLnm3xvmzzOKS5u14lV1FlWarTbERRGRE28Rh6CTJnzsDTI1VnNcnPYPRwYkqWmvf1YmNPRQGvwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Recuo1bc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741826970;
	bh=s79QbonB/1M1H1R9GH34tFkAAQ3ImHrCJt1dHjdi5b0=;
	h=Date:From:To:Cc:Subject:From;
	b=Recuo1bc80UXUAFKiwcy7Po0NhN9QSJFbgQyFRKRgbIAFFTUhH2QlQ7kZ8qhbtOmK
	 VtA7UmNtYksg0kaBPs51nEtn8SMUNUd+D8VSnHzb9DftbGzgXFrOeC7UvX24yGn/ot
	 Wi9yyc7a7b2xjAVL29tZ+iPhjbJecMTfvJZfnV/pT0JFR61Tow/J47azvklAZ6kOt0
	 2u1eq3vO9AXqXbA9ZKHpFln1ODXGgQZ7T5cMdX3GVc8b9ruKp5AKwUOOQixvInryxm
	 MmU/F+JAhhLonicQwfwSmgarf2K5i0T4PYAYrKTU3O5u2O7+uIiN4c5lVgtf1cAlni
	 /ssWQKXnTzS7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZCpmV3LPJz4wj2;
	Thu, 13 Mar 2025 11:49:29 +1100 (AEDT)
Date: Thu, 13 Mar 2025 11:49:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Stanislav Fomichev
 <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20250313114929.43744df1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wfNVq4GJXNamDxDIS+9EpLu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wfNVq4GJXNamDxDIS+9EpLu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/core/devmem.c

between commit:

  a70f891e0fa0 ("net: devmem: do not WARN conditionally after netdev_rx_que=
ue_restart()")

from the net tree and commit:

  1d22d3060b9b ("net: drop rtnl_lock for queue_mgmt operations")

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

diff --cc net/core/devmem.c
index 0e5a2c672efd,5c4d79a1bcd8..000000000000
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@@ -118,11 -125,12 +126,14 @@@ void net_devmem_unbind_dmabuf(struct ne
  		WARN_ON(rxq->mp_params.mp_priv !=3D binding);
 =20
  		rxq->mp_params.mp_priv =3D NULL;
+ 		rxq->mp_params.mp_ops =3D NULL;
 =20
+ 		netdev_lock(binding->dev);
  		rxq_idx =3D get_netdev_rx_queue_index(rxq);
 -		WARN_ON(netdev_rx_queue_restart(binding->dev, rxq_idx));
 +
 +		err =3D netdev_rx_queue_restart(binding->dev, rxq_idx);
 +		WARN_ON(err && err !=3D -ENETDOWN);
+ 		netdev_unlock(binding->dev);
  	}
 =20
  	xa_erase(&net_devmem_dmabuf_bindings, binding->id);

--Sig_/wfNVq4GJXNamDxDIS+9EpLu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfSK5kACgkQAVBC80lX
0GzwdAf+LHsYSjY0CWPzfKIDOgF7JSqTTQkQp2kfJITgXswd2WKpvr4rHVjBe2mv
AOelKVyC94t0Xw2iQme7Sa+5Jaq7SOHttVjWB260i/AGXHiR4N+lo6SNlDeGUYhr
TEKMA5HFVG2sRiuX6qC3b5vWs74w9OINXhO5X4dqW2zvAddjy43pDCE5UsU4sUSb
G708kuc9JGyMxKebPdvxkKEvFxX9jiP+tAqvBAP2w4yNv19MrQ8kh6m0qQ8FouOv
BX9Q6sWus5m2E6hxUH8RUqqss64wNtvwHfEb/KdzRrTSuoGnhnSTMI7ibKjHtHvw
scETVYCp3tnVwAjBs8rwLriaqH9AKA==
=ZXqg
-----END PGP SIGNATURE-----

--Sig_/wfNVq4GJXNamDxDIS+9EpLu--

