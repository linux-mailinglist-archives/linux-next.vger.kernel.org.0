Return-Path: <linux-next+bounces-5692-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68742A56312
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 09:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB3A77A615A
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 08:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EFD1E1DE2;
	Fri,  7 Mar 2025 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P+j6LFO1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805F41E1DE8;
	Fri,  7 Mar 2025 08:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741337842; cv=none; b=rUHZg4f8I2l5vG2JWGZjoX6xT5ohvHnSf/nFBKSVGUcBtEnHipYYZnuu40EViq5KsxjTx5fg6bulpXZLWXQ7FCJ5EZPcC9jOTXvko2dK9Zzhlv1+P0o47MUD0xO1lj5hXMHRkUS72Lh8+sQ6BEJoTHJC5mK0oa7rC6sTQk3zFzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741337842; c=relaxed/simple;
	bh=9b+i3SlwDWvRlk2Stn46hV048jxfGrVkUU5mAO6APDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kckHNzMiWw+WkNs/C8/hnz55ILZmupyj2I7Yb1CS6MHrov96k1pOhmh3SUE9r0K7SaITbgqDLOQm0tEudTmDd2H4aEFNfbHTqthzMQwOj0hp/C5T4ykQY72YIK3qOJUD1rF4npMBYSwxYhEQylRzqARyDnrytV2VQo9ISINv4OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P+j6LFO1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741337836;
	bh=7d5DwFDeVOxTGDKr1FNiLlbnaSu775qcZegDH1n/5n8=;
	h=Date:From:To:Cc:Subject:From;
	b=P+j6LFO1d6koR2g0V6vyeQTwP/EOuq27yeLiiIIQDpQZKngMwF9bgI2o/PwaVMo0E
	 9Bli6EBtneZ8VtirqK8WXurTgqPbxTLAJbVYp1UIPYJah46VPThoDdMKr0AV/5Wtq3
	 7NXbwopVC2liTtgsA3rEH5YUm2twkUwqAsuQ3cuSBJC4A14XFcs818YsdpX2DOjryH
	 aym4nP/U+jsj4uDweOjeax/nkcYn1sArMyaoG7bUvVGFk2k8M6Z7n9kDC27AfkTXLs
	 4rEfYKW4nFBFEcp6TPJDE/V5k8YcQQQEdodjcvZYBM5i3C5mwZBW7kG3Dkv0h8O8uw
	 j3npYPMM5zjAg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z8Kt36q6wz4whq;
	Fri,  7 Mar 2025 19:57:15 +1100 (AEDT)
Date: Fri, 7 Mar 2025 19:57:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hmm tree
Message-ID: <20250307195715.0b7abf0f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RQ4DJAj3agVkLChHGmguZcZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RQ4DJAj3agVkLChHGmguZcZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hmm tree, today's linux-next build (htmldocs) produced
this warning:

Error: Cannot open file /home/sfr/next/next/drivers/cxl/features.c

Introduced by commit

  da0dd17604d4 ("fwctl/cxl: Add documentation to FWCTL CXL")

--=20
Cheers,
Stephen Rothwell

--Sig_/RQ4DJAj3agVkLChHGmguZcZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKtOsACgkQAVBC80lX
0GzYzgf/ZFDkw7n2oYuNyjkAe4ozQqIqxNP384KBHIuSukH/w4VZWfMdLJtqtuTJ
fBZHMRuk9YymWvFNsAS64mfN9cU1y/dPWBJk5s6EkvIyX2zt6OydkO3QrjWPDmaI
3XRtsPTsZHavUj0wjVkf5lAOH1/FlPQLW1dioD/UamZXNeuSTFZ8XXvakTIWA0p+
OZF4Uby8m6arJ1gM3bN8l5o6zKQgmncE6N3k7HqloMZP/w/MRrio0Nw65fhwgzNk
2I8RfqmBSLGVYF8RzR+SXutVzGs0gcPL732G1vbgUsRJRCDbZZ3lPgMMuv6mQmPY
un0hmMlmMZeHJpVISt5DuHG58glqjg==
=jO3p
-----END PGP SIGNATURE-----

--Sig_/RQ4DJAj3agVkLChHGmguZcZ--

