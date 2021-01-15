Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255072F6FCA
	for <lists+linux-next@lfdr.de>; Fri, 15 Jan 2021 02:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729392AbhAOBA5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Jan 2021 20:00:57 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43127 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbhAOBA5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Jan 2021 20:00:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DH2sW2ltrz9sBy;
        Fri, 15 Jan 2021 12:00:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610672415;
        bh=pFZtsSKV3VID14I9NxcVzyczo37+sO1HzkPktURB6Dw=;
        h=Date:From:To:Cc:Subject:From;
        b=SZ7Z1qgHppuwW9l+Cvh+nPManb1LR1MQ/Lwne0kRh4TWfj8oiUEnO8GehW9NfsL5F
         N+nenJTQ/UfcTvlf7mNfWalgeDcUCVTxWuipr6hDmzy8I/SatMuhs6nJ4l3SV0aObO
         90wrFboOeSM8n3bStB0oIjaekno2NsNgqjIYGceUNkCpTf28ZgfZglEGuK5rU6dOPY
         vgWFf96ZQixkZNfCxd1Xzslv6pALxgFQzv0N31GyDvRfZMk3EbmV3+QcUbCpoh5sfw
         TPy40wQ+wwcjsxMvSDfg/u06k4qlR1vaYHc6UeoxI8pZA/COV/aiHZqmMOCaOxgGSi
         176+7G/rdmmuA==
Date:   Fri, 15 Jan 2021 12:00:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210115120014.4211dec6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rUleKG7Uah2E5vgc_m5JP0k";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rUleKG7Uah2E5vgc_m5JP0k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'd=
m_set_vblank':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5380:33: warnin=
g: unused variable 'dm' [-Wunused-variable]
 5380 |  struct amdgpu_display_manager *dm =3D &adev->dm;
      |                                 ^~

Caused by commit

  98ab5f3513f9 ("drm/amd/display: Fix deadlock during gpu reset v3")

--=20
Cheers,
Stephen Rothwell

--Sig_/rUleKG7Uah2E5vgc_m5JP0k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAA6R4ACgkQAVBC80lX
0GxAaAgAn2klmAI0wOutSvxHjuCLfjTb6qLSJXnQdYr8NiPYY3xbb4rsvbSI7S48
uBgKFHfO6w8bjiwAQZr972q+DZ140tqKq+4adiI+A1PI7L//dp6vKSpbOv3ckI3M
3kssZn48TnrCUojPCVgm8NycYywDPR2wufnyT+MQ8BQ2spXg9KtxwM7H26fhPpQi
5wBOZpv/ZoTtRTokClGH9Z4352yYJvU+/y2yd9NphsVEu2emUaLhzpceNjDIp8JT
YkRIcR0iwk61233g3xN2FRS8N/znXRdtqhrVXfAT+4HrybxrMYWlOPoQQvBiIEAw
HMQMu7bzqeQxgSjVODvs64GDmj+9UQ==
=rt4T
-----END PGP SIGNATURE-----

--Sig_/rUleKG7Uah2E5vgc_m5JP0k--
