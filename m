Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B513C9711
	for <lists+linux-next@lfdr.de>; Thu, 15 Jul 2021 06:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235281AbhGOEVy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Jul 2021 00:21:54 -0400
Received: from ozlabs.org ([203.11.71.1]:56589 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233862AbhGOEVx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jul 2021 00:21:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GQLjF0pMPz9s5R;
        Thu, 15 Jul 2021 14:18:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626322739;
        bh=ex0MUn6/WmQdAE7HtUlusnPU0W5GbK7HPP3ssZenvDE=;
        h=Date:From:To:Cc:Subject:From;
        b=og4lTkZCqU8uhEcrlj5fFWSceidXb7iKkWHri3bwa80OENvKAeNbh8JX/x7j8ql0e
         oCRXfWpdYUgML0Jkuy5HaEUfq4yMcggTcDJD52ZTOmfXhrl3LusFJjbDYyr6+sxm+8
         3HyQv8lwSy+vg3hGQZJ9r2U2GPdZZ/jDl9ZJqtD8PUbobFTe0XyysUYguo281xHEGs
         lAGPTn1/uwQKIxv1CvhT4j8hDZ1SC6bID6B28LjDiFtxjqqar+u1RlzTgPJXDoKSaB
         0kYghkpbSc10roAxLMBqOTHNfkymyS9ZHQceIR4V+67L4yHawmu1vIgg9gfC60kASU
         sigdOO3BGnUcg==
Date:   Thu, 15 Jul 2021 14:18:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Matt Roper <matthew.d.roper@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the drm-intel tree
Message-ID: <20210715141854.1ad4a956@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jx/Vz4=uZrGLV5ZV0Zhtu/8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jx/Vz4=uZrGLV5ZV0Zhtu/8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  db47fe727e1f ("drm/i915/step: s/<platform>_revid_tbl/<platform>_revids")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/jx/Vz4=uZrGLV5ZV0Zhtu/8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDvty4ACgkQAVBC80lX
0GxAUAf7BPNk+ONP5YbLLVNb9P+FIKUQhhDCy9Lt+5WNh5CSH6XlJVskjHkFK4gy
yjlQ6GHz/xEAJ1CWOWJu1flHPjWwC+1fPiNrG4J1dTF7EYNkGePqilBf4SrzGXTw
sgiTV21wv3/GdCKKGLva42WfKKEMIc1ayOIDvzIRRG3WpRuJXm1hCJ2mqYFuRFxZ
ogNQX+f8zBoeHy8O+VEgSL8KNtmWz6KcHwVmPG38TIWdidZJPK1r+nbWYlOfpg22
Wag3rLxylNsQgLFiJg1bka8akakatHLwz5ltJf3HmlotTROPum5wRtbwZ/zQl1Y8
GWS6xAwUrP5RXx5f8FCibRCq0jwEKw==
=/pQk
-----END PGP SIGNATURE-----

--Sig_/jx/Vz4=uZrGLV5ZV0Zhtu/8--
