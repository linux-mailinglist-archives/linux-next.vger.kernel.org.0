Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E8F4609B9
	for <lists+linux-next@lfdr.de>; Sun, 28 Nov 2021 21:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237994AbhK1UvZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Nov 2021 15:51:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbhK1UtZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 28 Nov 2021 15:49:25 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44851C061574;
        Sun, 28 Nov 2021 12:46:04 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4J2L9M5cVRz4xQt;
        Mon, 29 Nov 2021 07:45:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1638132359;
        bh=0vW6Y/+NF7V92m+XlIxTGFlGwtQ+RjC+SvrzKeT5XTI=;
        h=Date:From:To:Cc:Subject:From;
        b=NExpTWdh6oZ2CuFjCzJuUIrY+klXO1+U9O5TAulS+uTsiYEEHW2W9kF1Wdxv3f+Wg
         GXW8JAwZPphql2niSOsB3fFuM9nN2ICjleLUVp7HNIoyIHhq9qJHyF8+/XpeajNTKX
         /1LaYR4Y9v28XixgXci4GJ6IhmyvNYf/7aiEkxkZBE3IhbW+E9VRTMz8GrFeePpZ5f
         Um77ZJ9dW6D7ZMfWaCzIGDJVeyF/pkkj52CuoIBjI2PJTmPrTTN9NjbkEKxuawX1qa
         Odr00wgz3r84eHTqpmz8bdsEU6KUCrv9h5ve4CYN/N7osPInoNfIkyRqLXSGeXjNAp
         T45wHpWMWKybg==
Date:   Mon, 29 Nov 2021 07:45:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pidfd tree
Message-ID: <20211129074557.6133cb3b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vj4j3B82LTnSRKNR4XrpNMb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Vj4j3B82LTnSRKNR4XrpNMb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0f8821da4845 ("fs/namespace: Boost the mount_lock.lock owner instead of s=
pinning on PREEMPT_RT.")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Vj4j3B82LTnSRKNR4XrpNMb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGj6oYACgkQAVBC80lX
0Gx35gf7B8sJlGtnCCv5wYbo62Ss4onX+tOTcdlLcv13BEXS5icXjOd/Lo7+nt37
2zwp7BHYkT5twpdB/kZB/e0O43Ze/ahGa8+hmQuyiB8nMXNtE7LdQxjXprssf3v6
A+F7y9twGL0I+Ju4kofWzudvj8kfvG3HyRBA4Yy3pMx6GBsJweiCqdZjYPPIQhew
pT3GmwK6nYpGO41W1tmVFuys/L1WG0fD/bxT5HW3rs2q0OgMKpBy09hzIzJByi78
6Zzpt5EVEkKNZG6yzAWuXIHYIi1tn87jy57nE1IAsxtY/DPUU5liCnmAZF4N0lil
Bm21OUb8pXz0VfpyPduRGUEpWz2LLQ==
=1GOw
-----END PGP SIGNATURE-----

--Sig_/Vj4j3B82LTnSRKNR4XrpNMb--
