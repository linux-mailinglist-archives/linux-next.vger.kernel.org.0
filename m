Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5854F215105
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 03:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbgGFBvs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jul 2020 21:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728522AbgGFBvs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Jul 2020 21:51:48 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1902C061794;
        Sun,  5 Jul 2020 18:51:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0T7y4Zldz9s1x;
        Mon,  6 Jul 2020 11:51:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594000306;
        bh=vGrjLo9bIyDDJMbpF8o71tEP2DJi9pD1/ClDLsf/MSU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZMS798XsaFeahBWz/K8Co8PC2+dFxM7f64Vgjzz56aw3rEJniWGYk12xSN+WrGRW1
         LyIqF1Ax509BCow9VLByoB4Q7s8aEaP3sO1Zzo0VIfXGd5AaGO04A9+bGHBJmJ150E
         SXn5Phih/8qJdxeIjA9tcrFxwLZvdelArVWeP9TmKBvsAB4cCDwPGo3TorLkG2NneU
         2ipe86ow4/x85iCxtj8HBIBVMvOnvXbdVmCBS5esJT/ZsTIeDoqv4QIWceqT2gW+oX
         +RNMDfvh89L7RyTmOodUWopkMn+EFJzTOoUgYJ7GQYWAfj4lYFg3ahXPyGKX4X+T3p
         Q5NxB3biLC/0g==
Date:   Mon, 6 Jul 2020 11:51:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Colin Xu <colin.xu@intel.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Message-ID: <20200706115141.63f7677a@canb.auug.org.au>
In-Reply-To: <20200630115202.04c39f9b@canb.auug.org.au>
References: <20200630115202.04c39f9b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VN2RFb1d.9dhsZAzcrTk/Nw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VN2RFb1d.9dhsZAzcrTk/Nw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 30 Jun 2020 11:52:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-intel tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/gvt/handlers.c
>=20
> between commit:
>=20
>   fc1e3aa0337c ("drm/i915/gvt: Fix incorrect check of enabled bits in mas=
k registers")
>=20
> from the drm-intel-fixes tree and commit:
>=20
>   5f4ae2704d59 ("drm/i915: Identify Cometlake platform")
>=20
> from the drm-intel tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/gpu/drm/i915/gvt/handlers.c
> index fadd2adb8030,26cae4846c82..000000000000
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@@ -1731,8 -1734,9 +1734,9 @@@ static int ring_mode_mmio_write(struct=20
>   		return 0;
>   	}
>  =20
> - 	if (IS_COFFEELAKE(vgpu->gvt->gt->i915) &&
> + 	if ((IS_COFFEELAKE(vgpu->gvt->gt->i915) ||
> + 	     IS_COMETLAKE(vgpu->gvt->gt->i915)) &&
>  -	    data & _MASKED_BIT_ENABLE(2)) {
>  +	    IS_MASKED_BITS_ENABLED(data, 2)) {
>   		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
>   		return 0;
>   	}

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/VN2RFb1d.9dhsZAzcrTk/Nw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Cg60ACgkQAVBC80lX
0GwibAf+PXJXCM3LIm8R48ENxegIUgfk+plaPQakoIIZX68CAuRZ5y9hLYhlSGD9
H0A6LxpOlr7vGgYaLttX58jsZ6jgHzgb+bSRXBiBVMFhr3d1aEnKdbuC6VqFJHOU
tQNZuGWBxCOWan547rv8FObwY5IYbT4RjhiuUbxOznqsRQPbw2bONYqi6u+Guxui
BkTSGs9U0wwddnzQx6qqLselmTdyTOCM2JqIOykmsaVcOTpWUdhYS/+vBduPHD+0
DxC1VSg6cBpDNh3MUR/CohdEBj1aIUclBr+/CT6ELUTvdN4kIyf9YUVFGHb7iVqk
2q7spaFICRvvAiTXpufnqqpODfhSCw==
=AxTN
-----END PGP SIGNATURE-----

--Sig_/VN2RFb1d.9dhsZAzcrTk/Nw--
