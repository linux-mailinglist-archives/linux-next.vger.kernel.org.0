Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25356320FB7
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 04:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhBVDYQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Feb 2021 22:24:16 -0500
Received: from ozlabs.org ([203.11.71.1]:34165 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230071AbhBVDYO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Feb 2021 22:24:14 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkSFH2HgFz9s1l;
        Mon, 22 Feb 2021 14:23:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613964212;
        bh=DwuiH7S2B/BTlVrR8jipesfJzt/46PcYIOIZpoSp+AU=;
        h=Date:From:To:Cc:Subject:From;
        b=EbWcb5C2so1I8JzTtZXkxQR5yQHK7+jcYbgUQm+FDjzLtbs+S6SxsafEm4QIxO8/+
         V2mER2lJY0DJZMoknIuZ+tFBnF6lUyhe6FRfd7B0XhbsUoHguiNDV6Zl9rrUfNWztt
         EF6IhKuh+ln2EfQ68xpoz63tKsriGoqB/wvpZNCQs1aM9/7BMBOFNRqY4kcJDlzfMM
         o88IG02C2I8QDTkov0Qurpq2TC9QYcWlFW7vv7BESERntywxeVknbx7diTEKXVJ2+u
         OKx5U6qikMKrWaZEAjz+TtxzHjRpcR+/InUN2m3RJc1abU05sd4BveVdwH1UZ8J2V0
         7VYsBh0wmD6dA==
Date:   Mon, 22 Feb 2021 14:23:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        qiuguorui1 <qiuguorui1@huawei.com>
Subject: linux-next: manual merge of the devicetree tree with the
 arm64-fixes tree
Message-ID: <20210222142330.72b89798@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/78Tvumly.LP5wMYcFng2vuL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/78Tvumly.LP5wMYcFng2vuL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  arch/arm64/kernel/machine_kexec_file.c

between commit:

  656d1d58d8e0 ("arm64: kexec_file: fix memory leakage in create_dtb() when=
 fdt_open_into() fails")

from the arm64-fixes tree and commit:

  c6844a608e43 ("arm64: Use common of_kexec_alloc_and_setup_fdt()")

from the devicetree tree.

I fixed it up (the latter removed the code updated by the former, so I
just did that) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/78Tvumly.LP5wMYcFng2vuL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAzI7IACgkQAVBC80lX
0Gwy/gf/fawMKUGqVtVeUq2wYs+fD5eA/4y2OkPLLJ9ehcC4ar3sLI5sWdQdTGyG
Q82P093+UMZnZdxQ00imQkI1IBGTMvroEpX377PyFPlitAQPrll0V+sAvmeDNnVs
4oy7tovEmrwutXptDw49ATswT39zj6ooOQn0L1O5NA9jBEArwyAbQxzppZo2a2Hn
Km0juQKHVcXuKTNjtuox+E4JmFTUj08J92mEJBfbdiFBbU8bZCIm3y3uv0TkAQF7
UsG+bfOgf95fb92BVTgWuNd/vZEELFOlQOvCtfQ7sLeRJZ+wReoc1eGbQWYmo9OD
qqFOTZVhKy+9TmD5HH3LbRl8EDKvIA==
=9U4+
-----END PGP SIGNATURE-----

--Sig_/78Tvumly.LP5wMYcFng2vuL--
