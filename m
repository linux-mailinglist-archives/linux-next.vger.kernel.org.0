Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33012A778F
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 07:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725298AbgKEGui (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 01:50:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgKEGuh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2020 01:50:37 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BF1C0613CF;
        Wed,  4 Nov 2020 22:50:37 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRZ0S4yqvz9sSs;
        Thu,  5 Nov 2020 17:50:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604559035;
        bh=KMFs+51xchVCny2BoseXOTP3DtQHswbvOZzcGNF4J2w=;
        h=Date:From:To:Cc:Subject:From;
        b=L56AONlEzqN0j9OPe+mUDe1lzfvLXmeqZsm8xKN0olUICORmH4EXxdqvXIlMLdIJn
         1A39yilzL0vdkzavLRiCFU+5kO6q5yPpg7YQJyTwvyHdZLByeAHw0Qis+a6Zup18id
         CCNqcU2jU8Xd7ksZAcsJd+gSyB0kSYVDj+6M5Po0HiaV3MJWTPMJJkx6hAc2cEofRa
         ELF37570g6m+epatuMRkleELbxHvQwZUTaQbUES8YJnFpQ3rUAsKC7SWTW3CWoPJaQ
         odM2jAVw64bMGXCaJhNWhxhQO2SlMdHzW19IprmYcP3i5KEXDtOo5dZ/CQK6j/wrMu
         EJjTPWRNXsBxw==
Date:   Thu, 5 Nov 2020 17:50:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20201105175031.00e0b081@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OtWQb0KYZWLwU0EAd1tNEa7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OtWQb0KYZWLwU0EAd1tNEa7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

include/linux/dma-buf-map.h:106: warning: Excess function parameter 'vaddr'=
 description in 'DMA_BUF_MAP_INIT_VADDR'
include/linux/dma-buf-map.h:106: warning: Function parameter or member 'vad=
dr_' not described in 'DMA_BUF_MAP_INIT_VADDR'
include/linux/dma-buf-map.h:106: warning: Excess function parameter 'vaddr'=
 description in 'DMA_BUF_MAP_INIT_VADDR'

Introduced by commit

  20e76f1a7059 ("dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interf=
aces")

--=20
Cheers,
Stephen Rothwell

--Sig_/OtWQb0KYZWLwU0EAd1tNEa7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+joLcACgkQAVBC80lX
0GyHYQgAkcUWDWS7Qp7s0NEcKvGQ/fTY0dfJzESnLSpe9hcFHjexq850QfyN79D3
3Rg7X2iEUzXpIJhay2uhoD64rGPc0CoMNr45pbPOydAQwak5vKFqeZQTpGjRUur1
HmqUMK+9tnqJaI7aP0LijNn8nWYL7eds8izd8Rn1+R1QKLVKT66e3ofBJ/7IPcs8
fmUmgxow2oaBeuS8GmI7J96dFY+0GrB9egzwL2rIgTMgVl9lBTOsqf9s+veKmrlM
8e8YWuyXwpaHzB3YlUO6aVdCOEgeTaZDdLcRKNGiMnrFLX7YxKAKY2hK4hp1D14r
zKc7aPjLxTo4cvRtKT8cXbcHHU2n/w==
=DIsL
-----END PGP SIGNATURE-----

--Sig_/OtWQb0KYZWLwU0EAd1tNEa7--
