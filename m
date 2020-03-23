Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91ABF18ED81
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 01:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgCWAuT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Mar 2020 20:50:19 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33241 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726925AbgCWAuT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 22 Mar 2020 20:50:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48lwlQ5dCrz9sQt;
        Mon, 23 Mar 2020 11:50:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584924615;
        bh=h33vmQmR6+cqLLlsiq13QBebcQ0ZhM+IXVkPxrbI3sw=;
        h=Date:From:To:Cc:Subject:From;
        b=s+b/7F1hz2XX8IFv8SVcPNBWwsFksv6UfxV56FmhQnQkVj7/QLTqE2XLu3m3T4UyF
         iuOc7qBBrn3G9BT8Je+YXOTsUYEH+cZz7CLfMpncKCnBJzziGE1jUxT5N2EGCz+1BX
         CKXAxxjYoQPcN53TpZDk1gQvtjDJXde3z1xkQRZFg9i/X5hEMYBAelGQ6pl1963ByP
         KGUGF0tWKadyaoYXv4duycxdM05sfkLKxCUJ4P6f/KAXX+BMuYFgQB0/f1AgqMyDqQ
         FteN/OqHiN7OSDNlhTVzsyOry408ZMw0OlJ/6eLhWqAJY39itYuzbZCSjWar3fMajl
         N6z2diZM0cPmQ==
Date:   Mon, 23 Mar 2020 11:50:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mario Kleiner <mario.kleiner.de@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Lyude Paul <lyude@redhat.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20200323115008.7ff7dcbf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y432T03lLx=.CYyCQcKskh5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/y432T03lLx=.CYyCQcKskh5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commit:

  eb916a5a93a6 ("drm/amd/display: Fix pageflip event race condition for DCN=
.")

from Linus' tree and commit:

  7f2be468a855 ("drm/amdgpu: Stop using the DRIVER debugging flag for vblan=
k debugging messages")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6240259b3a93,a4256780e70e..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@@ -522,9 -524,8 +524,9 @@@ static void dm_dcn_crtc_high_irq(void *
 =20
  	acrtc_state =3D to_dm_crtc_state(acrtc->base.state);
 =20
- 	DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d, planes:%d\n", acrtc->crtc_id,
- 			 amdgpu_dm_vrr_active(acrtc_state),
- 			 acrtc_state->active_planes);
 -	DRM_DEBUG_VBL("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
 -		      amdgpu_dm_vrr_active(acrtc_state));
++	DRM_DEBUG_VBL("crtc:%d, vupdate-vrr:%d, planes:%d\n", acrtc->crtc_id,
++		      amdgpu_dm_vrr_active(acrtc_state),
++		      acrtc_state->active_planes);
 =20
  	amdgpu_dm_crtc_handle_crc_irq(&acrtc->base);
  	drm_crtc_handle_vblank(&acrtc->base);

--Sig_/y432T03lLx=.CYyCQcKskh5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl54B8AACgkQAVBC80lX
0Gz4sQf8DK64MsvR28Pg6iyjefl0TmxbVajUlIjjkVlKKMFJKNQCC+H3zFFNfrRe
ipkPPn0nA/2E/YLUID6lShntJ+4yGYutZFcGmWExj4JoMPANG97u/JdnCpGm2v5G
87V96IbRNcYphchXLfyRXhz1rUKbUIk30DjQwPkdU+k+WwksVr+uXB20Li0TqOK2
jgkKlv0JvRHI/sMrjmH4339Sw3OPF53WpanyA9xLW9yDyQNK6pkkDsMRSCkcI5Vm
pTnEEEoNnmPY+uCxQXd0orB8n3PE1cz3+/DaEwuTFKdCHH9wsp32A7ICNrOGf5Td
/cqLMWaDWD70wme7h+LUWS6rosC5aQ==
=qYsy
-----END PGP SIGNATURE-----

--Sig_/y432T03lLx=.CYyCQcKskh5--
