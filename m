Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5B020BCFC
	for <lists+linux-next@lfdr.de>; Sat, 27 Jun 2020 01:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgFZXDV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 19:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgFZXDU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2020 19:03:20 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D2BC03E979;
        Fri, 26 Jun 2020 16:03:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49tsqq0gvSz9sQx;
        Sat, 27 Jun 2020 09:03:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593212599;
        bh=rZSf3w6JT+xysNhj8MvFvNcipjz8LIPX1+9eaC7CCuU=;
        h=Date:From:To:Cc:Subject:From;
        b=E2GBjGCfqmg9TmpuUZvosu3dPNfLSUHHdLbyV0P6ImGdOsvGfhHWh551EuaJCaIOY
         AzADMVUVDVz9A33IkpGdj9SAQ20b1HlyhKEzZVM6Oi3/Nr1YMVDOFUJUzY/86Wgj+f
         rZJbEW0PHVhiZB0QVM5/PdYHAeItDoGxfV923qE9WvsKN1L/OHFH/7mdmZIX3Ng2Em
         OOoegCZ6Q2HsP6uocWyyR1uAehCeCDVzpCzM7mpbop7YSkLlSHzi9equrpDSgO5LuH
         yW+orp9IDC3LElJIRtREIZjlAK5onB41PBnVyOkJpX4axFZEvJ2cJHjRiiMqS5+8BR
         7aVg2j/i2DFnQ==
Date:   Sat, 27 Jun 2020 09:03:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the nfsd tree
Message-ID: <20200627090317.48bf2578@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1HrH8D_SDS_8B0_U52tWP6S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1HrH8D_SDS_8B0_U52tWP6S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  886c4fe8bdff ("nfsd4: fix nfsdfs reference count loop")

Fixes tag

  Fixes: 2c830dd720 ("nfsd: persist nfsd filesystem across mounts")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/1HrH8D_SDS_8B0_U52tWP6S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl72frYACgkQAVBC80lX
0Gz3FwgAn+mKB3XE+MbOCNqjbACH5GPRvlmaOtwMLDlifR/aC+zoky9NcBEyXuMA
4TEtOIG/VsGFqUSqOqEZgI5KnfnR96cy5bOwrlM6fd+2x9aGLiM6+Rm7VO2ZC2Vv
ojOCFsUbj3i/9EAreQ99kE0ZnOjSDfTV1+NfDECYoDifhol1TC7bG0WB3NR1O4Zq
hrIpgCe+dWO4sFHQ2B7b7K3EbOU1VKMDllJED5RJKsY3MSykTLxz6VCFL7PdP/vW
QZKPEyk+TuKWfL0Fv9rcoyTHKbUwfvsUnBV3frB7ea0luvCDoOVYFtMGyfcMwiTB
3IQr2QJr3t4DRZrH7nEUlPPl8tLswA==
=3my7
-----END PGP SIGNATURE-----

--Sig_/1HrH8D_SDS_8B0_U52tWP6S--
