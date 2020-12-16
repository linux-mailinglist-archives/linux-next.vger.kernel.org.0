Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96292DB81A
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 02:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgLPBBO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 20:01:14 -0500
Received: from ozlabs.org ([203.11.71.1]:39507 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726188AbgLPBBN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Dec 2020 20:01:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CwcHd5Lmsz9sTL;
        Wed, 16 Dec 2020 12:00:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608080430;
        bh=aSaBYZfkIflggMKfKcvbPOTdT9c91/PK5SG709MYZ8w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GwivpoNQe79fL0PgEL45kjXKPHGjJaf7yMidWkoDt5zMQ294w0/WWUDynZM3RRPrL
         uAkXA6C4gHx+45g64r2AYG9dP6UZzi1VvdM2O5wRDagMaXTqRVzDdWkdy8KiC5No7T
         Lt7DsRjmkLlb8TYQacnsVT4vYuB6zIT8lO8Nte+HvAVmK1V8YDHhho3adEAhpQ+FbB
         yQ4ZaP3vYIoZLCa2uuq6vAYTsuZXZO7s5ioKXff3zo+44ITGrpKQGh3hFudzzJC9Gw
         P5YgTqMz4a3ugmhKddQZMsT81Ha1ugzqMVsXE09va/BxO3m7hiUvd4qg8ZhbMONXSI
         VN23ropABUmWw==
Date:   Wed, 16 Dec 2020 12:00:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michal Simek <monstr@monstr.eu>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the microblaze
 tree
Message-ID: <20201216120025.3901896a@canb.auug.org.au>
In-Reply-To: <1848f245-2a64-0aec-58db-b575de29debc@monstr.eu>
References: <20201210155808.717a7257@canb.auug.org.au>
        <1848f245-2a64-0aec-58db-b575de29debc@monstr.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nU+7qCCV8HQgeX7gmf_9SCu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nU+7qCCV8HQgeX7gmf_9SCu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 10 Dec 2020 15:03:23 +0100 Michal Simek <monstr@monstr.eu> wrote:
>
> On 10. 12. 20 5:58, Stephen Rothwell wrote:
> >=20
> > Today's linux-next merge of the tip tree got conflicts in:
> >=20
> >   arch/microblaze/Kconfig
> >   arch/microblaze/mm/Makefile
> >=20
> > between commit:
> >=20
> >   05cdf457477d ("microblaze: Remove noMMU code")
> >=20
> > from the microblaze tree and commit:
> >=20
> >   7ac1b26b0a72 ("microblaze/mm/highmem: Switch to generic kmap atomic")
> >=20
> > from the tip tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >  =20
>=20
> Thanks for letting me know. I will mentioned it to Linus.
> Your resolution is correct.

These are now conflicts between the microblaze tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/nU+7qCCV8HQgeX7gmf_9SCu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/ZXCkACgkQAVBC80lX
0Gz/6Qf+KvPqcUfZ1enU9a+CVkt91COqnZWFdpFikS6hWWm3dLseUuIFThXFv6z2
saFr+fExQjeIy9cmxSRIa6VDLRrGEuOgat9l8Mt5ENISAgsi3rGTMuZQ/XcQD1Em
/KAYsgYoaDjq2TL5k6vlz67Xy16AOSiWoK76VjfkiRh780BiRrRJ9BlsqNON25/9
q0sv9YjgU/IbKpyk8bnojR1fA/BxGbCBc0yfNuZHjvQb72VVLxFVJdc7mmWQA9ts
4Uo98b0SW+//ku/2F1PAyi8Jit72/J66lFqvfb91edsAMuXXr4OnVAT2eUQNRVlq
87f3oP+YYBhwjow/3YFhy9gZH+mbLw==
=qtuw
-----END PGP SIGNATURE-----

--Sig_/nU+7qCCV8HQgeX7gmf_9SCu--
