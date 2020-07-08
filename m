Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3027218188
	for <lists+linux-next@lfdr.de>; Wed,  8 Jul 2020 09:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgGHHom (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 03:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgGHHok (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2020 03:44:40 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5138C08C5DC;
        Wed,  8 Jul 2020 00:44:39 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1rtD46Fyz9s1x;
        Wed,  8 Jul 2020 17:44:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594194277;
        bh=IxEA/LfDJeITFc3wpIqnPL4My/+fNA0O5G0uCNvx1t4=;
        h=Date:From:To:Cc:Subject:From;
        b=PfjfV2AMVByLTplVdH2CLU9A5auVoChJoRJqRB2NiMumf2Y2hV0K7RTf1N6rX5THt
         R9ZOwCjL2beUQ5b8fMF0g/v5ArhMRtFWm1sNe+O0RhGk4K88aUXLyMc9XRbYUG3AHP
         /odgsGNg1/SPxaQvfF96Q5TbGXUYNCrZ8q6dhZAC5fVlGsZ+8vfteNwF2wsc2oMcix
         xGtFsCiTt5TN1ofmsOn2GpM1qM/HZdASNdxDCDORslYF74W0pmrRyV+vRCs3o68fbJ
         Di+CbGkNXenuH+lKN0bx9ukCFwC+IrmCv72UMWYQiDAnrWD1t6f0SmFV9DJve0r3Cs
         InHW1MZ61St5Q==
Date:   Wed, 8 Jul 2020 17:44:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Renninger <trenn@suse.de>
Subject: linux-next: manual merge of the set_fs tree with the pm tree
Message-ID: <20200708174435.36a8166b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V2O2g57U5jKN6mJAWwZLlJb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/V2O2g57U5jKN6mJAWwZLlJb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the set_fs tree got a conflict in:

  drivers/acpi/battery.c

between commit:

  8830280a69dd ("ACPI: procfs: Remove last dirs after being marked deprecat=
ed for a decade")

from the pm tree and commit:

  598d0996ea31 ("proc: switch over direct seq_read method calls to seq_read=
_iter")

from the set_fs tree.

I fixed it up (the former removed the code modified by the latter, so
I just did that) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/V2O2g57U5jKN6mJAWwZLlJb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8FeWMACgkQAVBC80lX
0GxPowf9FSPeHouhzx0fW1ke6SAFO76rSP4kAVX66jNK39nBgqSyzYbvdcb7fqL7
yzoP+IbFhXhukUoFgkvbxUqus5UoUiQzNj9PtR+UmPDJBp7V0BcnYV2J4Fefzw2K
6xXBnJNnI0bZB8ium2DCyYTw5frEAVm52uypw3jYCwpTJ4CaTkn23LVGkr2/QcXP
tBDGPKnk7zAw0fs8INtParyjycymuLb+J4OudF2Y06SBuCxH8gsFqHLiSlBdkF9d
upTL+NAgxzdPAAbHcdYQforgQOnakBp/R4D5fs4jFZ0xb0TN0V5ToRx9iCf2Ei9K
rD3CBpie23hwId+x8GSisV8pW6ThXw==
=5RYQ
-----END PGP SIGNATURE-----

--Sig_/V2O2g57U5jKN6mJAWwZLlJb--
