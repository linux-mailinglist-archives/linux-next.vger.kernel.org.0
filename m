Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82FD642224A
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 11:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbhJEJa4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 05:30:56 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49399 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhJEJaz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 05:30:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNsjC6qpRz4xR9;
        Tue,  5 Oct 2021 20:29:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633426144;
        bh=q7WOLBSRiUYvpbECmY9FNOdpbOGUhuDTvoSdcw+r+58=;
        h=Date:From:To:Cc:Subject:From;
        b=ma104pZdAiWc1fct0RP0SB0BR2hEx9ffNpxKWwLMBQQrOxB8c2zShrWxWgNLlLtxw
         PSxFXovwiqjx6xw/vPTp9haE6me+wKCvf6ldXQQSmuEFQ3vWcyIYffO5jCq5A4OmXV
         7ifyhFpLZ4m/BTv6AFgcDeB7kXFC1KOKXq6NVmQruFHFZBoScx6TDHRlfrI1cehWK/
         PrNQcYS/PhVxa48dIoaBifCoLb8UIG7S23pdwgyWUR1cOr50HtpoPG1PLIv0h8cI2l
         /z0MWySEkPWbqR6zVkik72P4m2dIokT2IeicHIHn41LZstzqvLSoTTi3gkSmhyvPXQ
         hlqszB7Jtxnpg==
Date:   Tue, 5 Oct 2021 20:29:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Fengnan Chang <changfengnan@vivo.com>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20211005202900.29285789@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Rz0IXGmKLZrFH9iCpozBsMB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Rz0IXGmKLZrFH9iCpozBsMB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In Linus' tree, today's linux-next build (htmldocs) produced this warning:

Documentation/filesystems/f2fs.rst:288: WARNING: Block quote ends without a=
 blank line; unexpected unindent.

Introduced by commit

  151b1982be5d ("f2fs: compress: add nocompress extensions support")

--=20
Cheers,
Stephen Rothwell

--Sig_/Rz0IXGmKLZrFH9iCpozBsMB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFcGtwACgkQAVBC80lX
0Gy2GAf/UN8C+jBHgE5zWJmFVwS2hjKwSKinLIiaIyW4Fu+aeYPvYeZ6Ani8G6XD
/6/ooP0F7Hw0tkZSqQe3Ua9VDFiiXCyLoESuwvQbsCvNyBQhIf0PG43m4JTomvnW
7uiaCx0Kc+Lilel9y2dyjpXatHyI0uuJFy8y8d2aL3fxqv5OVZhe0iTHRj7k1jtp
I0ZgDjLf77u2wfkyruZljFbjCSwAXLiX8ZzHQ6BHAp8Y3NDAKF463R8PLaSSXt7p
obaWmFQ8DYvGME+ya1iWMvwv8+/KOnIuT1fBd9Y5VpX6A0mMndHNI8797cQzDCjs
kLUZOsex85NCjRpisPT3Z3zGwme1Sg==
=5AqO
-----END PGP SIGNATURE-----

--Sig_/Rz0IXGmKLZrFH9iCpozBsMB--
