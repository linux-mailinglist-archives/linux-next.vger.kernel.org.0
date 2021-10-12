Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E85142A2B3
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 12:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235881AbhJLK64 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 06:58:56 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36801 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236036AbhJLK6z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2021 06:58:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HTCKJ5DcYz4xbV;
        Tue, 12 Oct 2021 21:56:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634036213;
        bh=Xf1lPcg61XghCxXyudffvXGozRoqikwBbfUwHO27xIw=;
        h=Date:From:To:Cc:Subject:From;
        b=J18wbPSfa8fGX6RX6LtWwwxseI/SrZAVfoHTvyWNt5Sqdt1j3/kXy8ufUq7IA2ata
         y5SIRh8+hHXOu9EWCqdzsDZYvULtQ8afZbfkVGC4KJBROwd2xUJqCbxrdCPbriT9XW
         WraIS5FzqOnh4LT02Yc6xgf5T63CtOXx/f/XceWOlUHRhYAhhdaZNGkL9THUlkxuEH
         BaMWUFd2yHzj8Gxsrcfxw5ZOE8pNtz8IbWiSWLO3hWW1CldqBnMCdYg5gNtYOQSCXn
         r67nfuvbs2s66syUHBhmv1B1HjiBW3RS6HMB10duPkZgVrdB17FhFnUsTOlOjyoGbC
         XBsnka7IRPF3Q==
Date:   Tue, 12 Oct 2021 21:56:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings in Linus' tree
Message-ID: <20211012215651.300f8bc1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xES2aqxswmOIh2v9KQcV=WX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xES2aqxswmOIh2v9KQcV=WX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

When building Linus' tree, today's linux-next build (htmldocs) produced
these warnings:

Error: Cannot open file drivers/counter/counter.c
Error: Cannot open file drivers/counter/counter.c

Introduced by commit

  d70e46af7531 ("counter: Internalize sysfs interface code")

$ git grep -w drivers/counter/counter.c Documentation
Documentation/driver-api/generic-counter.rst:.. kernel-doc:: drivers/counte=
r/counter.c

--=20
Cheers,
Stephen Rothwell

--Sig_/xES2aqxswmOIh2v9KQcV=WX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFlafMACgkQAVBC80lX
0Gzdrwf+NhdXQRA8FrfoLzS0Jf7p/I1LB0T9+LL4C/RkoJR05RClQRFyOzHgNLKY
uY82jt5yCJwGDR5x5eCboV2WexqFNHCQTRDVlkmkzxQs7K+I2yOOCs4f6R8kyUbS
SIXyau1ERsJ8Fmy5K86xSvII8dmzc7TagcA68R3JnfXFLt4I+pgT2s2G+XwQBElz
Fxo+LorzakLc8smz2FQDLUqlQoacRJ5+bDrb/Y6XpHZCRmLEw/YXVYPGcOiNj/sD
qjqB4yJyg6ceFQcVvd285QQWBmHsyPpxllLA5G9ihtdyh5IykRlgEV+Vh0B/L+sC
BMwcJq85m/QuqwHChfyDW0gmJT9dGQ==
=dU+X
-----END PGP SIGNATURE-----

--Sig_/xES2aqxswmOIh2v9KQcV=WX--
