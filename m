Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 233881B525E
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 04:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgDWCYb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 22:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgDWCYa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2020 22:24:30 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E19C03C1AA;
        Wed, 22 Apr 2020 19:24:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4971Mv6JbCz9sP7;
        Thu, 23 Apr 2020 12:24:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587608668;
        bh=5fzpnDBD3kTHv78dET2bCLbFuvakH+fA/CNPxrKUKr4=;
        h=Date:From:To:Cc:Subject:From;
        b=ZeJxcYmpYJNiwo84HYTaPIwqhkbHq+xqcG1hMzxBZdMzAwCm3M3evOpHswR6h7hk7
         WNqEYlNKBqzfsWRYs8wO5m4C5kTIxKqTX5daR5jOVZa+eCIACw6M8nE7WV5ZarMUjV
         ASodkdWSR7uKDKEwWA8I6KB54ccW/c9wsBmDfZ5QZS0P/g1TNCpcghMdM5AZZm0AOF
         9GsAK7FUPBxZW/dq5H8JdimPgu07dEIor6brvX5i0STpmzdo+IJSRDLceFwQICNyk1
         7pDw4m8FKnoqh6LfHLduOkTP4CSqQPGsBoXABpnGLRvUdohNXFT2jl7mcd9ADR+sHZ
         TTYhsjCWnuxHw==
Date:   Thu, 23 Apr 2020 12:24:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yintian Tao <yttao@amd.com>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20200423122425.268829b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BQpd7i+P6VKAZHz0O_d8_2.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BQpd7i+P6VKAZHz0O_d8_2.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c: In function 'gfx_v8_0_ring_emit_rreg=
':
drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c:6396:21: warning: unused variable 'ki=
q' [-Wunused-variable]
 6396 |  struct amdgpu_kiq *kiq =3D &adev->gfx.kiq;
      |                     ^~~
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c: In function 'gfx_v10_0_ring_emit_rr=
eg':
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7608:21: warning: unused variable 'k=
iq' [-Wunused-variable]
 7608 |  struct amdgpu_kiq *kiq =3D &adev->gfx.kiq;
      |                     ^~~

Introduced by commit

  5e25f26086f6 ("drm/amdgpu: request reg_val_offs each kiq read reg")

--=20
Cheers,
Stephen Rothwell

--Sig_/BQpd7i+P6VKAZHz0O_d8_2.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6g/FkACgkQAVBC80lX
0GzaFgf/Qj3aXLZUp0O+JHZWgDi1JsKq/nFApY4R/OOqpPyRwGhEYjigTtJyzrUy
s0JIz9eGgthsJ//IxNdRcSyaID9wNiit0c0eFXlYe4QRDbrlVbxvwr12TL06/x1y
3hCg0Kpuy+/2MkWu7dJ9CkNBO6rnIgJGRJME/7r53LPX9m2nFD4VKBOoSzPFjzJ/
X+iuP81rV+PVWAcEGZMsL+6ptOmj6Dc2X0wpUAz0oWNS5aD+VBdfvXogsWzQRRRI
+0bubql4Upy20k1OQpI2/v6oM9S+V3knNde0pg3d7N/G5DKljsEDMzCUKBTisUs4
fIjxa2IifJ5vSvIuP6Q7zjAx00C8Tw==
=BYBC
-----END PGP SIGNATURE-----

--Sig_/BQpd7i+P6VKAZHz0O_d8_2.--
