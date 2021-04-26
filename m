Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560EF36BC0F
	for <lists+linux-next@lfdr.de>; Tue, 27 Apr 2021 01:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhDZXen (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 19:34:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57795 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232235AbhDZXem (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 19:34:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FTh6t5HSwz9sXL;
        Tue, 27 Apr 2021 09:33:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619480039;
        bh=M1lWzzgUUx/BdlrODY1Aub9m4138XqrYDKd6DZnilso=;
        h=Date:From:To:Cc:Subject:From;
        b=cigMQANGqhDseup/6lEGWayiWt9OtDXCpnuj+CBnabukD6ZZiVKaQ01meREga3XNi
         2gR8+VB5VKjLdCmBq/abqsf4svFiYE15+csPB9kmaqiTNtot7TCBjwfabXKrwseGDJ
         /16HOHDZqPkV0t1Lr7gTjNxUPSnNb6rSAb8hHNMICSXjAnTwPwyPlPfc0+5GYKbiJx
         hh8NUU13YXd7D9R3mCwonojKYxrP1/Xgwc4+eFaTLJvBejVewHpJ5TFf1cwAxgQ06I
         td4pGayz3ZR5QaLlUjg6QjA/75Ff0DVb2VOT0izsOnchrEl0P4+IzsJbWKMhdycdCJ
         wMHsUfXAkUn0Q==
Date:   Tue, 27 Apr 2021 09:33:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Takashi Iwai <tiwai@suse.de>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the reset tree with the sound-current
 tree
Message-ID: <20210427093357.6518bef6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VLwqXJ4hurx.FEdjR5WaFWQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VLwqXJ4hurx.FEdjR5WaFWQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the reset tree got a conflict in:

  drivers/reset/core.c

between commit:

  48d71395896d ("reset: Add reset_control_bulk API")

from the sound-current tree and commit:

  463bdeed6760 ("reset: whitespace fixes")

from the reset tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/reset/core.c
index 71c1c8264b2d,123b0c53a857..000000000000
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@@ -724,29 -610,9 +724,29 @@@ void reset_control_release(struct reset
  }
  EXPORT_SYMBOL_GPL(reset_control_release);
 =20
 +/**
 + * reset_control_bulk_release() - releases exclusive access to reset cont=
rols
 + * @num_rstcs: number of entries in rstcs array
 + * @rstcs: array of struct reset_control_bulk_data with reset controls set
 + *
 + * Releases exclusive access right to reset controls previously obtained =
by a
 + * call to reset_control_bulk_acquire().
 + *
 + * See also: reset_control_release(), reset_control_bulk_acquire()
 + */
 +void reset_control_bulk_release(int num_rstcs,
 +				struct reset_control_bulk_data *rstcs)
 +{
 +	int i;
 +
 +	for (i =3D 0; i < num_rstcs; i++)
 +		reset_control_release(rstcs[i].rstc);
 +}
 +EXPORT_SYMBOL_GPL(reset_control_bulk_release);
 +
- static struct reset_control *__reset_control_get_internal(
- 				struct reset_controller_dev *rcdev,
- 				unsigned int index, bool shared, bool acquired)
+ static struct reset_control *
+ __reset_control_get_internal(struct reset_controller_dev *rcdev,
+ 			     unsigned int index, bool shared, bool acquired)
  {
  	struct reset_control *rstc;
 =20

--Sig_/VLwqXJ4hurx.FEdjR5WaFWQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCHTeUACgkQAVBC80lX
0GypcAf+KVJMIkYq4RP1Fy3rl0sBV4x+b5IQviM1wtYTH70z2tkr8knMxmomssjS
7dZetPUWf0dyRf99uVjAA/Sne2Sa+Tpd8fVKKdfJI7jVKycBAflocoM52W9XOpV2
UBNOm/vgTwqK0NHR/Vd0AGRtX8hzvDrhL+BQMnUaBTeDeKia282LMVQLoFlyBtVP
4Gvcj+MHJ5lEm4DKmbAqO0bfL9MRjuKqlx/a1yz0uKhbcPq2ivBeP+oQQIYabpuW
LVQGfIEzL+uoeY1dPMkwHawgjL51HLvDl/5FksDBiG2GTngpzIgi4X/uc+gc9iKN
WK1WUjanrgsdGK5wTHQJY3SH5W9pHw==
=THEZ
-----END PGP SIGNATURE-----

--Sig_/VLwqXJ4hurx.FEdjR5WaFWQ--
