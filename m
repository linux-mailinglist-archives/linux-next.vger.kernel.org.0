Return-Path: <linux-next+bounces-6587-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22973AAF1D2
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 05:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 142FF9E0D96
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 03:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386E1433D9;
	Thu,  8 May 2025 03:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Mr7qDTdm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE8017D2;
	Thu,  8 May 2025 03:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746676124; cv=none; b=mJABRxVsvS2Md1S+kQW7syPqzIEapBX/BZ2pZ5wSd9Pg44Uex459IJxmTKETCMdiOEc6JVfd9jN1nNhsU+KH9XxftH9BbdPac1GwXh45kC3YmOGcpc5YWocv/59YXLb71v0HUa4XO0GZ+qwbmJUokAUCyKAFYg6CKbc6BTYvz5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746676124; c=relaxed/simple;
	bh=9vbztlY5olWsBFRPpIf+784crs/HMwV3kclYrkVYtAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IZZ/xlWLDGGKMO8Rs/o262ooBFQHmFVcc0fyYQNdZrYYFbFEOxIFXEvKSQvqhHm1kpf1Xyijm32jgjM4q6j+GpQA2rojzf7YTuPWQalkd2KJx9AcjrzC5lA8OYm6reXpAlYQf/PolYbmakUpHQt1DPtQ0WTNd+xD1bEjEwuwu1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Mr7qDTdm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746676116;
	bh=9e6bduR3IbevX5Vl855ArWQ8Wz6c6i43xYmFz7a8Pl4=;
	h=Date:From:To:Cc:Subject:From;
	b=Mr7qDTdmirQpYx/WTf67YtQe8r8Nq2Rzrmu2Ycqgj1RxLlsB/Zi/CGhi+L8nwHsVM
	 iOUAz+Q+Xfgji5ZciQatZ6ydsta0sIiko2aSGMpj4B36YG3UsDj0KTZsgL1JNFS/G2
	 vko8eN/JqDXckMJOAnnYnYsYSdsSkGnasYzyVxa82n8P9NsCWZT9lHZSQAW7+FW3yl
	 2qDoguMX9D+lsZ8Z+9JZis2RXwUQrhA7gkWFNE7JBsYPAZkoLKdmrykD439lK3lwBP
	 ZS+T1mcPrZTyk7dCSKjgeK8qlx9WGjqAXgR64CjDE/Kw91Fmyx78m1b6gCr9GVzEzn
	 kE+o/MA+z6gZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtJ5J4HYKz4wbx;
	Thu,  8 May 2025 13:48:36 +1000 (AEST)
Date: Thu, 8 May 2025 13:48:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Johannes
 Berg <johannes@sipsolutions.net>
Cc: Johannes Berg <johannes.berg@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iwlwifi-next tree with Linus' tree
Message-ID: <20250508134835.34bb82e2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SgS5UHr_Rfhe/VY6aJAuzpJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SgS5UHr_Rfhe/VY6aJAuzpJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iwlwifi-next tree got a conflict in:

  drivers/net/wireless/intel/iwlwifi/mld/agg.c

between commit:

  60d418e85404 ("wifi: iwlwifi: mld: fix BAID validity check")

from Linus' tree and commit:

  cc2b6a0bf340 ("wifi: iwlwifi: mld: remove one more error in unallocated B=
AID")

from the iwlwifi-next tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/SgS5UHr_Rfhe/VY6aJAuzpJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgcKZQACgkQAVBC80lX
0Gxxtwf+J2jkjsy/rXfa0Byjy+bkk8660PZ2Ooey1HR4wTXa9XOQiDQaC71GzEVs
UHznOzJYx0e1JHFKPw//PJnws0BPPfMl+GuPXQqKCX+yn0PTIAogaAT9tZ9PlApH
i7GONxHNbOGN+EySuMBjNNpdn5ek6Uu4IFjgXgh/22gjamBimQk19Mk8r7Swsdlj
J5/XUdiothlN2eVKyk/3je4mw7m6bNCATpNEsAgv7dl17VDqWyepNRUyHspkr3Io
BdoICZ7MfECYxyXkx+GUy2wwqI3ZrR/PRxJ5lp4Zn+gNjLLDSw0MBeTqRpSl1uGM
RpMlF0okJtdLUI3zFo23twna/Gp4yw==
=n7Y/
-----END PGP SIGNATURE-----

--Sig_/SgS5UHr_Rfhe/VY6aJAuzpJ--

