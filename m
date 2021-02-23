Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A449632349A
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 01:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhBXAXt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 19:23:49 -0500
Received: from ozlabs.org ([203.11.71.1]:53301 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234235AbhBWXup (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Feb 2021 18:50:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DlbNp705dz9sVF;
        Wed, 24 Feb 2021 10:48:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614124139;
        bh=ER/lCUPTCLvsQ0WunnD25O6xZpauNn7iM59CMq6zjis=;
        h=Date:From:To:Cc:Subject:From;
        b=qKVjcKmPveNNr0cCfkTvsLbChLMemvJbyqPo3tzGZz2Wg3U1RGidXcvEhGjw6CQ8n
         9Nlw1rC29btgsDM+VUTaumqXzhwdtj4s5zPt0tTkosrN0dCBt9WlQ6PMVFNCazOKmB
         sMApS6rs8B5Yu7fxrjB8xdq13VDithBcTjCy5KchHN5Jn18Wn7vKMgDsaZl1/s/T6g
         gJwFzhB8c2ldok6SJhcqQXYe9em+1qOfhNCR7748WmjfUOLwogqKzzVWi/AsQ/Uzsp
         C2aXwLEzbrUCJwyR3Y7gRaX/era2djipS1hm2vZQkmnVSvSUPS1x7BP1VsymdnwsvN
         B2XmoDf4pTDOw==
Date:   Wed, 24 Feb 2021 10:48:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Qingqing Zhuo <qingqing.zhuo@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210224104858.4dba60c2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pm4g_clg8XNkVQmU0XjS6Ai";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Pm4g_clg8XNkVQmU0XjS6Ai
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'd=
m_set_vblank':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5439:33: warnin=
g: unused variable 'dm' [-Wunused-variable]
 5439 |  struct amdgpu_display_manager *dm =3D &adev->dm;
      |                                 ^~

Introduced by commit

  3cfd14b67b2c ("drm/amd/display: Fix system hang after multiple hotplugs (=
v2)")

--=20
Cheers,
Stephen Rothwell

--Sig_/Pm4g_clg8XNkVQmU0XjS6Ai
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA1lGoACgkQAVBC80lX
0Gz1vQf+JZ3R4TToR9Fs+wb81DD3x8JRVUhDv4m4A8KXG0fcwhSaY1ZsuLqiOKD0
fY4NNd3RqLfeeFZohIjgKqb9G6HwVAavf0nCfazB/lubh+teFYJKJaAN8AOCv0cH
Zcu0LBpR3WE/fwPxouKn2maGfgqdaEmraGEKZnNs730Jq6frbEHuAE1W9AuKXdoJ
LRIbCHFyN8VpPBTTM8PEnWLL2zCknyn+cTbAZVYWoM1xanxyxO0rx8wj6gvlzccG
SFX8/2IAoivR/qw/fa/4qRs1i+2kJNqUv9aj9IjEVEeOKxE9Y8j9iR5TvCgt3JZg
T7WgIQfKuerxYhFHJwdeqYO4QMtzJQ==
=7U+S
-----END PGP SIGNATURE-----

--Sig_/Pm4g_clg8XNkVQmU0XjS6Ai--
