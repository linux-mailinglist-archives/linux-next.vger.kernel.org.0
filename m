Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4328B1BB182
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 00:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgD0W26 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Apr 2020 18:28:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45169 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgD0W26 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Apr 2020 18:28:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 499zvq48wbz9sSM;
        Tue, 28 Apr 2020 08:28:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588026536;
        bh=ivwgNicn18ZBKkBOXTf8jqeZchuVIx86HDJ84nnaL00=;
        h=Date:From:To:Cc:Subject:From;
        b=SD1w++tt2lIa1rEo0Hd31P2WICguTLAYTfppr0IYdb3khdIFxJz1varTMBNMS2Htc
         PNraVlRVHBJVXZSJIAQPU/uw285hWUsSVUS883cQSVIzsmsYaMZXC8G8t8cvhGg4kX
         4skYuI0BgO691+uNBtxDroyKxaz9YwnjUUxxWL7M6pvCe4WSGXmq5S3mFj49V3ksJ9
         DuU0VzigPNzyfNTZeJZb9sCuRcLAtMVgyTS2wSHcsJYx2ibyIA5c2LY78bbVImIKUF
         d6dDZ0SfGLZc8yRAmTe3ZHbZeFz3OsLVtqE2c/9uiJr737f5TYZrXaz2dwKscfAPny
         xnQLn6kcggBqQ==
Date:   Tue, 28 Apr 2020 08:28:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: linux-next: Fixes tag needs some work in the i2c tree
Message-ID: <20200428082848.19d38b67@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ca8nA/3nnw6ThCGx3N/2DV2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ca8nA/3nnw6ThCGx3N/2DV2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a66d0af81726 ("i2c: iproc: generate stop event for slave writes")

Fixes tag

  Fixes:=C2=A0c245d94ed106 ("i2c: iproc: Add multi byte read-write support =
for slave mode")

has these problem(s):

  - No SHA1 recognised

This triggered because the "space" after the ":" is a Unicode non-breaking
space (U+0x00a0, UTF8 0xc2 0xa0).  I am not sure if this is a problem
or not.  This is the forst time I have seen this.

--=20
Cheers,
Stephen Rothwell

--Sig_/ca8nA/3nnw6ThCGx3N/2DV2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6nXKEACgkQAVBC80lX
0GwFXQf7BmqaB+Y57tNBk6XlCNnqPgBUFbh9WY3DDK6y+inV/0cXYFR5Lcapgijh
KuBEf7Fjzyqu1dGIpWtl8fQsNNJ8O+1ENBITUsrukCB74vNZ16pDg2EYTPVNMU3i
ZVl/1/E0OqYXs0KpH3UwPHClJnO1a5RieXmxFgR04ovp+/4jH3YwUlOMM1RTl3Qc
mmtqabocfq2Yrgo/GO8G1NrhS/CGEmKbOpSymZ39aAHNsFxTg2Yo8pLByl8yJSQb
x3t3NX0xIm8xiu1MKxVGSi2H7emtlhFJbkH5Kmo/RoHPj2Z/8+YFHSle6wDwXsFI
1RYw3JHxUpf6iZYfIfAul08B/nMAAg==
=FaKN
-----END PGP SIGNATURE-----

--Sig_/ca8nA/3nnw6ThCGx3N/2DV2--
