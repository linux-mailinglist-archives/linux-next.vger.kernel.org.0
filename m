Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6924CF3CCA
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 01:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfKHAVc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 19:21:32 -0500
Received: from ozlabs.org ([203.11.71.1]:59651 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725928AbfKHAVb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Nov 2019 19:21:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 478LY51kKtz9sPT;
        Fri,  8 Nov 2019 11:21:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573172489;
        bh=wJ134fVt/5GKrex9pkMrD0W2xjP3wa4gqJRMV0Aa7ZA=;
        h=Date:From:To:Cc:Subject:From;
        b=bMbOArz5LIdC7KPSlepL1XlnuxPJG+QBJpC9PtdNbKKT+YhBKRtBjzcQMJFLH8qiu
         Y5rVqWibDDybFilfSKAg/amZP1PHWga+1wMecFJJB0uutmxp4KPLddRz3QYFz7vLF2
         2i9j5NByEJ8yhm52zoMxJoyTa+k8jFNR+iY/sCSa3A0+7mjf76niDd28/4F8lgYMZi
         AVdBs2MfSNcmKRx80RcWLXurO6J8OHgWp0+2IaY4Q47yxl286Fu5/pHbiuK+kv8l7F
         BwCNPkwTG8l4cfOEX0KNfLQhGMqIBvArpKR+AVAOVw6By3b/C7VqF1vbaQo8NA6QTG
         x6XTRE0l2U7TA==
Date:   Fri, 8 Nov 2019 11:21:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Leo Li <sunpeng.li@amd.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20191108112127.33c01bb5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3llplXz27kiyECUYPLPt1e5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3llplXz27kiyECUYPLPt1e5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:503:13: warning=
: 'dm_dcn_crtc_high_irq' defined but not used [-Wunused-function]
  503 | static void dm_dcn_crtc_high_irq(void *interrupt_params)
      |             ^~~~~~~~~~~~~~~~~~~~

Introduced by commit

  75856c84993d ("drm/amd/display: Send vblank and user events at vsartup fo=
r DCN")

--=20
Cheers,
Stephen Rothwell

--Sig_/3llplXz27kiyECUYPLPt1e5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3EtQcACgkQAVBC80lX
0GyR0Qf+Pu0mbi8E3nBNcYrCaxPPlQdy6fPotX9X/Kk/cnK+ExqLPV+uwOC1bqme
m6ui+9nRBgZfYaaz0bn7cRcE6K6XcxqKjMX3KbEbq8pj0ad1QB1+r20g/fvWD06H
DQ6uEh1B/c+hS6OWHe41Q2FIdwjR8gMDejbLZXDjpXgLaJDQIXpw+OS+LymjIOWT
u6H4kQm6t/i2++OJJDDWMGcsZDRjsolFdOAj0FMXPVYTQCDmXQemTnsWL3h5zrvB
g6TVI2RGpsoXMKAHnwHacE3k5fEYq8NEnAb/qRLCln0GGefG/qhzYjNT7n8ojxhA
EBxm9ypGizTXEJpoPPOV9DwJHtIyzQ==
=cXti
-----END PGP SIGNATURE-----

--Sig_/3llplXz27kiyECUYPLPt1e5--
