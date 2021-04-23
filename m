Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE2B368B27
	for <lists+linux-next@lfdr.de>; Fri, 23 Apr 2021 04:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236068AbhDWCkF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Apr 2021 22:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbhDWCkF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Apr 2021 22:40:05 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7452CC061574;
        Thu, 22 Apr 2021 19:39:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FRJQh2JFbz9sRR;
        Fri, 23 Apr 2021 12:39:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619145564;
        bh=CSUlIlYxT8sRrVdpDAHTNj8rXl6mPW5X7wC3LDuBHVw=;
        h=Date:From:To:Cc:Subject:From;
        b=vJlEC9ubrIkT1FM4PdDF+/CdU+Ndyks+WC0c147nR7yXmnOfFaQrsQ4v6WWYtHIWx
         KS3L2IADsPPRRTpT5ICWx9nEU+2mwkBMUcJ+z9GmWdxDZjeMZ/M+dG1Wg7/sYAnpuQ
         QTAsw5Qez9GNiv83CsMAYEcrAHeDYG5O/U/rVTUaHD+xtnU14v/PDmZwoYPZ1kd5jW
         tMFRKZyaQPGtk6AI297WcVGjfXmm1rU6yZ2ve+Nwk2IaTjoGsFs/SUYApTmi0KOVLt
         HGDmfi7ith5915szhCScU8hBg9BOD2SIuPHjQwlW38g/J0H3j155A9o4c4UN6CzMs3
         k0+Y+8f4yR/3A==
Date:   Fri, 23 Apr 2021 12:39:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tpmdd tree with Linus' tree
Message-ID: <20210423123921.181bbb3a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zz30I1lIU5S=lYDetQ49F5=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Zz30I1lIU5S=lYDetQ49F5=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tpmdd tree got a conflict in:

  security/keys/trusted-keys/trusted_tpm2.c

between commit:

  9d5171eab462 ("KEYS: trusted: Fix TPM reservation for seal/unseal")

from Linus' tree and commit:

  f2219745250f ("security: keys: trusted: use ASN.1 TPM2 key format for the=
 blobs")

from the tpmdd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc security/keys/trusted-keys/trusted_tpm2.c
index c87c4df8703d,d225ad140960..000000000000
--- a/security/keys/trusted-keys/trusted_tpm2.c
+++ b/security/keys/trusted-keys/trusted_tpm2.c
@@@ -79,7 -245,10 +245,10 @@@ int tpm2_seal_trusted(struct tpm_chip *
  	if (i =3D=3D ARRAY_SIZE(tpm2_hash_map))
  		return -EINVAL;
 =20
+ 	if (!options->keyhandle)
+ 		return -EINVAL;
+=20
 -	rc =3D tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_CREATE);
 +	rc =3D tpm_try_get_ops(chip);
  	if (rc)
  		return rc;
 =20

--Sig_/Zz30I1lIU5S=lYDetQ49F5=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCCM1kACgkQAVBC80lX
0GyGjwf/fGTC5s9PY2QFAd4MCkAKNzFNS0BvINleRO8mWg73fr37hbrFEG6mqpHM
gOS9TNRpInab65jRnm9vw40JTtyqrtmagc4qlVLYY5KSeDPvg9hmegvrfHwoWUNP
1H7MRkZer8yQphBjiE9kyuYlTMOBuepWhDBfsPWMC4SpE6AnBCnribzvIy3vvhe9
SyKHycwDEnI/XovOQswQza3j8Cs1U7zx8gGTpS97l7pHh4KK8Yp24gTrFigrVaVe
kFz322qCelW4Jzi+16DXoFppSFFVilxudRga7ddr+tr6c5ZlO3w7t97nu8K4bAqb
ZFN2Esfbm6DuNsNahTYWR917DX21HQ==
=FtIf
-----END PGP SIGNATURE-----

--Sig_/Zz30I1lIU5S=lYDetQ49F5=--
