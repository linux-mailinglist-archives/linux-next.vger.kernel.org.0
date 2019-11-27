Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB1E10A7A6
	for <lists+linux-next@lfdr.de>; Wed, 27 Nov 2019 01:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfK0AsY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Nov 2019 19:48:24 -0500
Received: from ozlabs.org ([203.11.71.1]:42611 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbfK0AsY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Nov 2019 19:48:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47N2FH6xq3z9sSd;
        Wed, 27 Nov 2019 11:48:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574815701;
        bh=BXusIggVC9k4+wds3dOgGJl8vuB5qxXlzp0EirQxxqk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ODN2sKlC//KFOfC5S8bkIITY4sCJN0g6THULbhD/qIq2wIkRp4WF1Rg0defQ9dLNd
         L99Fwb55iyrASuQi5bMdIwf7AqszR6Dmnedw7ankMCELWhjhLJIu9fr3TmYR6P42NO
         XFuUJSsIgR2XdL7kBsee1yYRBl0EA/SfQcb0N7RZejOvn6dfDuIlDvh5P9N90gf+SG
         NfcsbvwnAL6HxRCGY0j9/xuo4107C4sn4xQ532mD12dELDrsYlbVHWt0c+cHGotcwa
         8wwvxabZbe9Qn16kff4nSQiTIu4hKZXqXnqSawqIIjHew04g/upGVgeh24q/xTe9z/
         vsXBSeCh8f9qg==
Date:   Wed, 27 Nov 2019 11:48:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the livepatching tree with the
 ftrace tree
Message-ID: <20191127114817.71a3b7e9@canb.auug.org.au>
In-Reply-To: <20191115160319.2d84224d@canb.auug.org.au>
References: <20191115160319.2d84224d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VB+fl6/58ufvg.zbEUmWxMx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VB+fl6/58ufvg.zbEUmWxMx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 15 Nov 2019 16:03:19 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the livepatching tree got a conflict in:
>=20
>   tools/testing/selftests/livepatch/Makefile
>=20
> between commit:
>=20
>   8c666d2ab576 ("selftests/livepatch: Test interaction with ftrace_enable=
d")
>=20
> from the ftrace tree and commit:
>=20
>   ecd25094c5f5 ("livepatch: Selftests of the API for tracking system stat=
e changes")
>=20
> from the livepatching tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc tools/testing/selftests/livepatch/Makefile
> index 1886d9d94b88,1cf40a9e7185..000000000000
> --- a/tools/testing/selftests/livepatch/Makefile
> +++ b/tools/testing/selftests/livepatch/Makefile
> @@@ -5,6 -5,6 +5,7 @@@ TEST_PROGS :=3D=20
>   	test-livepatch.sh \
>   	test-callbacks.sh \
>   	test-shadow-vars.sh \
> - 	test-ftrace.sh
> ++	test-ftrace.sh \
> + 	test-state.sh
>  =20
>   include ../lib.mk

This is now a conflict between the ftrace tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/VB+fl6/58ufvg.zbEUmWxMx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3dx9EACgkQAVBC80lX
0GzS3gf/Qn5nYYnS5PNzWl9MLlFhgC5arYmG2GEzKIZ0lmKMD+k0Ctj7+gqFlTRU
mY8IugFw0aX62zWAYIeiprBFkjNLESSuQvWavFYzG5T1+u43D+k6D7+5jH2jS28F
ZtI/B8Qj0ACuW8We7+DRPfJl79l9gdr+5EHFgFLrcdfnlnb8PoA88Pl1Jel3Sp1M
NRdo5vAOgurzLKCrGO+NWANna6SbmE05A7rmMwZmAAx53sWBuxASZyLRzY0RPIm+
LFlljQKV2naRCDkKv3rdaKZKk5KkPWY1qEkywGhAWhuExgQu0A/iv/c39Z/Ecuy9
9tqUipSUOgDibx0iT/tLJm0ShXWwaQ==
=53FB
-----END PGP SIGNATURE-----

--Sig_/VB+fl6/58ufvg.zbEUmWxMx--
