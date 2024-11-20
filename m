Return-Path: <linux-next+bounces-4824-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF49D4452
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2024 00:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F23228260C
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 23:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7A319E7D1;
	Wed, 20 Nov 2024 23:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R79yPOe8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE29519B3ED;
	Wed, 20 Nov 2024 23:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732144336; cv=none; b=BdmfiM/G+Ah+PJSigWihUjqTtKI5PIX4X5I2aSimgMnXeosQQ54bOMS+6tcNrsyJT1ktp/XFfofI+CxTa/DWFv8BzelXKMyMQOUBlx0FefSr7bBvuLjCSp0Ekeoy6+FA4FsubBjwgmlJIVe4i7g6cQU/lx8PFNsHxasL9A3+A2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732144336; c=relaxed/simple;
	bh=18sRyguwTGCajWeRXVQWjqLfjklsd87lefxJ8WMGhuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eTWRse6r8bVSq6z9GVDCBgkeWJvtFPLjknIKVcxiOi7jHWVL2bFn4FRPhLz4KOg0GLBL+9XShyIQdULNUFQEmalgJY1D/EaKw08Mo8T79li099xRhH4YT5TC5ETKlxsbm03Y7vNhWYDesggSPIra8mnlLDuQOI9Lg1FWiGhQfIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R79yPOe8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732144320;
	bh=7VAYoYJ5QWXa/sLkxr15mejqRG1Y+7vQFftOWODfJSM=;
	h=Date:From:To:Cc:Subject:From;
	b=R79yPOe8alUxpBHE3cmUHZ8Y/DlSfU9XI3HXSzOYOQclTgHdioBnfXXjcI5WXX5wA
	 1yzvKeh3kFmSfnYvelxi9Gw6V3SVAV51o78c6aqm9p/1VFvgVreIToVjxxOKzgQOWK
	 gJlNXRMWXtLPlDvOrOEozAzxg+qdAogN5P53PzIFeuS9APIOPvR1w5HGiEH7Depua8
	 9htI7486rDy//gaa6rIDiPmQbbyF1usyhGVl3O8JfaiXnfQg9vdkR3jynV73k5O3Zz
	 cjKiQaBarrjNIcfSxGxJetlyNLM7nmFIHXw9NBWIPaMLwtpwYQBBej2tFE7DqXsFYv
	 4Q1KQj6Q9ooPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xtxvh1NpFz4wny;
	Thu, 21 Nov 2024 10:11:59 +1100 (AEDT)
Date: Thu, 21 Nov 2024 10:12:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: very bad update of the nfsd tree
Message-ID: <20241121101201.0c5a7ee1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/msfFz6rY5xSM5oWJAqTIT97";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/msfFz6rY5xSM5oWJAqTIT97
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

It looks like the nfsd tree
(git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux branch
nfsd-next) is now based on v5.4.286 which is incompatible with being in
linux-next.  Please reset your nfsd-next branch to something based on
Linus' tree.  I will use the nfsd tree from yesterday (HEAD is
583772eec7b0 "nfsd: allow for up to 32 callback session slots").

--=20
Cheers,
Stephen Rothwell

--Sig_/msfFz6rY5xSM5oWJAqTIT97
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc+bMEACgkQAVBC80lX
0GwMHwf+N+kX6ULnTQsEHH0jJVPMhqHDGUaOgNpUljy7/gtNTOQdunBai++3F9Vm
ic7AFFqCXWrDUv81ARLzGmWHo+5Z/TG4UrRlLE2FWi++uvJjnnWsaL7J2zYR68nm
olZ9xqTfVcylzOX235gdDUX5ipwxSsVMQfxeL6mAGk67xnUoZfe6RBtDogDvVS8y
axUAAPUDBzsL34ys4E6Fl0SSfoso6e/r0ZDcyGwnHUXRNG/7e3qoP/fb5FEI/ZCY
Ny4Ob8QgYIvsyRntFevDlx/xrs5wkFs7NHpgv8q9G8BznpPcwlSGTjOUjWn2hp+l
Tpa35mqxYjpyjlwb7MONZSFfRLGDuQ==
=RNrJ
-----END PGP SIGNATURE-----

--Sig_/msfFz6rY5xSM5oWJAqTIT97--

