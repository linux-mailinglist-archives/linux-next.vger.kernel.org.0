Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B3535BA99
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 09:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236711AbhDLHJV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Apr 2021 03:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbhDLHJU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Apr 2021 03:09:20 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CA1C061574;
        Mon, 12 Apr 2021 00:09:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FJfwp1h0Xz9sCD;
        Mon, 12 Apr 2021 17:08:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618211338;
        bh=/QHIfYKayMzV/t5iR+fIOZy3iOi0DYVVWzPMAY6qoAA=;
        h=Date:From:To:Cc:Subject:From;
        b=fP9tvQOOk7yAa0R5eMstcyu/AfLM/9ndq3sw/AQBX1od/jOjuS6qteu5TVYy0yP56
         tQ7RtgmSVUQCPzWkRgLjVdu4i+gbN2sI/dduTZaL7ua7LWFMCAA4789Pi3uPK/6Ye5
         PAtplseKxsFbpaHfUt++bJmIiLd2jSm+22L262xngjCSypGXRJuRBgGLY2z57N2HPQ
         44pTlKGvsK/eJUv+yogzTbgDOqZW+H21k90w9HItShoJA9p+ZshfzlO7DvjFF+8kF+
         edM+lwCw85Lp7nkgnUi8sXyWrFxNLeIoOr0bA6M8QOFyH5XLVl1AHvv1qqJfakWbCq
         Qx8011ohK4vAQ==
Date:   Mon, 12 Apr 2021 17:08:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Eric Snowberg <eric.snowberg@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Nayna Jain <nayna@linux.ibm.com>
Subject: linux-next: manual merge of the keys tree with the integrity tree
Message-ID: <20210412170857.49defc98@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xQU2D1jT4WplKx9OeGd=Jk/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xQU2D1jT4WplKx9OeGd=Jk/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the keys tree got a conflict in:

  certs/system_keyring.c

between commit:

  6cbdfb3d91ba ("ima: enable loading of build time generated key on .ima ke=
yring")

from the integrity tree and commit:

  9536390dcc8c ("certs: Move load_system_certificate_list to a common funct=
ion")

from the keys tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc certs/system_keyring.c
index 2b3ad375ecc1,0c9a4795e847..000000000000
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@@ -133,88 -133,15 +134,36 @@@ static __init int system_trusted_keyrin
   */
  device_initcall(system_trusted_keyring_init);
 =20
- static __init int load_cert(const u8 *p, const u8 *end, struct key *keyri=
ng)
- {
- 	key_ref_t key;
- 	size_t plen;
-=20
- 	while (p < end) {
- 		/* Each cert begins with an ASN.1 SEQUENCE tag and must be more
- 		 * than 256 bytes in size.
- 		 */
- 		if (end - p < 4)
- 			goto dodgy_cert;
- 		if (p[0] !=3D 0x30 &&
- 		    p[1] !=3D 0x82)
- 			goto dodgy_cert;
- 		plen =3D (p[2] << 8) | p[3];
- 		plen +=3D 4;
- 		if (plen > end - p)
- 			goto dodgy_cert;
-=20
- 		key =3D key_create_or_update(make_key_ref(keyring, 1),
- 					   "asymmetric",
- 					   NULL,
- 					   p,
- 					   plen,
- 					   ((KEY_POS_ALL & ~KEY_POS_SETATTR) |
- 					   KEY_USR_VIEW | KEY_USR_READ),
- 					   KEY_ALLOC_NOT_IN_QUOTA |
- 					   KEY_ALLOC_BUILT_IN |
- 					   KEY_ALLOC_BYPASS_RESTRICTION);
- 		if (IS_ERR(key)) {
- 			pr_err("Problem loading in-kernel X.509 certificate (%ld)\n",
- 			       PTR_ERR(key));
- 		} else {
- 			pr_notice("Loaded X.509 cert '%s'\n",
- 				  key_ref_to_ptr(key)->description);
- 			key_ref_put(key);
- 		}
- 		p +=3D plen;
- 	}
-=20
- 	return 0;
-=20
- dodgy_cert:
- 	pr_err("Problem parsing in-kernel X.509 certificate list\n");
- 	return 0;
- }
-=20
 +__init int load_module_cert(struct key *keyring)
 +{
- 	const u8 *p, *end;
-=20
 +	if (!IS_ENABLED(CONFIG_IMA_APPRAISE_MODSIG))
 +		return 0;
 +
 +	pr_notice("Loading compiled-in module X.509 certificates\n");
 +
- 	p =3D system_certificate_list;
- 	end =3D p + module_cert_size;
-=20
- 	return load_cert(p, end, keyring);
++	return load_certificate_list(system_certificate_list, module_cert_size,
++				     keyring);
 +}
 +
  /*
   * Load the compiled-in list of X.509 certificates.
   */
  static __init int load_system_certificate_list(void)
  {
- 	const u8 *p, *end;
++	const u8 *p;
 +	unsigned long size;
 +
  	pr_notice("Loading compiled-in X.509 certificates\n");
 =20
 -	return load_certificate_list(system_certificate_list, system_certificate=
_list_size,
 -				     builtin_trusted_keys);
 +#ifdef CONFIG_MODULE_SIG
 +	p =3D system_certificate_list;
 +	size =3D system_certificate_list_size;
 +#else
 +	p =3D system_certificate_list + module_cert_size;
 +	size =3D system_certificate_list_size - module_cert_size;
 +#endif
 +
- 	end =3D p + size;
- 	return load_cert(p, end, builtin_trusted_keys);
++	return load_certificate_list(p, size, builtin_trusted_keys);
  }
  late_initcall(load_system_certificate_list);
 =20

--Sig_/xQU2D1jT4WplKx9OeGd=Jk/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBz8gkACgkQAVBC80lX
0Gw6zwf/RheIuaHv6/Wj6lb7nTuPv3BhL5s/6II/liYyF5fCDWcBVwweUTx7z5kX
kaWzfFXQ18sXrmKF4+8+1EWs94zCRqdF6k5SZszbqGesSvUVtsqKFCZWpLoS19MD
g9l14RsJrMmNPFrUi5QWAFUBBtckX/HNWtI2O4X2cnubmMTrlrlpeGg02NNuXw74
EmBfalhC7V8N8EeiMDx1wZy3We1wVEPW6jXenEvx4IhUGuFjvXfBUdaWR2CcxHL6
F2L1frp/KrW375eTI5GhC78Y2I8HtahecZp5YFj9fTMJvpVlVxbPDj47gF6/LQRB
LsWMfT0TP1ru85wBHujHrpgTVc/ptQ==
=ALXf
-----END PGP SIGNATURE-----

--Sig_/xQU2D1jT4WplKx9OeGd=Jk/--
