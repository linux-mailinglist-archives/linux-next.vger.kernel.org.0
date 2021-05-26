Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2EE2390FA7
	for <lists+linux-next@lfdr.de>; Wed, 26 May 2021 06:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbhEZEkV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 May 2021 00:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhEZEkV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 May 2021 00:40:21 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA71C061574;
        Tue, 25 May 2021 21:38:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FqdWB33P1z9s1l;
        Wed, 26 May 2021 14:38:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622003926;
        bh=vuhV2Qz0o05/eToJNyBOXtbe9UPdcjJtGKi2Pd8FS1Y=;
        h=Date:From:To:Cc:Subject:From;
        b=saWSZA7UdsOEiwIGYQYzkerY1a9LylJQCfBUWM+UUH3jQl5bANa6cwDzBmq18Voiv
         Zll3sKIRezvK2ifkzV8h41+ELE4dVgIfwJNK+caT+iwmvSPU4rl1Cxqluyahr/13nU
         IcHej0Bqq0K6t4oDn+HsAvbLWjeVrvh9QFuNDyrSdDqTyozkt8hVmWUMwvIao5cow2
         9xVh/gSnnG5DI8XN3PrVr3kV+iuKdyMt9lZerG9nQAa/8auAXls6VtNg5GofjW3Cf8
         hMzOFK8J3PWYheaJj+aIlyD1O5HvAjwfs4GHoU2aBPLypLGigK8FjK6oBB5g0RFiwR
         fbueDLeNilacQ==
Date:   Wed, 26 May 2021 14:38:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Alexey Gladkov <legion@kernel.org>,
        Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the userns tree with Linus' tree
Message-ID: <20210526143845.3f09a874@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yVr=.DtgovgK8=XHL/+gLWl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yVr=.DtgovgK8=XHL/+gLWl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the userns tree got a conflict in:

  include/linux/user_namespace.h

between commit:

  5b8fea65d197 ("fanotify: configurable limits via sysfs")

from Linus' tree and commits:

  21d1c5e386bc ("Reimplement RLIMIT_NPROC on top of ucounts")
  6e52a9f0532f ("Reimplement RLIMIT_MSGQUEUE on top of ucounts")
  d64696905554 ("Reimplement RLIMIT_SIGPENDING on top of ucounts")
  d7c9e99aee48 ("Reimplement RLIMIT_MEMLOCK on top of ucounts")

from the userns tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/user_namespace.h
index 1d08dbbcfe32,61794ae32fa8..000000000000
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@@ -49,11 -49,11 +49,15 @@@ enum ucount_type=20
  #ifdef CONFIG_INOTIFY_USER
  	UCOUNT_INOTIFY_INSTANCES,
  	UCOUNT_INOTIFY_WATCHES,
 +#endif
 +#ifdef CONFIG_FANOTIFY
 +	UCOUNT_FANOTIFY_GROUPS,
 +	UCOUNT_FANOTIFY_MARKS,
  #endif
+ 	UCOUNT_RLIMIT_NPROC,
+ 	UCOUNT_RLIMIT_MSGQUEUE,
+ 	UCOUNT_RLIMIT_SIGPENDING,
+ 	UCOUNT_RLIMIT_MEMLOCK,
  	UCOUNT_COUNTS,
  };
 =20

--Sig_/yVr=.DtgovgK8=XHL/+gLWl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCt0NUACgkQAVBC80lX
0GxeNwf6A99dTz7b7BzbVrd22BPExWhrvS2OKUjK34oUu3Q2Mwz9V4GqT1Sr2NtU
81p2M8zRkQRZx1RgktFpSxpc6Ilurnog9I+CXsLCPOiOMSoHGApvTKUiH8MyKoNN
aSFvhRsKHn18rfMjNiGkdGCdp7wlHqcY+nAQ7AFGuwXQeVsWnq8lFi5tndsjEcUA
GkBdxK5h20ucBh9IDiqdLThHdCF6HQ+G2FcLjbttjetmJhSWdA+b1oZih/UY3OH0
vOSikM+ap+UNPAQU6OpTopriw12lA+cLBDZ8jg+COlpgrRkid/Jo/CQwYaOUeOR3
SmbGp3sGfuEZM71EiLmN4uy9tidlYA==
=HvrR
-----END PGP SIGNATURE-----

--Sig_/yVr=.DtgovgK8=XHL/+gLWl--
