Return-Path: <linux-next+bounces-3779-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9EF976112
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 08:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BE4A1C22143
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 06:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD27813CFB7;
	Thu, 12 Sep 2024 06:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hRCNg49e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2184D5028C;
	Thu, 12 Sep 2024 06:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726121622; cv=none; b=uBjruxzDb9J/4IbhO0QjELxUvYEvJz9UR7kG2LrHuQIPhPhgOSb7bpMZm5DbI3uqh5Le1J0sGd9dI0NyhIf/viCFpTWC0qEWbEU5N6fpX5vxF4+ThYAwplUCZnsbRC0wn+jvJVnBHPtJYft2dlanoyLzegyz8RU4+J+bSu/lBmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726121622; c=relaxed/simple;
	bh=V/Dz3yg2n/zb1jcXRN7taJ2ZZ2iEOm5kHDzoOrcd5eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cyuioMo493Zgs/siGsCUeC56PFKfoE6ryeF6Kd6cgNWGzbOaPKFcDpQuRIrpwp+cKwN71/y5Qr04xS2/9uSRByxUd23eWHG1Q8Ky+sdcQ7UoHcPQmREXN9ZjC0LH6PjP5t8iw6Z1tDaTWyhLQP3G6MyIhoDLbce5xUcbKfS2dwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hRCNg49e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726121615;
	bh=TB3+OuQrMEL6lwfslY3+79QTMJPjCDrIbhGGNU2vMfg=;
	h=Date:From:To:Cc:Subject:From;
	b=hRCNg49eX5Nns6R9QZDXZpWXYdXQNoHhyCuMbdXcDszPPTD7e/GZtpOHiexdMlBor
	 d15IeeoR+wcFlM3+H1wtJkHnTorG/rlG1x/uTfhYDSIbTNfhLXlOSY1jsAPi5dlzkw
	 Dq75i2K4y38e0QNH8eC8Pvi8E4BIJclaXfNRNLLEG8oP5/d45aghF0mnPhiz8kVMnt
	 4uOslD2TAlP2+f4Oea8KV8haS6RUrh2xholRlcDHi4cUDuTJBMsPR2UIO/lXLQDIjV
	 vuCqtxdbbrB4k5PdEISMB41vpIn4tj+p3F4FGHdENqCAD9OpsxJwjuUyjbGFyWP9rb
	 qsVdnPyk0ABCQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X46ZQ6Vf8z4x0K;
	Thu, 12 Sep 2024 16:13:34 +1000 (AEST)
Date: Thu, 12 Sep 2024 16:13:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xen-tip tree
Message-ID: <20240912161333.1e65a06a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PnVukLxuawTL4o2NvivCaRM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PnVukLxuawTL4o2NvivCaRM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "acpi_os_ioremap" [drivers/gpu/drm/gma500/gma500_gfx.ko] un=
defined!

Caused by commit

  de4237fd5174 ("xen: allow mapping ACPI data using a different physical ad=
dress")

acpi_os_ioremap is not exported to modules.

I have used the xen-tip tree from next-20240910 (as the next-20240911
version had a different build failure).

--=20
Cheers,
Stephen Rothwell

--Sig_/PnVukLxuawTL4o2NvivCaRM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiho4ACgkQAVBC80lX
0GzdXAf/dMV45FVDLzwh1p1FCLsoY+g+bl1mjxTGFDD6lo4+W2yb6c7Z+R91pJCA
fJHgBkYOYAK0Q4pLZa/k7bSgBF5mGN4VwDQi+nwa6PQbcIhjo2fRshAiguKy7vi3
UDppoP3OOadX9alUNN9q+bd/mG68AmO21KUIieTzHhJGEFAc8gwc+bNG5mDWfU3K
Y+dPPa3Wcf6QkRzZDEbkHhqdEFE5ZK7ubv1HlzwaDuiM5LGsKa49WnLzCesxz+gj
9tN8N1l7tHIXZ9KfwOcaug+x9KWiZg+yMYOLqx22Sld+k9DajQ1cCacN5svLncDZ
uk/LhwVwfmZi/JqITMdrCzdaOW0suQ==
=d7UP
-----END PGP SIGNATURE-----

--Sig_/PnVukLxuawTL4o2NvivCaRM--

