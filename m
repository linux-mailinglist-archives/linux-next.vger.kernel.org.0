Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00ECA361B55
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 10:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234291AbhDPIHa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 04:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234829AbhDPIHa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Apr 2021 04:07:30 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C718DC061574;
        Fri, 16 Apr 2021 01:07:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FM81w5Wkvz9s1l;
        Fri, 16 Apr 2021 18:07:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618560422;
        bh=1Wnk0eZUlJJHZgw/9emJx2PZi827RZvoISUmtcGsT+g=;
        h=Date:From:To:Cc:Subject:From;
        b=em7UneyUJ4S3MFrN0oPCM7stuKGYF2AVilxBsGjGymRrD9zL6xfhAszXNulQ1iLu7
         szHG2k85GoeKXbTEGRjs2tjmdFobUBYDQTbfecegSYOCH1aQ3LO7YCgkfneqJKtjHX
         0HAA0cPBX+LDQ82qhLEqfXvVnkA7cokU8lVJriCTGb/pv5lzhE0+8kcbKZF4wh+/RA
         ALvx0JS3PR6NEgH17HTYn7lWhAS99FEplfVh1KRvHLIfOljGSmShjeOmDGKPubqCvU
         u3it1aSHnIclW7muuNWsx5/S6IMQEkqSk27TdoB5HVmgNMRHUN3By9IXdwXpQs+0qJ
         RaE7X18WDrT0Q==
Date:   Fri, 16 Apr 2021 18:07:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Petr Mladek <pmladek@suse.com>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        John Ogness <john.ogness@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: linux-next: manual merge of the rust tree with the printk tree
Message-ID: <20210416180700.6b693f7b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GF2I8IbkuJnKG8ctnoA1y9V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GF2I8IbkuJnKG8ctnoA1y9V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  kernel/printk/printk.c

between commit:

  cf5b0208fda4 ("printk: introduce CONSOLE_LOG_MAX")

from the printk tree and commit:

  fd1e637b9b4b ("Rust: Kernel crate")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/printk/printk.c
index 421c35571797,d13be89530c4..000000000000
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@@ -394,11 -411,8 +394,12 @@@ static struct latched_seq clear_seq =3D=20
  #define PREFIX_MAX		32
  #endif
 =20
 +/* the maximum size of a formatted record (i.e. with prefix added per lin=
e) */
 +#define CONSOLE_LOG_MAX		1024
 +
 +/* the maximum size allowed to be reserved for a record */
+ /* Keep in sync with rust/kernel/print.rs */
 -#define LOG_LINE_MAX		(1024 - PREFIX_MAX)
 +#define LOG_LINE_MAX		(CONSOLE_LOG_MAX - PREFIX_MAX)
 =20
  #define LOG_LEVEL(v)		((v) & 0x07)
  #define LOG_FACILITY(v)		((v) >> 3 & 0xff)

--Sig_/GF2I8IbkuJnKG8ctnoA1y9V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB5RaQACgkQAVBC80lX
0GyS4AgAnbyJfaK8RnzxdFRl47e/InmnCJNk98m/BslB2sVhpq/2SPKyy2ubjzBf
EtdCj/R9rzbfDipPBB58KdfwyDu1u7aUiE5CvvxQ+GsSkYBU1+gZbGTslRA+wc2m
UKPlDQfiL+DwR2dKN/Yog4kS+ijQUqKtV/yZ3TN2kWpZO9t/JT7VRrCMjzyDLodg
Omd4ADDUkKSN3AouqisCFGXTObW0mZSALrG7BW3lUzKZMorfyhHyAOoUqFU3+fV/
DroyDGNP6xY0SXF0F4QyAdfzE1Kv7XLR4o+goGarNkLPbK0OJgcW1ip8gzoDnrJs
SXuqznzO/Cp4s0E8hZbjLpNKz6aqrg==
=Y4ts
-----END PGP SIGNATURE-----

--Sig_/GF2I8IbkuJnKG8ctnoA1y9V--
