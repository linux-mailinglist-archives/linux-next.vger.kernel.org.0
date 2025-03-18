Return-Path: <linux-next+bounces-5854-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A014A67186
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 11:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 724D23B3EBE
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 10:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0079C20896D;
	Tue, 18 Mar 2025 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PzcbuewX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E5D2080C9;
	Tue, 18 Mar 2025 10:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294355; cv=none; b=oWlfPlzwFO7+sTJQJ/h5mEdDQJcLrtKzh0JZOWEhU+xV8mwNH6YsXgkJ69R/YDOBwA6Tm48ug/DQ5xT0CXdqI7wdYg+FY51TlEULbT8pYg4LiOfziWuhZAbmSD/L96s8VV2fUcTHtufZ5e0VU0kOBlrs4NUKc4UDUqtTmzOuQ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294355; c=relaxed/simple;
	bh=jTYuMJ0L56UKvIOguXUoIXpG6FqHcudaWJ44VArFyvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E9+aJTmT5jvb7dxiQoISc5z5FUhi8Q3hf0PVIgFy8t8jVHq/16Z3gmPc7sdFpQqiuiQcr8byxXUDRVv1ERRMxJ3QsV8C5h5x/d0o6Vwsn1SCZ0e8TZfKNTQ4lCg6ttTZKwjbt24lJMvo0OvZZbRQmgEloEp30J1dRzTG4gYE3r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PzcbuewX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742294347;
	bh=m3DOu5ZTceFIS9Xf/WAzzd4G+eJV9hIT3L3AwUVfbNM=;
	h=Date:From:To:Cc:Subject:From;
	b=PzcbuewXQeK6ZARCQOB/rsQBe6r4xWcF2yLry0pmIu9qxuU46UtEdAuGdgf1SBkgd
	 hIe5XI63cugK5/TDO4Zmz9CAoV5/PM7Qpv6dSVRa4r/0mXDF2ixPKxKthpVN8P4fy2
	 4CWEbfoFADblykSkomhkG298apPXGgMEUuTE+KBaY7qhieP2w132LI3QgslOYsgyFb
	 NSHM2j53DFFXFSGkFYh2hIsSO3QGOt5mrU4rMX99+cXoroLsBec84derFkffTCtiHd
	 A0Z6KALBdAfe3t5hVmGfZIF3Ic8HR+KU2pKUEIBGNK6QOLUwRzjXXB0UDWMNuaJEVF
	 V4zYb0pAPN2Mg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZH7cW1ckYz4x8b;
	Tue, 18 Mar 2025 21:39:07 +1100 (AEDT)
Date: Tue, 18 Mar 2025 21:39:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Shannon Nelson <shannon.nelson@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hmm tree
Message-ID: <20250318213906.6e81f517@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iqN+MrBYWY_kOdcNrkmu1zQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iqN+MrBYWY_kOdcNrkmu1zQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hmm tree, today's linux-next build (htmldocs) produced
this warning:

include/uapi/fwctl/pds.h:1: warning: no structured comments found

Introduced by commit

  16384467ec8f ("pds_fwctl: add Documentation entries")

--=20
Cheers,
Stephen Rothwell

--Sig_/iqN+MrBYWY_kOdcNrkmu1zQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfZTUoACgkQAVBC80lX
0Gw/QwgAjWkZIFsmI7UB0gplJFgce/Emuu6VFBydcB3DkiVMfG5RaqaML6re9iSt
+7K40LaMd+OqCeFnC9I3jY/txYyM86Eh/A2DQxI7MKn68xSPXdEkQtXcQzdcDIhm
JJE5K6NMv7rVc+6eQ7c29k0IjgXcVmr+Gi6z3Ia8s9HkMDycepB3HkdglY/Ohdn8
3RsKW83WtNwwxl5Yx3gLAddyQjUyr4t/u0jNhVHNGaw0QVQwkEJSy6JN0YSAyIcJ
9OmZ6zEHfZZhaJRhxHElVe8ZERdO0ibHICv5damu8wv9JaD2Pwxag903F8N87G1B
sruqnIObfroimsuiXrC9gemHH3vvbQ==
=YTwJ
-----END PGP SIGNATURE-----

--Sig_/iqN+MrBYWY_kOdcNrkmu1zQ--

