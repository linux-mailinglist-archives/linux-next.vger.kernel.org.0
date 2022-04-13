Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4382B5002C3
	for <lists+linux-next@lfdr.de>; Thu, 14 Apr 2022 01:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232879AbiDMXtq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Apr 2022 19:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiDMXtq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Apr 2022 19:49:46 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95904496BD;
        Wed, 13 Apr 2022 16:47:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kdzln3Dtgz4xL3;
        Thu, 14 Apr 2022 09:47:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1649893641;
        bh=qH/xSM14cxvQij1hFLVu+kiAPdsZvEdmpAYyPixvxek=;
        h=Date:From:To:Cc:Subject:From;
        b=ZfwxXHhRF2TT05px+iytAli/nFmDCzJld8e/jro6DGDbdc0Qr6kgvPb1nOoQXie0i
         dekLtpC4yeJkOmjmDd2P86yM66vTe91YO5YMD5yzLyVilD8ymvTcD3q1wdgalRjbRP
         MjVhSRwKCYmkAJrG6AoHMvGOY/qeYRHWauuXEgh1C3SNfZ1nS7c+DLLV5Ahexe84wH
         vtf9oGXZ99zuGyPbivBLj3BvmVXirSsgsoymu300/NFCe5Ma4kkO5fZ1RVVekpdYOC
         QVt/iz7liVhHO37DtuRP6oevZrLaAf0Z94n44URBv+ELZLvMxY2VAafyrs+PrASGzH
         MK0nyvXnSSQ3g==
Date:   Thu, 14 Apr 2022 09:47:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20220414094715.4c2e0127@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Xpe14MVmARdV4iD3t4pUP/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1Xpe14MVmARdV4iD3t4pUP/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/radeon/radeon_sync.c

between commit:

  022074918042 ("drm/radeon: fix logic inversion in radeon_sync_resv")

from the drm-misc-fixes tree and commit:

  7bc80a5462c3 ("dma-buf: add enum dma_resv_usage v4")

from the drm-misc tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/1Xpe14MVmARdV4iD3t4pUP/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJXYQMACgkQAVBC80lX
0GzMoAf9FKTF9iImNzKRO3UdcLsXrWTGX3GJJBDJXQvppCSODDFibUtrrx7Nh6PQ
zWUHK0TWdkUMAtFR2R+hUHdzZp2hkTbNVQzU7DsZIJtP6V2/r122Hy2AVNT3u14/
RBe8R/UflsTfvbnXmqTtCWQsvfw+TdHKHbtnDlOCAzxD7V7T7Q2mRMZL1R3/MhBa
Vn4c9ml9AjN3glIETxv4b14zpzEtc7R11wbekjZ/Hjok0erw3RfBcO9g9nFLzTW/
ao0t05QhF+TejMJTTbJfufbTw81FQZ6h/cqfTDRVrTkkJm84VMWBen6QlyhJ62DK
xr/6oDOdXwKfegVRzBHrCUn939gqeA==
=b4G8
-----END PGP SIGNATURE-----

--Sig_/1Xpe14MVmARdV4iD3t4pUP/--
