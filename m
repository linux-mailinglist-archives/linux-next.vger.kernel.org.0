Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A49E9101210
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 04:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbfKSDP7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 22:15:59 -0500
Received: from ozlabs.org ([203.11.71.1]:58617 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727467AbfKSDP7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 22:15:59 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47H9vJ6FZBz9sP4;
        Tue, 19 Nov 2019 14:15:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574133356;
        bh=nqs3F2umAdBtQfpxikLR763VjtYUfxsa34h8onrr2w8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lzvzJ6j5h8Wkql08SGoI6FEKF8PYmeBAGOjU8LQzUqz6Khl+xkQl0HmWwekRDBLj0
         ikp4F5+oyu/LrhSRsTn8MhlsI9JXN11ty9g53kYPLINTRMJBHLTxutnYwScvj18Uc9
         9bK4/udF6PWaAofShtU/ZwvEh9QaJOP630UQEMWScwvKhn9SjBYgiLnsDISn6ww5Un
         NVrVooJ+g3X/bCJ0/Pd9GDpLzcP9dv7KQsGzPRvvtW6uq/BN7tQhPaSp8nI1F4Ckly
         EHeXCMbdWKD5U8SIkxFRX8goL9+rJTMjtD2xMrjNWFuqzwRobEg2KOMPFYoLJur0Pl
         4pcNvB/r09I2Q==
Date:   Tue, 19 Nov 2019 14:15:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc-fixes
 tree
Message-ID: <20191119141555.1c2e2270@canb.auug.org.au>
In-Reply-To: <20191118155852.GG9761@sirena.org.uk>
References: <20191113081035.7e7f9bc2@canb.auug.org.au>
        <20191115093410.4a7938f5@canb.auug.org.au>
        <20191118155852.GG9761@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GvQ8HB9ZfOE6x1bgnoHM38L";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GvQ8HB9ZfOE6x1bgnoHM38L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, 18 Nov 2019 15:58:52 +0000 Mark Brown <broonie@kernel.org> wrote:
>
> I've reverted the commit, I was a bit disappointed that none of the
> Intel people responded but I see you didn't CC Pierre who sent the
> commit so he won't have seen your report - I missed that due to the CC
> to Liam who was also in the chain.

Sorry about that, I usually manage to CC everyone involved.

--=20
Cheers,
Stephen Rothwell

--Sig_/GvQ8HB9ZfOE6x1bgnoHM38L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3TXmsACgkQAVBC80lX
0GwMjgf7BXYpr5BOvi6MgINE7o72hyepwlXTjv7I3+lafY35yeQ3UDJKR0v1/4al
B8uFyDGgO31IFVsAnZdOmwEVA9zP9FhNRKpQJuoFf5P6UXSCi2cpfPun+/0mVbqM
v7IKGrYZmYy9lZzhjxJp3Ml/9BZ47MJh4B/r1OZ0vz8Qi3MJyVTONXTxE50AefQO
rEWsJqBVgClNg3lYRIfPZhiBvcLSFhZf8zNBVgkA5IiwVXAQpDQHTN/QWgcyUYdw
91TK7FYlsU9tjafy4BT/c+NZhxOmzOMzblpUZZ6v496DA3IoWSlWeikJ5fQisv6a
BHuh7J5enmyTQb7W5CpmVe/qUmLlzQ==
=w3vo
-----END PGP SIGNATURE-----

--Sig_/GvQ8HB9ZfOE6x1bgnoHM38L--
