Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B974834DE2B
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 04:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhC3CTE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 22:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbhC3CTB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 22:19:01 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6A4C061762;
        Mon, 29 Mar 2021 19:18:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F8Y653n5hz9sCD;
        Tue, 30 Mar 2021 13:18:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617070733;
        bh=P4dRB76oMWnQalztuFm48vkWoHq1pH+SLuQwW8w+a1c=;
        h=Date:From:To:Cc:Subject:From;
        b=IHuyTihdoQcA65pE/VWB070wyTTChkpXFtdExoVxY2a+4fl/i9Ab9Si6/ViLZbCz1
         G+fZt5RIfW7lUnAHZ4GVb0On1WiGBkbAiJuhB1bT6xR4tcDICp347YCjN1jIvyEC54
         IANAUzN0iWf1ddtP7RlOsTRp0MK6DS0+575FwNXClR2U6lQSpfKqMiGlZXJuQrkJ9u
         sgISzQHDHU2kbnL2TF2Vd96HJRaGcVVvNoeyD8UechEfqDBzZn8XhG/HqILGRBc5Uo
         ovbkzEWIDoNujrpXIPklYZS1gr9e/n/vWDtoeCZfF+gky1rl5fWgiURLCypQQxpo56
         T5qY9n5qYUXuA==
Date:   Tue, 30 Mar 2021 13:18:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Wesley Chalmers <Wesley.Chalmers@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210330131850.437785d1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0kJeIXg233.vzcAE2Ra2GQQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0kJeIXg233.vzcAE2Ra2GQQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c: In function 'commit_pla=
nes_for_stream':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:2608:13: error: 'struct =
pipe_ctx' has no member named 'ttu_regs'
 2608 |     odm_pipe->ttu_regs.min_ttu_vblank =3D MAX_TTU;
      |             ^~

Caused by commit

  752106f5c5cd ("drm/amd/display: Set max TTU on DPG enable")

CONFIG_DRM_AMD_DC_DCN is not set in this build.

I have used the amdgpu tree from next-20210329 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/0kJeIXg233.vzcAE2Ra2GQQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBiiooACgkQAVBC80lX
0GyVVwf/RcPPkIO6HkLwGGP2giaESLf/T+t+Ux3MGEfp0pSAhDzmLIzRUh03NWjk
F4yqob24nzuPOyvvSblulbWyo1I0tfPV3Od+CgDNMOMAgAG42bX+QcznjyAeSSVL
hKd4nVihc0ZX+D/XVYDoqyFpaGsSrnX9wS6WUJebBXJKYuGgkhz++4mdHKFBoKhg
95Khw3yI6Cm5kBc14RRauf9J1kAjc1t7k9WNPGofKQhUVV+EZaz0QULkfcTi7dJU
kfndfWmbCI3wkEnJrIvG/s2LnQmF6F1vYcXVpe5XLG5e8S8B4f9G5CNYQmqaT6Ly
+hM+9M4VMkuSIg0e23dIWkJ7TnuJrA==
=8C9j
-----END PGP SIGNATURE-----

--Sig_/0kJeIXg233.vzcAE2Ra2GQQ--
