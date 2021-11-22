Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9A9459662
	for <lists+linux-next@lfdr.de>; Mon, 22 Nov 2021 22:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbhKVVLr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Nov 2021 16:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhKVVLp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Nov 2021 16:11:45 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE26BC061574;
        Mon, 22 Nov 2021 13:08:36 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HyfyC2l1Xz4xbM;
        Tue, 23 Nov 2021 08:08:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637615315;
        bh=kGDqJ30lN+FF4+CqPtMyEqA6aPbD0Nsm8L4zU8P4LOQ=;
        h=Date:From:To:Cc:Subject:From;
        b=JM1L/tsXJDy8KWL85dRtPRO3xZL/Z8/fyAdQHUtVgRZx3Sr2U6MmHRMFhs4q+RG/4
         uW1lRRjFCwaZIgV3NhXIyrWmqXDWTq9suiABTbpSClmhb1zSvU+Ud5tMVGra4XrvGk
         lPketPkgD9aVdanTdbtrcvi6BbBZi3SxDrcK++FT3UtwdL6IrOTBJCAizS86HtyoWb
         /rsSXIznXUBoq7bGdcOttPgK9SDVyNyrkiL6xv1KPewBxraeRCKsJvRJSpCy1/HVtB
         OJl2zCuSxA5ZJsowcDiY++l7FHZZhukGXAuoDTKtj3V1HUBcqG15jhn94SipRW0R8r
         mTE/jLQtTCVKg==
Date:   Tue, 23 Nov 2021 08:08:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Prasad Malisetty <pmaliset@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <20211123080834.00ebc15a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jKQ1.rY/hoHPU7E9cZ/yPVQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jKQ1.rY/hoHPU7E9cZ/yPVQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  66b788133030 ("arm64: dts: qcom: sc7280: Fix 'interrupt-map' parent addre=
ss cells")

Fixes tag

  Fixes: 92e0ee9f8 ("arm64: dts: qcom: sc7280: Add PCIe and PHY related nod=
es")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/jKQ1.rY/hoHPU7E9cZ/yPVQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcBtIACgkQAVBC80lX
0GxJOQf/ZgGrlbOu+teQ1PK7umv8DULsxWCXqFyBNvA76a7e85+w/GoaW3i37821
FRvIutKAJNAqSAUWDO5gJk991i3usHaP2pa+JhWbF4YPC6G+HBmBgM3Ax2zs/wtH
Lg2HmkD/XEjwLcQNeMqDvL4BLwxgMCsFImQCm5MmOd73ZMTBpZZ8etBNJsTbxw69
yxA/S7O2d6eyShaCh9V9ipW7FFk5U7H6ipFmInZSJ4ltVUqHHWGxftZe9ptJGM26
T3+mRytgn7dHZSmclA9SbA+w1Sj2rXb4wuDVSAGLZ/jTN0hgilR7XzEvzOHje7uX
WqFeQ7GLqGyUNOgMN0gY/NvaJXRCFA==
=LI1X
-----END PGP SIGNATURE-----

--Sig_/jKQ1.rY/hoHPU7E9cZ/yPVQ--
