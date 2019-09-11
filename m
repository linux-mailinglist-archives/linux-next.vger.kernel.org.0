Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89200AFE3A
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2019 16:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfIKOBr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Sep 2019 10:01:47 -0400
Received: from ozlabs.org ([203.11.71.1]:60989 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726058AbfIKOBq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Sep 2019 10:01:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46T3VF03T7z9s00;
        Thu, 12 Sep 2019 00:01:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568210503;
        bh=fVMbp9nUjHjHrCSnRjagqE1opDXIVQcKULOOuwAY5Gw=;
        h=Date:From:To:Cc:Subject:From;
        b=Cmmp18lsxXrtg+WLT7Hjugy4dCUkN+MUEt1qp36XFEKILh1KsNC2QfPTlgRRa3JV0
         fyKXzssxF2xKDPshchX5Q0EPkX0tZmp/5pWGd255yzDBsTW7Qa9Y270bb18mJMNXph
         Kod0X0A4jVIxdRQl88pHpspVdqGpb4Vs9JqwSl5vStmwYkLtNrQsVKdOWGIcVyCS79
         3dp/GYAFOqrbaI8vZ5z91G71OCT2DsEky+v4kZ+OEEaj5MHwAWlZM7sTX0bTezO/jD
         PEPW/QfeTmNv9iCAQOnMkBUIOt087oxOCIAj4nTg6r4vEClG4+gDdeLh/9JAbD66rY
         TjWobL0+3jjaw==
Date:   Thu, 12 Sep 2019 00:01:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>
Subject: linux-next: Fixes tag needs some work in the overlayfs tree
Message-ID: <20190912000118.1f100f62@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v4Tg2.DtvRlV4lcMmHHChS6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v4Tg2.DtvRlV4lcMmHHChS6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f31e81889715 ("ovl: Fix dereferencing possible ERR_PTR()")

Fixes tag

  Fixes: 9b6faee0747 ("ovl: check ERR_PTR() return value from ovl_encode_fh=
()")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/v4Tg2.DtvRlV4lcMmHHChS6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl14/i4ACgkQAVBC80lX
0Gw2aAgAnGgInmxdP9Nvb94U9XadS7+gWfTag4J8hJ8iTHijasZ+x0zzxmyB4s4g
r7xP13iYgcdVfGKOGrh4zhiBf6TOJyKnj8Nb67oQSFvXAr+JYe6ZbLsD7BM9B2XV
mUe8os1+fo97qN92xP8sAWTbpUIzr+tZaDPuwJa6j58AJpxwOYqN0et/0knX2XGt
yTvGEJPHso1+a7AL0SP2bxaXixUtShuvB80P8NTbEVP0l5Y/gC0/Q+DgOZiP8oAT
mJ2SDdkb3Rgj0Ft2Bnst4fNHp9zOO2S0J3QDCee97Q8/+VF41jyKUxtTqR8is+e/
z5dfGImXz1eIodvHmmG5hayInaSrPQ==
=cDDB
-----END PGP SIGNATURE-----

--Sig_/v4Tg2.DtvRlV4lcMmHHChS6--
