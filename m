Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 392F28B684
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 13:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfHMLV3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 07:21:29 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46568 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfHMLV3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Aug 2019 07:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6cl01OFssHR/XT5ht+3g70knuYQXSipHg7NmEEq3cAw=; b=SiiGCcE4QG0KTs+XVes7G8eOP
        RqX/euPbmE3NZfTNxAs/TScMX4MFCppfbD7Sf7rzD6zFzAlzCXbe5JXcYxCGTjcRjOSGaq9hqTe9s
        iZdcgC3wS9WfogESZeBAOErIXyKw/esnxxz/cucwpMGNIbIfjM7d52Fr0qLG/oAxLzh10=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hxUrd-0007ko-1D; Tue, 13 Aug 2019 11:21:17 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id D31852742B44; Tue, 13 Aug 2019 12:21:15 +0100 (BST)
Date:   Tue, 13 Aug 2019 12:21:15 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20190813112115.GA5093@sirena.co.uk>
References: <20190809130811.58eb1d78@canb.auug.org.au>
 <20190813131611.6d2b8710@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <20190813131611.6d2b8710@canb.auug.org.au>
X-Cookie: Poverty begins at home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 01:16:11PM +1000, Stephen Rothwell wrote:
> On Fri, 9 Aug 2019 13:08:11 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> > sound/soc/sof/intel/hda-dsp.c: In function 'hda_resume':
> > sound/soc/sof/intel/hda-dsp.c:360:22: error: 'hlink' undeclared (first =
use in this function)
> >   list_for_each_entry(hlink, &bus->hlink_list, list)
> >                       ^~~~~
> > include/linux/list.h:577:7: note: in definition of macro 'list_for_each=
_entry'
> >   for (pos =3D list_first_entry(head, typeof(*pos), member); \
> >        ^~~
> > sound/soc/sof/intel/hda-dsp.c:360:22: note: each undeclared identifier =
is reported only once for each function it appears in
> >   list_for_each_entry(hlink, &bus->hlink_list, list)
> >                       ^~~~~
> > include/linux/list.h:577:7: note: in definition of macro 'list_for_each=
_entry'
> >   for (pos =3D list_first_entry(head, typeof(*pos), member); \
> >        ^~~
> > In file included from include/linux/list.h:9,
> >                  from include/linux/kobject.h:19,
> >                  from include/linux/device.h:16,
> >                  from include/sound/hdaudio.h:9,
> >                  from include/sound/hdaudio_ext.h:5,
> >                  from sound/soc/sof/intel/hda-dsp.c:18:
> > sound/soc/sof/intel/hda-dsp.c:360:30: error: 'bus' undeclared (first us=
e in this function)
> >   list_for_each_entry(hlink, &bus->hlink_list, list)
> >                               ^~~
> > include/linux/kernel.h:972:26: note: in definition of macro 'container_=
of'
> >   void *__mptr =3D (void *)(ptr);     \
> >                           ^~~
> > include/linux/list.h:490:2: note: in expansion of macro 'list_entry'
> >   list_entry((ptr)->next, type, member)
> >   ^~~~~~~~~~
> > include/linux/list.h:577:13: note: in expansion of macro 'list_first_en=
try'
> >   for (pos =3D list_first_entry(head, typeof(*pos), member); \
> >              ^~~~~~~~~~~~~~~~
> > sound/soc/sof/intel/hda-dsp.c:360:2: note: in expansion of macro 'list_=
for_each_entry'
> >   list_for_each_entry(hlink, &bus->hlink_list, list)
> >   ^~~~~~~~~~~~~~~~~~~
> > sound/soc/sof/intel/hda-dsp.c:364:2: error: #else without #if
> >  #else
> >   ^~~~
> > sound/soc/sof/intel/hda-dsp.c:390:2: error: #endif without #if
> >  #endif
> >   ^~~~~
> >=20
> > Caused by commit
> >=20
> >   c2f16a94a804 ("Merge branch 'topic/hda-bus-ops-cleanup' of https://gi=
t.kernel.org/pub/scm/linux/kernel/git/tiwai/sound into asoc-5.4")
> >=20
> > Looks like the merge resolution is not quite right.
> >=20
> > I have used the sound-asoc tree from next-20190808 for today.

> I am still getting this failure ...

Intel people, any thoughts?

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1SnSkACgkQJNaLcl1U
h9CvYwf/W/QYqhEeSoCrLId1CN7b8D8dat0HRvuLo5yGd5ZnhxGF+wzBCU3o5ANs
14l243z26XGxGJ4phmPlmUJcAQDBKpTMBeSjcImx4dKhqJ69DC8rLOmhRj/AUHKC
75u2dA1UZRoqSvun0MBhHK5yHGwg6miIiueyFdftfrZjBS6OOECF4NHzvynVWbOx
Ebj1OjSHlOh/eWUgvsIg4/rkRV3rL0zozYBv8QgcZl+0WrfU/q8bMNlEEt4zOgJS
RHsKtb/7gm4KFOm1n54c9AP58Ok//Vxp4qftJluV5/GuMK8O3tnCRdoVtSqusK9Z
HJVKtKqvonPvyI3/rwLMtlYcuv7/aw==
=Ekyy
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
