Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B7B3D3002
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 01:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbhGVWVE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jul 2021 18:21:04 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34655 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232024AbhGVWVE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jul 2021 18:21:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GW7HP30r1z9sS8;
        Fri, 23 Jul 2021 09:01:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626994897;
        bh=3fm04KsHELrlYCHVj44lMB2kqBfysC7gl0tV53c3epI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CyFu6CIDE6JV9i1QT03cDPDUUyZQv2FfHEubCRohL4UJAxwHc+2W3cwjRhJJrDW2Q
         PBiZJGCwXYcWKg73TAIrt6mIJlze8lUTnLcOdRG0e58OvuirVBCqqyxp3T4wjcq1ZX
         7401WZ4PkSPVO0w5GdICXMjA0ltquPkjaCYB0gofpcPtCYi+znLxk9m+7Zf8LQUeXB
         PSPBdvQm8mhyZTSlu07bQPMFvdtG+TAz9RIsCxGsAE1zfSMY56234YrzQ+dEMLXz69
         TqxAf+O59knTnrWgIX2T6yV6jZB+wwl9q01heZbx1DC1sXETTWkyu2MH3Ty6tf/wD6
         IkQknUI0e7XfQ==
Date:   Fri, 23 Jul 2021 09:01:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Chris Down <chris@chrisdown.name>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20210723090136.04ca2091@canb.auug.org.au>
In-Reply-To: <20210720174300.018cc765@canb.auug.org.au>
References: <20210720174300.018cc765@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/85YQOh=ECckP4nDd/Q17x0G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/85YQOh=ECckP4nDd/Q17x0G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 20 Jul 2021 17:43:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the printk tree, today's linux-next build (mips allnoconfig)
> failed like this:
>=20
> arch/mips/kernel/genex.o: In function `handle_mcheck_int':
> (.text+0x190c): undefined reference to `printk'
> arch/mips/kernel/genex.o: In function `handle_reserved_int':
> (.text+0x1c8c): undefined reference to `printk'
>=20
> Caused by commit
>=20
>   337015573718 ("printk: Userspace format indexing support")

I am still getting these failures.
--=20
Cheers,
Stephen Rothwell

--Sig_/85YQOh=ECckP4nDd/Q17x0G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD5+NAACgkQAVBC80lX
0GwK2Af8DbveZ3TsSN1vxhZGbl/fGYk2d84+Q7bSCmu4jPa+R/VvsJoX11kNd37j
HoqPQ/czlt54inbjKm2Odnxr5dq8Mcz9Z4kDI+JbRf83RQ/p5mCcKe7DTAoPmDvQ
X3ImYhEIUulgQSSLD5wtXQG1UInBj+ngHmjKlDZk6mfeDUlREcJ5czMlO5OuGsAN
12JCTfCMxaRsLHyJ4L2WHi4EWfXvOZvISLHDWNAyFXJJc5uxEsDwJgD5M03iom5K
SPbQ7cvxxKXYJUdwSoRPWGUw1zmxsfwZNlyoPhR9Kd4UPvKdQAIl3ys16juosqUj
UmRhc6PYHDDGfiMXLR87VqCo4LhdrA==
=N6d1
-----END PGP SIGNATURE-----

--Sig_/85YQOh=ECckP4nDd/Q17x0G--
