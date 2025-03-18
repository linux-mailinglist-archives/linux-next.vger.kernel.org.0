Return-Path: <linux-next+bounces-5852-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECADA67158
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 11:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D994F17D325
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 10:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507FA206F18;
	Tue, 18 Mar 2025 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sWjC9ieY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B75202997;
	Tue, 18 Mar 2025 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294049; cv=none; b=JQtYJ5VuLHM6psTSbzQy3njeHVHxnuPTywyDBFqRdm21gOyuzCgKENnA/EpzDdY3lJXh2mSFjW5DztHO+el6lM8fC/3Hy8YTdt0aOCQRgL8twruteEByXd7CBXemDe3EZkcGYNcIOndEYDBEHEUVtgVPWxOo+gOsi5+cQ7DcL+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294049; c=relaxed/simple;
	bh=boUEFzR2f+gmED/G0my55hRnXnTJIW1CJbJohJHSlhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kFaChX74RHFwwhSUgrrP+8FotdFzzlBkMf0YXHqzvBxF21O9l+eQistOFywJu+DPJc2L3CQemmC+wK4GMXaOtVpROMOBqdFiTCB7lChSh4kUVc1ZM922naiPEvB/6ZHAiJehNP+h9lap35CW2SKYva4qvJdUrAgycFF7CZmwHRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sWjC9ieY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742294041;
	bh=U6fXIqmOMeSnP6qCMOFoMy4ZX3nWJvC/usPFupz0kJU=;
	h=Date:From:To:Cc:Subject:From;
	b=sWjC9ieYga1YPQkFBfspQQDbIFTcMzwQ6o4eeGEl4A47yyw8rZIjP39EmOhRTQV44
	 Pz8esQJF7x0K9GQGz6cIVPYf6Mflf87RIMwLpzeaPDtWqBgaTdR9rhodlYz3nU/Nic
	 f1jRdjCOKSFIBkZkaqCN42KXqYWwh5vCF/lagZeKxEC2BO4n1ORFwJlGZ/SAOnuspU
	 3MSv9HmU7SHYLWYLINjmm+jt3opgQE3rpbgAkX5lrm6+TLvB4pskmLqGqdNulgCOGB
	 e6YQDh/FUDHA7epbhF/1kh+0k6OuzK/X6Ax4VB/WRaPnnhSNTA7jhEQucDC6xX1dTD
	 f3uApC0Ho3ATQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZH7Vc6jHtz4x2c;
	Tue, 18 Mar 2025 21:34:00 +1100 (AEDT)
Date: Tue, 18 Mar 2025 21:33:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iommufd tree
Message-ID: <20250318213359.5dc56fd1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yagRj.NRlkk_8/gAVtHDkDz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yagRj.NRlkk_8/gAVtHDkDz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommufd tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/userspace-api/iommufd:323: include/uapi/linux/iommufd.h:1033:=
 CRITICAL: Unexpected section title or transition.

------------------------------------------------------------------------- [=
docutils]
WARNING: kernel-doc 'scripts/kernel-doc -rst -enable-lineno include/uapi/li=
nux/iommufd.h' processing failed with: Documentation/userspace-api/iommufd:=
323: include/uapi/linux/iommufd.h:1033: (SEVERE/4) Unexpected section title=
 or transition.

-------------------------------------------------------------------------

Introduced by commit

  50c842dd6cd3 ("iommufd: Add IOMMUFD_OBJ_VEVENTQ and IOMMUFD_CMD_VEVENTQ_A=
LLOC")

--=20
Cheers,
Stephen Rothwell

--Sig_/yagRj.NRlkk_8/gAVtHDkDz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfZTBcACgkQAVBC80lX
0GyQ0wf/YG2NkK17x00l4bzgm4oOUwYig9fxAoG7lCNNa4YEgkUjw/fwarJJRdkw
4p9BJmtioBKrBXf/HAJvu0r+LB3Xsk8Y7htVTbm7bPijjeqQqc2anN9p++WpwRCA
7maeAATp4SDCeX8P2rLwJ5X7h+gnGzkzNPG1jm5ZT4aya7jQ2ZbwgZ6a14vPkfKP
qZuB76E4yil3K84iJgf/7LfrCB/HDVl/KJ+b8kfTII5/lPgsphYwu3udFG5448Of
j+jOdwwDbo5bN5d/CnL1JvfLWm2XipIc7Au1iNFRgjc/yUqFUVZf0JQ+WXLGJ6Vr
phqQzArquFwmY5DacW3bcPSAx6netQ==
=6N5C
-----END PGP SIGNATURE-----

--Sig_/yagRj.NRlkk_8/gAVtHDkDz--

