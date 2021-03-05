Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D2C32DEC5
	for <lists+linux-next@lfdr.de>; Fri,  5 Mar 2021 02:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbhCEBF3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 20:05:29 -0500
Received: from ozlabs.org ([203.11.71.1]:58529 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229436AbhCEBF3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Mar 2021 20:05:29 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ds8fs6YM6z9sWD;
        Fri,  5 Mar 2021 12:05:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614906327;
        bh=uNvFCAO2+/dn7zGMlkg9As9h70Dvz8K1kFCotm7Xju8=;
        h=Date:From:To:Cc:Subject:From;
        b=PnLAC90/7KkCqBqXaLXitm2zG+rzO4YYr7FZCY9rfDJ+17IQHAZpTIh1g7womNx/o
         wnMEnN1HorjuOM9lhf1Pf1JuZc0weOa3YFoHJh3hGJaKOQxKMjnqYpb9mbF8vbSThz
         1ZK8iEhxDgmvCnnnKJ+KLJ0rAd6guEEl8VkJYSCGFGTvlydZkbTzyMTfyyIMbNZ8Y+
         FFAS+tM6BqkKwkyWPT1vI4gCVwE1RkcXHbjkWdKLFdDUaizXlGGmvs9BX0SShVoXCG
         vv2YC5lfBD40ecIC52PjYbJUenFGyT0GstSMH4szUDg+psLwnqxNxVvC9U4SjI5REj
         axK9ChShZOEXA==
Date:   Fri, 5 Mar 2021 12:05:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Jiri Slaby <jslaby@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>
Subject: linux-next: manual merge of the tty tree with the powerpc-fixes
 tree
Message-ID: <20210305120523.0cb114b9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9xWkDb4+9_2nx0jSjYMefla";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9xWkDb4+9_2nx0jSjYMefla
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/tty/hvc/hvcs.c

between commit:

  386a966f5ce7 ("vio: make remove callback return void")

from the powerpc-fixes tree and commit:

  fb8d350c291c ("tty: hvc, drop unneeded forward declarations")

from the tty tree.

I fixed it up (they both removed the forward decalrartion of
hvcs_remove(), but the latter removed more) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/9xWkDb4+9_2nx0jSjYMefla
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBBg9MACgkQAVBC80lX
0GwXiQf8DH+F4whK60DwjNEeg8slREuMDGj5efB//THFJmu1MUAsJfNIxZ+tYRwD
hIEeS9EWl6G/o28EqBe6yBsIdB4Q6/8CQD8q+0dC5rUrcnB9yGso7NdDut/aQJv1
8Xf3jbcLhafoceBARbPZ+ad4s7nGN+tbXnN8aIa5wiT2yvxaCQl23sZkHNYJGXJH
l8l9Gun1v8goZoaa/BSQr7RcNaHpBHycHRFss6QAa9nCbap67ZVAngFQYm4JuAGU
oeaH/Hbr5Ai2h3H8zEUr/Ivyyc8UK8+EWaVS9oqrXEZKdTvEBZPtMg1493pF0c4o
erVXqm+X/JvQlrNFGwLRu+DTmE32FQ==
=+4E4
-----END PGP SIGNATURE-----

--Sig_/9xWkDb4+9_2nx0jSjYMefla--
