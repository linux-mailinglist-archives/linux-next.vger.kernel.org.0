Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 062F01844ED
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 11:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgCMKaC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 06:30:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59629 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbgCMKaC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 06:30:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48f2531Yv2z9sPF;
        Fri, 13 Mar 2020 21:29:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584095400;
        bh=ennX8Om0QSmahoMa7c4vE0YoL0FkwJ9Ez20dcvWxNck=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bPutInDY0Yvo5NvIeS90Ri92Wk3oJLBT58/IKabBPDbeyDatP9vTcOsuAPL1TYlBR
         xyzKD76C9QDbU9b4mojQZQlhJ5qx4yJksL15dLXjBpuVrP9AslHvQR33icU7nlC9vJ
         6IsyyUJXpxL6UoDVeP57qxLXt9ncC6aULzs9zRfRI+8pvpjRtzs65T8dC5/HTGEBET
         +kNriPabv+WcmugXM99bL5vl2p7I23py3bTf3n4/bGTewoOSpsWRReYL2Es1HsMY10
         p7i1Xub0JsjNx3Yv+roXnjeiThfRlzJMW0FiHxQdtGc91rLkGL+jTNucXU21L1TBiI
         kf4Xqi0w/NQug==
Date:   Fri, 13 Mar 2020 21:29:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Message-ID: <20200313212955.753f3cd2@canb.auug.org.au>
In-Reply-To: <20200313080209.0c36c2b7@coco.lan>
References: <20200313131903.3975cdd2@canb.auug.org.au>
        <20200313080209.0c36c2b7@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.tCE97I2PM4KWCvibytdaN+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.tCE97I2PM4KWCvibytdaN+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Fri, 13 Mar 2020 08:07:35 +0100 Mauro Carvalho Chehab <mchehab@kernel.or=
g> wrote:
>
> Em Fri, 13 Mar 2020 13:19:03 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
>=20
> > After merging the v4l-dvb tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > ERROR: modpost: "fwnode_get_name" [drivers/media/v4l2-core/v4l2-fwnode.=
ko] undefined!
> >=20
> > Caused by commit
> >=20
> >   dfc22c073b78 ("media: v4l2-fwnode: add initial connector parsing supp=
ort")
> >=20
> > I have used the v4l-dvb tree from next-20200312 for today. =20
> =20
> Hmm... I double-checked at next-20200312. This function is defined
> at linux/property.h header:
>=20
> 	include/linux/property.h:const char *fwnode_get_name(const struct fwnode=
_handle *fwnode);
>=20
> Its implementation is at drivers/base/property.c, and this is always
> built, according with drivers/base/Makefile:
>=20
> 	obj-y			:=3D component.o core.o bus.o dd.o syscore.o \
> 				   driver.o class.o platform.o \
> 				   cpu.o firmware.o init.o map.o devres.o \
> 				   attribute_container.o transport_class.o \
> 				   topology.o container.o property.o cacheinfo.o \
> 				   devcon.o swnode.o
>=20
> The v4l2-fwnode.c properly includes include/linux/property.h.
>=20
> So, at least up to next-20200312, everything looks fine on my eyes.
>=20
> The header is probably there, as the error happened at link stage.
>=20
> Maybe there is some merge conflict caused by merging a patch from
> some other tree that might have renamed or removed its implementation
> after next-20200312, or changed from obj-y target?
>=20
> Or maybe this changeset got reverted?
>=20
> 	a7914d1072fb ("device property: Export fwnode_get_name()")

Unfortunately, that commit is in the usb tree which I merge much later
than the v4l-dvb tree.  You should not develop against linux-next, and
you should test your tree standalone as you do not know in which order
the trees will be merged by Linus (or me).  The solutions here include
cherry-picking the commit into the v4l-dvb tree (since it is such a
simple commit and should not cause any complex conflicts) or merge part
of the usb tree into the v4l-dvb tree (which is possible since Greg
never rebases his tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/.tCE97I2PM4KWCvibytdaN+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5rYKMACgkQAVBC80lX
0Gz54ggAgX1HuNYJU8Av84cn0X2podcQTzCWZM8NxDNx1nh85AEGwut6s9Omq9N/
z4XcP9u6H4XLVze/as6kocU40cbxxBZY2TNcZfeseLWDvsOW0hIR8zdGUeqnLNUb
vwHFGfCYiVq1FcLyQX+KA31/wE0vRgw6XGaIQPJ0JYtp2eJrxB82yVu+kI71bj3F
CSJBfaycSM+GgtNyQM5RSodjUdFnF8v93GaVswsuVnhobUwD4xLHjitvs7H98Bht
mVXhEsfMRdOKU9b8FzOgqLKXV1dCkgZZCCQJUWj/QON4IGRvaeyvECVeZqLnO3tM
YJRQFEsxTuMg+u1FL1DcPVdsvrMsVw==
=DsFi
-----END PGP SIGNATURE-----

--Sig_/.tCE97I2PM4KWCvibytdaN+--
