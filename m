Return-Path: <linux-next+bounces-4790-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4124F9CD610
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2024 05:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C09871F223FF
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2024 04:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B04A156F5D;
	Fri, 15 Nov 2024 04:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DGPW0/Tv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3FA155A2F;
	Fri, 15 Nov 2024 04:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731643290; cv=none; b=rxyNY3KuAYacuOmOb4WgPGiorcUmFiFvRWSPDS57bpcp4bb9C8nMARqceCEZZck8u+bubwwIVEZR0NIEgcAdYHPEMQ6RQat0G2DRxU0Eu4fWaxtdxDc0ChLk7/vZ6YvTpa4xAT9OEg3qTewvBZLbDJQEVjdosWGcy+tb4ZUAibM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731643290; c=relaxed/simple;
	bh=XthNiZBvbef+YNwcxdRWiT4FzpyLkPHqMawNovF5+wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WzCekRLZ3twBmWzGftFdqH17KoOTx5AvmJf33ohItEO+tIjdDSzoeSHRsjFK3tfsHYW6hk8RiZlFkD84SNIRNzXUs4PxATv0gY8+POLXa1sbIHsEhoRax3kPSGsDiBNjElyDnNbQH/kl5SXiDHpdRmgax+pbIMjYzLeFnQ8+inI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DGPW0/Tv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731643277;
	bh=y9pr4TSN6PiCb+Spz9MTsxw+G++IqCVNQrT9eZzuDFM=;
	h=Date:From:To:Cc:Subject:From;
	b=DGPW0/TvD0fPVkpp4KJ671HIBA3tQQnzC7K/OKW2zUf1t1wtG9vpKxiLOvvow/iRD
	 UCfZG07mh/yngJF6dIUzg8SzgypxWHHeqFgackKzubzwsvlf9VhT8lkn0aiVtSXFbT
	 yccY09jCSj+uPzJ6SrCrqUCF2yKKjPIll8F8SlVlFSPL0fkmeJwi83dsZt96U0vsvA
	 e6qbUVZzUJ3+cEf3ZtoLn5ZTpCqd5f8SPu+H7MbkUNnSlGu+b8j4+d1VAdYBiZnvqf
	 SZ6qAlfCuJ0JBiS/M0b+wypn3Ywq5J0HMGZjgNlBrU3BcDOSwbUXccZSCd8foFImCn
	 vvuaZUhGjcQ8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XqNcD0f0Gz4x8m;
	Fri, 15 Nov 2024 15:01:16 +1100 (AEDT)
Date: Fri, 15 Nov 2024 15:01:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: linux-next: manual merge of the soundwire tree with the sound-asoc
 tree
Message-ID: <20241115150118.3abfa3c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mkTW5raL2pqVcz1kQlLTnwK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mkTW5raL2pqVcz1kQlLTnwK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the soundwire tree got a conflict in:

  include/linux/soundwire/sdw.h

between commit:

  3a513da1ae33 ("ASoC: SDCA: add initial module")

from the sound-asoc tree and commit:

  e311b04db66a ("soundwire: Update the includes on the sdw.h header")

from the soundwire tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/soundwire/sdw.h
index 49d690f3d29a,784656f740f6..000000000000
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@@ -4,14 -4,20 +4,21 @@@
  #ifndef __SOUNDWIRE_H
  #define __SOUNDWIRE_H
 =20
+ #include <linux/bitfield.h>
  #include <linux/bug.h>
- #include <linux/lockdep_types.h>
+ #include <linux/completion.h>
+ #include <linux/device.h>
  #include <linux/irq.h>
  #include <linux/irqdomain.h>
+ #include <linux/lockdep_types.h>
  #include <linux/mod_devicetable.h>
- #include <linux/bitfield.h>
+ #include <linux/mutex.h>
+ #include <linux/types.h>
 +#include <sound/sdca.h>
 =20
+ struct dentry;
+ struct fwnode_handle;
+=20
  struct sdw_bus;
  struct sdw_slave;
 =20

--Sig_/mkTW5raL2pqVcz1kQlLTnwK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc2x44ACgkQAVBC80lX
0Gww4wgAncGM7TIKrWIEyuBhbyc55Rz6KZv5o0w6+/beE/kSBeSe1dZXI8udMWxL
eyXPZwoi8XZwE3eEUOjp/yVEJNc6tqibVycclH/O1Pkr9RSp1WmGAvUKhZrpN6Xx
YtGStcb8kI8We7Fm4SCkrZZM3DwvK2XUhaR6zhh8d+LHH6iTVVXsJ1GMJGi+svtB
Jm3TMseiHfFg4a8jobghB+xDRBa7f1Xqigq2KdsmZahL9AVK6nJqjYW3gUnINaU2
xyoUzttpJrzif9lOSX6ZbGONFa1I38qkwNFwZGNX7TP4G0NWDo1+k/Q4+rILD9Gi
lDX2sejyxA25LAIaxyaCQB4U7F5aZA==
=gMld
-----END PGP SIGNATURE-----

--Sig_/mkTW5raL2pqVcz1kQlLTnwK--

