Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF24C1D7001
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 06:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgERE5c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 00:57:32 -0400
Received: from ozlabs.org ([203.11.71.1]:49903 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726040AbgERE5c (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 May 2020 00:57:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49QRZx25K6z9sTC;
        Mon, 18 May 2020 14:57:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589777849;
        bh=A9TP6SkzWB6mnGqZDwuUYCknjhNrzX7gjqo6C0dGIgE=;
        h=Date:From:To:Cc:Subject:From;
        b=kF8z6XvUM/uCiXzH/lSg1yITetXZrhciIDMgwnh9qCFG+ZkX1Zgx7rND4cX5QUd4w
         ta/dBfIkNEsuPz99+CBDSFVSfYOlGtrBa36WcFCU/agBQqmwj3k1B1D/cWdkeoXXJF
         6UCS/6A5Q8OrCwIRXnwbQ5GSY0X+joWYeJuWYWGAPQXBahR72KZZ3M7kqqdpOIbHD9
         9pncmuOYa/wU/lyvIppURZ7n+IHOu40DpCOIw9Qu++80AF9ANZ4682mJHrBXQZm8js
         oM69ci0iFVt/RqLaPeeUV/kdWUONBhI0ZsEA8Xd9omN/gUiW0+ovpvkLJT1j1R+rs0
         lPmchQ2VxBaMw==
Date:   Mon, 18 May 2020 14:57:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: linux-next: build failure after merge of the keys tree
Message-ID: <20200518145723.65b89375@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DhvUael2DQj4sScjtbcHV3K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DhvUael2DQj4sScjtbcHV3K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the keys tree, today's linux-next build (x86_64
allmodconfig) failed like this:

x86_64-linux-gnu-ld: security/keys/big_key.o: in function `big_key_read':
big_key.c:(.text+0x562): undefined reference to `chacha20poly1305_decrypt'
x86_64-linux-gnu-ld: security/keys/big_key.o: in function `big_key_preparse=
':
big_key.c:(.text+0x825): undefined reference to `chacha20poly1305_encrypt'

Caused by commit

  e0a715753a88 ("security/keys: rewrite big_key crypto to use library inter=
face")

I have used the version from next-20200512 again tdoay.

--=20
Cheers,
Stephen Rothwell

--Sig_/DhvUael2DQj4sScjtbcHV3K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7CFbMACgkQAVBC80lX
0GwuCQf9GT+rRzPUAp15yGy52wKkp5Qpak6jTUwlChRI7Y5XB4FKKM27OMc5rrNh
CYD332Vm6KlPOWXIP2Ykq4rrE1paxPh8zqRrG3fMgkKoQ4ItZKsFiUyghO0nypYi
dvInU6xSGv/Tyn9vYv1BSrmxGnSfPp5YL9BWDM0jvKoBj21mbGhp8fJq4ZaqYZpO
b14tx5jqAzbBs6B9MgWg8sX6DUBEc/NH1bfruVjWE4Ez1uiPUsG4Dx70cJFKmCMs
ico8keHBeUJMGDz3WrviCk0HHQRD3dTrJ82oVVMu3Ldk87bRttl5Z/97muVOWz5f
9vxezso4CwLmyGmzqYkj5DBB95zF7A==
=TeEi
-----END PGP SIGNATURE-----

--Sig_/DhvUael2DQj4sScjtbcHV3K--
