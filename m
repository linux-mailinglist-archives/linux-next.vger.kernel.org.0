Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B7D321213
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 09:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhBVIes (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 03:34:48 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57375 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229863AbhBVIer (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Feb 2021 03:34:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dkb7Z2mWSz9sRf;
        Mon, 22 Feb 2021 19:34:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613982844;
        bh=oBVcSJQaoUWqCs4J+OvnO0YKmH7a7jV/4yZBhtbKFTs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fT6opzSgPrKLddFi3pWZrt+lhML/03n35pPDPevTKcLxSZ6ERibDJtwKuLxiDR95C
         X9zKPK3ct6wDfR53M4JNFhPNO3YfElD+CWFv51WtW4E10EkS5hrV5OVtXRp887zW+x
         SULdCblu46YJxBkGQfLNEk5UMestEAg51lzbxmNSVXruphcCT66pOgmpSCsTwLhLwh
         Pnx2Ek3WiQHGVfVrlaDQHTJ0h0YqcbwYQ81//3RuQ/PshfVjcVeeotmgEKvW7xiuDE
         66WIgKRZS0Abtf9lwjQnKUBRLOw5nPCKBcIYgJlHbUWM5s3Yl3c3sY3QMOu+GABPNL
         nyVz4W11g3e9A==
Date:   Mon, 22 Feb 2021 19:34:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pm tree
Message-ID: <20210222193401.524d0ab1@canb.auug.org.au>
In-Reply-To: <20210215113939.03e44e3c@canb.auug.org.au>
References: <20210215113939.03e44e3c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HRnmCbGVUGkfYU5co_9wRzC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HRnmCbGVUGkfYU5co_9wRzC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 11:39:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>=20
> In file included from drivers/gpu/drm/gma500/mdfld_output.c:28:
> arch/x86/include/asm/intel_scu_ipc.h:23:12: warning: 'struct module' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
>    23 |     struct module *owner);
>       |            ^~~~~~
> arch/x86/include/asm/intel_scu_ipc.h:33:17: warning: 'struct module' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
>    33 |          struct module *owner);
>       |                 ^~~~~~
>=20
> Introduced by commit
>=20
>   bfc838f8598e ("drm/gma500: Convert to use new SCU IPC API")
>=20
> OK, these will go away when the drm-misc tree removes this file in commit
>=20
>   e1da811218d2 ("drm/gma500: Remove Medfield support")
>=20
> So, if you don't want to see these warnings in Linus' build testing,
> you need to make sure that the drm-misc tree is merged before the pm
> tree (or the drivers-x86 tree).  Or you need to include module.h in
> mdfld_output.c before intel_scu_ipc.h (or in intel_scu_ipc.h itself).

The above drm-misc commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/HRnmCbGVUGkfYU5co_9wRzC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAzbHkACgkQAVBC80lX
0Gy4CQgAoQmz+3H/Qw7wvjREpG+UBBhIWCAQgK+omgZaidj1LuLxL7ornq37qqPv
3tzq5U2aiR00XmbMhqe11t3sbuMX7eMVM/qhtTRHOdzNzdbCXsCMjBvYhp2P01XD
O2GdAi7fdYfAlFfIfp1UgUgNeQmt5EHyzIg/gbySj/QK7anVB9ejwWazWArncaId
yrCcq0NTVkyhVdeYE1pjuTctnVx0CmGSm8J2uzkZyHmzojVLi4mvfXdRpjP2zJES
ekG9G3DRDDq+18Fnskt0gcPN+DBBc3M9XEXSM23hnb3Dh4ixyhDFhptsQE+igJ39
NBdLWVdxg/LoYSXsa4gynUUmhw6FXA==
=xDeT
-----END PGP SIGNATURE-----

--Sig_/HRnmCbGVUGkfYU5co_9wRzC--
