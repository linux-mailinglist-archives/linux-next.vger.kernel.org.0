Return-Path: <linux-next+bounces-4292-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 888569A0001
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 06:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7473CB22F87
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 04:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B75A176237;
	Wed, 16 Oct 2024 04:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="S4n5SJei"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850F315E5CA;
	Wed, 16 Oct 2024 04:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729051959; cv=none; b=rX/YVvT/zbLltFfwteLkYpoFYM8V3HZsb+gnRLUxxt3YbH1RCaRtfDf4N24iCLq2EN+WT2s3m24pstK+nkkBNTCFuGL/9PsDHeLYeeXLyFmmZgUT68LkwDL1uASve/bM0Cjmaco6COKTd5TbUchyU2Kp4lOVcQSlTrmhJ+XCsB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729051959; c=relaxed/simple;
	bh=1S0qb8jno7Mr9AeWm5rcBTeSEqBGmcMLwOcO6Imy51Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=br5btjjAxMHwZrr3oEHuIgyb1VIXEajB2AH1SWED1yGMGLEVBPXn3jPhKxURTsiyfRaLE0TmvXrhns4RUcYDMH/xZEvmjQzjKErT3CSKUUWue97vL4nybGkNHRypHChH/3W12dtCFCDQhGArNB3UeXNkDsBTMykGV5C2b9NoDoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=S4n5SJei; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729051950;
	bh=dLXf4idwckNZwdve0BmykMgLl0RejwuyD6Tl9d/WRcM=;
	h=Date:From:To:Cc:Subject:From;
	b=S4n5SJeioJVWwVDTN5NB/B+DF/I/sZeZcXoExOXSYQfC7NHt8ohrXIKrb5LQR9+Na
	 2B0MRphk3hw2SRbc83m3TtIokveNCQFNfvBCVEhW6lRblrQM6BUccGt68tO1orc8+9
	 qeDx1LT19+KG6CslpyZ4Ln92Om5jPkxBI5FwLyj0UbikJbZ/5MqoONcNbshuENZs5A
	 P/OnpkaRiz9RKyBRa6MqPRMdh4b+MfhX3pi5/R88ALc3ZVgzOD2JMr9439dY2DJwZq
	 GEQRQq2CLNqSTYRr5tRavNlIOOJ6u887zSYGuZTX5fsnDW0pFK0/AboPrNOr597g95
	 ky1DeXmi2jVMQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSyH24Vzdz4wb5;
	Wed, 16 Oct 2024 15:12:30 +1100 (AEDT)
Date: Wed, 16 Oct 2024 15:12:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the driver-core tree
Message-ID: <20241016151230.41896b5b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q1mteMhLIOnViSUutxWW+L4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/q1mteMhLIOnViSUutxWW+L4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mm tree as different commits
(but the same patches):

  9bd133f05b1d ("lib: devres: Simplify API devm_ioport_unmap() implementati=
on")
  0ee4dcafda95 ("lib: devres: Simplify API devm_iounmap() implementation")

These are commits

  a508aa764a55 ("lib: devres: Simplify API devm_ioport_unmap() implementati=
on")
  e16fbbc11039 ("lib: devres: simplify API devm_iounmap() implementation")

in the mm-nonmm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/q1mteMhLIOnViSUutxWW+L4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcPPS4ACgkQAVBC80lX
0Gzoiwf/fhTph7fGeOkBYw6vaiRVU4cxzSAj27byAvhcfwR+xJe05Ll3VlKAmZmo
oLAUXOWXKEg/3zigMPvSZ+OAq/TDRBHfTnf56fKuj5T9bLqSguLmPrR/7VY9UQ0Z
VmOU/FLun08o5FGiSlsq7ZG3Qf8WuGYGfB1w1XoLFDOzsM71Fb8F0szwcw6yAE3Q
/VWh0HTs0tm5D3rkb+7ZVnJuoi3kzSiUKIeozSWrkWDZrZl5Ok0jr06Zy2HJ7lq7
1vSt0prgJpNIdFl1daNp66d9LRTd2G3e2EeceWLAl51nZC6Us6tsB+eD6Le/V9rp
pmxiWtKtOHuJk5ZEwZd8TGPq1Jba7g==
=0UjL
-----END PGP SIGNATURE-----

--Sig_/q1mteMhLIOnViSUutxWW+L4--

