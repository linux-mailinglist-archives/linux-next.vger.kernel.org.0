Return-Path: <linux-next+bounces-2863-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C37692B0C9
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 09:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6A8F280AB9
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 07:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F0012D1E0;
	Tue,  9 Jul 2024 07:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P9B16q1i"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FAC12F375;
	Tue,  9 Jul 2024 07:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720508719; cv=none; b=ZA7NMVkM0pzztPo5FN1h6pZsYslh8SQdivP9ThpCe4nZeP+fbMWNeRi7AyUh2d3nE6WAjCV5cxP+i29iOZncImJ+Ys/S0U6H5QE0O1YqnCdx8bI9wWZLoiTt9eAWobPdJuqOVLM2uuS04VydHon/1/3rPdAQuxnsbpzVWxXBoyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720508719; c=relaxed/simple;
	bh=iJUq2de9Qzyvax72QH0A++O3d715jT4OFGMvZM8I7/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sCOOzTOSjxomCdW55hGTG7jsOL02SQcY0JTxRpdO3skUSqE3PvEDvdzLu0jL4HtylLh6XH9M9Jdj5m3OuQWorDzizpP5rmZRqW2PVws33A/9NtbXf56BGepma71hH2XbAa43n8bupKjkvzXBIoh8iAI1H5+qmd9U3jnm+Qk0ENo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P9B16q1i; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720508715;
	bh=cCiKiNeYcknzTIGN4qbBuxmlPNclxRoJbyFhK88EkG4=;
	h=Date:From:To:Cc:Subject:From;
	b=P9B16q1iyu0Ma36RfqNf36/MYebhOCi9b/r+waAJHW2gDXV/oGw6oDTwfz+9Hl6O3
	 vOjpZZlrod2oUwpbo4guPDzYCJJA5rkD44P861KVytZvzdihg8VIH/7fGkN3uCdyV6
	 Pv8Xp/BAOuN0O2eZCEL1nh1KlHAt2HnchJYCXteDzYAUR3zdo+6+VkohfSyQtoCfWg
	 RyFO6QYNBnID+xLo7Q72Fbcv6lTfPB/1gcyEbfNWtwrt+D8kF8nHkN0Ymz5L3rVVDj
	 P4ouQrwvoYBmkuhfxGUUlyBPewTAEJ3SndARU+fL1Y6/xSjc8D2Zg+Pb3khspqed/z
	 jXoMu4yAPGLiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJBp174Gzz4w2L;
	Tue,  9 Jul 2024 17:05:13 +1000 (AEST)
Date: Tue, 9 Jul 2024 17:05:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, David Miller
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Li RongQing <lirongqing@baidu.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vhost tree with the net-next tree
Message-ID: <20240709170513.6335f7da@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RWF=t+d4j2ktBmk4.BXL2IC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RWF=t+d4j2ktBmk4.BXL2IC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  drivers/net/virtio_net.c

between commit:

  d891317fe4fb ("virtio_net: Remove u64_stats_update_begin()/end() for stat=
s fetch")

from the net-next tree and commit:

  b76ecd081d7f ("virtio_net: Use u64_stats_fetch_begin() for stats fetch")

from the vhost tree.

I fixed it up (I used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/RWF=t+d4j2ktBmk4.BXL2IC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM4SkACgkQAVBC80lX
0GyNEwf/VpSJwauBopWtcBDS9KLwKw2/m7+UDlNWU6mI/Ab7fzFtkAC2OnU1cWeb
OYd6189wRPwTAfJWdoDWurzMrtU+iJBNjHvyn6W/m6pEMUbI4f4WRMWNQBXXj5D8
/KZv+GBSEZFgLKcQcN5uQbl+EKCNx6GEWxKYITydbzUil+lTidZYSmrD+4d27cfK
C7nIkshqZEBLxntJeWK6aikTl/QghH1MFYIo+5pfuiZ7IOlToK+vXaa2jrm0a18w
XIaPb27Qfi+8Tgh4pDpNT7pgHy1G/MoPrO8mxPa4bBTuV7QhV3v5U9QGTkNKyzUF
hKFtZLZfAOxVeoEiZiVcZ8n8Y/0HyA==
=tSS2
-----END PGP SIGNATURE-----

--Sig_/RWF=t+d4j2ktBmk4.BXL2IC--

