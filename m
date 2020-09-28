Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0956F27ABC6
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 12:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgI1KZG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 06:25:06 -0400
Received: from ozlabs.org ([203.11.71.1]:37647 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726629AbgI1KZF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 06:25:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C0JYT361mz9ryj;
        Mon, 28 Sep 2020 20:25:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601288703;
        bh=Uss30wBG9lIfpvNt/vLUU/Qu9ctf375Kq2lOFcj3JG0=;
        h=Date:From:To:Cc:Subject:From;
        b=byPviN8iv0nxQsaPlbnV0nTvi7AFAU9nybNVHUBPKLblJ+BdEkksqCelrECu8+daf
         ZQRmuJMZXPz53o/zF7D/HoJjl8mSfhWW/kPITtfjqOdi9ohcNJsm9o2xhX3H/iFcuN
         di2PH/UFe+446zRckQyVP9x+xyfsZ2d9Ozpms3TTa284U5oi+qz9JfFhtKN7ILEPVP
         ke7ZV4lTT8RiccDR5mXHORuUEruT0obsuqDwj1X+03r8KAnnptR+DB5Yy+zf0fJ4SJ
         lUnZa9fmbW8xijsjBsWOcFUlPWOjj9ykOez+Ev9K/jTS5MkyxSbxuQ8p4VFE9zQfDQ
         cCZBLYa48lg6A==
Date:   Mon, 28 Sep 2020 20:24:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the pm tree
Message-ID: <20200928202459.419ce848@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FX3qEY5w1ZE9rQtfZn.wrD9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FX3qEY5w1ZE9rQtfZn.wrD9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/acpi/numa/hmat.c

between commits:

  01feba590cd6 ("ACPI: Do not create new NUMA domains from ACPI static tabl=
es that are not SRAT")
  4eb3723f18e9 ("ACPI: Rename acpi_map_pxm_to_online_node() to pxm_to_onlin=
e_node()")

from the pm tree and commit:

  b499f2c84cbf ("ACPI: HMAT: refactor hmat_register_target_device to hmem_r=
egister_device")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/acpi/numa/hmat.c
index e7add2609c03,134bcb40b2af..000000000000
--- a/drivers/acpi/numa/hmat.c
+++ b/drivers/acpi/numa/hmat.c
@@@ -705,8 -652,11 +652,11 @@@ static void hmat_register_target_device
  	if (!IS_ENABLED(CONFIG_DEV_DAX_HMEM))
  		return;
 =20
- 	for (res =3D target->memregions.child; res; res =3D res->sibling)
- 		hmat_register_target_device(target, res);
+ 	for (res =3D target->memregions.child; res; res =3D res->sibling) {
 -		int target_nid =3D acpi_map_pxm_to_node(target->memory_pxm);
++		int target_nid =3D pxm_to_node(target->memory_pxm);
+=20
+ 		hmem_register_device(target_nid, res);
+ 	}
  }
 =20
  static void hmat_register_target(struct memory_target *target)

--Sig_/FX3qEY5w1ZE9rQtfZn.wrD9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9xufsACgkQAVBC80lX
0GzAUwf6A1pD6KQlLxgyxMBsw786XIt/1ltEGaO9hJbFofckFyM5vZiA46xuQRvs
UDleoPiY7IYemg5vKXWgqwFPdCQF/PuztU+VzbV+yjhH67o3k29FSB5gQNw1d3ei
ocAxdc6K6DjnPYl7aDYiaTdtyqOY1a+FBdsG1bH4FszRD44+bmNaayo3IRyBD9WZ
iUSaJd5P8EFdV04j1AWtSKYL0jvOsKFRoWbSkP6F3dD4iyAo2ImKLd0Usu8iqyAF
1Hm4LkvQcWXa174TRc3wpzCxaHTH/C8dKFsghA2sIEyK/wda3hMhnoHCUuLzDHci
tHkIeDMF3cLUO4dY0lUVX+HhfVkzoA==
=7dNn
-----END PGP SIGNATURE-----

--Sig_/FX3qEY5w1ZE9rQtfZn.wrD9--
