Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC633F5A80
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 11:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbhHXJLb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 05:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235264AbhHXJLa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Aug 2021 05:11:30 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D97EDC061757;
        Tue, 24 Aug 2021 02:10:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gv3HN5r5mz9sW5;
        Tue, 24 Aug 2021 19:10:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629796243;
        bh=DxU9rF162QESczE0Q2eu+iaYjYaaO7dR9Je0KWwwGIs=;
        h=Date:From:To:Cc:Subject:From;
        b=gGUIKTaT+cJMtW0OBv8xquzIhCzlV5maKF/VgQeyKXU1EyeoGVti8u8KNN0KugS8m
         ORmWbDaEGKDSUPnMpufJVmv5eH8pi/zVgncJqcJaIFXobE/zr7je7M0/yly0u8iCVP
         XatYtz7si0IuwnM4e7kYqkXEm04WaIPnlSbMe0uICoW+A0YRbmRvgYrC1wp81xKHE8
         zI9EHfg7FqhJIoukAHphemcDCXXJYIYqUytsURCNX9UX6s+zMeq0UJHxQQyNVtq2mE
         eM7CEaepJk3uJQJlhsIqDR1JSHUrQjYWY53qTRDSpMvZLYIXeuUYyhswlaxsVcGu76
         TMglrtXmaVhyg==
Date:   Tue, 24 Aug 2021 19:10:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Vasily Averin <vvs@virtuozzo.com>
Subject: linux-next: manual merge of the akpm-current tree with the arm tree
Message-ID: <20210824191039.10d869cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7nmc8zCM.N=aRPKEUVSaZzc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7nmc8zCM.N=aRPKEUVSaZzc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  ipc/sem.c

between commit:

  bdec0145286f ("ARM: 9114/1: oabi-compat: rework sys_semtimedop emulation")

from the arm tree and commit:

  7a4207f02a96 ("memcg: enable accounting of ipc resources")

from the akpm-current tree.

I fixed it up (I think, see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc ipc/sem.c
index ae8d9104b0a0,1a8b9f0ac047..000000000000
--- a/ipc/sem.c
+++ b/ipc/sem.c
@@@ -2216,40 -2229,9 +2216,40 @@@ long __do_semtimedop(int semid, struct=20
 =20
  	unlink_queue(sma, &queue);
 =20
 -out_unlock_free:
 +out_unlock:
  	sem_unlock(sma, locknum);
  	rcu_read_unlock();
 +out:
 +	return error;
 +}
 +
 +static long do_semtimedop(int semid, struct sembuf __user *tsops,
 +		unsigned nsops, const struct timespec64 *timeout)
 +{
 +	struct sembuf fast_sops[SEMOPM_FAST];
 +	struct sembuf *sops =3D fast_sops;
 +	struct ipc_namespace *ns;
 +	int ret;
 +
 +	ns =3D current->nsproxy->ipc_ns;
 +	if (nsops > ns->sc_semopm)
 +		return -E2BIG;
 +	if (nsops < 1)
 +		return -EINVAL;
 +
 +	if (nsops > SEMOPM_FAST) {
- 		sops =3D kvmalloc_array(nsops, sizeof(*sops), GFP_KERNEL);
++		sops =3D kvmalloc_array(nsops, sizeof(*sops), GFP_KERNEL_ACCOUNT);
 +		if (sops =3D=3D NULL)
 +			return -ENOMEM;
 +	}
 +
 +	if (copy_from_user(sops, tsops, nsops * sizeof(*tsops))) {
 +		ret =3D  -EFAULT;
 +		goto out_free;
 +	}
 +
 +	ret =3D __do_semtimedop(semid, sops, nsops, timeout, ns);
 +
  out_free:
  	if (sops !=3D fast_sops)
  		kvfree(sops);

--Sig_/7nmc8zCM.N=aRPKEUVSaZzc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkt48ACgkQAVBC80lX
0GziBwgAlhdFSdJ7tgYTz0u5QLKwluiLxNEKy5VzgF6OlxBDmPEWQS8kuZqfhYwU
vfwSyyhKxwhRT+6WxPcQsQkgUyZMYw+gOnNTHgSwBrhtOlfO4cPRPnmle1ncLStd
Pck/nqeP5KFuw7caVekofwSkXFrIVCwGrQQkGCv0KT0Tbaz/w+D9/YLGOPIIcErb
IwHB0dKxYKQhZ2S0yMsZCWnJJq2hxvvMkaOxI1gzNuvR9w5Rv1D022cN5Uk0aeIj
oQx19+2P+ATD+BHmlcs9r9YgU7MTst+DLZ6XsL2vcMxClx9bgRIz68Z5BpI7SqGc
nmSJmSbX2t21OTzZ2Ad1ewjsMtjmmg==
=OKxu
-----END PGP SIGNATURE-----

--Sig_/7nmc8zCM.N=aRPKEUVSaZzc--
