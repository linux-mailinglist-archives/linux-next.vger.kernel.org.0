Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27AD442465
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 00:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbhKBAAE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 20:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhKBAAD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 20:00:03 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DAFC061714;
        Mon,  1 Nov 2021 16:57:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hjqhf50brz4xbY;
        Tue,  2 Nov 2021 10:57:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635811043;
        bh=8esQ6lYRSQpn8iI/jCExJ72OMlSUoX9ZCEItGgJWlNM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hNTelzg7wPXutjJvDuUuN4yrHtiqmm9nwO2l5sogNejjM+uOECTu2/17xFe3IEOxx
         MBvipDMyPCsYdBkhOVihJxoSIwCHGTeGgEHi6xfU3tf6nwdus855GuhivdoDTwnppK
         FtHtS7l+CfUHhUF2QXuzTG4z2lVbMjRIV1gk2+VfhI/Iav+dMoiiuE/fFILT4FLOBw
         CP4K9x3lR98a7EUb1Ai6c6OCcFJ0QRIA4+UASBOfhGd3pQThrdXVIAk+5rIEfJdy7M
         o6JRgdapc+5zEZvUhZP1gJ4HLk1yQ3Nc501A4VYP+9Ot3MsWLkwfKnlbnUD5rH4Sef
         si7/2wU46qMBw==
Date:   Tue, 2 Nov 2021 10:57:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the gfs2 tree
Message-ID: <20211102105720.091d21e2@canb.auug.org.au>
In-Reply-To: <20211015150420.617125bd@canb.auug.org.au>
References: <20211015150420.617125bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DB2Flx69xkQxikKjyLxZL/.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DB2Flx69xkQxikKjyLxZL/.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 15 Oct 2021 15:04:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/x86/kernel/fpu/signal.c
>=20
> between commit:
>=20
>   4303543bac16 ("gup: Turn fault_in_pages_{readable,writeable} into fault=
_in_{readable,writeable}")
>=20
> from the gfs2 tree and commits:
>=20
>   fcfb7163329c ("x86/fpu/signal: Move xstate clearing out of copy_fpregs_=
to_sigframe()")
>   a2a8fd9a3efd ("x86/fpu/signal: Change return code of restore_fpregs_fro=
m_user() to boolean")
>=20
> from the tip tree.
>=20
> I fixed it up (I used the latter version - see below) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
>=20
> diff --cc arch/x86/kernel/fpu/signal.c
> index 164c96434704,37dbfed29d75..000000000000
> --- a/arch/x86/kernel/fpu/signal.c
> +++ b/arch/x86/kernel/fpu/signal.c
> @@@ -275,12 -283,12 +283,12 @@@ retry
>   		fpregs_unlock();
>  =20
>   		/* Try to handle #PF, but anything else is fatal. */
> - 		if (ret !=3D -EFAULT)
> - 			return -EINVAL;
> + 		if (ret !=3D X86_TRAP_PF)
> + 			return false;
>  =20
>  -		if (!fault_in_pages_readable(buf, size))
>  +		if (!fault_in_readable(buf, size))
>   			goto retry;
> - 		return -EFAULT;
> + 		return false;
>   	}
>  =20
>   	/*

This is now a conflict between Linus' tree and the gfs2 tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/DB2Flx69xkQxikKjyLxZL/.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGAfuAACgkQAVBC80lX
0GyS7gf+M5ISOwmRUBs4FOiAsP7uZ1CMV+W6ASqd6UHfwTBzhhz1kbAzEdWG5Nrd
Qix2cI/R1oSLWIIWHejC93z1+r+6mRXZoueAOuTo5unSxPactobOF7An7Ole0+S4
9Mk/qUjH5BYeEXbJC7Zh1Nrvi5Z52ESdgYKQKYH36VxUQI5OU14GaIZI88Om/Igx
nmPCAfdZYCbHwnCy2PDJ09ZYgIFYNpJWOb5Pjs3d4PM74ap+5UnWuU/W7oXVDBPi
fQz/0JPBpqtJoXad7+g85CgMKjb0kpUcTHR6miMV5kvSX/fiLazhYO37jVWFEm4X
jpzYKRlXvrZarzUCmyarxbhhmjhYTw==
=gxkG
-----END PGP SIGNATURE-----

--Sig_/DB2Flx69xkQxikKjyLxZL/.--
