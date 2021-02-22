Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55F33222C9
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 00:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhBVXul (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 18:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbhBVXuk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2021 18:50:40 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB15C061574;
        Mon, 22 Feb 2021 15:50:00 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkzSK0pcNz9sSC;
        Tue, 23 Feb 2021 10:49:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614037795;
        bh=pX0WYdPuB6nv8cg3kUdrKd2A841m2wNDY//CSlQG4cE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ljC/1Jb1//43GKjkVW+9pgrLIXZFAJko8/80nMMcm83KyLX/m5oU9C4RSW0V3MX7U
         VDG3RiUlXFC1GoMVDRVenIA0Ajhwtvres0G3ypg5WWDoaChMZZmdxVc+Nv4gxuFrfZ
         y1thulL7ip3Oh14RWx8wpT1foUsZ+T6GDSRNr/ftz97RwVxZ1iwf/UX378la7XvcSB
         PeRCU4YcUzwOgNNBNwBb0wyVD2yaiZQ46au2HlnVj8m1ArX6oi1vAwcW8bTwbWZVWk
         1PI6oECDqMaRp1Wl3VObdcVybG5ch04a3DjT1cLUJrdjBd3al4Gcq1vFiSQVf+uzTp
         xnPwCOGr+4O0Q==
Date:   Tue, 23 Feb 2021 10:49:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: linux-next: manual merge of the kspp tree with the mips tree
Message-ID: <20210223104950.1f754320@canb.auug.org.au>
In-Reply-To: <20210215074726.60c45281@canb.auug.org.au>
References: <20210118150804.378ac9f3@canb.auug.org.au>
        <20210215074726.60c45281@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_L.V5b/u7kTB1oSiHwMFBW2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_L.V5b/u7kTB1oSiHwMFBW2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 07:47:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Mon, 18 Jan 2021 15:08:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > Today's linux-next merge of the kspp tree got a conflict in:
> >=20
> >   include/asm-generic/vmlinux.lds.h
> >=20
> > between commits:
> >=20
> >   9a427556fb8e ("vmlinux.lds.hf41b233de0ae: catch compound literals int=
o data and BSS")
> >   f41b233de0ae ("vmlinux.lds.h: catch UBSAN's "unnamed data" into data")
> >=20
> > from the mips tree and commit:
> >=20
> >   dc5723b02e52 ("kbuild: add support for Clang LTO")
> >=20
> > from the kspp tree.
> >=20
> > I fixed it up (9a427556fb8e and dc5723b02e52 made the same change to
> > DATA_MAIN, which conflicted with the change in f41b233de0ae) and can
> > carry the fix as necessary. This is now fixed as far as linux-next is
> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging. You may
> > also want to consider cooperating with the maintainer of the
> > conflicting tree to minimise any particularly complex conflicts. =20
>=20
> With the merge window about to open, this is a reminder that this
> conflict still exists.

This is now a conflict between the kspp tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/_L.V5b/u7kTB1oSiHwMFBW2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA0Qx4ACgkQAVBC80lX
0GzvaAf/exYfZ63fFOXiiAaFP0uHEBIhRhM1t9R/hMH1ktuFdwluNFDAWb6tryej
CJt3LHk8CZTyvc4MlaZgAWW/VaGFyJKsN+EjBl5Q8oIMyn2RlazhZfLx7ZA3n1jL
d1q9xh4fK8xhKxzF0TAlsTm2QumF7b5pl7YOy6a7ISmc5qmw25UP7goVve1bHrYH
/QbYVIXBi9azya06tYhrMYd9+HlD7tq7wibcoHIDtb+uIRnIldxrEMQXmMzkYSPQ
M1gGAsLMHoy54ClkMkmvKWoaSwGsUrK9ZpkkaLomJM1ZTtJUzJcPXVZtPmIKRClc
NxoSGrm49gW3acu4n124c1w852dJVg==
=4lJh
-----END PGP SIGNATURE-----

--Sig_/_L.V5b/u7kTB1oSiHwMFBW2--
