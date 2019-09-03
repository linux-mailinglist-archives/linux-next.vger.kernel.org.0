Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C144A60C7
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 07:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfICFmg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Sep 2019 01:42:36 -0400
Received: from ozlabs.org ([203.11.71.1]:54713 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbfICFmg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Sep 2019 01:42:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Mwp06shwz9s7T;
        Tue,  3 Sep 2019 15:42:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567489353;
        bh=4QAshjM4ER/rbKtuwZWCPMrtMyIAHnxw2gh7SK0PWlk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=K7h+72f5D/cy+PoimSdCH85Y8F8s1uR0NCQeFaf6cPXyhjrpcMCBe3w89wIS+ewUM
         CMejem4DARxDSEkUGSGteIvSfjdRyXjrbGwv9Q90NOhhUzsvNMrHbpAl9oI0e1gLzh
         Av/mAdFlSeOPqZDgX8KKlEQVmoRVmk2gAoFfFDSmAMIsYrAOQVjNNwffhyRa1JI6iP
         MZhKLqrp91AjRveaCsQLNuX+ONmsRvAFy0jNKVesLit+E+RozHooAm2ld0awucMKRJ
         gIRVnf5zHZEO53SRhJBcE1klJLCR1dNunCauP1wAkDKytkducCXZoQdkH0tGeNihz+
         Vhs+NinSJCmGw==
Date:   Tue, 3 Sep 2019 15:42:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Jason Gunthorpe <jgg@mellanox.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        kbuild test robot <lkp@intel.com>
Subject: Re: linux-next: build failure after merge of the hmm tree
Message-ID: <20190903154232.636d9b3d@canb.auug.org.au>
In-Reply-To: <CAPcyv4hyEK=jA=ATyzjKbJDeQfpOyRo4pxoFCTf1LHa-muC14w@mail.gmail.com>
References: <20190902205017.3eca5b70@canb.auug.org.au>
        <20190902105137.GC20@mellanox.com>
        <20190903094511.2704484a@canb.auug.org.au>
        <CAPcyv4hyEK=jA=ATyzjKbJDeQfpOyRo4pxoFCTf1LHa-muC14w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9nyjpxpV4rf1Yo/trBf+IH6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9nyjpxpV4rf1Yo/trBf+IH6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Mon, 2 Sep 2019 22:31:00 -0700 Dan Williams <dan.j.williams@intel.com> w=
rote:
>
> On Mon, Sep 2, 2019 at 4:45 PM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > Hi Jason,
> >
> > On Mon, 2 Sep 2019 10:51:41 +0000 Jason Gunthorpe <jgg@mellanox.com> wr=
ote: =20
> > >
> > > On Mon, Sep 02, 2019 at 08:50:17PM +1000, Stephen Rothwell wrote: =20
> > > =20
> > > > ERROR: "nd_region_provider_data" [drivers/acpi/nfit/nfit.ko] undefi=
ned!
> > > > ERROR: "to_nd_blk_region" [drivers/acpi/nfit/nfit.ko] undefined!
> > > > ERROR: "nvdimm_region_notify" [drivers/acpi/nfit/nfit.ko] undefined!
> > > > ERROR: "nvdimm_blk_region_create" [drivers/acpi/nfit/nfit.ko] undef=
ined!
> > > >
> > > > Caused by commit
> > > >
> > > >   126470c8a58b ("libnvdimm: Enable unit test infrastructure compile=
 checks")
> > > >
> > > > I have reverted that commit for today. =20
> > >
> > > Looks like more kconfig trouble, can you send Dan your kconfig? I'll
> > > drop this patch again
> > > =20
> >
> > Thanks.  It was just an x86_64 allmodconfig build.  I don't actually
> > have the .config file (it gets cleaned up, sorry). =20
>=20
> Strange. x86_64 allmodconfig is certainly a 0day build target. Could
> this be toolchain dependent?

Possible, I guess.  I am cross compiling on a PowerPC LE host

$ x86_64-linux-gnu-gcc --version
x86_64-linux-gnu-gcc (Debian 9.2.1-4) 9.2.1 20190821

$ x86_64-linux-gnu-ld --version
GNU ld (GNU Binutils for Debian) 2.32.51.20190821

It could also be an interaction with something else in linux-next.
--=20
Cheers,
Stephen Rothwell

--Sig_/9nyjpxpV4rf1Yo/trBf+IH6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1t/UgACgkQAVBC80lX
0GyU5ggAgc/GarWvyXNTtugs2EAr9rchCYNiLJoswER8xyi53fApo2iYWkN8dnRp
A9luQjB3L3y1X+33SwvW4igJ9Ipq7IQ61GE76yHuFneUuuUcnxuevR1wf4SX5ASw
t5Yc4EjFKNZ36F7xhpjEtqMcsuJCu8/3wPXcNRZnHh16QBo3n7o7uTvci4fMT0Qr
8SUGpGu+dLu1pe78cnuBBMywcT4WvS0Zkliw+msLB7VIiiydaOC9bQGEMpECdRNe
oVM0CAs1pwRsI1k0AkrBDo7lb1kgY57Pts62cJz+MJMbUg3nt4nlQPh0c+tKS3FJ
txaYSe7QGbiR6AXAvNOxIqTmObb2RQ==
=StVB
-----END PGP SIGNATURE-----

--Sig_/9nyjpxpV4rf1Yo/trBf+IH6--
