Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E837E34CCCA
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 11:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbhC2JOy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 05:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbhC2JOf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 05:14:35 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F4AC061574;
        Mon, 29 Mar 2021 02:14:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F86N25K2Lz9rx6;
        Mon, 29 Mar 2021 20:14:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617009267;
        bh=Gavol2XtuiEbDNv1Cl+fnnhJIOGpbKjp17lcBgR0KdU=;
        h=Date:From:To:Cc:Subject:From;
        b=Ud6hfwzZXfmeHU3Uv2FMSAk4HdxNNQihp/c2bgPaIHUy82CmDhhgH7idYBZAo48+L
         icoRnDAfO9O3VmPi4TBdsXLdBZjswfAXW8h1PYrxQ7bljuaeMo0w9Kugq7A3LiIc7F
         u7edZN64/+Drr12OqAksCfek92eyctIdEZIc1z7nNE1WCdnxJnDIXD6MnqdsCfHRTG
         K45Rpu56F/rG1M9wtDxRQf4NcVWf9EkQAUS3u5/mHIw8W8eL0K1LvPucb8pFT/aB2o
         HQy2vznG3jSTxSWWndmC7KpQQ2uKqBqk6INGhq3VkRbNCVTxgREv0bQOZetKdWLiX7
         sjZkm5trSqjqg==
Date:   Mon, 29 Mar 2021 20:14:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     Frank Rowand <frank.rowand@sony.com>,
        Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the overlayfs tree
Message-ID: <20210329201426.78d4b28b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8_Y0NtmKr0EF6j0hJdQY_dZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8_Y0NtmKr0EF6j0hJdQY_dZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the overlayfs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/devicetree/kernel-api:56: /home/sfr/next/next/drivers/of/over=
lay.c:1184: WARNING: Inline emphasis start-string without end-string.

Introduced by commit

  24789c5ce5a3 ("of: overlay: detect cases where device tree may become cor=
rupt")

Probably exposed by commit

  8c8239c2c1fb ("of: Add missing 'Return' section in kerneldoc comments")

--=20
Cheers,
Stephen Rothwell

--Sig_/8_Y0NtmKr0EF6j0hJdQY_dZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBhmnIACgkQAVBC80lX
0GyDSgf9GL0kmLqm1QkF4JVZen2Ma8CZLnBrL6BedGtmmBthdCZdX3C+Fdg6Amq0
6+MXVNNINyhZ14y+m/Soh94YPvvQRky14/SOweBI+R7Pkpkrakxe7aMDLo+Hiaky
IL/I3JNKINGLTnGy7ikzyhOddgdrmobNPHkHVHCtvZmnY9koBZ75wEJHcH1ZDl9G
vs4RbxmoD0v/EYfOHKh2Cd68NGyL+2eVPLVYscRa09vXHHeVOWo/S+naM9k6pq6T
kjfvkYsS1lAR+8Qab7C0zp91c8UpcPcxEwmr+zE/1uMZ4HcxdHswxOZ1y/ADoXC9
HXvvXGdRlbxykyDJ784FLbjFgfhQwA==
=qkFu
-----END PGP SIGNATURE-----

--Sig_/8_Y0NtmKr0EF6j0hJdQY_dZ--
