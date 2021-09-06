Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4468401607
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 07:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbhIFFnA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 01:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbhIFFm7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Sep 2021 01:42:59 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8215CC061575;
        Sun,  5 Sep 2021 22:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630906913;
        bh=IUXT2gFKIZreWVNVlP87ef6RQd/qD0k5TPWhDhb05ok=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rtNLAFYEfftYvvHVzGfEEMz4pE/5dmi5zs/NugcO3n/BS5i3gA5P40/6Emm4Ztq6L
         6gBPBLonCc7qNxgr2m0LVQnhZw5HMLgEqWvrItcNlcpasdBQMn+oqktmSW9Sr92P8G
         DgBEF7vXFBL9RHTUPJpRj4ffZ009WOm1J5aPa1PdZW4c3/nIilqYcg/XKxuA/KddO7
         QA5dWIyoDwpBSZPhHxvmjoCVcHYKhNBuFINEswxBwLMelpa0aFASEYFNwzmX2LGy1c
         aqyrVgV9dzI4aNVS8LwAxCjhU0DllQia1ApQG6bRsfjveKxr+ZfmZRNgWe1AysMicz
         Bx+o0KAFuktWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H2y2S5xjZz9sVw;
        Mon,  6 Sep 2021 15:41:52 +1000 (AEST)
Date:   Mon, 6 Sep 2021 15:41:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build warning after merge of the kspp tree
Message-ID: <20210906154151.0aa41a7a@canb.auug.org.au>
In-Reply-To: <20210830184429.1ee4b4d8@canb.auug.org.au>
References: <20210830184429.1ee4b4d8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+W1mqGOo_LjEdTOMqZCF815";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+W1mqGOo_LjEdTOMqZCF815
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 30 Aug 2021 18:44:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the kspp tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
>=20
> drivers/gpu/drm/kmb/kmb_plane.c:135:20: warning: array subscript 3 is abo=
ve array bounds of 'struct layer_status[1]' [-Warray-bounds]
>   135 |   kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL2_ENABLE;
>       |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
> drivers/gpu/drm/kmb/kmb_drv.h:48:23: note: while referencing 'plane_statu=
s'
>    48 |  struct layer_status  plane_status[KMB_MAX_PLANES];
>       |                       ^~~~~~~~~~~~
> drivers/gpu/drm/kmb/kmb_plane.c:132:20: warning: array subscript 2 is abo=
ve array bounds of 'struct layer_status[1]' [-Warray-bounds]
>   132 |   kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL1_ENABLE;
>       |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
> drivers/gpu/drm/kmb/kmb_drv.h:48:23: note: while referencing 'plane_statu=
s'
>    48 |  struct layer_status  plane_status[KMB_MAX_PLANES];
>       |                       ^~~~~~~~~~~~
> drivers/gpu/drm/kmb/kmb_plane.c:129:20: warning: array subscript 1 is abo=
ve array bounds of 'struct layer_status[1]' [-Warray-bounds]
>   129 |   kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL2_ENABLE;
>       |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
> drivers/gpu/drm/kmb/kmb_drv.h:48:23: note: while referencing 'plane_statu=
s'
>    48 |  struct layer_status  plane_status[KMB_MAX_PLANES];
>       |                       ^~~~~~~~~~~~
>=20
> Exposed by commit
>=20
>   656256c0d67c ("Makefile: Enable -Warray-bounds")
>=20
> Introduced by commit
>=20
>   7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
>=20
> from v5.11-rc1.

Due to Linus -Werror, these are now errors :-(

I have reverted commit 656256c0d67c for now.
--=20
Cheers,
Stephen Rothwell

--Sig_/+W1mqGOo_LjEdTOMqZCF815
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE1qh8ACgkQAVBC80lX
0GyiVQf+PJFYXwWyUe9jhw21HXnLUe+aeBHlhW7TNGHNOPVuPN8MmjU8FJgiypKf
Vzr8wJJnHXsOULy5ECKEb9w78RltTLSOQHyMQf7jVIjVcCSCMRiKL5NUZ2EAEGpD
6Z0C7Q46yAKluI+tqDEpeWmvyQbrleo65mLclLDuiImkx+daowJ+Bj70emHN77DR
mmhWpl3cZBGXCs8Y+iBjQFyIUeMwJ3DqT8ra6w2tIDKwL4R1iiDFsfHFq2AD0QkW
c/wGhExA4LlcgEhNruMki7fkg1SNNwYq760XVPc/9b8zK4xUz5FYEoLznYVOCv24
NbfCGL0MNqsEl8ZzCvBZPt1b2oInXA==
=2oRg
-----END PGP SIGNATURE-----

--Sig_/+W1mqGOo_LjEdTOMqZCF815--
