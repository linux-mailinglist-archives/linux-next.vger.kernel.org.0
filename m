Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF85F3235AE
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 03:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbhBXC3f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 21:29:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbhBXC3e (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Feb 2021 21:29:34 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 324D0C06174A;
        Tue, 23 Feb 2021 18:28:54 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DlfxG5d7pz9sVR;
        Wed, 24 Feb 2021 13:28:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614133730;
        bh=kEJN/s7n1Org9UskoU7vvPrWoElvp1X6pfjRPHvJOXg=;
        h=Date:From:To:Cc:Subject:From;
        b=KOE9GvppnI7lSkeUlgH5656faNNxd1l1uExf47ia9RV1PY4V7PjxJvNN5tE8Sw/zZ
         FBHCqEkyBYsLxBjISoQpnjCI7S1CLZBXlHSjekOQ9n88TCasoDPlbNgIKMNCnmhMpv
         Cwww19XK8JaPTbD3wwg8aQ/O0W8mSAFCco6Vky3IIOvdn3boz+a8Yn5NVFBx6N7U71
         MhRNm3UQEWEGLuZDmyqGwsUK4+WVbk7RYw1J5+6BU5PMmeyvihr5P0g+8k4zcPp75P
         qpvI9/5fMZHetgg0exo8D3WLuyqrnIV5GRQG+lK2GzCMWPOIF/qs2UPUoSV/WPlaKd
         6ZZq36NLglCIQ==
Date:   Wed, 24 Feb 2021 13:28:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Qingqing Zhuo <qingqing.zhuo@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the amdgpu tree
Message-ID: <20210224132849.439973d5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y3w=68c/7c2xhxac/lTfvOe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Y3w=68c/7c2xhxac/lTfvOe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:380: warning: Function pa=
rameter or member 'vblank_lock' not described in 'amdgpu_display_manager'
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:380: warning: Function pa=
rameter or member 'vblank_workqueue' not described in 'amdgpu_display_manag=
er'

Introduced by commit

  3cfd14b67b2c ("drm/amd/display: Fix system hang after multiple hotplugs (=
v2)")

--=20
Cheers,
Stephen Rothwell

--Sig_/Y3w=68c/7c2xhxac/lTfvOe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA1ueEACgkQAVBC80lX
0GzRZgf7BkQDCvY/14IYRb/7LKGWiQVbSuEdK1Pssvh8dSxWUR5ldM2Wupk/Cyy2
UeGN2sBgrRIYgx1KrV9cknoBniqI0ZM1arp03Rr0cMli2WRkAw79vyDheXHRxUmC
xVQPYhvcx0DOy4cyywylDc5CscBWphCdKHMOx/ndqbxfwV4vC5OdlgNRCcW3czUa
NcCxVOvgc72lgOnRfOZUrD1A6hT23W8VVmGcfBl78ARRAXGKnbENI6hdjJFD8AT9
iVxI+ARKPqdFqYI1IKoxaiWbkYZ5brvF2v9ESbCNtuJ3eXVfeoY7dlVD+7BxJrbR
4Rp7g9NKeDhClU2YfZ3hPxv7b+GAzQ==
=eNul
-----END PGP SIGNATURE-----

--Sig_/Y3w=68c/7c2xhxac/lTfvOe--
