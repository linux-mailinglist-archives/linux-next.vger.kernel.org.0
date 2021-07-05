Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8875A3BC3CE
	for <lists+linux-next@lfdr.de>; Tue,  6 Jul 2021 00:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbhGEWJB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Jul 2021 18:09:01 -0400
Received: from ozlabs.org ([203.11.71.1]:51811 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230086AbhGEWJB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Jul 2021 18:09:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GJfsT58ktz9sWq;
        Tue,  6 Jul 2021 08:06:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625522781;
        bh=TwqMw62jrR/kI5w4kSqFgyUFVnwFQ2A8qCJfovIHDIA=;
        h=Date:From:To:Cc:Subject:From;
        b=l0IcdjbYrJI5JQ3eCNY49qmRtoI9T2SI/qHuePuqfgHSV/gwUHG0yT0WZeazaB8WF
         3gVTjOSFrUz3VdnEE7kGHnjkIBZ7Kd17RRhEJgb0aKl4fafH9VPgeMnsMRNZztALhZ
         +FoxxpHhPgMn0H7vTwGwDCiVGsO2LUvp84ZiJMbgng/o7IwnJVytZyBsZICfQpuDtG
         npxPFzl1OX6bNBknAsTJnVWMrx3jNNV4qr1heZa4TwdoNJ6+rHVJp6COADdcFsncCl
         pi+CXYa9kwkaLq307BnTo4rqNrw8QRp77Jhjm/YwLOrGKuus7n6vejAT/ww2ABfp84
         2RoW3jy9kVa0A==
Date:   Tue, 6 Jul 2021 08:06:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the memblock-fixes tree
Message-ID: <20210706080621.5d497973@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cOHV3q4rtL2hX9.blEKZJvr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cOHV3q4rtL2hX9.blEKZJvr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  24caecffab46 ("arm: ioremap: don't abuse pfn_valid() to check if pfn is i=
n RAM")

Fixes tag

  Fixes: 30603c5a0c9a ("arm: ioremap: don't abuse pfn_valid() to check if p=
fn

has these problem(s):

  - Target SHA1 does not exist

I could not easily find the actual commit that was meant.

Also, please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/cOHV3q4rtL2hX9.blEKZJvr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDjgl0ACgkQAVBC80lX
0GyjnAf8Cwd+kNYrUBK63Um85skjWgpV/sNrhSCb7GATYhg41oKybiAyf0HUiF67
6WvzbkG/b8mFknBKvyRarBtFv/CFw7Bkt5sMD3w6isezcNUXvtanj2zkxQXshKQd
V7wulwc59J0SN+Kn9pN5fPJumChW0hKgdKiuQRpB7jWiKZkgM5cK+cZjsOE0j8JB
f6MlZfaLVhzpaToph4Pn8cE3M8Dqcu80jMTjfCF3GFHrGiVxaRrsWUrUHxuD10iM
hIXYkTNk/kZrOAkaBFlKeXfQlh0t52qqRjQJz92Dw2Pb73aazl/QpjjUq+jiqQD6
O6FhpWg/cwo64wjjzb0R1uI0W5sFOQ==
=szX0
-----END PGP SIGNATURE-----

--Sig_/cOHV3q4rtL2hX9.blEKZJvr--
