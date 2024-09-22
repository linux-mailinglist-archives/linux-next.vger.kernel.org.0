Return-Path: <linux-next+bounces-3939-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C0197E436
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 01:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDCD4B20C69
	for <lists+linux-next@lfdr.de>; Sun, 22 Sep 2024 23:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B74880025;
	Sun, 22 Sep 2024 23:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LddSTxUM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651177711B;
	Sun, 22 Sep 2024 23:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727047490; cv=none; b=Dh/twibltOFDK9D8G/tl8Y6wnsThkSRccogbh0wKbnze848r8lpG0mEFGdRnroTKd0in+LfUeMjtmcGmAyiwQausqHI1gOdI9PZL6LfhBH5+U3RDqPj836j6dUEEu9BkToYBLn7UGQzAdtGQfzP+9aR6OzyNCTvGCvJDLK9Spx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727047490; c=relaxed/simple;
	bh=9egvdmA4WX9bHRnk8S1fHALDRS+LgDw4seE8JrM8D6M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nUb29YqY//co7JLhoN+u52X3+LSl6BxHw+WuHzA4qOm1yzFxqBrj3rtBqMAKXKWJYht96HGnbL+H4vcbzmFgDp0VLWGNF35sPJCL05ltX5B8HxDfK4y90yKLc8pgMAJdyoNN3gszu6FUVEXke3y6aTwItlLj01CjiYm6CEQmizk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LddSTxUM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727047482;
	bh=JM+RKZj0M+lOVVuosO43GXc+1Ln+21ezimFGHW45vUI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LddSTxUMsFDK/iq12PD9c4R64hppwukbuGtVMYP+5cD6PMZLB+CPrTfPbCRHqxLG/
	 BwQidGcKdsoSgYeou+lQSJXeMI57+27JlpKYsXNaSESZfRZDYYEjD2d+bnK/Bqx2GM
	 g+0TLvkedmfe+yczgx9U5DI4rcGtl14Ss1XWTiqaF447+MCyo1VkzSYmIWUxyp42HY
	 K9pmVJhO8vklp9uHeKzFBjJJ/3tFhElhbZg+2l841SeOAnb4SEDY7rRrzjpYK+kQev
	 HZsKb9d11U/LPRjhgXUX+7eEaiVK6kAW6skUl1nf5HhYWppxUTD+bVZK9Qg9CgV6KY
	 dWpt9zwV56Hyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XBhzY5tgfz4w2N;
	Mon, 23 Sep 2024 09:24:41 +1000 (AEST)
Date: Mon, 23 Sep 2024 09:24:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Nicolin Chen
 <nicolinc@nvidia.com>
Subject: Re: linux-next: manual merge of the iommufd tree with the mm tree
Message-ID: <20240923092441.23da0552@canb.auug.org.au>
In-Reply-To: <20240816125429.7a55b08c@canb.auug.org.au>
References: <20240816125429.7a55b08c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i02N.AXFM6P/AW1UdQShWlv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i02N.AXFM6P/AW1UdQShWlv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 16 Aug 2024 12:54:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the iommufd tree got a conflict in:
>=20
>   drivers/iommu/iommufd/selftest.c
>=20
> between commit:
>=20
>   e843cce9dd23 ("fault-inject-improve-build-for-config_fault_injection=3D=
n-fix")
>=20
> from the mm-nonmm-unstable branch of the mm tree and commit:
>=20
>   4be8b00b2b0f ("iommufd: Reorder include files")
>=20
> from the iommufd tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/iommu/iommufd/selftest.c
> index 6bfb7fa5da7d,b60687f57bef..000000000000
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@@ -3,14 -3,13 +3,14 @@@
>    *
>    * Kernel side components to support tools/testing/selftests/iommu
>    */
> - #include <linux/slab.h>
> - #include <linux/iommu.h>
> - #include <linux/xarray.h>
> - #include <linux/file.h>
> - #include <linux/debugfs.h>
>   #include <linux/anon_inodes.h>
> ++#include <linux/debugfs.h>
>   #include <linux/fault-inject.h>
> + #include <linux/file.h>
> + #include <linux/iommu.h>
>   #include <linux/platform_device.h>
> + #include <linux/slab.h>
> + #include <linux/xarray.h>
>   #include <uapi/linux/iommufd.h>
>  =20
>   #include "../iommu-priv.h"

This is now a conflict between the iommufd tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/i02N.AXFM6P/AW1UdQShWlv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbwpzkACgkQAVBC80lX
0GztkQf/V9mUo53kFcQQ6VEMq8istptTs9+UqhdqZVjenrHJW3WTo8U5tP9GKP/1
J5EIwJa5GsbSm4AO2pGlaRrCo82jfgKVj9POEr/027PbVIqDAw/xeEdGvEDIA4xR
zbrzuCNXQ+dL6dhieNkP91CytX7dvVvY4a947z5kiuO+2d7eCnAekjWdn/DANwDn
7MJ93CMsKNuoXvpXCBbNlzGWwnQKw01HQ47KhNGjVHYcYiOHP1Hq2pGTiIHsWZzK
VAN5ACJmJAZmN9Dx3NMQq1GPqg6j3pWJPxvl2C3/qOj3+r0OfWMaPTrfs+1B++Ay
njcMBUYqDTk9pL3nVv8Dog8EBCkASg==
=5WBG
-----END PGP SIGNATURE-----

--Sig_/i02N.AXFM6P/AW1UdQShWlv--

