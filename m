Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8D728E982
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 02:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgJOAfe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 20:35:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33569 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727790AbgJOAfe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 20:35:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBVgS1nSNz9sT6;
        Thu, 15 Oct 2020 11:35:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602722132;
        bh=AEUzDcNpseI0zKOcofSjki/FWqNB2DYfmUv1ZA64ZT0=;
        h=Date:From:To:Cc:Subject:From;
        b=ZAGOU5MnMIDN+6LKnJTogH0NDfPeinbdSTa7Y18yG0Wyc+e/4RzG3DBHkq4mIo9Jc
         S6lgdXwIB6zFI1/Ff8RrULv6p+H8yaKi+LYr2f7mjPKe4S67rihGViE7Q3Hpis8PVK
         N/HTtqagwb/M66/oxbSedFAcA3GpzGQwMSEegjDBiydQFzZJqQ0wIKoWonUhZned36
         TCBoH24zFMIV7NJrsZO37cWUBn+yLBkA9vB5ySWgYVfI3GwBqb9rR9Sx+7jtoO8Jo5
         nXWfKJF0oeR7LbxvUN8jLrXayC6cWrrB1yUwGn4ZzQsIWlokcacTgLNy57iggydnTq
         0PzOr2TdEw0gw==
Date:   Thu, 15 Oct 2020 11:35:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: linux-next: manual merge of the btrfs tree with Linus' tree
Message-ID: <20201015113530.115e0361@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/voInhO8v9bi.ZAxF+1MUQqx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/voInhO8v9bi.ZAxF+1MUQqx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do *not* rebase/rewrite your linux-next included tree and then
immediately send it to Linus.  Or if you do, the please also update
what you have in linux-next (so you can sneak it past me :-().
(mutter, mutter, unnecessary conflicts :-().

I have dropped the brtfs tree from linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/voInhO8v9bi.ZAxF+1MUQqx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+HmVMACgkQAVBC80lX
0GyiVwf+N2NmWlhEJR1ugr0XXH+JlSXRtJCu05zTfm4ODJFdPkS0ZmSnE0H0znZe
IiN9aArnRWSJ5BUqCDWUMnQ3Tg/pKNn0ZlGiuXER23LsVhI45Jh1ktF9RWLg9Run
89olNZJZdqwHzJeCPfST/pBs7CF6rUeuWKCpF2+KvySD4esi87FnWEald1xhH7AP
evdhMfn/WsfT4Ms6k1ud/f9HKE3a7GzMLDYxPlGScepVdWcueK8jWbeI2L5HkYp6
0O8ZgY1TeXj1Hcb1ngOZYjdZ3s5R1o0FkgKL9JJiGR9WpxpUS+Yrc3qqLGlbT2HV
0EiWPoRSFQInZBg/wFFNMsO/v87q7Q==
=5OB4
-----END PGP SIGNATURE-----

--Sig_/voInhO8v9bi.ZAxF+1MUQqx--
