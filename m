Return-Path: <linux-next+bounces-2725-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1856D91D4BC
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F5E01F21131
	for <lists+linux-next@lfdr.de>; Sun, 30 Jun 2024 23:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C187BB0A;
	Sun, 30 Jun 2024 23:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="C0hpzRMj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213177BAF7;
	Sun, 30 Jun 2024 23:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719789493; cv=none; b=cD5m3eBjpdDchWFsqYjjrtyyLyH2ag4bVaRIIGF2PFxDtRTXsKtHgJCI/jUhmQUDAXxyh42ttYbKqN6sI65APBgMLTogBi+Qfvaowd2WPBXQ9CbbcL74V3OYmFpOBjSL+/8qRUXoyvnJ+yoZGUVJBaKwvWrxGRT5dVRN/vc7ERs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719789493; c=relaxed/simple;
	bh=QkGHXX0FtQykoNcog9KQ2V1hBcZKz4ViyKs3u4C36jY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ll37/LcQGBsQ/o9s3qwshjNw1OnKYSaQgd0zw5S/FLcISmx6UN2JbLDH/oszcr8OfCbsheLuDpLGf/ODJoCkQwAIIkoGLVycXq19GHrWo2tHaOoX1yAi99TbRZJ7XBD8pC6MFxSuhZ7PUh9UMGVP/CfrKhWVGf1Wt5efQWhKdHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=C0hpzRMj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719789488;
	bh=JwhBMuPGcJFV5oMnPFixaLggfeMTxW7GyDMPzrZWl9I=;
	h=Date:From:To:Cc:Subject:From;
	b=C0hpzRMj0JwgVZ67Ib9fFpEmbaXthytPI++2Ok+bee3AXrSvZibkpOnGNFLFc8QHA
	 Ybkjzb4f0T+4jF6bj39TffogciWTJsz01TjFK2tfshT40g6u1/dpFACRCwmtN/hIJU
	 7Zwo41AOoIBSWkXXpzdkwHgynCapNaACIFQfkN4+8YqAFyJQPEROBh7frFEPM+31BF
	 UmMrj0/HMSsomozh8VqaflIUb93pogFvk84DBHfC6EBTYRMuUAOGG8jOVLb9bm/9Dg
	 edlN0VwfPPo8uAYqn8yMC0HVjg2rHJ687dJgdC69/poDUsBMnnQclb837GyjS0bqsv
	 5dbAg2Rja4gcw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC4pm0WZSz4wxs;
	Mon,  1 Jul 2024 09:18:08 +1000 (AEST)
Date: Mon, 1 Jul 2024 09:18:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rdma tree
Message-ID: <20240701091807.4094c370@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nEp_VLfjx.CHVmys7K3g9cH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nEp_VLfjx.CHVmys7K3g9cH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a92fbeac7e94 ("RDMA/cache: Release GID table even if leak is detected")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/nEp_VLfjx.CHVmys7K3g9cH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaB568ACgkQAVBC80lX
0GwaUwgAiMQgxMP8NPLZIvdRlAb3x8xkY/02ACHQi2QLUdpMtV8vpOpBig2JwQm4
aBHV2SosXWlIfq4SXBlMFVICWXkKSdR5mglZXvuLxtb/odtF0r4aVlbuXOtm1lUg
jBDA/MZ8Ia3bK+i3vQbL7kz+qdKZ0QlDqcWq12zEFZmpVLe6g/xBOIYOXQyQPPel
yRL0Pmz47UV6732iXYUuiW26ZGsqQZm/kIdiXnjQHossPoKcgx+OueAF6SSc4AuA
aIR0GIVgqu4xRnK7xNAHEfxKGutSlWZK0DC1oRHlhKzf36vefmT2WETt2d7zcnq6
xn/saeEHBrC/JLrY5ks3RY3EBBT9aA==
=uYBZ
-----END PGP SIGNATURE-----

--Sig_/nEp_VLfjx.CHVmys7K3g9cH--

