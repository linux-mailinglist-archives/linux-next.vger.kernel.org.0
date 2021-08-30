Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535803FB2A9
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 10:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234877AbhH3Ip0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 04:45:26 -0400
Received: from ozlabs.org ([203.11.71.1]:51739 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234824AbhH3IpZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Aug 2021 04:45:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GykQQ54mvz9sT6;
        Mon, 30 Aug 2021 18:44:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630313071;
        bh=Oet/2ShYhw2WhmAox81rCS8HNSaRzTLzHbGsHoERplA=;
        h=Date:From:To:Cc:Subject:From;
        b=MOgzxvVQe99BPFYZ8yJ0Cw/nIgdymyzYzxBRWdr8nu9xYKJCLKy6XZqq1hzd6WdAK
         8f6D+oVY13WefjNvHcSkywmPSX/V64HZtK9AXZtmEUP13wxo8CB67BnaIEyCZtLCee
         P0nqiu8ssOVVSWwUn22ttbhr16X4FiKT60yqB7wNQ9pk7cp8YbiWDJo+3Ve/TJqh07
         SrC/NmY5DkV1rPTOipN4zPuFzZBgNpuICJYPG866ug9VmdHCMoK9sMw6B0tpUp/CcN
         /qIAhHN+4+J7hN9hAJZDt1s1z+gJeDMD4rzc5MJS8+5dvPEMK1craUR1clSJVIrjyl
         MXFMZlmRmZYDA==
Date:   Mon, 30 Aug 2021 18:44:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: linux-next: build warning after merge of the kspp tree
Message-ID: <20210830184429.1ee4b4d8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qEpE2bEw7=XPgc=TuN69q/w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qEpE2bEw7=XPgc=TuN69q/w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

drivers/gpu/drm/kmb/kmb_plane.c:135:20: warning: array subscript 3 is above=
 array bounds of 'struct layer_status[1]' [-Warray-bounds]
  135 |   kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL2_ENABLE;
      |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
drivers/gpu/drm/kmb/kmb_drv.h:48:23: note: while referencing 'plane_status'
   48 |  struct layer_status  plane_status[KMB_MAX_PLANES];
      |                       ^~~~~~~~~~~~
drivers/gpu/drm/kmb/kmb_plane.c:132:20: warning: array subscript 2 is above=
 array bounds of 'struct layer_status[1]' [-Warray-bounds]
  132 |   kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL1_ENABLE;
      |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
drivers/gpu/drm/kmb/kmb_drv.h:48:23: note: while referencing 'plane_status'
   48 |  struct layer_status  plane_status[KMB_MAX_PLANES];
      |                       ^~~~~~~~~~~~
drivers/gpu/drm/kmb/kmb_plane.c:129:20: warning: array subscript 1 is above=
 array bounds of 'struct layer_status[1]' [-Warray-bounds]
  129 |   kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL2_ENABLE;
      |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
drivers/gpu/drm/kmb/kmb_drv.h:48:23: note: while referencing 'plane_status'
   48 |  struct layer_status  plane_status[KMB_MAX_PLANES];
      |                       ^~~~~~~~~~~~

Exposed by commit

  656256c0d67c ("Makefile: Enable -Warray-bounds")

Introduced by commit

  7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")

from v5.11-rc1.
--=20
Cheers,
Stephen Rothwell

--Sig_/qEpE2bEw7=XPgc=TuN69q/w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEsmm0ACgkQAVBC80lX
0GyjoQf+MNK6gFevp/QNvKQHyjE4H/r0Q3ZowIhaN56dYwIaCO9ojOiD21DrvDQH
+hY0/PpEiZrTZvP4Drvz7N/QvTinBWIo6tUwPDjm6/F6Y4No7JCQyaJlAD/3G4jF
lWzfqS3YbQwBNr14fEAkrK9CBAPZEC/3NtzFttnZac+eMG1TF9OPDRrxZ3Z2lG4X
vD+SUSzyo4KEsWbqLlQHoDQPNVeIr8c9qrf6bNVsrGEa6QLZkKEDwMNfGDeujBTK
ErNUDQ47gnOnG9XvV+pmh9I68/6APNofvan3/9SFV+DsGRTYmodib6M4MHm2etu3
jeCe6gzJWXPW6SEDd5yJbiMx0S5IgA==
=IDCX
-----END PGP SIGNATURE-----

--Sig_/qEpE2bEw7=XPgc=TuN69q/w--
