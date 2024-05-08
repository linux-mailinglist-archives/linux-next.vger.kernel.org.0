Return-Path: <linux-next+bounces-2238-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0438C0774
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 00:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADE301F2503B
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 22:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBC622318;
	Wed,  8 May 2024 22:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FrWVWrNw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210C217C79;
	Wed,  8 May 2024 22:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715208319; cv=none; b=B73Liqoyl1xHEdz4bUwFI8k0KjMCSfVSZAOkaiQhUQhg5XOfK4HvwQQ71ayxG7GMGIhlVCBDA8gK39XhKTcC20wywEwNFavdpM7+nzJOzsLMVtqgNAbYfgiyao5kYdg0fgcQUEw+Z5f+ZH4ZgDU6TqFqt0TZ0f/QcZpig5jw+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715208319; c=relaxed/simple;
	bh=XoDsCvV6zkUV0+3Fhr6Nsi59VArpSjQAk9Wtdx840F4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ag3eLQOK0QF6sPMbq5VW7slpdHZg6FZe1avuICfVQS5uXBpeA9eb8zyyXo7ZHF2wP/QTPXI8q1yaeGkni0vxkMTL+HBoRLs2ITZnXLpjZiY5Nt1hNhuqHhkvvsu0s5G6oTQoggfImMTfx59gwNp9uvixtI6VmBSnd3Z0/oUbXb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FrWVWrNw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715208315;
	bh=R9Se/EocRmXvxWKB/IxywV6aw07G4p6oFrpP3Fw0LlA=;
	h=Date:From:To:Cc:Subject:From;
	b=FrWVWrNw1tZcz47qu7DugOwL4lvpDPRH4jP52Tg2jp0wCUHQd23oodBZQn4b0bj+z
	 LgsvqRqEfqrA9Ng1fxUXxbJOjtB8TZ7aIuX2MJZ42lsN6dcH5xQI5QPLm79EWanKaW
	 8v9cAX357REyMRzqQTJV4qwlDLMhwwgxOx2KffeoRIu4LTLajDxSsJzjqoi+BBYzeT
	 gsmexbPGHrHNtGyySkphrSsvSNvvZxsvEczBKyj7jJxpCYNI1pM3pB6+hEH10afrir
	 S0pMqaqwuOFkJ9bpjBlmvPawiWLsiML4IWIXsd0ASCWmpOdrPRac/mXz5/4EaEUMbk
	 zUvZyooOiEtAA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZVbH3RPJz4x1R;
	Thu,  9 May 2024 08:45:15 +1000 (AEST)
Date: Thu, 9 May 2024 08:45:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bitmap tree
Message-ID: <20240509084514.45a48d99@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TvIlTf34Zbx=n_Ps2_a_Oxn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TvIlTf34Zbx=n_Ps2_a_Oxn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  552467a38cf5 ("arm64: tlb: Fix TLBI RANGE operand")

This is commit

  e3ba51ab24fd ("arm64: tlb: Fix TLBI RANGE operand")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/TvIlTf34Zbx=n_Ps2_a_Oxn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY8AHoACgkQAVBC80lX
0GxJ1Af6Alvkat8u7pQdjNPIi1sm+EAXzcY6gGfuL4pXgh8JwnyGlR7VqKvchRxD
G+dd75Fe/kbOprViAV8iWwJo1oBRkWIYhw9GVIy7n2cfs+NKLeAqECa97a3eaoVE
BeJftkohYlmo9BKrPUK6bLzN/pcKedcj0Z/kEatLeHvKFCTIMEtVs7bDsrl3xTQF
qH5vM6Yn4m1jmUzZslg5kt+smzCePKF45Avf/Tgxdx5caUj72mybJFDevi2csZJ/
cyEUs0VXEYx67KZ7g71HMD/eBbYJz4vI2ZpZP3g99Ob/Pu77y6scYa9utbwrJr/h
ANwC5ottpYjHA9uynWOE+hSRTUYmRg==
=TM66
-----END PGP SIGNATURE-----

--Sig_/TvIlTf34Zbx=n_Ps2_a_Oxn--

