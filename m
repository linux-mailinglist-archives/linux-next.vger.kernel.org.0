Return-Path: <linux-next+bounces-7175-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45200ADFDA7
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 08:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8543189E74F
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 06:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAABC241CAF;
	Thu, 19 Jun 2025 06:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qwqYusp0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3770C24167D;
	Thu, 19 Jun 2025 06:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750314659; cv=none; b=fXCQefY0J94V3SIHJHiMDrItOgJkoVotHvcc/mBLyCdk6X3PY/sUUJvyVWvpSK2GYTDuwPhDjcqWICLA7tEChV5ZEUr5N+oNvncjSn92KsT5WInufyeVioKFYEzxc9GSxZPgliG2tE1Y6Zns7T+uFWrI9v2syUII2WMQooQ1gWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750314659; c=relaxed/simple;
	bh=XDYDVp3L62GmYM44274ZD7YPQjqg6i8tsN/XhAKJp6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uO+KXWssGVXP6OqVBeZFzhKBXXQDN/YvH/eQ42YMWzab9LuaW98xRYvrQDrlZ8KQFvF34DMo8kxtpwgz09m/JgS7X9sba1t9Ey7BUihG5XJY38pc2729SmAiZGRCo2Tr28Lgl9j96XToiAzyfo7CwajTL5u08MiF8sxH5pRCY6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qwqYusp0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750314643;
	bh=2wLPpUxm1cNGWwH16bxL9usJa/D5UKwe4i2r7lgYJHE=;
	h=Date:From:To:Cc:Subject:From;
	b=qwqYusp0jj7V35sJ+YgzQfzJSSavjp+inBbmu+n5hKLCIt0r81+gnfXs/pE+N6Iid
	 HmUubge7UlCrQUUE7WRe01I/9wAwx0HXzTEqG2Hm9niRu0DmgjxYTsOaskGRhk/jUj
	 nS5p/ZY62UtT7iHOvCvBLUFU+4o8/gtzKhgv6PSyVEiMXParpaOVPELlosKVcnY2MT
	 XEAlHKQN+gyYVt6edd7xLRyjNvAYYyC/jn1q9wQOp1bPbb87fB5Ykzh8xeq30qnxBl
	 txN/BBpszWQcGMlTAfLBnaWyyKEK15UbzX/hI24bzs1TaHY9isnzJAefXHVXjWZ6er
	 6edkcr0ZshE+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bN9hz0Mmxz4x8y;
	Thu, 19 Jun 2025 16:30:42 +1000 (AEST)
Date: Thu, 19 Jun 2025 16:30:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe
 <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>
Subject: linux-next: manual merge of the driver-core tree with the rdma tree
Message-ID: <20250619163041.7e4f9c96@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZMyv+xMeANeLTptnJTxTJtH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZMyv+xMeANeLTptnJTxTJtH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/infiniband/hw/qib/qib_sysfs.c

between commit:

  24baad32b710 ("RDMA/qib: Remove outdated driver")

from the rdma tree and commit:

  fb506e31b3d5 ("sysfs: treewide: switch back to attribute_group::bin_attrs=
")

from the driver-core tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZMyv+xMeANeLTptnJTxTJtH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhTrpEACgkQAVBC80lX
0GyKBAf/flVo7J3UQo7cxnfxOw3AssIP+7vsKPLKXVczmfMQhXZgCD2BjgTviFp3
+IGyy7abO09F6bttIh5nOqZnAwwiLOLGWzTiHMWJRm2qLBz2PqG/fLPZhX1OGTyp
NMU5+SjreE5FbDAgMEJ5DmGfq0wXXO7gpEkYl4DzjdScTM09O5UV6iq9FR6yRsmc
/tvXUty6ybhZX4Hk3i190Dw9ETBRrrnedEZvGz3ed+0HFgmBrUORV2XuzB/jC9eW
V6KAFyTe66u91QhcexAqM7NTvwoIBdHY5br5IgSj5yjNHZVbydHoH5LvALELQ+6/
rHwCk5OKGVxqgkV356Tb8sNYky0vIQ==
=1/RR
-----END PGP SIGNATURE-----

--Sig_/ZMyv+xMeANeLTptnJTxTJtH--

