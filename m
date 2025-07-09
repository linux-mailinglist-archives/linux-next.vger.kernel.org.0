Return-Path: <linux-next+bounces-7431-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F79FAFE8B0
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 14:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75F0A16B0F0
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 12:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7772821CC4D;
	Wed,  9 Jul 2025 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pUyU/sZS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9612A274B3B;
	Wed,  9 Jul 2025 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752063554; cv=none; b=e04O2GVqgUYiLCZaiJyVvSs1PJRHrxdaJlX/ksXd0jj29Pg/p/5FZc82SIwv7lvQ3l5JRCyvCtT8otdFx5R4J0SiD9yCqqrPHL+rIK1yuN+vtsKItSPfejdeyNScS7mzU2xhVCZvyHu7yQlKVL1zQdfLg2uy1Rptflq5ZOM1qSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752063554; c=relaxed/simple;
	bh=t2BbGWEcPww9/zrhtw02Ren5jeVGKUgVNeFA8j+G1hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qIU+XhMElrWqBVFIJpTtiCTwLgbOqc3SR4PUrdKfhhtg6NI8WicpXmUkUJV0wpUDAWEukIJM9eq8MR58ByGMOFh1NuNIE2NvPS5sKHe2wDvHdtjLxFPkoWUS8ClMdhtF3KP78kIKdIsU7lhvAg5z5YvjaTb40kYnvy30wp1GAKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pUyU/sZS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752063480;
	bh=Si/UIBGqjtn/1epVGgHhJMdqwD159C/BVyCBGc8mYo0=;
	h=Date:From:To:Cc:Subject:From;
	b=pUyU/sZSPyxGGH3rnVXeW82rXhE15et2nuO1LIFdf0Bk3SZ38MbqbQ63gB7cvzc5o
	 vTf3ULofnN/9GGAmfdQgVJMoleLaoDNmvU6skuslHOBlTy8MzSF7ArACIKwVJ9IKPG
	 oljk5SvoR16fGfHROT5uIQUK2dI+x+iBPYFad0Mu2Jz8BOAoq852Xx8qFYH1nvPWj8
	 D4yzQJPvx/L2GRyCYRoX7OUEdm1BEZ5jL2hLraKoyOKHwA1iR8zhR7z5zMyL7w1AAR
	 GhCKsSd5Xtphq2xlLPCDZuMLYA6ULNPJ7sDMllOw0dmarJKbER/vX/FjqKTk3O7/fQ
	 d9GLDbzXQVV3Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bccSS5dmGz4wbb;
	Wed,  9 Jul 2025 22:18:00 +1000 (AEST)
Date: Wed, 9 Jul 2025 22:19:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vhost tree
Message-ID: <20250709221905.61e77ab8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MgQgRtSdtlaOfCMR5VyZIVa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MgQgRtSdtlaOfCMR5VyZIVa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (x86_64
allnoconfig) failed like this:

In file included from /home/sfr/next/next/arch/x86/events/amd/ibs.c:12:
/home/sfr/next/next/include/linux/pci.h: In function 'pci_set_disconnect_wo=
rk':
/home/sfr/next/next/include/linux/pci.h:2738:14: error: implicit declaratio=
n of function 'pci_device_is_present'; did you mean 'pci_dev_present'? [-Wi=
mplicit-function-declaration]
 2738 |         if (!pci_device_is_present(pdev))
      |              ^~~~~~~~~~~~~~~~~~~~~
      |              pci_dev_present

Caused by commit

  b7468115b604 ("pci: report surprise removal event")

I have reverted that commit and the 4 following ones (just in case).

--=20
Cheers,
Stephen Rothwell

--Sig_/MgQgRtSdtlaOfCMR5VyZIVa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhuXjkACgkQAVBC80lX
0GzFuAf9HFoPx7fRWZDz1lrpKHiYA/e7niXJbm+aw9BxatzbUkKsAW3oFff0Ny5H
YdsJ7lHfsqmDzDAqH4A6s4jB9BYmXvJi0KXLqaAXDm0gtyABNvFbM7WEG00CD0uR
CuskQu3XnmiTHS5jTuxbkMwWTolvqcjeI26R7ELJ9Rr+m6s7dE42uytLMwkOuq1F
5quBR43KkO1QXb5hQXuR1l/B8a83vGH3HS4+Z4YZb4bFgPnpFcuqH1mS1uUVJvft
BZjtZMOA6DU4RG1hbzcQbzQg2DWEizaVUtPQ8py1i/IRF9fV1+lNIljZbIwS5Spt
dX02KvgN4GDo8yKFxK2C25nGbq/qcw==
=5rhw
-----END PGP SIGNATURE-----

--Sig_/MgQgRtSdtlaOfCMR5VyZIVa--

