Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B24E2356248
	for <lists+linux-next@lfdr.de>; Wed,  7 Apr 2021 06:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhDGEQO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 00:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhDGEQO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2021 00:16:14 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A87C06174A;
        Tue,  6 Apr 2021 21:16:01 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FFWKR5GmLz9sV5;
        Wed,  7 Apr 2021 14:15:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617768957;
        bh=o0Kw+AcXV0I8ENnMs20LWxY5frfPRkSWaK1Z6QK2dDU=;
        h=Date:From:To:Cc:Subject:From;
        b=J75yxFTwkPkzgiW3dSZExFwd++UqTjCq+RxXKXcOMhdAm94JV9FPc3zz71o+NIZc5
         Jja9NTbzUMqOlgtt6D/4FjbNT1NmyAtSHd6m6cdqXk9CY09mRDHsbhJbHOglPMF8oc
         zvmM5bsygi4rIzan6Y8yYYQ/aLpvsrYIMwS7I82mErE4kLQIQ3A7cbGfOK2h1XH3Wg
         3c8xO8eChFIR2Q2cFHT8oDOS93KU0vQBlOoDRPNs8DpBl6d8lUtl2PQMOj+1fyF+DQ
         DoX3rk+StG9g+D8S0lxwQIhfGg5Iwyr3TV2IJtDlVtp9WPsf2gvWzA6EXIqRXm0SwS
         R2VM9N9ZH3MZw==
Date:   Wed, 7 Apr 2021 14:15:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc:     Eric Snowberg <eric.snowberg@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Nayna Jain <nayna@linux.ibm.com>
Subject: linux-next: manual merge of the keys tree with the integrity tree
Message-ID: <20210407141553.266b704e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.8PNWkYJvMJgUWpzozUcZQo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.8PNWkYJvMJgUWpzozUcZQo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the keys tree got a conflict in:

  certs/system_keyring.c

between commit:

  df73a4001959 ("ima: enable loading of build time generated key on .ima ke=
yring")

from the integrity tree and commit:

  9536390dcc8c ("certs: Move load_system_certificate_list to a common funct=
ion")

from the keys tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc certs/system_keyring.c
index bb122bf4cc17,0c9a4795e847..000000000000
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@@ -133,85 -133,15 +134,34 @@@ static __init int system_trusted_keyrin
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
 +
  	pr_notice("Loading compiled-in X.509 certificates\n");
 =20
 -	return load_certificate_list(system_certificate_list, system_certificate=
_list_size,
 +#ifdef CONFIG_MODULE_SIG
 +	p =3D system_certificate_list;
 +#else
 +	p =3D system_certificate_list + module_cert_size;
 +#endif
 +
- 	end =3D p + system_certificate_list_size;
- 	return load_cert(p, end, builtin_trusted_keys);
++	return load_certificate_list(p, system_certificate_list_size,
+ 				     builtin_trusted_keys);
  }
  late_initcall(load_system_certificate_list);
 =20

--Sig_/.8PNWkYJvMJgUWpzozUcZQo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBtMfkACgkQAVBC80lX
0GzLmQf8D9B9f+VlMIJiFbBxrgKHZBH7WSmaDYJoYqt2u8Krv/OmclX7YtmZnMnH
irs9Dp1YrIfIY+pQtJ3iijpWJlfxMGjvv8m7gYsLprDHVMbC7W8TyWVdzH0pXiuW
4n4MEtJmyCHzLraKy+AdC9rw4cjdWiQKbk1Qn7Xoc2HToM4IOCqtIh+d5+n4UtEF
EkgJDQ6RwFA+6Qa/A+M/8F+0uPRAoCPeBVDrn2lREJZZq60pqB8FW3aNSn0jnq1n
jVHQLcCLMnEGGGlNgfYRk4xqodgAfPuuHIY0eyf2P2JkCvt/PoAtMG6USwe9+P7y
F+gkqHPdxLTbaH5L0BZ3OXroqLnEVw==
=9U8b
-----END PGP SIGNATURE-----

--Sig_/.8PNWkYJvMJgUWpzozUcZQo--
