Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC6629489C
	for <lists+linux-next@lfdr.de>; Wed, 21 Oct 2020 09:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395384AbgJUHGl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Oct 2020 03:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395340AbgJUHGl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2020 03:06:41 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECCDFC0613CE;
        Wed, 21 Oct 2020 00:06:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CGM3x39q3z9sPB;
        Wed, 21 Oct 2020 18:06:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603263997;
        bh=0fppAgxi4ZG+m6PUSHdmhcdwWQQFzQNPFtkURWPtNR8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rCx5FS9b54+ZTRnEnKec63CSt2jaTQIYS5Q2EQWIS2oDHGiJNzYWH95XUo/akUh6t
         Jm3dsBthsdjng5TRuGaVCe8mqIIsuhBQ5KinZRhMaO4PGX9ebcPbTMQH2LJGUOpGPW
         UWIqOk8Efgk3yFXqfMLIgKD8iF0xJ+SCucYOg+zILFWZj6kpidCSfsBEQPNjkJHPQh
         45Elp6wXnNpC6WAVzNAg5y2DbCgrwV4slmEuZKteI2dcY/XyODK4NrWsiFTFtm+bfp
         RpLQDhJ9A4n/u7DzE91fLkAMB8BD6hAMx8DwUSIs11sHB8OGxry7chT1dV5tM1f7dV
         bJXxqmK5E1UDQ==
Date:   Wed, 21 Oct 2020 18:06:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Minchan Kim <minchan@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: Re: linux-next: manual merge of the notifications tree with Linus'
 tree
Message-ID: <20201021180636.75f3c700@canb.auug.org.au>
In-Reply-To: <20201021180255.5673c548@canb.auug.org.au>
References: <20201021124733.344e5107@canb.auug.org.au>
        <20201021180255.5673c548@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nhu3FwCKaH++n7gvDqPcc_c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nhu3FwCKaH++n7gvDqPcc_c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 21 Oct 2020 18:02:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> On Wed, 21 Oct 2020 12:47:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > diff --cc include/uapi/asm-generic/unistd.h
> > index 2056318988f7,fcdca8c7d30a..000000000000
> > --- a/include/uapi/asm-generic/unistd.h
> > +++ b/include/uapi/asm-generic/unistd.h
> > @@@ -857,8 -857,8 +857,10 @@@ __SYSCALL(__NR_openat2, sys_openat2
> >   __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
> >   #define __NR_faccessat2 439
> >   __SYSCALL(__NR_faccessat2, sys_faccessat2)
> >  -#define __NR_watch_mount 440
> >  +#define __NR_process_madvise 440
> >  +__SYSCALL(__NR_process_madvise, sys_process_madvise)
> > ++#define __NR_watch_mount 441
> > + __SYSCALL(__NR_watch_mount, sys_watch_mount)
> >  =20
> >   #undef __NR_syscalls
> >   #define __NR_syscalls 441 =20
>=20
> I missed updating __NR_syscalls to 442 which I will in tomorrow's merge
> resolution.

I presume I need to update __NR_compat_syscalls in
arch/arm64/include/asm/unistd.h as well :-(

I really don't like conflicts between new syscalls :-(
--=20
Cheers,
Stephen Rothwell

--Sig_/nhu3FwCKaH++n7gvDqPcc_c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+P3fwACgkQAVBC80lX
0GwfHQgAhNMDDn+Tu+mr+2NS7B3DHp/GROFAhMxqiJard4eWRrjHeoQmLBG2+Tgs
b0+GO2jJikvt8gcNFMRCYUS5QB6CBnCnmbyK3SSt8YH4Hyfg/HNEirzdXo6ros4A
H8Z98TdDoDei9FHjf7T4Mg0skr+7rWNcVZzvpWCP3ddrBvcAL34gvifB/N3rGhkb
DzqBQZ1goot9O72x0o8Om4LCsRL1dL3/SF36r6yH6NLmKZhHEaFRek1fz8/3WIJf
LUBQXAWnom8tf7GSxJZFyQW9dug9++qU1CYjLbfBjZfloTjRZ4e/CWQMXjjBJRNL
J5KQG3R2bo4fAg+TAWIiL9ENQA09ZQ==
=hZ3I
-----END PGP SIGNATURE-----

--Sig_/nhu3FwCKaH++n7gvDqPcc_c--
