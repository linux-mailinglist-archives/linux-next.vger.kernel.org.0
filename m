Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B752F0B84
	for <lists+linux-next@lfdr.de>; Mon, 11 Jan 2021 04:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbhAKDjo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Jan 2021 22:39:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbhAKDjo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 Jan 2021 22:39:44 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0DBC061794;
        Sun, 10 Jan 2021 19:39:04 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DDfZV5tq9z9sWL;
        Mon, 11 Jan 2021 14:38:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610336340;
        bh=Kyl6NJ+tK5dzE/JpAjOlqWUko4jnUe2abgy8kErpX+s=;
        h=Date:From:To:Cc:Subject:From;
        b=M/X6Y42+hrLqlxjxkzMW3AcZJ+K2Rf1Q3JD8VFzMjNG4vIRp+Xzm85s3sAMjqLtXC
         RpVsi0Wbaz39rc4WmSSMmr5+yeqppdum4lGuZ0avtWsDhSuKa4i8krVyeSYwTBHHaU
         NAAP0MdaRUlQj6NkOuyi1rdld8pnknRNEq4C9P6A5D8Br8T7l0t1ngskApkkwDndA+
         4zO42x8IukHab2qYcP1yPMZ10g1gcB5LtIHoual+PdZP2+0Xul0F/Sp63dyTTmhjV6
         dz16+pb2QjQjn4F+4SDokM0FMOi69M9uextSAQ6frxJTHuEO1IVsFf2pMc1hqDeD4F
         QRIvyMe+X7Y2g==
Date:   Mon, 11 Jan 2021 14:38:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warnings after merge of the amdgpu tree
Message-ID: <20210111143858.6fbaaf9a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c_+xUw76xFGqReoHVD3t9E9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/c_+xUw76xFGqReoHVD3t9E9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:340: warning: Incorrect u=
se of kernel-doc format:          * @active_vblank_irq_count
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:379: warning: Function pa=
rameter or member 'active_vblank_irq_count' not described in 'amdgpu_displa=
y_manager'

Introduced by commit

  71338cb4a7c2 ("drm/amd/display: enable idle optimizations for linux (MALL=
 stutter)")

--=20
Cheers,
Stephen Rothwell

--Sig_/c_+xUw76xFGqReoHVD3t9E9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/7yFIACgkQAVBC80lX
0GxGUgf/VGOxiBwXW8N+mAniWClcsI6w6h6GeWFCdk+6lREwXwKiQFfoMsdjyaj2
oFd9Eu/o08cvG3gN1dZ8eO9TcAd+gnpLfLvF+v8OHwbAdygOGmXVCxjZVfchwNjF
WFTIwCvs4jhwOSNU20Uec1aVPXnr5bM8wiqL+kxc8rpXq39+1jKjLcygqOq9Byyc
Ri1gDMOV+/bT3mR2lUS0AX33TRaDGM7SXVwyc1KC/eG4q+FojoBQNf38OAUirL6t
BXS+9Bw0qZRwdvYVHnStggfemAZ7TUzSnmPkC5K8U+GeuRoHKzzNv2ONQVhpZNVd
MaUdZdwZZ9xg5DELhN5pUndl3mAGAg==
=W6ng
-----END PGP SIGNATURE-----

--Sig_/c_+xUw76xFGqReoHVD3t9E9--
