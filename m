Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E1034BF87
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 00:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhC1WB0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Mar 2021 18:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhC1WBX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 28 Mar 2021 18:01:23 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B63C061756;
        Sun, 28 Mar 2021 15:01:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F7qRM31Fyz9sRf;
        Mon, 29 Mar 2021 09:01:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616968881;
        bh=5HhQHmCdYgsPA8RXY8VYh1EyFWPd5mOOiVguF7B+feg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kd3Gu2MbJnjuLrePT/Dbc+t+TFMjNcfw8hENvAuymA+KFzIUMx0BqPRZZWRdMB10a
         5ncEz6+Exr2VdJ/UBV6lqZMubK+0V+uo7vyZEtgxS55Kq8UCjfukUXO3vdhHBy7rqJ
         OiE47UGHnsF60GQ/lfdNuxE5m+7fv1TxnGShi0Z4vCpN05HB02mX2QHjsC6rH0//dQ
         amNX4zSyfwkUlUoqZ/ci0ICJJEQ5498SI9xJyOGVXArACZw2FkBlvTL+98YmnWtlNn
         Qtt+ySEp+KbyOgtsQ6TANXYcbk0NvnXDGlaDVMGNoHg/IJUi4gMSKhZMnd5Ywza5Br
         NmuTU/8Ez5V+g==
Date:   Mon, 29 Mar 2021 09:01:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Imre Deak <imre.deak@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-intel-fixes
 tree
Message-ID: <20210329090117.6b224931@canb.auug.org.au>
In-Reply-To: <20210326195838.5ad4973b@canb.auug.org.au>
References: <20210326195838.5ad4973b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//QsD_AfuZfie_FBZKD_mLXq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//QsD_AfuZfie_FBZKD_mLXq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 26 Mar 2021 19:58:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-intel-fixes tree, today's linux-next build
> (htmldocs) produced this warning:
>=20
> Documentation/gpu/i915:22: /drivers/gpu/drm/i915/intel_runtime_pm.c:423: =
WARNING: Inline strong start-string without end-string.
>=20
> Introduced by commit
>=20
>   8840e3bd981f ("drm/i915: Fix the GT fence revocation runtime PM logic")

This warning now exists in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//QsD_AfuZfie_FBZKD_mLXq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBg/K0ACgkQAVBC80lX
0GyYwggAj9F/JN4TaL4WF+9DYWxOQ/V8lMzzerBR+N65DxX/5p01HhKhdU/sJUVS
wbrnNAJViURVtHEpnl28m9jSBgdXVnoCBgt/kMQCtIv+vGREZ9isJ2T0KOw11F2I
1OeHLooITppCjoFM7Kngnt4yJXWXirSSQk68DD+TWyRAgHDPec7rv+3562nBcfny
F643OjjAHwkC2AbofvDk/FrlbNR9+3oTYP4FpVna8HNmOgWvYIPEcWZB+maFJwgt
xPLR5ryD4ReYvIvSILrfo2syTRR0mj11eyiKlH3cDp0FFRfqqOpolKtSc4N3q9eE
j9CqoH1WiURuS0+Z+C3SAj8jSBXD/w==
=pIB0
-----END PGP SIGNATURE-----

--Sig_//QsD_AfuZfie_FBZKD_mLXq--
