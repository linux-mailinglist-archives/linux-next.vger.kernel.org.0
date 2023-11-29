Return-Path: <linux-next+bounces-131-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E23D87FE180
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 22:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E3881C20981
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 21:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB535EE85;
	Wed, 29 Nov 2023 21:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b="iGxpeWrp"
X-Original-To: linux-next@vger.kernel.org
X-Greylist: delayed 391 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 29 Nov 2023 13:05:16 PST
Received: from gimli.rothwell.id.au (unknown [IPv6:2404:9400:2:0:216:3eff:fee1:997a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35E6D67;
	Wed, 29 Nov 2023 13:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
	s=201702; t=1701291522;
	bh=pfKXxV1o9bsVbdXsAevw/wLb/y587ncz0hjhk3GzGOk=;
	h=Date:From:To:Cc:Subject:From;
	b=iGxpeWrp+d+nmMhFAuAF4qCcs/IGNlwwkhvizUVaylZqD25r3OVM+Yt4S+GBio506
	 /M3BaNdAqWgYsSyxVw5aZ61zsUoSM6Oa7mD88zjtQbSsx+Y9tFvDJjQbzUf/YcPjHO
	 0w7vxNako0xezNT3wo8b3vQ1ALp4n7PHB87vSfWIOxFfrw4OnCq9NWO9JwLmN8lVhA
	 VRc+Uqc8mEGzBgz2h4E96Irh7FouJsyWuBQCE0OidRGgNCWJkiTup2GYNevfpZ7wUp
	 FO/qNHGdPqDuj4QQGa/if+mUGclFmyQw6nUSh8NViuWq1N/T8um7ZSdqRR98MILCxc
	 wyTI6WhUEoPdQ==
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.rothwell.id.au (Postfix) with ESMTPSA id 4SgWrd6HC3zyqc;
	Thu, 30 Nov 2023 07:58:40 +1100 (AEDT)
Date: Thu, 30 Nov 2023 07:58:38 +1100
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: linux-next: lots of errors/warnings from the
 -Werror=missing-prototypes addition
Message-ID: <20231130075838.05e5bc9b@oak>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9q5QkoqVTQKoUJ==mE2l8X6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9q5QkoqVTQKoUJ==mE2l8X6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

please see the kernelci results here:

https://lore.kernel.org/all/656732fc.170a0220.49447.2c19@mx.google.com/
--=20
Cheers,
Stephen Rothwell

--Sig_/9q5QkoqVTQKoUJ==mE2l8X6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVnpf4ACgkQAVBC80lX
0GyNygf8CDjyqxpGtj556f6TeQWcjlwr4hV2Z+vYvWzxD3RV1rxr7K3idc1OwBHT
gn0F6pLnzfZGXRt/0FPg/9MQyM7II/kZeoIhE6Sm/cl19bV4PIih84vGjG8EpP3a
PvV0f57f8HBkrF3HlaGB+8iWrcbmqC0EOh2BnbCR2HTS1Jw2Toj4J1YAwyPZY3/G
qt2R0H1znXNCznq6ktY7QUX2BLd+Qou0W7xy+MvgQzWo6JY2jwnFNUlXpBPc562k
fEXPr6HyCuiDBXu/5qDj1I6N01B6+FJ2cmZg7PzhN09yen0z+I6V2VxEgUQDtPbH
wQfCilM6GdUk1Fk+FymjnEsFWnKl1w==
=9VCh
-----END PGP SIGNATURE-----

--Sig_/9q5QkoqVTQKoUJ==mE2l8X6--

