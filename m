Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0353FC011
	for <lists+linux-next@lfdr.de>; Tue, 31 Aug 2021 02:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbhHaAkD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 20:40:03 -0400
Received: from ozlabs.org ([203.11.71.1]:51329 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231989AbhHaAkD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Aug 2021 20:40:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gz7bv39XVz9sXk;
        Tue, 31 Aug 2021 10:39:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630370347;
        bh=qTA/HYRgV4/GUwzhz6EzXXa7EKbySRevQ2+mdeE0fE0=;
        h=Date:From:To:Cc:Subject:From;
        b=UpTxyqTm6PID1kd2i3p6t2bue2ksUfRSXgawLeNmk87d9esJetXyhIZ3gcGEbqUfI
         /+cmOQGH9JycdStUnvKUP6vBVLIiZMJy4Pz/tNfGJpCrxwYh6FNDN/TQPevk29Lv7i
         9ZuCtZ9ZGgKnPhNaT2kVUzIoXtx8rqZ3+fejUFp9ASlJXIPqV1RiwaFRi79NRXsYP8
         4oo7TKwCAwmFmohgIwqs+WGDBOmxSleKZlTAjvknSEfjIh4WRDEUo4kvs5U16ElJfY
         LYepTcKNMvlXxFMAE/6Ye5s215DVJOpZMkpDE6+hCM10eoMLh2ssjfWwaaeXF7nHvi
         odTReFmsIVLCQ==
Date:   Tue, 31 Aug 2021 10:39:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Benson Leung <bleung@google.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Gwendal Grignou <gwendal@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the chrome-platform tree
Message-ID: <20210831103906.5c590f67@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QoBEidSYUOAJ5ubq4z03/Vw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QoBEidSYUOAJ5ubq4z03/Vw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cf7f3ebb41d8 ("platform/chrome: cros_ec_trace: Fix format warnings")

Fixes tag

  Fixes: 814318242 ("platform/chrome: cros_ec_trace: Add fields to command =
traces")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/QoBEidSYUOAJ5ubq4z03/Vw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEteioACgkQAVBC80lX
0GwY3Qf9GOlVJQu0a2ONMkc3t5/v6e7v03sTPsyXo40WLkteWcts98sidonZL4sv
GRYK1zYKElO9k+VwP/UsnN/rUBsm0chdx15v2+iXZ9ZP22HDK6DtXuVx41AL4bN8
8yQhiL3DnTb1FdEWZ4Tjc0en2BVpz4BtsDODRP+KlxLHE86PmLwEMihV/YEj9y2l
5nwdc6AWltt6+bIKkgt5lgirSR8ByshEPce5vTMf4ra0bgaT2InXAYiTKsOajb4L
hh40E7zrhSn7awNosExTFscYNLrRgP5SDT8JVtN0o9UskPawfgwgtAp7jrX0APtN
UEix6APT9TgsXQCb/lPJPSLBGyjqjg==
=Ex+m
-----END PGP SIGNATURE-----

--Sig_/QoBEidSYUOAJ5ubq4z03/Vw--
