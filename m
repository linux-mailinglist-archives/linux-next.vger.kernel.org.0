Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C465B11C11D
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 01:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfLLAKi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 19:10:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35175 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727067AbfLLAKi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 19:10:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47YDhk2pXhz9sR7;
        Thu, 12 Dec 2019 11:10:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576109434;
        bh=sfTDccDxN2RVpA71FM/TjnLz+LD+V8lrOeiTtGHXab8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FLP2GakyUNflJSxeMWwYE0L21y65nYAg5V+btWfrK3okn+Arx6GKwU4Pw5ucjRVAr
         3RVfIn6Uxjdb684171ChbjMru3Q02jlAsAGE0epm1uf+57GzFjkC5L43fxQb5wwCXm
         FqRB2OYNtSorjLpBPlrKOiiHTR0kChn+sGldQvywf0Kd1ll3NBdQhV5aYjvUZvhd0J
         aaqqx6es7mH+8IyVgmOSuyEmv5yByF6rioroj6lU20+YdOMj2zbio7xcuPs9tHcnAr
         0M4Jr/rH1ELDIvI4OankMHiZjXDX6JJ/CEC1Uy2twDpSmJnQTwego45UQLbEulB1gT
         2qPTIkrJvrF6Q==
Date:   Thu, 12 Dec 2019 11:10:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yintian Tao <yttao@amd.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20191212111029.44cb40c4@canb.auug.org.au>
In-Reply-To: <20191212103738.1b3b085c@canb.auug.org.au>
References: <20191212103738.1b3b085c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/89zMYY5NFJ07HgHk3nXume6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/89zMYY5NFJ07HgHk3nXume6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Just cc'ing Dave.

On Thu, 12 Dec 2019 10:37:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the amdgpu tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>=20
> between commit:
>=20
>   62914a99dee5 ("drm/amdgpu: Use mmu_interval_insert instead of hmm_mirro=
r")
>=20
> from Linus' tree and commit:
>=20
>   8497d2bcdee1 ("drm/amd/powerplay: enable pp one vf mode for vega10")
>=20
> from the amdgpu tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index c17505fba988,8992506541d8..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@@ -2794,8 -2828,6 +2828,7 @@@ int amdgpu_device_init(struct amdgpu_de
>   	mutex_init(&adev->virt.vf_errors.lock);
>   	hash_init(adev->mn_hash);
>   	mutex_init(&adev->lock_reset);
>  +	mutex_init(&adev->notifier_lock);
> - 	mutex_init(&adev->virt.dpm_mutex);
>   	mutex_init(&adev->psp.mutex);
>  =20
>   	r =3D amdgpu_device_check_arguments(adev);

--=20
Cheers,
Stephen Rothwell

--Sig_/89zMYY5NFJ07HgHk3nXume6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3xhXUACgkQAVBC80lX
0GwMpQf/aXivTmKXcB6J89F0MKgC7un4shEj4+Q4FcPtDT1QlqwUvfC3b9s9FpVk
SVquLBUkl0Lqhim4fpZJZh1mpuRh4h1VdVIfDcJfOIVPTqEqv83fATTmY2/R22tP
MifpvjLDnpMdTk7/nwS742oEO5M6K4dUdWraHz5NEpIVcgzisazyoqmQWGb2+Dhh
uhM1R5TLhZNwdDxF43T0cupCipdZj5oOQU+LJGX280RUQfHZ8Fh2BfjN1LNU25mp
1VHoHa6IZMCvp6jXZNMJhP2OzCUWqBrfP4U8wKFhwF45s/TSZpaf+gZ+vitkOz2K
eMf5zAlJl8wpzUXZixjtfP3Pf8Z+Nw==
=XsmQ
-----END PGP SIGNATURE-----

--Sig_/89zMYY5NFJ07HgHk3nXume6--
