Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DB91E54CD
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 05:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgE1D5W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 May 2020 23:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgE1D5W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2020 23:57:22 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B98C05BD1E;
        Wed, 27 May 2020 20:57:21 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49XYmt6Zcpz9sRY;
        Thu, 28 May 2020 13:57:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590638239;
        bh=2BUcHYpkW+gU9UE65n32G+Jloswo8dh+G03/XVbNDc8=;
        h=Date:From:To:Cc:Subject:From;
        b=dDFAiz1SUyd6OWzJZK0EK+FpxdUrdyIRMXvRdVYBThfzXSUR22EWOz/vDyET1r9T9
         c70k8hQtI/Ao7Ollx2ou6mxbdK49z4rUpZa78CdsQVfPNw8f25YlK3tHMye0+Xkueb
         jQ+8RsG4vgCvxk7Tw4MPz/oaDNTfZmuXvXpEsGHL9ASPipvIMWvFc5tri4nRUFRipG
         N5x3kIZzqEf32+FqGc3N5oLnInRs0ezjK/2YmNmJIDInKvsqOHi7Hv29dzXO7HvPDX
         WMlazUmnLchORaRsPLQU16Sk/5ID+Vz1/vYCAQRVXsKsK9RfNCnM96Lxp8PwgAuhGq
         DKZzwd//6QpOw==
Date:   Thu, 28 May 2020 13:57:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20200528135717.3e2d5169@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R6ixqlpR7xRooxsW0X2YY_4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/R6ixqlpR7xRooxsW0X2YY_4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/sof/intel/byt.c:464:12: warning: 'byt_remove' defined but not use=
d [-Wunused-function]
  464 | static int byt_remove(struct snd_sof_dev *sdev)
      |            ^~~~~~~~~~
sound/soc/sof/intel/byt.c:454:12: warning: 'byt_resume' defined but not use=
d [-Wunused-function]
  454 | static int byt_resume(struct snd_sof_dev *sdev)
      |            ^~~~~~~~~~
sound/soc/sof/intel/byt.c:447:12: warning: 'byt_suspend' defined but not us=
ed [-Wunused-function]
  447 | static int byt_suspend(struct snd_sof_dev *sdev, u32 target_state)
      |            ^~~~~~~~~~~

Introduced by commits

  ddcccd543f5d ("ASoC: SOF: Intel: byt: Add PM callbacks")
  c691f0c6e267 ("ASoC: SOF: Intel: BYT: add .remove op")

--=20
Cheers,
Stephen Rothwell

--Sig_/R6ixqlpR7xRooxsW0X2YY_4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7PNp0ACgkQAVBC80lX
0GyFngf+NMiUS0XuzKdTbfnYxdX4rOM+uKdhmLSW37YWgNagEBv0IvY+F3MR0R88
gHMUNuMXQ3UZYsenMzZG0oegwQLGoPA/GUwRZMWbWUz4DwS0LUKE7qpJcXcja0fw
fOnY9C0aCWQihQIXtxBVCXMY+LjZd561nRuCGNLY40j1aq3y40d8IEzgiWfYVI0D
t19Yl1n2HACQ/mGDDltqJy/BrqZJ+mFBFZIZvnjBQuSMGlj9JH3Xf2EZWZXQGrcM
XxLptGBPKUIpgIrCcKXr8013CNOSIIGXcGd0uzXyvqu5OnpUNdUU07s9FAc2laB+
agKU+j8mD2AodO8zOjcMutwu6NXsSQ==
=kD9P
-----END PGP SIGNATURE-----

--Sig_/R6ixqlpR7xRooxsW0X2YY_4--
