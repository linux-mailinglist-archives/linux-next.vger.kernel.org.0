Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528F0421C5A
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 04:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhJECM2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Oct 2021 22:12:28 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46807 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhJECM0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2021 22:12:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNgzF04Vrz4xbX;
        Tue,  5 Oct 2021 13:10:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633399836;
        bh=fIc3aROPEW2TdVb69B4RtwxCSq7X4qRoJk8L1unsRl8=;
        h=Date:From:To:Cc:Subject:From;
        b=HGWJC5iGw3MgZfFdjk353kqj+PhOsttDXA60c8rbAP4sCcQso8vVlBdDXHKIYQWZH
         EgMMZwVVGbT8GPl9vyyXw1sYyzqDNz+zf0YI29x6pf4Y1YZp5oWSjgxjHb0k8f7JiP
         AxwTc2lRBmWJerIU4hv+v7h3ntz0lUMxCd6uX1ppPiIcoqel9WAs2/q9ydUTzy59gn
         svNhhduQKD5Uj6sbdZ+ZIs19pl68bseTgpeVtvZ+ho8INBsAPh5BFF4iKgyXH9Oj1Z
         gcyHz7de+f6m2J/Ua7wJ0D1BW3vAG69rtpieT3jygJ8KsbeeWAaOfz0KJGkhypozud
         jBOI41St2vmpw==
Date:   Tue, 5 Oct 2021 13:10:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>
Subject: linux-next: manual merge of the drm-msm tree with the drm tree
Message-ID: <20211005131032.502a16d6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vvs4NLlv=FRmBCL/A4bnsLJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vvs4NLlv=FRmBCL/A4bnsLJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/msm_gem_submit.c

between commit:

  0e10e9a1db23 ("drm/sched: drop entity parameter from drm_sched_push_job")

from the drm tree and commit:

  68002469e571 ("drm/msm: One sched entity per process per priority")

from the drm-msm tree.

The conflict was this:

        /* The scheduler owns a ref now: */
        msm_gem_submit_get(submit);

<<<<<<< HEAD
        drm_sched_entity_push_job(&submit->base);
=3D=3D=3D=3D=3D=3D=3D=20
        drm_sched_entity_push_job(&submit->base, queue->entity);
>>>>>>> drm-msm/msm-next

        args->fence =3D submit->fence_id;

I fixed it up (I just used the HEAD version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/vvs4NLlv=FRmBCL/A4bnsLJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFbtBgACgkQAVBC80lX
0GwHwgf9HY6t8i1Exfs0UtU1b/lpduyBqDJH68h0SBe6KzleCmPXfrC0LteFYW4r
u9HINb0poJ3ijiINRjp8cXzK++8A8aTPlBDngJKLOQqHkh/L+ZtC55puhF+CeNjd
36IrFTEN+7GssJ55grXPMVVAB0H8QjtKhXWB/SMvuCtiqHKuXfR0voj4s5+csEy+
KDGYyC8lL+DfRJR+zc2wqcKgiZvGLqC8tM9b1vT+6M4eZdrGU2DLamCueqVUBlyy
5Litrk4Qqw9IllfM1DLyryGmZ61YhjDbagVw29sH1JC/kZ5hP9FFLmEBITjMaCmx
2/KZkB6K5xYqtATcFcZ/Ca8B3Vl76Q==
=e2MP
-----END PGP SIGNATURE-----

--Sig_/vvs4NLlv=FRmBCL/A4bnsLJ--
