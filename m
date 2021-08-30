Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBAF03FB0DF
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 07:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhH3FrE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 01:47:04 -0400
Received: from ozlabs.org ([203.11.71.1]:55985 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229936AbhH3FrD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Aug 2021 01:47:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GyfSZ4MrFz9sWS;
        Mon, 30 Aug 2021 15:46:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630302368;
        bh=eh3cO90c1KedAIJjSl6KhOs8itt4bFhDPyslsaki+bg=;
        h=Date:From:To:Cc:Subject:From;
        b=QnM00rPpxqrsnMXbwtoHmHkDteIgeugumsc/XoT3jOIHVJ2mMcFfl2APcwhta8Ov0
         C077J3yxmbQIl6nZUHFqYJ6o/gVwzA+L5ETTvIQacv2rY0cSHxGdsoupRKJmdCdWWz
         65WAyNR9tajJWXaXAhSC1Yp8eF3am4Y2UlFDaEW6NfUN9731OieVTXzU76enl7xBqK
         +ublSzQbXKL+PGS4DEQuWXRfSz0WhXxh1HuJORKUEnQmAhOMbBevrG0h9DMqdhmJSX
         azeNByre4P7oyKZ8vJKffAU8kFA1GCzJpbzMaYmLA3kLMfSwV3ekfpwPyXZH/ChCbw
         8CYKskaHKTZrA==
Date:   Mon, 30 Aug 2021 15:46:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Jiri Slaby <jslaby@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tty tree with the parisc-hd tree
Message-ID: <20210830154605.2abe717e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uVUbwi0.12Pg.+NH6XSljQ2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uVUbwi0.12Pg.+NH6XSljQ2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  arch/parisc/kernel/pdc_cons.c

between commit:

  9613b0cb3eb4 ("tty: pdc_cons, free tty_driver upon failure")

from the parisc-hd tree and commits:

  0524513afe45 ("tty: don't store semi-state into tty drivers")
  72fdb403008c ("tty: pdc_cons, free tty_driver upon failure")

from the tty tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/uVUbwi0.12Pg.+NH6XSljQ2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEscJ0ACgkQAVBC80lX
0Gz2wwf9EzoZZLXgVZXEOqIIY8e8do1BSIZz7CIxD2/674rEK/Tq3du0wpe3X3a4
PJgW4uAso7V+6vxCYHXx6BdzM7gqYly1Grh2oxW3i0KeTqs08uxst3qZjYCfIduu
2GorYxFuYVOcZpIxSOEoLaMYGkvxRE7V5QitRgaqO8SYguFYzVT6taVuJrC1CICU
7aVndMGhlHU5ejSRcdWE8n6hKnXqRIpp8mOkjfJHQv2FCAtoRYd1fi6RadWMcWC3
J/l9S6EMn/3xzHPkJunJN20Mc1jWpIFmCS0AY9mW4r7JoTJ3YsGwApi36ejZ0Dgf
1taA8ciufj106PfavfhbuGKzmhhd3A==
=VduB
-----END PGP SIGNATURE-----

--Sig_/uVUbwi0.12Pg.+NH6XSljQ2--
