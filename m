Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C75302212
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 07:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbhAYGTU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 01:19:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbhAYGTQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 01:19:16 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69CDFC061756;
        Sun, 24 Jan 2021 22:18:24 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPKRw1GN2z9sVX;
        Mon, 25 Jan 2021 17:18:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611555502;
        bh=2Fp1oQTZ8Qcu6JEynLYpml6vy91YL0jq2UG+B1W/hGA=;
        h=Date:From:To:Cc:Subject:From;
        b=pRnM6Ekfq75+RgSJWhrjC6e0pEDGnJaL+tiTm/kt3u2gpOxojc20BYYCex46Q1spQ
         RJ0jm3jOGEx3C7Fw305BuPSKB547hcBhRxBpnk9fkQAhn2HC5kJlWIhkTDUy5JQZbG
         KUSCxQd2iJbVwGY24ELNpYfS35Mip8khf+tRzxYdeiN0aRL1r6POyON3anyxiLx0Wl
         JOepsELXIlTTTnpbALFu3mi7y2K7roCBf5/un7lFpYY2OeSxP3jGgW/k999nX1smTF
         fwvQ+bViZOJVKNf42hrDnh/kQx/8yVXj6nBM6LXhBSfJG98zbcFo2BRMrsTOaljS8G
         GIFINVKcfEjLg==
Date:   Mon, 25 Jan 2021 17:18:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Tushar Sugandhi <tusharsu@linux.microsoft.com>
Subject: linux-next: manual merge of the pidfd tree with the integrity tree
Message-ID: <20210125171818.286f08b9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k8KE2htOxDV//cDHrcpI132";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/k8KE2htOxDV//cDHrcpI132
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  security/integrity/ima/ima_api.c

between commit:

  2b4a2474a202 ("IMA: generalize keyring specific measurement constructs")

from the integrity tree and commit:

  a2d2329e30e2 ("ima: handle idmapped mounts")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc security/integrity/ima/ima_api.c
index 1dd70dc68ffd,ed410efb3597..000000000000
--- a/security/integrity/ima/ima_api.c
+++ b/security/integrity/ima/ima_api.c
@@@ -183,17 -184,18 +184,18 @@@ err_out
   * Returns IMA_MEASURE, IMA_APPRAISE mask.
   *
   */
- int ima_get_action(struct inode *inode, const struct cred *cred, u32 seci=
d,
- 		   int mask, enum ima_hooks func, int *pcr,
+ int ima_get_action(struct user_namespace *mnt_userns, struct inode *inode,
+ 		   const struct cred *cred, u32 secid, int mask,
+ 		   enum ima_hooks func, int *pcr,
  		   struct ima_template_desc **template_desc,
 -		   const char *keyring)
 +		   const char *func_data)
  {
  	int flags =3D IMA_MEASURE | IMA_AUDIT | IMA_APPRAISE | IMA_HASH;
 =20
  	flags &=3D ima_policy_flag;
 =20
- 	return ima_match_policy(inode, cred, secid, func, mask, flags, pcr,
- 				template_desc, func_data);
+ 	return ima_match_policy(mnt_userns, inode, cred, secid, func, mask,
 -				flags, pcr, template_desc, keyring);
++				flags, pcr, template_desc, func_data);
  }
 =20
  /*

--Sig_/k8KE2htOxDV//cDHrcpI132
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOYqoACgkQAVBC80lX
0GwvyQf+KmAb4k0vPNayE44IS4hlsorJ1DccxO0+t0EYFbiDjmqHIsbi5dF7wZKH
MJuoSGGkOB2F88hmfYj+6+QVRHtHBtrGOaTSjvdCO5oaGhKwa3hVRU7bohAAJW1W
NsmYm/MV3eKMEr9385Cw9T1N62L6MQYF4a8fjAi5p7AMDnT+ahVydUP3v162ncoc
fAyoZLQBn3oatKG6CSHNky1N6c4lf85tpC+g1Bd6pL/vsYyT4wLoKrAL7lj+Cltz
nftNqLdw57dDWUXihbg3Och60UGcJC+PSDuJ/iMv7tm55Q3M83+Nosu9Ygf8MNy2
5NUca5LiDuSTX4ftcLl/LRNJGxnbtQ==
=bjV6
-----END PGP SIGNATURE-----

--Sig_/k8KE2htOxDV//cDHrcpI132--
