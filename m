Return-Path: <linux-next+bounces-390-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB378123E9
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 01:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E8011F219C2
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 00:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F7138E;
	Thu, 14 Dec 2023 00:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qtncVbeC"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1023DC9;
	Wed, 13 Dec 2023 16:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702513844;
	bh=+73VdIH+l1vbZl3wpgzGVdBkqDMH+xbOJV9chvjsKfY=;
	h=Date:From:To:Cc:Subject:From;
	b=qtncVbeCc3b5GRiDeDtwdXtE3IYjreXmcz8XK3opugiLBSqAnJ7uySiqlmF2tEAQd
	 Yev4TBHADoYshNogSfM8N5XwHXqj7oNnBj6Dfq3WL5xtDWzTyRtAQ+gQASvOfQsKAG
	 GxlWnkIzS4IJttI3pwOyvg/FhLQ68BrkuvWInLHBHynhtvaMSVZfgqQrZlbhtp+SZz
	 EY9dsA7eZiYR87SvfMi8Fwmip7aGcv1XzymTINlfvN1tuPIu3nVvpVeLMs+Pv6MISE
	 9jVLg8Exlc+EMsHD/0cq+VWAPpmzMnNVR1fgmrQ1qkmiPYY6l/ijZNPWmERW7m+AHY
	 ZwL/macoGYxOg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SrCtq6gflz4wc8;
	Thu, 14 Dec 2023 11:30:43 +1100 (AEDT)
Date: Thu, 14 Dec 2023 11:30:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20231214113041.3a0c003c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hEnblnRG.vC/RW3TIeCOmTM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hEnblnRG.vC/RW3TIeCOmTM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c

between commit:

  bd6781c18cb5 ("bnxt_en: Fix wrong return value check in bnxt_close_nic()")

from the net tree and commit:

  84793a499578 ("bnxt_en: Skip nic close/open when configuring tstamp filte=
rs")

from the net-next tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/hEnblnRG.vC/RW3TIeCOmTM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV6TLEACgkQAVBC80lX
0Gyduwf/ZqPVHbvKCTdr9wvSTpKY/zAYHIZoyTVPexbE1O5RAqd4axotWLeiL/hB
0zFeE6zT8jdSENUZPr/Qyxb/XSLC3p+BHA8UZu3UC7wDaJcLqo5xPfEku2kuG/0g
gbVy5OEi9aM9c1r+jiC0rcumsK7NHg7/YPoIaF79yXujf8VvXd9aq+rA0at2mupi
ZsdLMMGm0ZHFEU/tPEdIQ63AFOvd2F+jNlKmN7OsIvFGYpEYL8KNgcKRadQWcWpE
dzfqq7Gpkplyu2HFrrtfM72O+Or2+7y5+StBvzG/KS7m9Ef3hgR7I7lmoF+W/4p5
MpDbn6EogDMmrHp6UUmQTJ72RWbxgQ==
=ymwH
-----END PGP SIGNATURE-----

--Sig_/hEnblnRG.vC/RW3TIeCOmTM--

