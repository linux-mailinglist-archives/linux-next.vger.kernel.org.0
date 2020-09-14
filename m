Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0ECF2684CF
	for <lists+linux-next@lfdr.de>; Mon, 14 Sep 2020 08:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgINGYK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Sep 2020 02:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgINGYK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Sep 2020 02:24:10 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4824C06174A;
        Sun, 13 Sep 2020 23:24:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bqbsy45RSz9sTK;
        Mon, 14 Sep 2020 16:24:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600064646;
        bh=yDp0vXxjzmfSYCaoog5kzFZseJ0NfAuRuJ4WI1fMDKA=;
        h=Date:From:To:Cc:Subject:From;
        b=qt7bGQ9Ku+/iJJqEK0V1kqEEInvoX4B2ckmKmAJXsf3IK31UN45yyIUdEMECzl66E
         pwh8WUsPkW4uLEKOzYuOEr4I+H8QZeIAySeqm5EkzMqg49TFCEQtzLtzqt0VgAWKfO
         IRynojbj9ahKp+/TquyUOrgdnEhhed8MvkWVXH9xElBPWVp7E4VURKEwb3xvlTDr2S
         1KMELLgwfiz9OLOSQg0qFsuWuHvyPI5ovlHEeQFXPQoXOf3fX1NwRa3564OMGNlItn
         208+zySvdI/VF31W1UbHUyk8E9fYZpIykY72dGugo9aLx70irQGPWsGYfv+rQNRtNE
         SjNiewo1DhMJw==
Date:   Mon, 14 Sep 2020 16:24:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Message-ID: <20200914162405.4804f571@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LcfCOcGk8TxgJEc3q7a2PWK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LcfCOcGk8TxgJEc3q7a2PWK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/media/test-drivers/vidtv/vidtv_psi.c: In function 'vidtv_psi_sdt_se=
rv_get_desc_loop_len':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                   ^
include/linux/bits.h:24:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
   24 |  (BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
      |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:38:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
   38 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
      |   ^~~~~~~~~~~~~~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c:103:9: note: in expansion of m=
acro 'GENMASK'
  103 |  mask =3D GENMASK(0, 11);
      |         ^~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c: In function 'vidtv_psi_pmt_st=
ream_get_desc_loop_len':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                   ^
include/linux/bits.h:24:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
   24 |  (BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
      |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:38:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
   38 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
      |   ^~~~~~~~~~~~~~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c:118:9: note: in expansion of m=
acro 'GENMASK'
  118 |  mask =3D GENMASK(0, 9);
      |         ^~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c: In function 'vidtv_psi_pmt_ge=
t_desc_loop_len':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                   ^
include/linux/bits.h:24:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
   24 |  (BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
      |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:38:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
   38 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
      |   ^~~~~~~~~~~~~~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c:133:9: note: in expansion of m=
acro 'GENMASK'
  133 |  mask =3D GENMASK(0, 9);
      |         ^~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c: In function 'vidtv_psi_get_se=
c_len':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                   ^
include/linux/bits.h:24:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
   24 |  (BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
      |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:38:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
   38 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
      |   ^~~~~~~~~~~~~~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c:148:9: note: in expansion of m=
acro 'GENMASK'
  148 |  mask =3D GENMASK(0, 11);
      |         ^~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c: In function 'vidtv_psi_get_pa=
t_program_pid':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                   ^
include/linux/bits.h:24:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
   24 |  (BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
      |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:38:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
   38 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
      |   ^~~~~~~~~~~~~~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c:163:9: note: in expansion of m=
acro 'GENMASK'
  163 |  mask =3D GENMASK(0, 12);
      |         ^~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c: In function 'vidtv_psi_pmt_st=
ream_get_elem_pid':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                   ^
include/linux/bits.h:24:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
   24 |  (BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
      |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:38:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
   38 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
      |   ^~~~~~~~~~~~~~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c:178:9: note: in expansion of m=
acro 'GENMASK'
  178 |  mask =3D GENMASK(0, 12);
      |         ^~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c: In function 'vidtv_psi_set_se=
c_len':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                   ^
include/linux/bits.h:24:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
   24 |  (BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
      |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:38:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
   38 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
      |   ^~~~~~~~~~~~~~~~~~~
drivers/media/test-drivers/vidtv/vidtv_psi.c:209:9: note: in expansion of m=
acro 'GENMASK'
  209 |  mask =3D GENMASK(13, 15);
      |         ^~~~~~~
make[5]: *** [scripts/Makefile.build:283: drivers/media/test-drivers/vidtv/=
vidtv_psi.o] Error 1
In file included from include/linux/bits.h:22,
                 from include/linux/ratelimit_types.h:5,
                 from include/linux/printk.h:10,
                 from drivers/media/test-drivers/vidtv/vidtv_pes.c:17:
drivers/media/test-drivers/vidtv/vidtv_pes.c: In function 'vidtv_pes_write_=
pts_dts':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                   ^
include/linux/bits.h:24:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
   24 |  (BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
      |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:38:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
   38 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
      |   ^~~~~~~~~~~~~~~~~~~
drivers/media/test-drivers/vidtv/vidtv_pes.c:94:10: note: in expansion of m=
acro 'GENMASK'
   94 |  mask1 =3D GENMASK(30, 32);
      |          ^~~~~~~
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                   ^
include/linux/bits.h:24:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
   24 |  (BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
      |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:38:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
   38 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
      |   ^~~~~~~~~~~~~~~~~~~
drivers/media/test-drivers/vidtv/vidtv_pes.c:95:10: note: in expansion of m=
acro 'GENMASK'
   95 |  mask2 =3D GENMASK(15, 29);
      |          ^~~~~~~
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                   ^
include/linux/bits.h:24:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
   24 |  (BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
      |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:38:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
   38 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
      |   ^~~~~~~~~~~~~~~~~~~
drivers/media/test-drivers/vidtv/vidtv_pes.c:96:10: note: in expansion of m=
acro 'GENMASK'
   96 |  mask3 =3D GENMASK(0, 14);
      |          ^~~~~~~

Caused by commit

  f90cf6079bf6 ("media: vidtv: add a bridge driver")

I have disabled CONFIG_DVB_VIDTV for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/LcfCOcGk8TxgJEc3q7a2PWK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9fDIUACgkQAVBC80lX
0GxwCQgAjPQGhJuJd/iyEIgvrCzYauCPQFZZ+JwjDvm3COIBml3DUUgkzqx99Mec
vrURk0kK94wsSfHDuKfqVdQ/ruI9Wq/dfVXoSDXsMIMllKfE41lYygDQYN43Gxn2
Ur6vUVwaq2lq3lhjI+NoweDDoW88N0piTrd3lDVGl4acxH4eIqhUXXFOWh7RLpTU
zpyy52W7belrB2EsEzNoDdTPVS8COgcHiAXZq2ZJ6oILZSogIGMk4l/crKTDMZe7
qSRDJ9N5SDUpkTfkdWveThXyHSxWrCLjRHRFc11MV0q4QA4NHjBfBwuEj1+FrJGh
kxyf/svZp42Raq06yPCi2pzwaKQX/A==
=loin
-----END PGP SIGNATURE-----

--Sig_/LcfCOcGk8TxgJEc3q7a2PWK--
