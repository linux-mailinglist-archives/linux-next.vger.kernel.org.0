Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBF4F3CFF
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 01:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfKHAmw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 19:42:52 -0500
Received: from ozlabs.org ([203.11.71.1]:44927 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbfKHAmw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Nov 2019 19:42:52 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 478M1d2pBVz9sPT;
        Fri,  8 Nov 2019 11:42:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573173768;
        bh=R9/oYo60qxfQ7WsMW0HX0R46GovOjFzuX/xtvjhGC2o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VawW4RrTMjde+At/oSAmmp0PAE5yueJk8cifC7zA7M+8Mh25Zw8S41LhE1ap9FycD
         3dbr4NkMgA+1FLQVBgXeC20fQe/GUCpwJyRTQn4Q6Koi9vFO+uj5wD3OUM6G5gTjmY
         xKMBEAWPRmTtIOKUENe0Ardz9T4pfVciduIMy3lEQE9uwg2UWXGzzY516qRkutW05P
         DubLLKrUnKaQ4tLtOCKWDKlHZ5fhEsK2OpyWCIE9RXkCRQnTXjpiVfseNtRcj7CDzA
         nTNhA00SxmCZCkezHawIjdZ2eKHhKv8F08TSre4fpnd+eWG7/Ngm3oNvHi+IwRm3TL
         qvQjlzl7vKD/w==
Date:   Fri, 8 Nov 2019 11:42:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-intel-fixes tree
Message-ID: <20191108114244.357c594f@canb.auug.org.au>
In-Reply-To: <20191031113315.4183cc7a@canb.auug.org.au>
References: <20191031113315.4183cc7a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8O7Q52mKl9Pw5johfOYOCiA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8O7Q52mKl9Pw5johfOYOCiA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This is now a conflict between the drm tree and Linus' tree.

On Thu, 31 Oct 2019 11:33:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/i915_drv.h
>=20
> between commit:
>=20
>   59cd826fb5e7 ("drm/i915: Fix PCH reference clock for FDI on HSW/BDW")
>=20
> from the drm-intel-fixes tree and commit:
>=20
>   7d423af9bfb1 ("drm/i915: Implement a better i945gm vblank irq vs. C-sta=
tes workaround")
>=20
> from the drm tree.
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
> diff --cc drivers/gpu/drm/i915/i915_drv.h
> index 953e1d12c23c,8882c0908c3b..000000000000
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@@ -1704,34 -1339,17 +1339,19 @@@ struct drm_i915_private=20
>   	struct {
>   		struct notifier_block pm_notifier;
>  =20
> - 		/**
> - 		 * We leave the user IRQ off as much as possible,
> - 		 * but this means that requests will finish and never
> - 		 * be retired once the system goes idle. Set a timer to
> - 		 * fire periodically while the ring is running. When it
> - 		 * fires, go retire requests.
> - 		 */
> - 		struct delayed_work retire_work;
> -=20
> - 		/**
> - 		 * When we detect an idle GPU, we want to turn on
> - 		 * powersaving features. So once we see that there
> - 		 * are no more requests outstanding and no more
> - 		 * arrive within a small period of time, we fire
> - 		 * off the idle_work.
> - 		 */
> - 		struct work_struct idle_work;
> + 		struct i915_gem_contexts {
> + 			spinlock_t lock; /* locks list */
> + 			struct list_head list;
> +=20
> + 			struct llist_head free_list;
> + 			struct work_struct free_work;
> + 		} contexts;
>   	} gem;
>  =20
>  +	u8 pch_ssc_use;
>  +
> - 	/* For i945gm vblank irq vs. C3 workaround */
> - 	struct {
> - 		struct work_struct work;
> - 		struct pm_qos_request pm_qos;
> - 		u8 c3_disable_latency;
> - 		u8 enabled;
> - 	} i945gm_vblank;
> + 	/* For i915gm/i945gm vblank irq workaround */
> + 	u8 vblank_enabled;
>  =20
>   	/* perform PHY state sanity checks? */
>   	bool chv_phy_assert[2];

--=20
Cheers,
Stephen Rothwell

--Sig_/8O7Q52mKl9Pw5johfOYOCiA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3EugQACgkQAVBC80lX
0GzchggAo5oRTxB+fN/Mf6fDT2ym3SzxMVItmzy9m+ld+RlJkEDjux3LHOtiDug5
jqd9z1rmX+4s+yTznDEHwgHqZx0AWZsr4Ex+3MYhciWU6e5ey4jIA6JRSjfonlZ3
XxkkD/JNJEa+LUaS8c1OAQawMemJKgb8Yt31yqkR4ZAs29A9Dd1pTxyGXL1T6WaG
Hk8XrJ30TtNvIGvjCsQ5kX1tyuDy/BshS9tK9q5056f0uS6FD87OYJVEslKY+Er7
rvM3I4c14xajf2zc8ooVWw+7OTezYI4ZuJII5rbehyFN8houk/TGnZTrsySkSET0
uDrXSB+pUjMBNXQKqHtk/tl8z9iMIg==
=3cJp
-----END PGP SIGNATURE-----

--Sig_/8O7Q52mKl9Pw5johfOYOCiA--
