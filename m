Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 110829A28C
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2019 00:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393770AbfHVWGN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Aug 2019 18:06:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50371 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393769AbfHVWGM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Aug 2019 18:06:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46DzBT0JQXz9s3Z;
        Fri, 23 Aug 2019 08:06:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566511570;
        bh=FjgnBALC5NUQCMLCfA380juwNXCxxWmU50GErFrn/UQ=;
        h=Date:From:To:Cc:Subject:From;
        b=N0Iyi+h7Zaa2XaMhbGf6BnQCc+daN1QtzAxKWW1aIKfzerWsszwNyXMm1+7rJTJr8
         n0mkXWV7dxCLMeY29k8Jhgm6i2Eh5vMemZ/6jklL/14TYGMw49URueWLHETd20pRxb
         fYoMvlS2633GcUzOwWN3Nmve5K4nI9hEQPu0gdZzXNbbxMjGDkV/bOteNLMiWQqE/u
         zCjdqhRwcnFWK58gav4eHWe6KFH8LGFXFDQ6yujSRU4jc8fiV7TjtTu67YABzw5BB9
         /B3qADZNpfJyjVPljkVWMqwStolnq66CInPjGsmJpmXqk809monZE4/rMptir/7tQ3
         U78Ri+g92QgpQ==
Date:   Fri, 23 Aug 2019 08:06:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kevin Wang <kevin1.wang@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: linux-next: build warning after merge of the drm-fixes tree
Message-ID: <20190823080604.5164f8c4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HShUJloo=cDetiPXNyLRlaE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HShUJloo=cDetiPXNyLRlaE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-fixes tree, today's linux-next build (KCONFIG_NAME)
produced this warning:

drivers/gpu/drm/amd/amdgpu/../powerplay/smu_v11_0.c: In function 'smu_v11_0=
_setup_pptable':
drivers/gpu/drm/amd/amdgpu/../powerplay/smu_v11_0.c:368:40: warning: 'size'=
 may be used uninitialized in this function [-Wmaybe-uninitialized]
   smu->smu_table.power_play_table_size =3D size;
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~

Introduced by commit

  00430144ff73 ("drm/amd/powerplay: fix variable type errors in smu_v11_0_s=
etup_pptable")

Looks like a false positive.

--=20
Cheers,
Stephen Rothwell

--Sig_/HShUJloo=cDetiPXNyLRlaE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1fEcwACgkQAVBC80lX
0GwxdQf+KjYY/Nw9tCs2c2KnhjF5ysvy/O4yLP9dkoq47vCD4DlXwUXRo/FgrcZZ
J4eyZrIflOy9pma3gH4/LTWNiNkNjAhkXAc7mqFcfvDHtKM1F8I1uzYfQV3ejVsm
yDVfntPcjES/mUnEadJEpuqFFw8L+kLbbfof0yNLEHEmxPkLcwM5QXooGrkm/zts
QCuaAKKE69L44r3pSuhB7CEFuwUUatFrZ3rl3c4eY2vT2M9OlE8Do1dvsoJCaidM
n+cVzeD/f7CA/6+3JeQh3eLujnth6EaRtmuoGOAC/GGEgf/hjPMFsHEkvjicKe4d
QuJ5iLUlbB9h2rUrZhIh4vuicKjVcA==
=UlcG
-----END PGP SIGNATURE-----

--Sig_/HShUJloo=cDetiPXNyLRlaE--
