Return-Path: <linux-next+bounces-8255-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E8AB5266D
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 04:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 787DC7AD1FC
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 02:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5884A20F08C;
	Thu, 11 Sep 2025 02:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hSq6lLVQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDB8433B3;
	Thu, 11 Sep 2025 02:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757557610; cv=none; b=RalspUi6xTPtEI6U0OIV9Szea3CN0NlfMOI86HO+dBOsNhWy7L7yyBsqNU2sOu1i0XnjHRvQbiSw0FPJ93vyLZlJzDAYFsLm2+20I1tt7wwUxDXSPnpTqHMZhnmfslrKauck1/2SsxsmdJMKJbZF6uRyEGODSaNplbAzeW4qbXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757557610; c=relaxed/simple;
	bh=e55PCbyJhrqtW0NBVs1hfcsdUXUvirzdArJTiCyvhWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SPNt2Ri57uPqt6fzKV29aacDdt/HGealS35XTlAxK03sjSm1Lwh887iYB35/QWNDSBg8hDrIbDzfjZklJXeiHVoMdc8muRhz8i+jkp906nlQhA+C0C4YwA1uNbQGHB/ACF8AKDoGeTI8qzevqNSn90NTAwGm0gXB0Rv8GzAC3lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hSq6lLVQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757557605;
	bh=0A6URhdlqs4pP9qVP7HRkSbprGrlPkR5AfXD+T7ESEQ=;
	h=Date:From:To:Cc:Subject:From;
	b=hSq6lLVQ7AR5vUSQlTfoHaCuSfRB58mZ9V4WWSZQmfjE1uJVZwT/kcD+CJunSRxlM
	 S9FAx3nyuLqpfVadw55aEImr4Ov9WUSnDaZswm9xBI0J/Se+oNtUHsS5+C8hUV52I5
	 dULI420vHg2XDTC/tvFTPyU7B4scH+GA+oXkZ4gla6J5d1KgmhB+To7i1hwJM9EalV
	 S3x+Poj4mNo8uAVz0qO5dA2+ipIEDWjol8nS+2e8VrApz5YxMTcIvmLaINVQ/oXTvP
	 FnNz3OdSVEiW0SwMXOd6Km9TNgutaISL/6TtyeE6uB73BTfvoHm1eJdFztDN0hljul
	 QnZ/WZSjzGGRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMhJj3dFGz4wB0;
	Thu, 11 Sep 2025 12:26:44 +1000 (AEST)
Date: Thu, 11 Sep 2025 12:26:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Leon
 Romanovsky <leonro@nvidia.com>
Cc: Abhijit Gangurde <abhijit.gangurde@amd.com>, Allen Hubbe
 <allen.hubbe@amd.com>, Lei Wei <quic_leiwei@quicinc.com>, Leon Romanovsky
 <leon@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the rdma tree
Message-ID: <20250911122644.40124ffe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/no9PiYLtEvLL6LWjSC5zsG9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/no9PiYLtEvLL6LWjSC5zsG9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  Documentation/networking/device_drivers/ethernet/index.rst

between commit:

  ff8862c9c609 ("RDMA/ionic: Add Makefile/Kconfig to kernel build environme=
nt")

from the rdma tree and commit:

  6b9f301985a3 ("docs: networking: Add PPE driver documentation for Qualcom=
m IPQ9574 SoC")

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

diff --cc Documentation/networking/device_drivers/ethernet/index.rst
index 1fabfe02eb12,0b0a3eef6aae..000000000000
--- a/Documentation/networking/device_drivers/ethernet/index.rst
+++ b/Documentation/networking/device_drivers/ethernet/index.rst
@@@ -50,7 -50,7 +50,8 @@@ Contents
     neterion/s2io
     netronome/nfp
     pensando/ionic
 +   pensando/ionic_rdma
+    qualcomm/ppe/ppe
     smsc/smc9
     stmicro/stmmac
     ti/cpsw

--Sig_/no9PiYLtEvLL6LWjSC5zsG9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjCM2QACgkQAVBC80lX
0Gyj8ggAnL3ThRIvQx9UDbN5NRYmqztyz41D8eOfNOOTlFNBaZvOFnQz70aO0A6X
KYDxNUHsvIb13hX4Q1DHGQkw8kJBjWGUbYi30BYSWT+GPEwncfDFz3fsgKJRKoSS
SeOVO/IHFEcmh4wJWoGHdaqZ2o/tG3oVghABDV92rCeUIxOHvHjCUwYV3wxaYFar
B5BXsQz2ApMkxRfBSLbzwcoDqBdTGCU1qE8NN0RnjBS18izNTkqQzrRcFU2o72YA
zdUBEriE4+X2bdNIiJoa9IGCnMAWuDUGha1d4cGTfL6c0rtcVROEjjJnoIokmpAe
Vy5CAggwDX6t3LVkkkFvCVvbgWMlpw==
=Wwlu
-----END PGP SIGNATURE-----

--Sig_/no9PiYLtEvLL6LWjSC5zsG9--

