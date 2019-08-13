Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A77238AD17
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 05:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfHMDQO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 23:16:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41587 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727064AbfHMDQO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 23:16:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466yXq4zK8z9sND;
        Tue, 13 Aug 2019 13:16:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565666171;
        bh=dmS1vUryG/NssiQnUHqe7M4xKFDhBiJSovCkiCc/Sn8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EidlyDnJDIMUu26l/JKs5ZoOmYzoSSb8Z6UFiVvjpWxT13BcsBblKl5kUVKSRUUZQ
         qY8iS/57yoTsv8ncPgaHPuBAYzU0nKf04cJFBSZpEnGu7Gdk49nY9XgvYDnGjCsidm
         BdPtrAtovvv5pPzM2xFWAANu35d+V+Lfz1k6UVWEXEV/RUvmacjiD05ymlCnr6TcnP
         FrN2gvF36Pg3TQGJeRCt4HRrBvnHlKNZpRY6s03NfmS0f6xXFEkzrt3xWuwlg3n03M
         wKM6/hFvjseP4LhoI7qn6WCvCvChiF279F+LhP3ZLoeyX6TSrVhADgz4F60S8tT4NB
         8Z1d64KOTDQig==
Date:   Tue, 13 Aug 2019 13:16:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20190813131611.6d2b8710@canb.auug.org.au>
In-Reply-To: <20190809130811.58eb1d78@canb.auug.org.au>
References: <20190809130811.58eb1d78@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XXlR37OZVpI/umYIBjhd8O9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XXlR37OZVpI/umYIBjhd8O9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 9 Aug 2019 13:08:11 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> In file included from include/linux/kobject.h:19,
>                  from include/linux/device.h:16,
>                  from include/sound/hdaudio.h:9,
>                  from include/sound/hdaudio_ext.h:5,
>                  from sound/soc/sof/intel/hda-dsp.c:18:
> sound/soc/sof/intel/hda-dsp.c: In function 'hda_resume':
> sound/soc/sof/intel/hda-dsp.c:360:22: error: 'hlink' undeclared (first us=
e in this function)
>   list_for_each_entry(hlink, &bus->hlink_list, list)
>                       ^~~~~
> include/linux/list.h:577:7: note: in definition of macro 'list_for_each_e=
ntry'
>   for (pos =3D list_first_entry(head, typeof(*pos), member); \
>        ^~~
> sound/soc/sof/intel/hda-dsp.c:360:22: note: each undeclared identifier is=
 reported only once for each function it appears in
>   list_for_each_entry(hlink, &bus->hlink_list, list)
>                       ^~~~~
> include/linux/list.h:577:7: note: in definition of macro 'list_for_each_e=
ntry'
>   for (pos =3D list_first_entry(head, typeof(*pos), member); \
>        ^~~
> In file included from include/linux/list.h:9,
>                  from include/linux/kobject.h:19,
>                  from include/linux/device.h:16,
>                  from include/sound/hdaudio.h:9,
>                  from include/sound/hdaudio_ext.h:5,
>                  from sound/soc/sof/intel/hda-dsp.c:18:
> sound/soc/sof/intel/hda-dsp.c:360:30: error: 'bus' undeclared (first use =
in this function)
>   list_for_each_entry(hlink, &bus->hlink_list, list)
>                               ^~~
> include/linux/kernel.h:972:26: note: in definition of macro 'container_of'
>   void *__mptr =3D (void *)(ptr);     \
>                           ^~~
> include/linux/list.h:490:2: note: in expansion of macro 'list_entry'
>   list_entry((ptr)->next, type, member)
>   ^~~~~~~~~~
> include/linux/list.h:577:13: note: in expansion of macro 'list_first_entr=
y'
>   for (pos =3D list_first_entry(head, typeof(*pos), member); \
>              ^~~~~~~~~~~~~~~~
> sound/soc/sof/intel/hda-dsp.c:360:2: note: in expansion of macro 'list_fo=
r_each_entry'
>   list_for_each_entry(hlink, &bus->hlink_list, list)
>   ^~~~~~~~~~~~~~~~~~~
> sound/soc/sof/intel/hda-dsp.c:364:2: error: #else without #if
>  #else
>   ^~~~
> sound/soc/sof/intel/hda-dsp.c:390:2: error: #endif without #if
>  #endif
>   ^~~~~
>=20
> Caused by commit
>=20
>   c2f16a94a804 ("Merge branch 'topic/hda-bus-ops-cleanup' of https://git.=
kernel.org/pub/scm/linux/kernel/git/tiwai/sound into asoc-5.4")
>=20
> Looks like the merge resolution is not quite right.
>=20
> I have used the sound-asoc tree from next-20190808 for today.

I am still getting this failure ...
--=20
Cheers,
Stephen Rothwell

--Sig_/XXlR37OZVpI/umYIBjhd8O9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1SK3sACgkQAVBC80lX
0GxebggAm+2PVT9KHHm+6QU3UMx4W2WplKtEZ9IvUzk330srsxF5qhKOLWmoM5Co
wbXQ2TwxHOcxxDlYMjG08ndrH+40jjIKkprCL+7X3HJdBQqiKtmaCrZp+flm3Gus
BZhcaPmPTXxK/UYZOy9GY9IoJWFLb42Iy5a+9FtNGfk6I9E3wOFC27mtB2wPNngJ
3BRFx/K7PKyfUA9ZnaPMVactsKPPYrqrzDRfW1nCXRLlBbZLDkhrsTHjcxSnuQye
MR469DR2NTp81ll24nxHhWrkFNjze3XQt4N7xQKNlhbrXG4cnKe67Yc1Z3eT8bxM
Ci6VgQQ0lJT06Ib118+PfBuABE+SFw==
=/Bdn
-----END PGP SIGNATURE-----

--Sig_/XXlR37OZVpI/umYIBjhd8O9--
