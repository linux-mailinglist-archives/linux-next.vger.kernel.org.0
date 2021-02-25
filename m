Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 727EC3258B5
	for <lists+linux-next@lfdr.de>; Thu, 25 Feb 2021 22:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233286AbhBYVfU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 16:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbhBYVfT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2021 16:35:19 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E580C06174A;
        Thu, 25 Feb 2021 13:34:38 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DmmJp73GKz9s1l;
        Fri, 26 Feb 2021 08:34:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614288875;
        bh=bYzddqNNDqTWFGwnYvyyMr3F6WxG2IVuzQfE0YRr03w=;
        h=Date:From:To:Cc:Subject:From;
        b=kz7G1oyVHFF3WxqkGCynw7zYUxvP4ygfe7ULheUW7o5KmS8MiOAASB6asjk79Kjog
         sZdhtn/4v7JSTeZD1d0fkiWzXkLt1g4Xj+OLE/123Guz9A+AVuPd8UvslGwszmc0Uq
         TT6X4JgaXFyq8yhcozKXZMFdpFe3+KGOKhR6MyxJJRKCNnDDHca59Oi1TfvI6YWoBP
         cg3LXOo8goZUkCTUnJ7/rcsArkBLZIo5By7ivAUlp2a9EU3pETKmscD+DW9Vlo7dpx
         RNWgJl8aNg1o18ZnxaMwLpSIECQX7gwEWCEg6tPNEHMBapgvjTlqy6pRt5BSm9mDXH
         c5S97OjGQ7/iw==
Date:   Fri, 26 Feb 2021 08:34:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Donnellan <ajd@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the jc_docs tree
Message-ID: <20210226083433.1419e9c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vMjOURVoPVQx/M_sLwpcgrz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vMjOURVoPVQx/M_sLwpcgrz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  36eaf08fc283 ("docs: powerpc: Fix tables in syscall64-abi.rst")

Fixes tag

  Fixes: 209b44c804c ("docs: powerpc: syscall64-abi.rst: fix a malformed ta=
ble")

has these problem(s):

  - SHA1 should be at least 12 digits long

I don't think this is worth rebasing for, but in the future it can be
fixed by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/vMjOURVoPVQx/M_sLwpcgrz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA4F+kACgkQAVBC80lX
0GwKWAf+LFBk/Lmj7tF+b4JQzlDFXWRGa1s3qToyGT5fynznvrsqqzBEd/cGDu2N
xCViSdkOZLwHEL0Nnagm7X6Gpe+5Fr9A15KVX5syNC3qM3xZtHxI9wwe9ixPx3nw
RfihlA/MwUaT1XMJBN5aIfYHP01sHTm5Mlul9BNol99Im3Wv6TwQHqOjFUJiN3cf
5SqtIQY3UdA1SIwEzSQAeycsuopkj3rLZwTnPNw2imKNAqTzkcYLl4e15XinqjYu
1uLoG6OI2nwjIwfq6eVxJaclvRn6YbcjHK6z7upKg5q9K7R21HfB4BJg8G7j5AVc
MK3/jgf/5KP+IdU6WzsglHmM8HRewA==
=wuFJ
-----END PGP SIGNATURE-----

--Sig_/vMjOURVoPVQx/M_sLwpcgrz--
