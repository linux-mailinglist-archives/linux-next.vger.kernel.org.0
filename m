Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24CA2EEAD4
	for <lists+linux-next@lfdr.de>; Fri,  8 Jan 2021 02:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729564AbhAHBR6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Jan 2021 20:17:58 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38039 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727634AbhAHBR6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Jan 2021 20:17:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DBlZN4MRPz9sW8;
        Fri,  8 Jan 2021 12:17:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610068636;
        bh=pDVt1BbK+UDosdTk0hGWhuK2FPCer6YAixo1SzJUR9o=;
        h=Date:From:To:Cc:Subject:From;
        b=RqgW39DKehnFKNv2AABrzBDVG7xq8+EN0ezLNPk3hN9oQmloXt7l7QQ6WvSOXD6ow
         Nvr7QEKQ+j25/qQXvDiKOC81z1sxsrDgH2BbtTEnYHjV2Xa4lU/czlP6xUzyfH4VEG
         OTCvJKQ7Vbzl51gPY3w1dcMZ9/zObyF0Z0KA8H0PphmaU5jh+RpLw8X2IjQ4MgPRiI
         bpNmebY6bOulMVIAbUlZr65icR3vfJmhenrFBa/fYHNrCPJSw86ori6U56TT4hXxMw
         NCOg+xluQ7NHhir6YF3GyoxRR6RtWbHnL9ZRXT2XTFYBCV3QH4iVbJgigM4HwNw5QI
         DofCaR5iDgoKg==
Date:   Fri, 8 Jan 2021 12:17:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210108121715.2f33a6fe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qhYz2xoa.EcX7FhgRKB9z9c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qhYz2xoa.EcX7FhgRKB9z9c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'd=
m_set_vblank':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5493:2: error: =
implicit declaration of function 'dc_allow_idle_optimizations' [-Werror=3Di=
mplicit-function-declaration]
 5493 |  dc_allow_idle_optimizations(
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  71338cb4a7c2 ("drm/amd/display: enable idle optimizations for linux (MALL=
 stutter)")

I have used the amdgpu tree from next-20210107 for today.
dc_allow_idle_optimizations() is only declared when CONFIG_DRM_AMD_DC_DCN
is set.

--=20
Cheers,
Stephen Rothwell

--Sig_/qhYz2xoa.EcX7FhgRKB9z9c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/3spsACgkQAVBC80lX
0GyrPQf/cdS1AsBtCXfzXQNUJadHiJPqA29ogebo47bA/ptGav0dPp9TaXFPvJxv
kSV8fY+9L/a4SNhuHS6YjpurglkWbbqBXnJjw6eKzBWGkuWa9tyFXEKzHg9LrdVF
/JmWFXXqSIXD59nGrUuWWlLVRxZDBq7qx9X4nRZPXyATdK/ShR2Oq91DQrVGVFYv
rXVdmn9yWSflDpJm+vfzmyMhUWJXzTOEHzCIxkcBJJH54C7bcftbp8nMtH5crrKc
ZtWy0powIeh92osjb0ncALm7dbp4J6/oNA0nxV4n46YBZv2EQuQkoNgUhifmc5V6
vZyoVwbOuoYqDsdfOOsAy8kcOTWwEw==
=7Qqs
-----END PGP SIGNATURE-----

--Sig_/qhYz2xoa.EcX7FhgRKB9z9c--
