Return-Path: <linux-next+bounces-6589-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EABAAF4A3
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 09:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D27017B3CA7
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 07:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0A221D3C0;
	Thu,  8 May 2025 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gnxuwhEk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE4B33FD;
	Thu,  8 May 2025 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746689118; cv=none; b=fePOtRhV86Up+O26FqQnak16OHe20ghG2ikTB4n+gNdiRtnpkP4L52+MGspr/2+orvRicX0rpBHdUIiUDr0XuRQCPf7Zl5K+60owYBj+FY3vtQKzzZfsxK7qvlahT5jO5SqjCzehTSRkTGfmhOJH1fcDNldmF7TM3ZYdt5it7rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746689118; c=relaxed/simple;
	bh=fLlmBaUywmsK0yfESfzCAkJQ+mLSh1gRKjj+ZwJlh98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HQsMDVHYMkLNOONr9QUq+RpmpS8qYoZQQ7NoX5F6qv4PCRmznV51uCMaw0GFt1W0iDis9ht3b6NTJz4tXlR0Muwm809yt8o7rp8HFpbvYB+Tgq3WX4Q6OqbBHrJ4yMFLKxxNKyhYz29fbb9lN5SBC6X5QIUkTJswnBYDZM/++XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gnxuwhEk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746689109;
	bh=OPm9vae/tk0diDEwZG8OsMnel8xTGwQ4wRy58gbvY80=;
	h=Date:From:To:Cc:Subject:From;
	b=gnxuwhEka4nLmO6xfOlIXBI2fFOTK4J8LDaf+mYPrJQVJUyM7A9CEZcz77F/nyq+B
	 6iVaaOTRnBgjThpJ2IX/bfUdivQRTGrWUOkFZdHTQ0s3n9Cg2050FQQ542nJSHA1gx
	 pfclEHP1lskMKgnPqm0bj+NIPSkwtUwEx9Q259DQCQnAcXYXHsZdVa0n3WBZWoJeJ2
	 BMkXMJqXks+VMDj5Si/nGw6nHfOR7huFx5qJKrBcfQS8kP9Uodu48xH1pxqmScMCpm
	 uaMO7fbz1Ko18KWjxQGY8Wpt1M9/U/mF7I9lqGJh/O0SkzK+C213S0B4t3REdGTQyT
	 +RO56HMhY5efw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtNv81ZvYz4x8R;
	Thu,  8 May 2025 17:25:07 +1000 (AEST)
Date: Thu, 8 May 2025 17:25:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>,
 <sathyanarayanan.kuppuswamy@linux.intel.com>, <yilun.xu@intel.com>,
 <sameo@rivosinc.com>, <aik@amd.com>, <suzuki.poulose@arm.com>,
 <steven.price@arm.com>, <lukas@wunner.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the devsec-tsm tree with the
 devsec-tsm-fixes tree
Message-ID: <20250508172506.226894cd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EJWQlHPWcQXF8WTj/en3gor";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EJWQlHPWcQXF8WTj/en3gor
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devsec-tsm tree got a conflict in:

  drivers/virt/coco/guest/report.c

between commit:

  99b9d909187a ("configfs-tsm-report: Fix NULL dereference of tsm_ops")
(the file is drivers/virt/coco/tsm.c there)

from the devsec-tsm-fixes tree and commit:

  e5ab985f1416 ("Merge branch 'for-6.16/tsm' into tsm-next")

from the devsec-tsm tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/EJWQlHPWcQXF8WTj/en3gor
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgcXFIACgkQAVBC80lX
0Gy0pAf/dMysdotc928wh7RaWXPxLTtAd177HB8O2g2dWiExS60gYCabA4co9z0I
DsRpam01WhaIQ7ySZ8wTRMqs9dEzd5SdsLThW8Sz/M44Q+L4ip+kf8Fn3fjpLbLF
siOdhcY0WdV0lVYhdUeVONiMpAqa9SDdQT5sJNBl57iY+Ngp38ZkLc8K80mIsWPj
TGLZfeMnRHlzPnJaomoMgtJAVXNSVJ+tOXrLa3joUi4iBoKU3Qwy3ifDbDGOPCeA
u7rRp7PPtk9IkY0VETmuAm3Kkgkuk8sBhSWDMnZ/drGGjRLn94YpR4OpvPVIaTlx
xtZHdWWoJYm/T1QtpMJXqx4wQKYpbw==
=gysg
-----END PGP SIGNATURE-----

--Sig_/EJWQlHPWcQXF8WTj/en3gor--

