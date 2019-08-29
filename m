Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52593A10A6
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 07:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbfH2FGO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 01:06:14 -0400
Received: from ozlabs.org ([203.11.71.1]:43009 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725855AbfH2FGO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 01:06:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46JrDK56T9z9sDB;
        Thu, 29 Aug 2019 15:06:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567055170;
        bh=pCysRng/1zz1IZYbS4XcXHoXaL4ceVedAyCTtsZVcT4=;
        h=Date:From:To:Cc:Subject:From;
        b=IV1yKEkDepDLMuFJ2IgZWudCFrYqzzmhTu+9z+fFIpyPjhaWhtF5kwFt/2Yx8QU7l
         mN8UmmXz8jav5+XXh3slYGT9F8RnJ0oWwuhxF2eelNaLCPlaK4WqIcIbSmeIdEewVX
         pDBCYk2CG5aIn9hhJDf2xvGgVhl6AbUQSP/4OSBjPU1+jxDdajecZtJtrYLlfzPVN4
         r4xAWzZeMWTl9faBtnfZASggMv3Phe0J0saqOlYAoE8FUvZlrC/w1aFKeyj1uG/U/s
         AwYUh/t0jd8Mz4s3aRspOHZuU42BtS1xBSvngad8PBEO9uM3Hy38JamPhgxnbXuRv7
         lu7M87q8/SAFw==
Date:   Thu, 29 Aug 2019 15:06:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Garrett <matthewgarrett@google.com>
Subject: linux-next: manual merge of the keys tree with the security tree
Message-ID: <20190829150609.7ae3c4ee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ugYQCC7a/8KEVh+Hlrxm4EU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ugYQCC7a/8KEVh+Hlrxm4EU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the keys tree got a conflict in:

  include/linux/security.h

between commit:

  9e47d31d6a57 ("security: Add a "locked down" LSM hook")

from the security tree and commit:

  25d2a1e61245 ("security: Add hooks to rule on setting a watch")

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

diff --cc include/linux/security.h
index 23e1c3f17d48,003437714eee..000000000000
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@@ -441,7 -394,13 +443,14 @@@ void security_inode_invalidate_secctx(s
  int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxle=
n);
  int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen=
);
  int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen=
);
 +int security_locked_down(enum lockdown_reason what);
+ #ifdef CONFIG_WATCH_QUEUE
+ int security_watch_key(struct watch *watch, struct key *key);
+ int security_watch_devices(struct watch *watch);
+ int security_post_notification(const struct cred *w_cred,
+ 			       const struct cred *cred,
+ 			       struct watch_notification *n);
+ #endif /* CONFIG_WATCH_QUEUE */
  #else /* CONFIG_SECURITY */
 =20
  static inline int call_blocking_lsm_notifier(enum lsm_event event, void *=
data)
@@@ -1259,10 -1213,22 +1268,26 @@@ static inline int security_inode_getsec
  {
  	return -EOPNOTSUPP;
  }
 +static inline int security_locked_down(enum lockdown_reason what)
 +{
 +	return 0;
 +}
+ #ifdef CONFIG_WATCH_QUEUE
+ static inline int security_watch_key(struct watch *watch, struct key *key)
+ {
+ 	return 0;
+ }
+ static inline int security_watch_devices(struct watch *watch)
+ {
+ 	return 0;
+ }
+ static inline int security_post_notification(const struct cred *w_cred,
+ 					     const struct cred *cred,
+ 					     struct watch_notification *n)
+ {
+ 	return 0;
+ }
+ #endif /* CONFIG_WATCH_QUEUE */
  #endif	/* CONFIG_SECURITY */
 =20
  #ifdef CONFIG_SECURITY_NETWORK

--Sig_/ugYQCC7a/8KEVh+Hlrxm4EU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1nXUEACgkQAVBC80lX
0GxMOwf/U6IM3kn+FcXWXWHgZ53hhbMWasFY25Yg9o88txiclwv/mbUl4GL1p3Kj
LvKIk4gvbK38EN43BXDch0RhJ+DJY9iY11HcjNyEGZq+wQCGoec+R8dBBHRcYfT9
D9jmsRweBMQ+4GzJ0weGA96UGuVX+0yQ9fVpU8+P79JTi30drwcgyuYBpPueHIRA
KhRzLUBQQ08K/FIx2CGFG1XfVvFFzhVq2MU74niETe76B6EvSpUGi6XOZVd3e7iZ
VY9vGE0FFXdDBo6vR1AvEzhOwCQRPD5jgerk29roIKfzmGagLdF+QdcvqvFCdpBY
EvjPuZR8tJXV30h+PK2jKpJQqDxyEw==
=dgUO
-----END PGP SIGNATURE-----

--Sig_/ugYQCC7a/8KEVh+Hlrxm4EU--
