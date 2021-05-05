Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C212E374B22
	for <lists+linux-next@lfdr.de>; Thu,  6 May 2021 00:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbhEEWW5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 May 2021 18:22:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51255 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233874AbhEEWWx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 May 2021 18:22:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FbB5b2Tl3z9sCD;
        Thu,  6 May 2021 08:21:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620253315;
        bh=MBsrEiVVK4ikpWY8C9uwRIQbPvut3V/1aWROJgcxRXk=;
        h=Date:From:To:Cc:Subject:From;
        b=YwTi1vab1qX6KnKS+g1VLvX0CzUhWGeIihRA+u1k68GSEO145PgNzq70aXVCSxOyO
         0x4e057G5HKcF3mwP/mehKolEwvf9xIT+cRSZLND/eFetv43FX8otAhpNiUZ1kKsVf
         45x550Pv64+NEuFv74jnSo728frgU1xQ6xDbrYTslCujXcRZIIKibGfIDPoWAEMptp
         oAV4FUE8EZg1HEdNjfrBEKtm/6kSXZC2dlcI2SN9lM/uOcODkg2vOS8gZ9LlXhKVd4
         ZcGNGhfZeabNpMtFQEI6d7qvAYn8A0nhgd1aSz87rUitZw5XBRA1msKH8y5Rdtldqf
         82o38FMhldmTA==
Date:   Thu, 6 May 2021 08:21:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Michael Zaidman <michael.zaidman@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the hid tree
Message-ID: <20210506082154.58352028@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gX2FgZ/4hTOuWE7kBWgv/j/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gX2FgZ/4hTOuWE7kBWgv/j/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b45ef5db7bf2 ("HID: ft260: check data size in ft260_smbus_write()")

Fixes tag

  Fixes: 98189a0adfa0 ("HID: ft260: add usb hid to i2c host bridge driver")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/gX2FgZ/4hTOuWE7kBWgv/j/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCTGoIACgkQAVBC80lX
0GzuzAf9H9+JTF5SZ8pR8sOY0A8eNpSz1TmngMmxZWjGmswRyFKcyvS0pg+DGUq4
J1zhKcypbADjiBv8QAgjgF3JuXg+GAWZfGVTWpIiz2RipgjHCSuW2nQeKaTwMTEt
o0Q7w3iNcQCbWxh/0eRwIlmEPQMbjB0IN/balSrQqltTFZq5YKS3KOIPDzauK3J/
yjfR6XuNuzOW1ZMgM71PVDVVZcB7HDevqi3gbql/lXn9bmtvkfcEIt3ZBV372o7t
IbG9iPNPaRLkWPpHUKDOifTZtQtvz6uTasZ+Clvm4qsFJ+m8O4HKHCDTX7VUpIQH
kRGyTVDU1P+UkCaRTYVbJ+qcTE6GVQ==
=xaAU
-----END PGP SIGNATURE-----

--Sig_/gX2FgZ/4hTOuWE7kBWgv/j/--
