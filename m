Return-Path: <linux-next+bounces-2934-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5C292DD4C
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 02:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32E2F1F23756
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 00:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082DA383;
	Thu, 11 Jul 2024 00:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UvnaoxtS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF93E36C;
	Thu, 11 Jul 2024 00:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720656743; cv=none; b=T7syHB0xwfkeAmrl7pMvVEpthVywlAvfJPfzaS0KQ0+ZV1s/piaovv56EsC7JKPhMQQ40rJZcSU/gbD8t+Z3zuqmEvW92DtPSiQHZhkk2INg7i/grXYXgn3Ghg1kJb99XXfbbjWzi41/xpCJMA/Lte3cyekWUYbVjYdTfDFT/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720656743; c=relaxed/simple;
	bh=z3/GPZr3IzNYwJAFUT/h9tXpOM7D+P0jV+CMFOAI/30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CNNxSktJsig1sNodZFyS5ecWSUgjQU08YFRZtoQqknyVbboEg0Q5qnvKDJ16YhxYyUu+mPvVe69L2IAd4qM/jrWB2/V7bSTAudC1wFVFDqDR4CyApMxL+QyBS7a50WD+XKm0MKBV1tIuE2z8u2z4nIUzOwhz2lj4bpgBchPMHjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UvnaoxtS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720656738;
	bh=aOXnWRsFNv0bEA3PDX/YTLl+7NS+nEOIZ25OGc32Xgs=;
	h=Date:From:To:Cc:Subject:From;
	b=UvnaoxtSGqPMsCysoNbJ8jch0T4GEvkJpT0+J4OKbpNr5DIlciOILaEYejwCOLvgc
	 S4ei7WFlocJq3667WDQGzTbQPQAnNn8JvOntuHsAq2LchG6AQQo20CefQBkkxC5qvO
	 FAn+EvoQ+iLFkCQMQalvn2Rbl7S29AP+ApOB8OkB8cz/RdmhQ62X7Dh9nxvjmXFzde
	 euDL34FZ+SQTjG6DZPXuuf5lVNk36YgqdUAR7JoKwNqfIqgpOFQnXRwYIsBs1okhTU
	 YmTnqObd7t1WlArUeR2LJ9zHP+Od+uOg+3bLPFg4u6a2mfU0LKHFMZLhW11kwrMFXy
	 qv3IeYq5dS3vA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKFXf1pHBz4w2D;
	Thu, 11 Jul 2024 10:12:18 +1000 (AEST)
Date: Thu, 11 Jul 2024 10:12:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the bcachefs tree with Linus' tree
Message-ID: <20240711101217.12675d47@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k1bVI9sYrFtANSoBycP1=4y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/k1bVI9sYrFtANSoBycP1=4y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bcachefs tree got a conflict in:

  fs/bcachefs/fs.c

between commit:

  0f1f7324da0a ("bcachefs: Log mount failure error code")

from Linus' tree and commit:

  43c6a0cede5a ("bcachefs: Kill bch2_mount()")

from the bcachefs tree.

I fixed it up (I dropped the former change) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/k1bVI9sYrFtANSoBycP1=4y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaPI2EACgkQAVBC80lX
0GwsEQf/fbBioo933eRY2bGLK8zTOyEzus2FiTsj2O6k/o4RA5AE062H90L4d/nU
5mJ2wej2CURcyBDwh7Uo6/84/gTgGRyOewUgPQJRJKsflm1Dx1PR62q++7LL8ItP
LsKwBQjJ4Sj7PdzFKcR9JKtFVla7joCWAMlcONTX9ohruEdR7JPStec8mUst/XuR
OS8m7/GWDO7L8IlGf0QvLD288jMD2l2+WLEV5I/xziqKv6FV1qtK4itRCuBDBIQW
ZU6Lsf9QGfruhJdysuqdAFH2TacOw1JiC4O5CkTh/gmWvlPkVzvmpt3cpjS8ePub
AT6ASF6W+FSj6CVO8FWO/fzOjnBwgA==
=3/gm
-----END PGP SIGNATURE-----

--Sig_/k1bVI9sYrFtANSoBycP1=4y--

