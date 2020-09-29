Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4567727C1BF
	for <lists+linux-next@lfdr.de>; Tue, 29 Sep 2020 11:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbgI2Jy7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 05:54:59 -0400
Received: from ozlabs.org ([203.11.71.1]:40581 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgI2Jy7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Sep 2020 05:54:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C0vrK0LPHz9ryj;
        Tue, 29 Sep 2020 19:54:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601373297;
        bh=K9o2m464FiOzYLspilJjEGxOl0UfxxUgUkxIWX09bKk=;
        h=Date:From:To:Cc:Subject:From;
        b=h+VL7xFuszdGTxuciwV9z/cgTgdEON8iD6Uur1Ln9yfu4j2KuQ9g90H/uNZNVZ+PW
         O21vlbru1Y4/a3GzXXtdUdvMERCgb4Brkmhi3ajO07deMprPN+cen9LHQbUDMn7r0t
         yO9r+pMzqKlcFYNtLE5Q44gMfOg5BObL9H69xR4k9gW+y2z3lHOmEUZTFkSMvPDWz5
         WYyUQ3/jCETCO9yVJUQAiOPFocZSn3IrMcPcUD4BBq9PCIFuOlPLX+hnPz5VU5jmHs
         DUSpDpCDlS8bIYbl5s5z9yj7QnlmSxfjx45qobEZXNX4qZYgw+yViLJC/TrHQtiVCn
         Wk6J0x5vtakDg==
Date:   Tue, 29 Sep 2020 19:54:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ritesh Harjani <riteshh@linux.ibm.com>
Subject: linux-next: Fixes tag needs some work in the ext4 tree
Message-ID: <20200929195455.2cc5ae91@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fwZWsdF9ODuOFQ/NoS7O6U9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fwZWsdF9ODuOFQ/NoS7O6U9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  424de74af0d0 ("ext4: implement swap_activate aops using iomap")

Fixes tag

  Fixes: ac58e4fb03f ("ext4: move ext4 bmap to use iomap infrastructure")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/fwZWsdF9ODuOFQ/NoS7O6U9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9zBG8ACgkQAVBC80lX
0Gw2QAf+KOd5IXA5ojDFYpnA19uouUDXwodfC/UarXCJg1GPSrTzcrKlS5XIMii3
Dz4EGsHETVKD0tUzFXFADPyyQQPsazbYpzfaTsEL/8gVVUMVxKf28y4vw7HY5g+4
2waGlRX5YtwwHRS+n14FfUYNJ0HNtfdrwlTyL2OW4muE8V+GigjR9Qg9t6unGeq1
BaL7z1tSi0pJEX3I/hyYKQg+q3Uz2Z9tcWGKXGKoFzjWH2wLnmTLTSiAPsUGfsAX
A2cVZo6nq+MXSlypL0ck5uuR0IFn/PaUER/cwvZKUCtbD9CoH0rzUBH2ldTWxgdD
qHfOxwJVp05EelcicLaCS9pgTOfMjA==
=puhX
-----END PGP SIGNATURE-----

--Sig_/fwZWsdF9ODuOFQ/NoS7O6U9--
