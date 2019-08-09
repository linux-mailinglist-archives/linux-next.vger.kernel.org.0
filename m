Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 672A18700D
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 05:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732375AbfHIDIP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 23:08:15 -0400
Received: from ozlabs.org ([203.11.71.1]:45295 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729503AbfHIDIP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Aug 2019 23:08:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 464VYS2k9Zz9sND;
        Fri,  9 Aug 2019 13:08:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565320092;
        bh=UwHKXiM1jL2kp/zSJ7li0egdaFzN7VooB3guDS4RRns=;
        h=Date:From:To:Cc:Subject:From;
        b=DFl4qOwxUnXyYKCcFq1bXTBxWVDOitVTXfyUjEsNfOQpQFMx0o1FnKfiH0vkr88dC
         Nk/iPDN5Wkviahe0GjuuYef9AfI67VuCvFqie5VnsT9AgH5Sk74GMLwH0+N8fIUM0P
         5Bm3hariI8qoIpXtzjGBIIpP6nksICP0199eLInvRnE5SdmN+1SjSMZNbF8OkwKCND
         pLD9tYLUqwgDbYn/z0Hda97sTr8wNB8VxnoGkDE1/I7dFwCBE1XWfu7oXWZw3hpZwx
         JlQ8iuhxc7UNNWdnVH+f4puhjrmvU4DtTdoJvLZga9BUbX+01S9rlNWgjJpNyw1qW5
         QLiSWcAcC+Z3A==
Date:   Fri, 9 Aug 2019 13:08:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20190809130811.58eb1d78@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DBvIh+mnMeOiQxTxlA/O8t.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DBvIh+mnMeOiQxTxlA/O8t.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/kobject.h:19,
                 from include/linux/device.h:16,
                 from include/sound/hdaudio.h:9,
                 from include/sound/hdaudio_ext.h:5,
                 from sound/soc/sof/intel/hda-dsp.c:18:
sound/soc/sof/intel/hda-dsp.c: In function 'hda_resume':
sound/soc/sof/intel/hda-dsp.c:360:22: error: 'hlink' undeclared (first use =
in this function)
  list_for_each_entry(hlink, &bus->hlink_list, list)
                      ^~~~~
include/linux/list.h:577:7: note: in definition of macro 'list_for_each_ent=
ry'
  for (pos =3D list_first_entry(head, typeof(*pos), member); \
       ^~~
sound/soc/sof/intel/hda-dsp.c:360:22: note: each undeclared identifier is r=
eported only once for each function it appears in
  list_for_each_entry(hlink, &bus->hlink_list, list)
                      ^~~~~
include/linux/list.h:577:7: note: in definition of macro 'list_for_each_ent=
ry'
  for (pos =3D list_first_entry(head, typeof(*pos), member); \
       ^~~
In file included from include/linux/list.h:9,
                 from include/linux/kobject.h:19,
                 from include/linux/device.h:16,
                 from include/sound/hdaudio.h:9,
                 from include/sound/hdaudio_ext.h:5,
                 from sound/soc/sof/intel/hda-dsp.c:18:
sound/soc/sof/intel/hda-dsp.c:360:30: error: 'bus' undeclared (first use in=
 this function)
  list_for_each_entry(hlink, &bus->hlink_list, list)
                              ^~~
include/linux/kernel.h:972:26: note: in definition of macro 'container_of'
  void *__mptr =3D (void *)(ptr);     \
                          ^~~
include/linux/list.h:490:2: note: in expansion of macro 'list_entry'
  list_entry((ptr)->next, type, member)
  ^~~~~~~~~~
include/linux/list.h:577:13: note: in expansion of macro 'list_first_entry'
  for (pos =3D list_first_entry(head, typeof(*pos), member); \
             ^~~~~~~~~~~~~~~~
sound/soc/sof/intel/hda-dsp.c:360:2: note: in expansion of macro 'list_for_=
each_entry'
  list_for_each_entry(hlink, &bus->hlink_list, list)
  ^~~~~~~~~~~~~~~~~~~
sound/soc/sof/intel/hda-dsp.c:364:2: error: #else without #if
 #else
  ^~~~
sound/soc/sof/intel/hda-dsp.c:390:2: error: #endif without #if
 #endif
  ^~~~~

Caused by commit

  c2f16a94a804 ("Merge branch 'topic/hda-bus-ops-cleanup' of https://git.ke=
rnel.org/pub/scm/linux/kernel/git/tiwai/sound into asoc-5.4")

Looks like the merge resolution is not quite right.

I have used the sound-asoc tree from next-20190808 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/DBvIh+mnMeOiQxTxlA/O8t.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1M45sACgkQAVBC80lX
0GyvTwf9H0wiWVDj0ZH3GBqnTWJkS2wgHhsR9DIkhjkkOv8x5tX02O9l1N2A9omR
IW4ninJN7AHyhxMJUuBv8ajIJTS50LmsYEi41bOrMGwLPXeeTtVSE1LsncNnxNC3
x7QOqcgMCu92zo+2Mio1eyCXuHI0uYzUHaI7b/9XV9WpJVQanjKfaDYFcTCDXswN
b8MkLZOiRyxygz4U6S6gQZrhQU7Z52EKDQqESabFfm5IF+nFMWd6rGHcZ80UdXZo
lDKuJEqNvaVBJg95+vg9gH+zZMu8gbGxKwCwwMfuJx0a9Yv++9YrPXDoY0V5Qd2h
zHrcR7N0OAqnNKMnffVM8NWE72qYQQ==
=EJYJ
-----END PGP SIGNATURE-----

--Sig_/DBvIh+mnMeOiQxTxlA/O8t.--
