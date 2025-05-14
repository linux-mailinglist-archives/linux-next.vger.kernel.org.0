Return-Path: <linux-next+bounces-6759-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A937CAB60BA
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 04:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A79516EE67
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 02:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6BB1DFE20;
	Wed, 14 May 2025 02:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A4PuKOf3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C23928EC;
	Wed, 14 May 2025 02:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747189746; cv=none; b=g9fSmqDo2moBhW0lLD0eZvLLhTCpKsxC/rEgHwQ/ju49tAhYaTxDBzsQGMxMzuRDt8vQm/e+3S3xo97B34OGAmY9jmT2JmXzncmMksb8Fes5PspCeaibIBvTu7+cZ+6eKiwPs1vnAttDEiqrrRYacHX8H3p0K0h7ytLSmsI5mqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747189746; c=relaxed/simple;
	bh=zilfPsdUo4IN0FDk2yDlhKBrWAYoBz3LVX+/p9lrjg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cT9+4uEuNDyfGdUf/IefPnjzGqodWO44OVdRud5fe4DYR3/b87iCFyjE6kdnMzRDzdhwqehiUYx/oXf5EcQT8LBHLEVCsT9RbAbLwKBc1JBL6Yp6rHUjvmkUxWONqyoMW3YejKKXngVE2G5ckaazd1+FQeZ1ogAFD7swOtuCjdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A4PuKOf3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747189742;
	bh=6Pw5UzS8wUVrHGfY4sqUMu24u0Yi3ofodNKIO8qQmFE=;
	h=Date:From:To:Cc:Subject:From;
	b=A4PuKOf33wsnRwk8nVSfdy4F0atayH3QqXoYlnmTbRcm5/BM6O/2yTaePpVruAu0L
	 3+fycW9r00oS7QCyDXiN8UsYZ6F8Q7/1MwtSrPZf846DTuhU81+v0QiOQW984nnOy7
	 18UxlPjWJCbtUp0WbJ1ABsrAQlNyA6QBuLEf7CxUOc5WiL90CTS/yK7Q5IrwctxQFN
	 bTkxeIV53p9iqAmawdutkPdXR1TyH76+piS+rRNcE+lEaxewfXw738jC2YtIBNmENy
	 cL7STLNTr0DKcFP8iIbigxojrpuEc4BtoUA1wkRYJ2YL5s2dFxDYgXK6Sy0ewkDf6F
	 OkWJVkDolmJLw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zxy2j5Z4Zz4x3d;
	Wed, 14 May 2025 12:29:00 +1000 (AEST)
Date: Wed, 14 May 2025 12:29:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Cosmin Ratiu <cratiu@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mina Almasry
 <almasrymina@google.com>, Stanislav Fomichev <sdf@fomichev.me>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20250514122900.1e77d62d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vNE4Bj/iXK670Gw=h1UMaN9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vNE4Bj/iXK670Gw=h1UMaN9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  tools/testing/selftests/drivers/net/hw/ncdevmem.c

between commit:

  97c4e094a4b2 ("tests/ncdevmem: Fix double-free of queue array")

from the net tree and commit:

  2f1a805f32ba ("selftests: ncdevmem: Implement devmem TCP TX")

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

diff --cc tools/testing/selftests/drivers/net/hw/ncdevmem.c
index 9d48004ff1a1,f801a1b3545f..000000000000
--- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
+++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
@@@ -431,23 -507,7 +507,23 @@@ static int parse_address(const char *st
  	return 0;
  }
 =20
 +static struct netdev_queue_id *create_queues(void)
 +{
 +	struct netdev_queue_id *queues;
 +	size_t i =3D 0;
 +
 +	queues =3D calloc(num_queues, sizeof(*queues));
 +	for (i =3D 0; i < num_queues; i++) {
 +		queues[i]._present.type =3D 1;
 +		queues[i]._present.id =3D 1;
 +		queues[i].type =3D NETDEV_QUEUE_TYPE_RX;
 +		queues[i].id =3D start_queue + i;
 +	}
 +
 +	return queues;
 +}
 +
- int do_server(struct memory_buffer *mem)
+ static int do_server(struct memory_buffer *mem)
  {
  	char ctrl_data[sizeof(int) * 20000];
  	struct netdev_queue_id *queues;

--Sig_/vNE4Bj/iXK670Gw=h1UMaN9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgj/+wACgkQAVBC80lX
0GxV+gf/Z5ywtZMxr4/byEMpeEALNHFwFUqfRaKm+5wBVlNBk21fZPzuE32lSOht
ViC7kM1yAkxn1RKfytyW8CihwMVjOY43P6c0ey5qCRqgvMBKQy5gTJbsAlFBHGK5
o/QF/BA4MaVlisK2UjQ5MDNqNd7DEEixYkCmZHO8smqNJ1xx/YjxfPfRYVfO2Gxw
TRsZayzPmXhxiYGvjyNFj+2QIf3vMvNX6cpGblgVf+axWhgTuSAAOuSB2rUIlyr4
Ab6XMmhP1Jkf0KOdUq7VJmB/wGXy9mlgORFqSTX3tpQMUcrPZNuusN8Bbr5irtuz
O3u4Js2ZbKE4stTVbwDbznjCtKA2WA==
=oMrf
-----END PGP SIGNATURE-----

--Sig_/vNE4Bj/iXK670Gw=h1UMaN9--

