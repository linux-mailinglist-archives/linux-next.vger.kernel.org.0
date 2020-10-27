Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE87029A209
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 02:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409107AbgJ0BIO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 21:08:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34097 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409211AbgJ0BIN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Oct 2020 21:08:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKtqZ5JCMz9sRK;
        Tue, 27 Oct 2020 12:08:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603760890;
        bh=RVhtUNwgIsxWozCYg7fWyrfnYuOxzoorV1O82f8QJlI=;
        h=Date:From:To:Cc:Subject:From;
        b=SnfeHvYvp7QFN1qNnlFXwMhe7frc0s8MC5AeORGTJUvOARi7lER872ramaNuN+UWp
         HEjh2ydpIHonW3HperAKYo5iav4YHePie7fwYxUEzWKtciFMaL3AK/JMXWy1DOZsOX
         kUG/1f5g9y9/STUAZP1AKDfGCCCoYVrupdPU0jn8Xbo7/pJ+WBzSR4JzcUz9wbepnD
         RMsslJefr6BUzGRQGRQ0ML9Qoeg6R67bwbvjazU3tWRfsjeYb56p2yBmKMuU1V1pnM
         U/NNIja+74ihpX1m+zhC/8dOmZ64tp9uf/YWta9kqatcYxBHpkGuWTtpfaSYoO17e0
         88ZY/R+eQTLMA==
Date:   Tue, 27 Oct 2020 12:08:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20201027120810.00df2f1e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vtDp4MExbuP8Zz6arD6h.99";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vtDp4MExbuP8Zz6arD6h.99
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:


Presumably caused by commit

  c03c025c87f2 ("drm/amdgpu: fold CONFIG_DRM_AMD_DC_DCN3* into CONFIG_DRM_A=
MD_DC_DCN")

I have used the amdgpu tree from next-20201026 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/vtDp4MExbuP8Zz6arD6h.99
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+XcvoACgkQAVBC80lX
0GwVSwf/XHZL9W8rrwzF+utTZPqVMoIwl2VGV287hvs7oywGxXVR+F9p8Iz7xIXG
kD9QKm80j66JSoQ8y2uwSx5Z2osEiWn5yQhO3uIZGJ5dqKZLSSdRbPg2tUBDX5lF
cNT0S4AqonMxoIH4j4nWUPniYZhBOVnBBBS2J+1Oy2SCbJGFqvt3HCFTI+t2GjMd
Zhq0MruBk9j7okp4m4vFoJQUls7GzdzuC2LrX/LRaDFRNKK3l1xRsM1or2nwWO9b
PLmQeTeLap1wDgfilPmereEiQ3P9ZI0vNAtnoAIiJhIQszydxWsd4wl/VJ4/rLdE
amBatgRXcwutzEGVf2EUlKhJ+pBu1A==
=2+wR
-----END PGP SIGNATURE-----

--Sig_/vtDp4MExbuP8Zz6arD6h.99--
