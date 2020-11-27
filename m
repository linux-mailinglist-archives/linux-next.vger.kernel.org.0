Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E782C6CFC
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 22:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgK0Vpu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 16:45:50 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48849 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732380AbgK0VpF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Nov 2020 16:45:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CjSnV5F0qz9s0b;
        Sat, 28 Nov 2020 08:44:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606513455;
        bh=ub5PZnR5+XaV7QtxRqzhr61Zeo2CaES2yY+8j2LiOBo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VyJTWwTQs6JyWRW7wCopRXFaKqEqIeXynFXJyza6Ft0CgHRrEbzonwAeSwjfD35CU
         YFEbFd6pqOvHPArAMQ/DgSY3KflMm7EPAgUbdZEoADNwZU9hD5TjeWh5S0AkIZCSDb
         xbFr3QkVmT2wDfSP2IMqo4MNiQtjJ9q4N8wiAfXSX5J4aZ1EdsZNlrIvrBor7fl86T
         8AUzVocijT6MxtJR2OLPAAYUboQXYlvVXots2bZre7XLE7cshXvWaRMsCUxpRqIjvf
         qbwxgj9cOyTsBSR9rUlCPvk2g3mo5XeTVjLxRhgD4lA5/2ju9V1KvCXPgB/BOIrysR
         CTFsbznxgOkYQ==
Date:   Sat, 28 Nov 2020 08:44:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: linux-next: Tree for Nov 27 (parisc: signal flags)
Message-ID: <20201128084414.3daa87d2@canb.auug.org.au>
In-Reply-To: <155a20fd-09c4-df35-9cc6-8526a89c2933@infradead.org>
References: <20201127200457.1ffb6aaf@canb.auug.org.au>
        <155a20fd-09c4-df35-9cc6-8526a89c2933@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wQycoIya6A4=Fb8SpZ=hKS4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wQycoIya6A4=Fb8SpZ=hKS4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 27 Nov 2020 10:43:07 -0800 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> On 11/27/20 1:04 AM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20201126:
> >  =20
>=20
> on parisc, _SA_SIGGFAULT is undefined and causing build errors.
>=20
> commit 23acdc76f1798b090bb9dcc90671cd29d929834e
> Author: Peter Collingbourne <pcc@google.com>
> Date:   Thu Nov 12 18:53:34 2020 -0800
>=20
>     signal: clear non-uapi flag bits when passing/returning sa_flags
>=20
>=20
>=20
> _SA_SIGGFAULT is not used or defined anywhere else in the
> kernel source tree.


_SA_SIGGFAULT was removed by commit

  41f5a81c07cd ("parisc: Drop HP-UX specific fcntl and signal flags")

which was added to Linus' tree in v5.10-rc1.

--=20
Cheers,
Stephen Rothwell

--Sig_/wQycoIya6A4=Fb8SpZ=hKS4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Bcy4ACgkQAVBC80lX
0GxIdQf+Jf2y/pnPzPbXSLELtuT+08SDoBstIe5ZBx9ZNjJe9928V543Pp8dT4ff
zdglHKyu/Jx1A4PGzK1pEJUgpk50B0SGg3wMrnSW0SA3PdAjeSiurfzblGhS8DJH
RioYdjqZrOwbNAAwX2nOwFSKDZclRkcgUuYyWBWz7bpKxbHKQYMLQEh3pNAQUSKt
Fxfrfs/7XweCZYWV+wuBPeyyQ0bit69A9c/xVvTlPDNvj98ttFK7wYEimXYYj+Li
rt1rQCQmZdwvr6LjtkZcA//vo++4D1selopI1E5+eQe9UeaNOg4kXXtRlFrTsht3
yPIisKYL7+TeH78VwIVi0dOhIJgtGg==
=Qxxn
-----END PGP SIGNATURE-----

--Sig_/wQycoIya6A4=Fb8SpZ=hKS4--
