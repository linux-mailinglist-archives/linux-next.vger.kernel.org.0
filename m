Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0C3215254
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 08:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbgGFGDN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 02:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728794AbgGFGDN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jul 2020 02:03:13 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323C0C061794;
        Sun,  5 Jul 2020 23:03:13 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0Zk73HQjz9sSd;
        Mon,  6 Jul 2020 16:03:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594015391;
        bh=0dVbgKA28kBMMBn0W8j637PFOw6QisU9Bne1J5W6tps=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d+MXpCRUAhoHu5HNI1G0Mga9ezKCdIyXG12yoM7HpjftlIGsQBLkCcTKWpVJKC4XJ
         qDN8AXORH2RBrgh6xvfMrswwhfp0tBBqQ9Sm2R5DfIwp4AsYMU3z8w7WXWINu9Y9Cu
         ucQi+qnXUOsQQMoTVrpSC+lpPQOz2+6/WI0smLrLq31ouzEXQxr6gqemvrGpIEb5ZZ
         +DqXNJhtZ3a6bsbdneJ4Aewl6LpqfVOMO/c6S8OL6kfA5phafAIKi42q2nks9XGNac
         RPB9BHyaE8HK38mB7fshakwGP4qSSKpkQJgjKD/7lcazCGm2F69epBvH5lSGFNFsR5
         9pIP2FWpB2rEw==
Date:   Mon, 6 Jul 2020 16:03:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Dave Jiang <dave.jiang@intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the dmaengine tree with the
 dmaengine-fixes tree
Message-ID: <20200706160309.5f03bb2e@canb.auug.org.au>
In-Reply-To: <20200706044146.GA633187@vkoul-mobl>
References: <20200706135621.0113ebf9@canb.auug.org.au>
        <d3af0beb-1548-7ad3-fb30-f768303b8701@intel.com>
        <20200706044146.GA633187@vkoul-mobl>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XjV3lD+3dMo0pP=hZje_G/N";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XjV3lD+3dMo0pP=hZje_G/N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Jul 2020 10:11:46 +0530 Vinod Koul <vkoul@kernel.org> wrote:
>
> On 05-07-20, 21:23, Dave Jiang wrote:
> >=20
> > On 7/5/2020 8:56 PM, Stephen Rothwell wrote: =20
> > >=20
> > > Today's linux-next merge of the dmaengine tree got a conflict in:
> > >=20
> > >    drivers/dma/idxd/sysfs.c
> > >=20
> > > between commit:
> > >=20
> > >    da32b28c95a7 ("dmaengine: idxd: cleanup workqueue config after dis=
abling")
> > >=20
> > > from the dmaengine-fixes tree and commit:
> > >=20
> > >    f50b150e315e ("dmaengine: idxd: add work queue drain support")
> > >=20
> > > from the dmaengine tree.
> > >=20
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your t=
ree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particula=
rly
> > > complex conflicts.
> > >  =20
> >=20
> > Hi Stephen. Thanks for the fixup. I think there are two more bits that =
are
> > needed from f50b150e315e if you don't mind adding: =20
>=20
> I will merge the fixes into next so it should be resolved for tomorrow,

Thanks,

> >=20
> > diff --cc drivers/dma/idxd/sysfs.c
> > index 2e2c5082f322,6f0711a822a1..000000000000
> > --- a/drivers/dma/idxd/sysfs.c
> > +++ b/drivers/dma/idxd/sysfs.c
> > @@@ -313,14 -303,7 +303,12 @@@ static int idxd_config_bus_remove(struc
> >   		}
> >=20
> >   		idxd_unregister_dma_device(idxd);
> > - 		spin_lock_irqsave(&idxd->dev_lock, flags);
> >   		rc =3D idxd_device_disable(idxd);
> >  +		for (i =3D 0; i < idxd->max_wqs; i++) {
> >  +			struct idxd_wq *wq =3D &idxd->wqs[i];
> >  +
> >  =20
> > >			mutex_lock(&wq->wq_lock); =20
> >=20
> >  +			idxd_wq_disable_cleanup(wq);
> >  =20
> > >			mutex_unlock(&wq->wq_lock); =20
> >=20
> >  +		}
> > - 		spin_unlock_irqrestore(&idxd->dev_lock, flags);
> >   		module_put(THIS_MODULE);
> >   		if (rc < 0)
> >   			dev_warn(dev, "Device disable failed\n"); =20
>=20

I added that fix up by hand today just in case it matters for testing.

--=20
Cheers,
Stephen Rothwell

--Sig_/XjV3lD+3dMo0pP=hZje_G/N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Cvp0ACgkQAVBC80lX
0Gwj8wf/ejKWL6zYT0covN4Jt2g7CUOaT1qaCRVWCxFhtNbLLzQ66fPBzftpXepu
nchyqfs2n+P9SNjCyFPrBEpr3PrHxEwNWc20Hc6sZZ+3EQKmibifZ8m0XiATTaXk
d3mRhgjZeB6CtH5ioiK/5kXNtfmKPYi7Rve2+xVAywbv999t2Raddpdbiq9d2f3I
B/mpq6/pFS+vb2c/XNLgb45iEhu7iQog6zQR2mwW6VdBW0ib08w82Jkp9yh6350v
aDUcX4JVn41hDPHExDfb/fEvagdOeCyoVF4l26OUObXLX32cZGD90UhUOug7uGSb
AGS4JZfRYsm4ugNotH6hhb0+Ut8ojQ==
=RUvX
-----END PGP SIGNATURE-----

--Sig_/XjV3lD+3dMo0pP=hZje_G/N--
