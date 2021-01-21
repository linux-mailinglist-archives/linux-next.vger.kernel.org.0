Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4142FDE93
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 02:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390966AbhAUBMz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 20:12:55 -0500
Received: from ozlabs.org ([203.11.71.1]:55765 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391751AbhAUBMa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Jan 2021 20:12:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLkr40gmkz9sWX;
        Thu, 21 Jan 2021 12:11:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611191508;
        bh=7c7cvqA9gS0UzEg1pIAqrmG+QQlvyJGWNl+BfzEM8Qg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qPzlgw1+mwOM4cL3xrLVdWUk4xYPshoS6DDLmKu5lUDgwni2Rfh2PtaEk/Y0C8UJL
         I6omYlYGYJrycMJTFRzJjP9mp+Ly5SxJ3XDCoFhNhByr8IErZm1DO6IxAzd4mcLf5z
         gkQDve2ZAcNNh74Ek9M2m2sFjlpamVwGsR421NrBTGtlNfBNjwShnseLl6n2y2z81h
         rySJXZ2E77zUOlpMQQWryaJ//ko8EorIgWqxiiOwdeJZ0OVHtZp2kSMgm94ZU/6Ojh
         Zp/MZTGwebNXoirHDtyDa8FXRNWvhW7PJwNShfzxmNMDIiC681jZhai+ztSI1Xu2xu
         EnBCc1acg3e9A==
Date:   Thu, 21 Jan 2021 12:11:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Lyude Paul <lyude@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
Message-ID: <20210121121146.6133975e@canb.auug.org.au>
In-Reply-To: <20210120105715.4391dd95@canb.auug.org.au>
References: <20210120105715.4391dd95@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TCcYvsvZ=n.2WdGUBVd4Svo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TCcYvsvZ=n.2WdGUBVd4Svo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 20 Jan 2021 10:57:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-intel tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/gpu/drm/msm/dp/dp_ctrl.c: In function 'dp_ctrl_use_fixed_nvid':
> drivers/gpu/drm/msm/dp/dp_ctrl.c:1425:16: error: implicit declaration of =
function 'drm_dp_get_edid_quirks'; did you mean 'drm_do_get_edid'? [-Werror=
=3Dimplicit-function-declaration]
>  1425 |  edid_quirks =3D drm_dp_get_edid_quirks(ctrl->panel->edid);
>       |                ^~~~~~~~~~~~~~~~~~~~~~
>       |                drm_do_get_edid
> drivers/gpu/drm/msm/dp/dp_ctrl.c:1431:11: error: too many arguments to fu=
nction 'drm_dp_has_quirk'
>  1431 |   return (drm_dp_has_quirk(&ctrl->panel->desc, edid_quirks,
>       |           ^~~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/msm/dp/dp_ctrl.c:15:
> include/drm/drm_dp_helper.h:2087:1: note: declared here
>  2087 | drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quir=
k quirk)
>       | ^~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   7c553f8b5a7d ("drm/dp: Revert "drm/dp: Introduce EDID-based quirks"")
>=20
> Since the drm-intel tree still has its other build failure, I used the
> version from next-20210108 again today.

I still get this failure, but not the one from the drm tree, so I have
used the drm-intel tree from next-20210119 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/TCcYvsvZ=n.2WdGUBVd4Svo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAI1NIACgkQAVBC80lX
0GyzfAgAnyS+ybHffHP2bTfDMvIkkgOUx97yFSBTtMuNvpYhgPzkKPbLOZ9RaAhU
QWUsHkTs430Ar2XuVlTBULbjVBTD3UdOv3aXYGQPsEnKH2bMl7rQtgoj/xTqk3Os
G22yM7FpWgAnvjL6AeMujVjnr+GQDsYh+s/mg21XDZo4qqr/nUGHWDSAQkk+knFY
04aKuUT8nun+b3yMTy2mUrXbh+wvqRbz0qC3rezN85dNZrmbLjSP2AqG3OhqCZzD
0xD4wf+gyyLt24BnKxH9gB1d/w1JuaPBoMUzYQzWiBxWnBIh3FjVN7nabl0gKge8
KadGXBjYDZNvpSJ1J5aiVQ2S5xUj3g==
=tDMC
-----END PGP SIGNATURE-----

--Sig_/TCcYvsvZ=n.2WdGUBVd4Svo--
