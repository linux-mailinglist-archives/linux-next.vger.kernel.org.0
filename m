Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78DEB305116
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 05:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239347AbhA0ElY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 23:41:24 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41129 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231386AbhA0D7S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 22:59:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQVFh6Gh2z9sSs;
        Wed, 27 Jan 2021 14:58:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611719913;
        bh=xx+we2RkhnSFfttGUyX2XLWuGtMaFFlaUiEqy8P7T4A=;
        h=Date:From:To:Cc:Subject:From;
        b=fO+o27mb7Bdj9Lo/3zSfP1++4Tu2qcf1hvHzQbbTSK5YPiX2CTvXVbtJ4uxpStj2+
         LX6UE9hLQItzOIBQbm8+u426R4dakR/UnbDJiY35/itb/cIEthYAQoMa7I1KdCOEMu
         YXRARhKPJVxYaiPNtgNP4TG5OkGJFIasZCy/M/1PlgwjMRMAmrZRcjTVBCNvsUzlZT
         X5Xdfi+z5pBIhcWeFbGngAjQTRkny6u8N3MEtuUSm5tpVqvYBLpRE+KzzFugFNOwbt
         7E1ewQaShDfVTjfQfxfBp1+31/ek3rVIqPxTWFp+G9g5rda9htcbh3XSpmdK28+Kpt
         thTg4qdO1oUUQ==
Date:   Wed, 27 Jan 2021 14:58:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Tushar Sugandhi <tusharsu@linux.microsoft.com>
Subject: linux-next: manual merge of the integrity tree with the pidfd tree
Message-ID: <20210127145832.3e7b3262@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C.kFR3z/q4HJRfFtBIztctc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/C.kFR3z/q4HJRfFtBIztctc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the integrity tree got a conflict in:

  security/integrity/ima/ima_policy.c

between commit:

  a2d2329e30e2 ("ima: handle idmapped mounts")

from the pidfd tree and commit:

  2b4a2474a202 ("IMA: generalize keyring specific measurement constructs")

from the integrity tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc security/integrity/ima/ima_policy.c
index e14426c24a19,9b45d064a87d..000000000000
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@@ -498,11 -522,10 +523,11 @@@ static bool ima_match_rule_data(struct=20
   *
   * Returns true on rule match, false on failure.
   */
 -static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *in=
ode,
 -			    const struct cred *cred, u32 secid,
 -			    enum ima_hooks func, int mask,
 +static bool ima_match_rules(struct ima_rule_entry *rule,
 +			    struct user_namespace *mnt_userns,
 +			    struct inode *inode, const struct cred *cred,
 +			    u32 secid, enum ima_hooks func, int mask,
- 			    const char *keyring)
+ 			    const char *func_data)
  {
  	int i;
 =20
@@@ -623,11 -650,10 +653,11 @@@ static int get_subaction(struct ima_rul
   * list when walking it.  Reads are many orders of magnitude more numerous
   * than writes so ima_match_policy() is classical RCU candidate.
   */
 -int ima_match_policy(struct inode *inode, const struct cred *cred, u32 se=
cid,
 -		     enum ima_hooks func, int mask, int flags, int *pcr,
 +int ima_match_policy(struct user_namespace *mnt_userns, struct inode *ino=
de,
 +		     const struct cred *cred, u32 secid, enum ima_hooks func,
 +		     int mask, int flags, int *pcr,
  		     struct ima_template_desc **template_desc,
- 		     const char *keyring)
+ 		     const char *func_data)
  {
  	struct ima_rule_entry *entry;
  	int action =3D 0, actmask =3D flags | (flags << 1);
@@@ -641,8 -667,8 +671,8 @@@
  		if (!(entry->action & actmask))
  			continue;
 =20
 -		if (!ima_match_rules(entry, inode, cred, secid, func, mask,
 -				     func_data))
 +		if (!ima_match_rules(entry, mnt_userns, inode, cred, secid,
- 				     func, mask, keyring))
++				     func, mask, func_data))
  			continue;
 =20
  		action |=3D entry->flags & IMA_ACTION_FLAGS;

--Sig_/C.kFR3z/q4HJRfFtBIztctc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQ5OgACgkQAVBC80lX
0GxR2Qf/V+QXO8VERa9rPM8uKcHQ83MHPm097cnvpGfjzaCmyAnTinwoRhTBuPMR
HgHpCb1YCgjiwHCeWxD+jt/w+RcZpt8CIYTsHaf069l2xp2UMt0P5X/fPFppU0Rt
4XUT3kaDGaJbhoZuJzU01/fDMmppYcgeDFJ3lyleO2BnrKAx3yaznBt0xgnEHz7w
sLyevNV4FCEjsfoeTFiWlt6lM9Gc5tApDZabdWKz5B/x8/7rSmY+ZM9mufs57Mb9
OTLsUGav2iq9HjSBv0fjXCbTd3VvZsfLDsUCyXc5YKIc6519xjrTt4Y2jZIBHCb5
U6ITR8KdXlSN+hm5Zq12WdF1rDfYUw==
=TQ+q
-----END PGP SIGNATURE-----

--Sig_/C.kFR3z/q4HJRfFtBIztctc--
