Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3512943F0
	for <lists+linux-next@lfdr.de>; Tue, 20 Oct 2020 22:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409521AbgJTUfN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Oct 2020 16:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392293AbgJTUfN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Oct 2020 16:35:13 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45CF6C0613CE;
        Tue, 20 Oct 2020 13:35:13 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CG53L0yM5z9s0b;
        Wed, 21 Oct 2020 07:35:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603226110;
        bh=/BKLmz8KuUCichDKSvDy9oaVl59rQgUgtVfs6NSGaOI=;
        h=Date:From:To:Cc:Subject:From;
        b=Be5FAUpYfmjkmr0V489hbYSn1wJ/y7phukDPRhirB38fGX+VSAd0W81fs/VSG+noP
         ymghrQn3b38oMGVR67FAFmO1Nusg7F6l8KYwcnI3zsXvotvYfqQOIp4fQbOBu6a0e0
         hd7+m0r38bechJNyhBGIq+517uXLqvQsQtZ5G+QUovw7droZ5wEnqJl+P/04y9NvWy
         qsGRy/BbN4owga5zh+m5Gf1I2CIpj9h7llweRx8byZQXnbs82nYC1XTJAExQribl1d
         72S7hlktEIQbG6ywPcRWdqNZ0un08mk6D91YnpjSTw2UrOqZjO5NPtQ+oTFuADbyEc
         N5B3eekmr+2kQ==
Date:   Wed, 21 Oct 2020 07:35:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Andreas Gruenbacher <agruenba@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the gfs2 tree
Message-ID: <20201021073509.167428ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t867eCqFdgx4gJiwFwet8_X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/t867eCqFdgx4gJiwFwet8_X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  955584707816 ("gfs2: Fix comments to glock_hash_walk")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/t867eCqFdgx4gJiwFwet8_X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+PSf0ACgkQAVBC80lX
0GxLiAf/Ug3cald03R9c8KW6ZExutxvnob03iv/xtSHWp6JYPC1BCEkltJtL+DKg
OnRDATzeeyFwSCTw1qxV+GvZvnwwOxcEksETSo/OZz1yyQHqN+n2xVaDKPxBzaQV
nLAcVwvVumuwQfTsBbDAbWDeeFEbyX9cgMzvEB/aW28VeSMVyriSeLySZjmq69Ez
s5mKIosz/o67zcAL81oD0yCW+8OP+KBpZl7FSE/8n3RRd67u2gxqXnhObS9paawU
fvYgjwC+y+kyF+ZGxN4fQ1XE0INCYyrPjuHG4QbNKMyma0Zg7hgEV9+OGvSjg3RJ
W/06AgxvwhM808t3AFrI/G9MMPN0cA==
=A4I8
-----END PGP SIGNATURE-----

--Sig_/t867eCqFdgx4gJiwFwet8_X--
