Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD9234A38A
	for <lists+linux-next@lfdr.de>; Fri, 26 Mar 2021 09:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhCZI7P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Mar 2021 04:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhCZI6p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Mar 2021 04:58:45 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79ECBC0613AA;
        Fri, 26 Mar 2021 01:58:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F6G9C6jsQz9sS8;
        Fri, 26 Mar 2021 19:58:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616749121;
        bh=mxCP5CGbHH823CsHkk3eybzLBXaXgpboct6zBS6d3t8=;
        h=Date:From:To:Cc:Subject:From;
        b=nGOjt4WCwwGLBojfz6Xws6Z1zeNfDKbfRagwLSSU1d1wg6wofx3vwUQw+i5dLI4Gq
         bXz067u2VN5wt301IHuPK+TocV1az0fZFtUpTHBWZLY5OnRnQPKCiXULLUBOEGNYFt
         QUviae3AzZMBJAD+btpdWMGEODt5FFoYizdA/iKmQZ2RseCw47d7n3YvfbNQniWRei
         v3Sz73CVNgaoV/1RsuRkSpM/0UJhuxB7HA5MxMl9/MOVzosGIqjvKQT3kvmFHTcdU4
         5Lx2AI9gtCeI/QvRf2XKLtP7wr/BjAmkP7p0ILqAZp+dymGSFtFVEMYLqluzIbIllT
         B9wgubqsyF7Zw==
Date:   Fri, 26 Mar 2021 19:58:38 +1100
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
Subject: linux-next: build warning after merge of the drm-intel-fixes tree
Message-ID: <20210326195838.5ad4973b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=LeT9U32PuvBr+yiCz4GAjz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=LeT9U32PuvBr+yiCz4GAjz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build
(htmldocs) produced this warning:

Documentation/gpu/i915:22: /drivers/gpu/drm/i915/intel_runtime_pm.c:423: WA=
RNING: Inline strong start-string without end-string.

Introduced by commit

  8840e3bd981f ("drm/i915: Fix the GT fence revocation runtime PM logic")

--=20
Cheers,
Stephen Rothwell

--Sig_/=LeT9U32PuvBr+yiCz4GAjz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBdoj4ACgkQAVBC80lX
0GyOTwf+KnUPZ/ON+sibMKESXBQOAItQf2jogwrxO3SnPlq81kg97LVsS0DG2F1f
ZYt6ID31gHskLun1PBPTuy4hQv5czb4HA4iBz2CVMkLRsv3P5hgadaCflyH07c9K
a36dqWxQZbO9iOo53T3LVKE5CjaWneabnF5TsSCstb9Q3HLipkZSWl1WmMQKXj2y
SvUy8VWAtqNGNsGeymJBX5aZ9p9y7PcyhHG1xg2TC1zDPxlooRoW5DI97UoSCZJg
pri8G7FB43XROjuCfSRqK1ujrDtWNdFzAsGNbqBHTayqlAGw0025Z9gi3v+PmZdt
iq5qTBR8Z2LGYvTipmWczadhsv7pmw==
=7wPl
-----END PGP SIGNATURE-----

--Sig_/=LeT9U32PuvBr+yiCz4GAjz--
