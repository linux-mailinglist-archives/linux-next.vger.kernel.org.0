Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC47943D7F3
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 02:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbhJ1AQy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 20:16:54 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:52019 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhJ1AQy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 20:16:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfmJf25Xtz4xbG;
        Thu, 28 Oct 2021 11:14:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635380066;
        bh=EgfOD7CjT5IcvHjmIcTpoztjjfDxrjya/WzWRIM2U34=;
        h=Date:From:To:Cc:Subject:From;
        b=Xk/V2+aXoYD4sfa3csjvK0hbl4vo45tSo3Tx3kW9DIGNw1snQQwQ1laedPaEQZ1cS
         fmo/Z3h8yXn/Z9GuWE85E5YHq8q8U5Pqz+4DDrpPoJ93PQoSwaO8eWZemMdIGK8r0M
         ZLbViUzwrj+tVv2L0dA2MUeHcNQInMhFIYkxx+9uBfII3mcMKK6ssKIXYxNeT0mOKN
         uE5oYjtvg61lEoaOBO3cAmsHX+wMSdiV2vCCOWunsiIL9wL4bv48c5+QkWj7JgfwS2
         pAOKA2nhqr7ud79+NlcmX/RWdoW49JT/W3MKqF0TkJPODU5jtSVFO5XxM9/uqDA0sh
         kXK+oMYcNUUGw==
Date:   Thu, 28 Oct 2021 11:14:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20211028111425.456aa88f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cA=D69+i8pAqj1u3fnTZW3c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cA=D69+i8pAqj1u3fnTZW3c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8bc3824f0ee2 ("drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN i=
s not set")

Fixes tag

  Fixes: 41724ea273cdda ("drm/amd/display: Add DP 2.0 MST DM Support")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

  39b3c728e5ca ("drm/amd/display: Add DP 2.0 MST DM Support")

--=20
Cheers,
Stephen Rothwell

--Sig_/cA=D69+i8pAqj1u3fnTZW3c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF562EACgkQAVBC80lX
0GyRnggAi+UO2EOoz+9bnhB2trFpT59H2VEUgd4VzUjwcwxGwZlM/myvs3QaWTr3
M8cBmpfGojrUwXHRDDaP/8uAW0T9gUK1uXYGYmKDIg53U8GyQf6vGi4P/ZPf/EPE
JsvBRdzoXb1Oey7Ot/Cvr6QUuwrkWX2x1KvGk7AHmKC5scLz2fGkH8OgmcJd4x3o
xCA6c3w5PbzkN4y1RCR67vzFoCZRDAa1hF+mzRa5iQMFVm5D5SdYF+7m2kOgb6vt
vcucn/xmL2REFpnHS6FIExVcrF4VQy0j86CMvbsmYLcIAy7HZFA5r0AsY/KOHvYE
KYxKrq7WtLbG7dgkKKz3YlqFIHClZw==
=NQB+
-----END PGP SIGNATURE-----

--Sig_/cA=D69+i8pAqj1u3fnTZW3c--
