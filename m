Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF3437B18B
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 00:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhEKWUd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 May 2021 18:20:33 -0400
Received: from ozlabs.org ([203.11.71.1]:54157 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229714AbhEKWUd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 May 2021 18:20:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ffslw0q0fz9sWC;
        Wed, 12 May 2021 08:19:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620771564;
        bh=gs6L+JN8iicTuEapOAjT9bM6srgu/tmpQND/mdnqrLg=;
        h=Date:From:To:Cc:Subject:From;
        b=UVcbmk3C3IRqTmujO7SMic2p4TfFKAE5/QeA0UgPswlnSG22EUDytXFye7kkoi/ly
         KtXlpA3GGL8nw14+cvSjltUrg8JCtbNXjQgIUu9cRdXUUxzp0ffQpZnn2ejopFxtnq
         y6dy+Yy+sBfwrT4zMSUFy6s3wXttXzoXUfN+IyGwnNoYrS055obfFp8sA+/EnE1Q1C
         W2X6ECXUwKG+U3JyXKHqJGz2MFH3T7dkrZzrOMQo56lySryRJc+2iBx+jz/GnOaryS
         MGeS7q6LJE7I6DeuyrLXHpqifjpmkKaBtzb//TbyjeLgYtXFUVCta+yi+0VO5Ic+Rm
         JASB2GgehB6ZQ==
Date:   Wed, 12 May 2021 08:19:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20210512081923.00737f5c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yIlA1w86gb=JZGnmdqQePPK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yIlA1w86gb=JZGnmdqQePPK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d4378f172385 ("drm/amdgpu/display: fix warning when CONFIG_DRM_AMD_DC_DCN=
 is not defined")

Fixes tag

  Fixes: 77a49c458931 ("drm/amd/display: Support for DMUB AUX")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 81927e2808be ("drm/amd/display: Support for DMUB AUX")

--=20
Cheers,
Stephen Rothwell

--Sig_/yIlA1w86gb=JZGnmdqQePPK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbAusACgkQAVBC80lX
0Gz0tAf/ZPnIszVmiqWMwzsvq025+BZ3OIdw1mxixgWeXn1nsZx7HlCi7machCjD
9wrKK9P0SQKCHSiiYM0N8BZg3Ctln+mhyRag7JCpQEC9YSVx+1cq+cb+fiIVoQ2m
E1jV+CymMtmGN9rORDq1wJPcFgxiXROTFEWCEGmt3dQImP+BNY+dKUdZz1+KRq27
LRXxhMAGJnaDI25etDEzZeVpFPmAjvFqI6GSz0bNRv1RQY6w33pdrVODnTSw8iV7
1T1VAcjT/hWvVZ3RULc2bdizgzv3vJzkIZmr7utGCIg2C3dsbIG6QEsbr3NH+bkT
TGSEgwHmDlAhkSyYkhn3xcNO/Ywilw==
=9N1K
-----END PGP SIGNATURE-----

--Sig_/yIlA1w86gb=JZGnmdqQePPK--
