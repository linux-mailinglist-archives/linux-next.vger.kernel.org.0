Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71AC214ABB6
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2020 22:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgA0Vip (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 16:38:45 -0500
Received: from ozlabs.org ([203.11.71.1]:43399 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgA0Vip (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jan 2020 16:38:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48635t21Lbz9sNx;
        Tue, 28 Jan 2020 08:38:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580161122;
        bh=bm5DRTf8LkaPVNLK8Gr0ajXrGGi2+RdpyrhkpBOSE8I=;
        h=Date:From:To:Cc:Subject:From;
        b=oYuRkUN/cFYoi9rV3sdUWQyTbEYBzopLveSAgY8F5+C2zr/ve/zp5sbvbV/beq2Ey
         TieWqSVmFDDVcDFPsiniMgO4zE5/neeuXbve8TJz7gnuWq0YgmvlwkTlcD7i/37C2c
         glRq+msYdXy0+ku4/m9iUKfdAyhPrN2fx1WDCAmh52Cp+egW1NN7InCBceEJrz7QEe
         aIvuDK5aqI+Qry/TXWTgK6/NKRJDrv+W6McT/IYZ0CKAqoNPKdssLSY9L8ILnGfVeU
         8DAJ0+RI60SH4hcIuK9l2Z+035b/I2izlv5y/x3OPwLvK1cGZ8jT2F8a40QWHaO5oe
         aJpqsXZk20n2w==
Date:   Tue, 28 Jan 2020 08:38:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the amdgpu tree
Message-ID: <20200128083838.12b2cd2c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/18Agw/yPg7Wd00rHatx5e=n";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/18Agw/yPg7Wd00rHatx5e=n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  9909ad4c6545 ("drm/amdgpu: Fix TLB invalidation request when using semaph=
ore")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/18Agw/yPg7Wd00rHatx5e=n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4vWF4ACgkQAVBC80lX
0Gz5hwgAhUXG5tgLjoIuTxNDIxvTfxoR9cJpQIf+rbaUOpMeN1hvFN1tmjSP+kQd
g4DM2bi3Gk38F8By5g6iN7iX9Hows6fQuIK0OVSVtOplANIoC7vhUEc/PoX7cBtc
9hMDMrfvl/tr8pJ9Fpx/oWxgMQNSPX6XPpBGjDA9IZhsIUZv3uL0dEbbhSfjEB+G
L1qYpDH4+/Uy5/XSMiXmDZFcwQvtUAZaF9pWmvda7QsP4kWJkP3xDRL8eZZIlKMJ
2GAIpJv5fbxz8vghL9YtdPv5v/ul16MeAjxdQWmCB1gimIHxDMz2PifSAyPZ/hA1
6k3OoLFqfMMPoPpXRg7KJP9laVZ1xA==
=gTMR
-----END PGP SIGNATURE-----

--Sig_/18Agw/yPg7Wd00rHatx5e=n--
