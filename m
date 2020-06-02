Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6714A1EB8F8
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 11:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgFBJ5o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 05:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgFBJ5o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2020 05:57:44 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77DAC061A0E;
        Tue,  2 Jun 2020 02:57:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49bnXQ1L14z9sSW;
        Tue,  2 Jun 2020 19:57:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591091862;
        bh=JPDQGGFP+kA5UYz5ysXHsEATvrHtDzNbEvUwmbhd1Bs=;
        h=Date:From:To:Cc:Subject:From;
        b=KJW0LiHok5p8SBm+NDsy0dI28T9t0XXL5sWiGP0k5cmerg6oSdeOpi3y38vkNWc6G
         VqZnDEOyaL6hBUCBz86c24Pi5hOxuwEW1NU6iE+zXvw0Tn+YbSlJ8H2J4N9ZHOq1Q4
         2v0ocItRkA5bIEsd1uLgmSs8V35yhDFwK4PeAeeDPAtgJzum5gvIvRtwFX9tLrtj12
         4WvpPicjA+3aQF2OFR7sixbwwfrLdstKuW3uiIZ5m37xAQ27ZKyQUIf7DL4XBb7uYa
         IoO2XOuj8wai+nTj6DM4/9H8U3YrhnjUBubOGdthREEfjsjNuOEJ//1fdzFLyoVqmk
         SoIOxobgQJaLA==
Date:   Tue, 2 Jun 2020 19:57:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20200602195741.4faaa348@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//mJSjeXXpXUR9j/EslE6syt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//mJSjeXXpXUR9j/EslE6syt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: modpost: ".probe_user_write" [arch/powerpc/kvm/kvm-hv.ko] undefined!

Caused by patch

  "maccess: unexport probe_kernel_write and probe_user_write"

"These two functions are not used by any modular code." turns out to
not be true :-(

I have added this patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Jun 2020 19:54:05 +1000
Subject: [PATCH] turns out that probe_user_write is used in modular code

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/maccess.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/maccess.c b/mm/maccess.c
index ddfda8e6f4a5..88845eda5047 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -246,6 +246,7 @@ long probe_user_write(void __user *dst, const void *src=
, size_t size)
 		return -EFAULT;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(probe_user_write);
=20
 /**
  * strncpy_from_user_nofault: - Copy a NUL terminated string from unsafe u=
ser
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_//mJSjeXXpXUR9j/EslE6syt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7WIpUACgkQAVBC80lX
0Gw94AgAgALxrUEtHxIlcdEpMrgfi4OwhUbpRxMBLPA+9ysB7Vg7RfGHT3TuK1qC
J0XorDZCYfG7XFP2qr7bpxomNoUaxk66Y/oljETDaHAAhZjX2nKGemtPiG8WYdlE
jaLIe4n7TZ6lFhvxaw3PXWSayTlhXmQbLRyuUd4evFy0+I5SnY0FO9H1kDeXeDzi
ydP9v5SDnUifNCBai6vTY//DLpU/XzMchQiahp/KImyuqUkU5Ys76+K8lo0Zwc/u
cJCB8RS9adIl8Lg+FB+qQZmXVi9qY3GYN42rfpbnaoCI10LvlcVPPhLcPV9SH2Yd
OjohsvocqrWRIgdtxt+SohNVW5P2UQ==
=wOFa
-----END PGP SIGNATURE-----

--Sig_//mJSjeXXpXUR9j/EslE6syt--
