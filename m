Return-Path: <linux-next+bounces-2935-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242B492DE4C
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 04:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E48FAB21CC5
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 02:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F314EBA33;
	Thu, 11 Jul 2024 02:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DtVcDnqp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFC479DF;
	Thu, 11 Jul 2024 02:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720664258; cv=none; b=nbAmeAu6AwoguhigWcKQV0eRI0IyB2hWsvkWte33GoHFHq1o1ExarCaLK968mXyXkxbS2IQoO8WYQYgAzdNzd9YIa9sPDRDmudL2IkQCrgeZ7bt6TLsiaoLEK+gjxOZSJoLjuAbuTBuPfE0jpIvhfMHqvytqm0SumU+ULGruIEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720664258; c=relaxed/simple;
	bh=6Cl0COJ+KPE08x/VOBtl345I/TBsEEvslZZImkNkZPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wvln4SooSYwD5ZmTju8U0odLnczCOzEoxhF3vDWJ9hslJZCE/m4GEXCpwCHBvEj48Z0mk7Ln5lr0Cyz5GYDsaksAs4yafBOs9j4t1iY1gSkaspRYbog1WXmivreL9BF8Of4b0Z5zdbvsBu5e3Yu3LlbyrwPm87eKONQ9fq605zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DtVcDnqp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720664251;
	bh=PPo7nmHCNk06MfO58dmwetPugEnRShvTRaasMy1gZtU=;
	h=Date:From:To:Cc:Subject:From;
	b=DtVcDnqpSFKxBh9JBgfVvzC8qOcjND9xGD2jdZtV7wDJqsyPvjBerbiEBHq2CdXv5
	 VbHJFNNgJyZe7Y/XExncc1z5LPev6GFbC3HmqpD5zrl8BJVm4nABSbzfxd5BARr0OG
	 vzfdjWOIkFniTnZJFarHE4Wb94vzdpU7swMNqLtgM+0U77aRxaaPuUyCP4mnoVTslv
	 S5L52BXP9ktcoB2ynL0r5PCGECHrrYbVN+diHZ45HT0blyBLCP4vd1Qab4abYH0FmC
	 atp7YrFyIWKoXEdqoyDmVMzPZbLZd5eeUKOYNG9+WLx60Y1rC6KSM4xHi7l/2enWsM
	 40GzwIWUvQJ4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKJK64WYlz4wcl;
	Thu, 11 Jul 2024 12:17:30 +1000 (AEST)
Date: Thu, 11 Jul 2024 12:17:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the device-mapper tree
Message-ID: <20240711121729.0d71308e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QDfqgO57ncFxaPAPE3tTbce";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QDfqgO57ncFxaPAPE3tTbce
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the block tree as a different commit
(but the same patch):

  e87621ac68fe ("dm: Refactor is_abnormal_io()")

This is commit

  ae7e965b36e3 ("dm: Refactor is_abnormal_io()")

in the block tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/QDfqgO57ncFxaPAPE3tTbce
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaPQLoACgkQAVBC80lX
0GyzbQf/VxdzhWp8lKKx8EmZs5QVSlgONPEz/sQBt3zOnwAmlq0bpa4vIpiCvdTQ
QLrQcnnOIVeFk6rO/nTn6YAIbPn144dHUSF4aKZQ42x3k67hnOJi+BaFsgYsEK5l
M8WOS4oJqpnX9+B6WwcxKBgqukXSGYqQFf28z0mbfih4os+ahpprhhiBxgLTZ8yK
rw6vr5S99wG71BVejW5rv0aIWSyYCk3UkXpSJ3DyAnMCmjdcOCf1jp91s3RHSDcU
+Kr8yzEBiEgCKb968axsX5+wCXFnAjfY7l+K4zITW4RRZ4JYT8gw4LQ63MGRsxyi
CIJYYon5agZbeY0Vz+yItkPmvicGgg==
=Izey
-----END PGP SIGNATURE-----

--Sig_/QDfqgO57ncFxaPAPE3tTbce--

