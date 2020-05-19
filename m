Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A489C1D9F94
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 20:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgESSgf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 14:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgESSge (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 14:36:34 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E001C08C5C0;
        Tue, 19 May 2020 11:36:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49RPjX0pyjz9sTH;
        Wed, 20 May 2020 04:36:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589913393;
        bh=uHf/n/3lhq80d/20JbDIKvnFDtOjqWPxZBs/eern4Tc=;
        h=Date:From:To:Cc:Subject:From;
        b=nchV7XJFXHz/dOTOpSi/rBos5yGTV09NBskEw0f3KCv61/NCpPGVL0/OC6GRGPNta
         zcRGVBs/sq6LjR0LsLra8DmcqXOLawjInD6R7lMssWwUz5OKICVbOrgovVeEnYeuai
         AtZjFc3uhTaaVUoKPZLr4O1sLdPM5OK3VdsPxp3bFpubDPIAt6wg7jTQT8YgPSFOMK
         fb3fa25NpJrAM6fXIbuZG7ihcKDtU7F2/vmDPx+qHEbblINgx90K1P9Jv68SwvsIYU
         1bnTZivcJ+dwJLMsrvzWzlOu1XVmld6fnabFdVk2p95N9+uzoP9QVrtkwiz+6O8REM
         wAToACIaqONWA==
Date:   Wed, 20 May 2020 04:36:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: linux-next: Fixes tag needs some work in the iommu tree
Message-ID: <20200520043631.41a150d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QZtWuWWQjElsZXikxlRXNfy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QZtWuWWQjElsZXikxlRXNfy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ef0865631ae3 ("iommu/vt-d: Fix pointer cast warnings on 32 bit")

Fixes tag

  Fixes: d64d47f4f5678 ("iommu/vt-d: Add nested translation helper function=
")

has these problem(s):

  - Target SHA1 does not exist

Fixes tag

  Fixes: a3bea1a35c083 ("iommu/vt-d: Add bind guest PASID support")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: b0d1f8741b81 ("iommu/vt-d: Add nested translation helper function")
Fixes: 56722a4398a3 ("iommu/vt-d: Add bind guest PASID support")

--=20
Cheers,
Stephen Rothwell

--Sig_/QZtWuWWQjElsZXikxlRXNfy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7EJy8ACgkQAVBC80lX
0GyfpAf8D2Cq6o0ggkCuC3xkUXuOF2h3mbMy0b72PY/Wvls23FJGiQVRjUQ2d0Xu
Xea683UQqLvpSwgOdmIWnUVQKzp4I28o6fO9vXmYuZv9BM1d24j5yonhm8MsDnQn
Uu1gYTI20Z1hy0qmYut1X3GBCKOdQtShVCEf0Tq//LIy0DJPRgYmHsiFN9nqCKZL
0FNskQZUMY9jAqtmyzP+qx5x3bhIajK+hcyBw+e+ePGqMGSoW13zhko1/yMm8Yze
WE1qHu8CQGb9fupZnKDLQs8/CmY8I0BLRjz7GFC3WJMwtx0c40aqUKGJzNbqk0jj
S1CPjc8Kb6JyzuvC18RNmePstVmShA==
=qyWc
-----END PGP SIGNATURE-----

--Sig_/QZtWuWWQjElsZXikxlRXNfy--
