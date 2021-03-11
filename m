Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF2E3370BB
	for <lists+linux-next@lfdr.de>; Thu, 11 Mar 2021 12:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbhCKLAt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Mar 2021 06:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232538AbhCKLAj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Mar 2021 06:00:39 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6349DC061574;
        Thu, 11 Mar 2021 03:00:39 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dx5Zq3LL2z9sWX;
        Thu, 11 Mar 2021 22:00:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615460435;
        bh=6l/sE8p/M9mVTwFP/ZIQWgmyUh4aBe0dUA5pbIYix+A=;
        h=Date:From:To:Cc:Subject:From;
        b=qFr+8QdyjNg3N3wmN+Z1LgWO+SX3Zk2v+mJP72zg0Ut8qWNAMZdrFkyBcjWdZeE6E
         KKLXzf5vQONxyeEWC5wOAlaATcv3Yx/+TtrIZDSNgs2SloHdZjKtDXlGq0iLzncHiL
         L3Y9zk58VvNzCB3JO/LCj3mB3ofkghWO7tZymPMbAPZT24dZXD/J4cB4S2HEjpmFVt
         wCvpMzx/4DJqJfKwlALLk/6U6PkSetOZqdhiK7GN0dGD5mIv2dNUPCPAEa1GHZq5KJ
         gVZRgGYeWqYndZ1UmeNVSKiIN/cFVnsHePGG95SE9dn82/emwHaupfje5opt8cYy1K
         1E7nVKWI+dsSA==
Date:   Thu, 11 Mar 2021 22:00:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Harry Wentland <harry.wentland@amd.com>,
        Zhan Liu <zhan.liu@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210311220033.7c5fe548@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/edLuGdRjo7ZtZFTo=skh3o9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/edLuGdRjo7ZtZFTo=skh3o9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:143: warning: Function pa=
rameter or member 'list' not described in 'dal_allocation'
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:143: warning: Function pa=
rameter or member 'bo' not described in 'dal_allocation'
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:143: warning: Function pa=
rameter or member 'cpu_ptr' not described in 'dal_allocation'
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:143: warning: Function pa=
rameter or member 'gpu_addr' not described in 'dal_allocation'

Introduced by commit

  1ace37b873c2 ("drm/amdgpu/display: Implement functions to let DC allocate=
 GPU memory")

--=20
Cheers,
Stephen Rothwell

--Sig_/edLuGdRjo7ZtZFTo=skh3o9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBJ+FEACgkQAVBC80lX
0GzgxAf+LUycni2F07f93tsuUu63nuhJVSpJpy4I4W3mVk7gyKsa5nn1vxIdqQYp
83visQvd/vkQDaYcJ61xMOaFMbcsmjzUGFETQ57/VX/kKJlZUQkah0aSoEMAMw/h
SuFaOB+6uESzMQxuN4X5LbFjkFd5epgUpeCDnxOVdMYgDYPckIz5Nhk2a2piPjVS
Vrri2mJwaeYvm8WV4lHI0OBD6O1QJTb9RzI0FVZgk2CUwrjXeHaQ3SRwEFt4W3EF
nWbprLyWxBfMD6ja8zRBPcMIw4Q/9AIBXZgP76y2v0fhEMQ38HPfEhvAylLqg7vz
k80b3D8PeqPHTDaOdwXiqJczrvzrdw==
=bJbc
-----END PGP SIGNATURE-----

--Sig_/edLuGdRjo7ZtZFTo=skh3o9--
