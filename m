Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF6C23FD79
	for <lists+linux-next@lfdr.de>; Sun,  9 Aug 2020 10:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgHII5b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Aug 2020 04:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbgHII5b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Aug 2020 04:57:31 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E648C061756;
        Sun,  9 Aug 2020 01:57:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BPXzX25j8z9sTN;
        Sun,  9 Aug 2020 18:57:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596963449;
        bh=Wl+ZEPR2nqFKgj/Exq090s6aHL4BBMpUzG1yyNaV4Jk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W9eyRp8wR0z6syshAQ+U6lJ8V/+YzTV1SXnc7LrpSwJ3X2e203IswQFFgAYq0n5Py
         LaEM8EV+Js5zOGD1xzmDYEBrvzb0i8CxeJ+EoDsLdw1WWyVh9Kr1vYDNr8cl7g/jUx
         p1YVZgTLAXWFykvQj0T1lp3BVtpUSFAfl7Vsht222ZWD0iuYAVd+25GRax8HhdBf+c
         4eKGQ9m8sFRlBuGOaEmIi4gJLLik5hOFj8+mIUF3kBmEP2+KxhGXRHtvxdCdTb7Rv9
         SyL+ukbSy4cd+O414vfaFrpUzT8N+sXjdFSbbLIkb09vxHZgeUboMn/qsvE7FzWzaV
         zSY0PjkoKodmA==
Date:   Sun, 9 Aug 2020 18:57:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: linux-next: manual merge of the set_fs tree with the powerpc
 tree
Message-ID: <20200809185726.5d8e5f55@canb.auug.org.au>
In-Reply-To: <20200717190931.701ddf08@canb.auug.org.au>
References: <20200717190931.701ddf08@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h4YwlFL/8NIBi9n_EmMIqX8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h4YwlFL/8NIBi9n_EmMIqX8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 17 Jul 2020 19:09:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the set_fs tree got a conflict in:
>=20
>   arch/powerpc/mm/numa.c
>=20
> between commit:
>=20
>   c30f931e891e ("powerpc/numa: remove ability to enable topology updates")
>=20
> from the powerpc tree and commit:
>=20
>   16a04bde8169 ("proc: switch over direct seq_read method calls to seq_re=
ad_iter")
>=20
> from the set_fs tree.
>=20
> I fixed it up (the former removed the code updated by the latter, so I
> just did that) and can carry the fix as necessary. This is now fixed as
> far as linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

This is now a conflict between the set_fs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/h4YwlFL/8NIBi9n_EmMIqX8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8vunYACgkQAVBC80lX
0GyH2ggAgjqRQHzD2II/rJWPv7LgkrI6+O9t2qfbxLWMqOmzYHR1cV/VoW7fXEUJ
UOCJwNWGVmS12DYKt4UBudW0bOuZmLTqK09qmifOEbbOYTofa4475Gecq+j7YWxH
aI/s5VwrJdmW13K7+eaBzne1s5oRfVkQ4WDg9nUYd7NAwwOMYHYxQosuvGfaKmR0
PSgwUCYtPjgLW69Ttr5Np3pZ+3/C/txSOhxX/pmLVBtNUcJamOKFVULEzhJDG2na
lhy+QkLQ+Xn83AAgQo1qxAX3E3rUnPe7xk08SgOq6/SMxXzaqKG49Ge+2MpvOg2l
6T0JQn0uGQrMBH9ajfjRBvgjrJSvyA==
=9uU4
-----END PGP SIGNATURE-----

--Sig_/h4YwlFL/8NIBi9n_EmMIqX8--
