Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B0E2DF778
	for <lists+linux-next@lfdr.de>; Mon, 21 Dec 2020 02:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgLUBam (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Dec 2020 20:30:42 -0500
Received: from ozlabs.org ([203.11.71.1]:54407 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbgLUBam (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Dec 2020 20:30:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CzhjF3t2Cz9sTg;
        Mon, 21 Dec 2020 12:29:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608514195;
        bh=hrn8FYzYojdamBQWUGEbfvgDOXCFt95vV+2ZYM002uA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Hbop83VuW5zm4ZOrAxvq1fLPeeKF6eSBqYSKIRyI81RsXi7kwjXnail8d2w6UJZJq
         njOckOKmPfUwhI2qpDoMDEEbGNpBdE5NqoKIoQufLgcoyF25GE8VlhCG4kUydQP5SG
         3H+I8mm12AaQmLF98NR5s2Pyf+k85kyrb2Q517q0+QDTPMClanJIfgnJaIsHG1SCpp
         6vhBNpKm2Lx28OfwdXb/6ri0BGthxLqECpjC/SaCmZz5Yx4GWHpvvRHNg1R9vfOpFI
         nTIpK2OIT8fwnzdxx532e5bIsMKSNgL6Pa4AVIjIV/C2+AppctH2dXsr9VaiA8RVZB
         ByACSg9BEj2Zg==
Date:   Mon, 21 Dec 2020 12:29:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Message-ID: <20201221122952.5e34baf0@canb.auug.org.au>
In-Reply-To: <20201215071340.7d02be6e@canb.auug.org.au>
References: <20201203183740.1a1054f4@canb.auug.org.au>
        <20201215071340.7d02be6e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pm4xw0OT6AhAJ_um56l8K.C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Pm4xw0OT6AhAJ_um56l8K.C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Dec 2020 07:13:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Thu, 3 Dec 2020 18:37:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the block tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > fs/block_dev.c:1067: warning: Excess function parameter 'whole' descrip=
tion in 'bd_abort_claiming'
> >=20
> > Introduced by commit
> >=20
> >   37c3fc9abb25 ("block: simplify the block device claiming interface") =
=20
>=20
> I am still getting the above warning.

I am now getting this warning from Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pm4xw0OT6AhAJ_um56l8K.C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/f+pAACgkQAVBC80lX
0Gxc3Qf/SO3MN0RePAXXcDWFGMSWi3yYFq6NEKXcetfqQazXMOFM5B22jyohTU+8
LCKOLAJezjdS2nURtyv+97V08/kT3eTPdcgO/be079w9uxXocCcVLTsFKb7zaUO8
hLZcz11Pm+0lzacF3+fbykMycE0P1poDvA8QlgI7B50SHRHigDWYvGdutVxkBxF7
V7iGNapjNRFqD4rW4YpM1/YGVUKCKlFl7kI7+oCfmxzdkqky8uNbdGyzK3UbQb8c
X20nMQEdLDPzsw8D1hbcAoeD81ONSaM5aB8ggiYauV2x+DkHEqoXzBGgFKGWpv45
AgBDhdKZxd32Ino+1F7viIiWtq0IOg==
=TpmC
-----END PGP SIGNATURE-----

--Sig_/Pm4xw0OT6AhAJ_um56l8K.C--
