Return-Path: <linux-next+bounces-4600-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D14409BAC22
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 06:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 782251F21621
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 05:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D96A18C326;
	Mon,  4 Nov 2024 05:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UJAAd1aL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C751885A0;
	Mon,  4 Nov 2024 05:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730698981; cv=none; b=a7Ble1LozDL2GdIg0zZN/e1Euk5M0hlkcK+whS+rGEi8NXvHDwL8eUg4/jnPWFjrL0ZG93H+8iBiiTspYkhg933Jmspd0MCIECSgeHLdi/tW6lIS5utzVXtXBdaW8jdgJr5pbkBvvvDtSdrDE4v6LleFpiRb6X+MbDwUCn8NO84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730698981; c=relaxed/simple;
	bh=a2vJfaNuFnMNwVVdpSzwez9xVFuw/p1xPUr4dNRFFjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oAiJjIgd5cNQ4yU2O1zcPdx79Kn7hDFtzlS2O/Gj4sR8M0wtEGp7YR6pBqjLr17mLjby+dNlOrK9/noWA8/pMuZQnXUjwWDbIJNfMGpwwfYRtuSL4iUpfiDiUzHehuBYH9wwBhNGWS+fniTOUrZYj5hTFY6fm8MMxPTmW89kd7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UJAAd1aL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730698973;
	bh=ePDJyq5NAAlwQFv5E+x/MRanxnuXrP2EF23Rz4s6f7Q=;
	h=Date:From:To:Cc:Subject:From;
	b=UJAAd1aLC2qLvKYEjevMwV7gX5QtU41IHlFNmsv/ou7MuD/EkQnq5V4ZiEEqItMiR
	 sNU7Zk5JftjSLwdZTodZVYFa6xNSEKqTOfgZEITPpRIKZ8vDOC+Dn6jqajm1b2bI6W
	 /chsfoNRMzzf40y/qKv2jVNgW1jIokLyTDLr+OfRCbk+V6Zt2loQsBFBqlJOPfYeqQ
	 ajxtPqlGQg21NvcHGJjzCauRN5uNzuruPg/0Z82v5/PE+mXl3TeHR1gQXjVklUz5xW
	 hsYDWjuSJwzyxE/TzrHcj7xhJ+dtMnsZWCXmZ1wS8m6idCkHkjXVTz/9TYNf4aIIPW
	 ho8bgzKye+cAA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XhgNY4YJvz4x7G;
	Mon,  4 Nov 2024 16:42:53 +1100 (AEDT)
Date: Mon, 4 Nov 2024 16:42:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kspp tree
Message-ID: <20241104164255.62f42928@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+IvGcB/=9b5rydh8TZe5EN_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+IvGcB/=9b5rydh8TZe5EN_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  a508ef4b1dcc ("lib: string_helpers: silence snprintf() output truncation =
warning")

This is commit

  136dd147cdca ("lib: string_helpers: fix potential snprintf() output trunc=
ation")

in the mm-hotifxes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+IvGcB/=9b5rydh8TZe5EN_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcoXt8ACgkQAVBC80lX
0GxV3wf7BMp10g1dE4fHPJjEAkm7SO6lipueZmaoi3n3rBPXRINcTSxFzzxK62td
mpyW4HKv/5lJX5p2ULkXvMFu3PE1sAiv4lD6PiwyPSKhG+HdlOM9F06Wtsp5NyTa
juSBC23pQBL+qrH6pTGetvunITtwa4ak9OPHV+DWWKdd2XM2Ww4dC8XadlhwANBc
J17usN2kHfdQvwsflK4LhwAsbDMKMd/Qc11ZfBdryOrZCDQty3k/QL3i0qEFbdOj
1X/wc/HYi0Tc/LJ9KyKzLZz1zVOTKEuUSRk2kL7b6cXJlhIis1KZJJTGgP649nLv
oxfbR/SBZnW44HtBw+p4DZFeyZG11Q==
=DEPi
-----END PGP SIGNATURE-----

--Sig_/+IvGcB/=9b5rydh8TZe5EN_--

