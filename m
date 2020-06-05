Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6620B1EF114
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 08:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgFEGBN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 02:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgFEGBN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2020 02:01:13 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3D8C08C5C2;
        Thu,  4 Jun 2020 23:01:13 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49dX872rTjz9sT6;
        Fri,  5 Jun 2020 16:01:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591336871;
        bh=NkIotAwMMCLbH7t1B0iBJAQSTvh8eN1pgjQsGodlr6k=;
        h=Date:From:To:Cc:Subject:From;
        b=NVWHTSX414wKBtm8+fzrxV1dM9jMuUmx2B4uVzSNSb650QU9Lyj0uq7emYA9pGiIB
         Lbb9pHEandkgXYGGy+pwttlyY+V1WrQRA38yr03PJy8mt5wFq8T4+N5qquUvBGmpi1
         P6Ym5kyShHbNJL6umztKX8jgB3coNuMVLNAv5Wv4ENEZNbmHDDhnVTqZVgk75/5SUx
         qPZL9xYGZxoD+DJTIZLgWZJGeBsSuQsyqwr34vbR7DClzG0HYiyLiKvIerwl2b1Qrn
         eyz5znAe+kDGvH7DAQakveaA4SfbtUVIZ3bCWLm2YPZx7eQYtvesIqNfGeisrNpYAu
         4FS63IYpWtF6g==
Date:   Fri, 5 Jun 2020 16:01:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Rich Felker <dalias@libc.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm tree with the sh tree
Message-ID: <20200605160110.7015e86c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SreivWS8aL=GrgUWoEk46fD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SreivWS8aL=GrgUWoEk46fD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/sh/include/asm/pgtable_64.h

between commit:

  37744feebc08 ("sh: remove sh5 support")

from the sh tree and patch:

  "mm: consolidate pud_index() and pud_offset() definitions"

from the akpm tree.

I fixed it up (the former deleted the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/SreivWS8aL=GrgUWoEk46fD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Z36YACgkQAVBC80lX
0GzRYQf+ICROVvHl65dfc5iZ23YMD11XNySynm5Gy438smTodScgivEmizskB6bD
ecOij1m/iVtwmnutw4IcKEm2C9HsA+7OH3csogqM8sL9HlSBGv+bmvwYzRUxv4EN
BzaNzNjxt+cLOz9ZdSL0o15u1R2GLSi8/uY3vKxZfQ32bOC4dTpNC9lk99AZNz9C
jkp3GF5GOFna8S8p39awqmIYFKc6HYkO1anpnSCO65Y2lVAIKj0ciAWXDq7Yejgj
wjhdl3LvsCDNO2aYuREOSCEd6jIDvpMzd7oys/v3jQgha983NErxciBqGuAK0ABJ
wyWBA3AuvrNikTvGLtQZ7zX1sjVGkg==
=/yeu
-----END PGP SIGNATURE-----

--Sig_/SreivWS8aL=GrgUWoEk46fD--
