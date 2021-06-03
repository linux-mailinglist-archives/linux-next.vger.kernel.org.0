Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCF939984B
	for <lists+linux-next@lfdr.de>; Thu,  3 Jun 2021 04:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbhFCC5p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Jun 2021 22:57:45 -0400
Received: from ozlabs.org ([203.11.71.1]:41971 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229663AbhFCC5p (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Jun 2021 22:57:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FwVrw1BbJz9sPf;
        Thu,  3 Jun 2021 12:56:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622688960;
        bh=kNZO8cNXHwdVHyYMhGdZ3l4ogt+C54D3rxbZU9S2DYE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jMh2YX7eMP5zdPLXK1/wyy4AXLdYFnFwI7MUXgkqGIKpJ6B/kqQfYxSwEGAKYJfjj
         +M14Ccvh8OsqLcCFWczBQCrhXslfjCfB5zAAzVCLBQ1fLjGRdr/BU97YEQAoCTHy0b
         Pqg91v8eBGG1AK40FaT81XkVehxhj0r1hX2wrT88xslzloCrdyMxS7tls0LG2UGn8c
         jNYZJSgAU12eUjwMvACpdj+FTll/qT+0FZvj21Lh8knM2SMimcybKxTDDQG256093s
         1Dn8KyD1qssYD0xXo9ycC4+agMxKfAgjMmUEmJ3j4SKwwnSbB1F79v/Nvej9fOkXUZ
         21afMIsnYX2lg==
Date:   Thu, 3 Jun 2021 12:55:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nirmoy Das <nirmoy.das@amd.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm-misc
 tree
Message-ID: <20210603125559.37d1dee6@canb.auug.org.au>
In-Reply-To: <20210603124847.19a6dacf@canb.auug.org.au>
References: <20210603124847.19a6dacf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/biCzpGQcJqdY=0PNQKJAJAU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/biCzpGQcJqdY=0PNQKJAJAU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 3 Jun 2021 12:48:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index bcfd4a8d0288,1923f035713a..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@@ -657,11 -657,10 +658,11 @@@ void amdgpu_vm_move_to_lru_tail(struct=20
>   		if (!bo->parent)
>   			continue;
>  =20
>  -		ttm_bo_move_to_lru_tail(&bo->tbo, &bo->tbo.mem,
>  +		ttm_bo_move_to_lru_tail(&bo->tbo, bo->tbo.resource,
>   					&vm->lru_bulk_move);
> - 		if (bo->shadow)
> - 			ttm_bo_move_to_lru_tail(&bo->shadow->tbo,
> + 		if (shadow)
>  -			ttm_bo_move_to_lru_tail(&shadow->tbo, &shadow->tbo.mem,
> ++			ttm_bo_move_to_lru_tail(&shadow->tbo,
>  +						bo->shadow->tbo.resource,

that line should have been
						shadow->tbo.resource,

I have fixed it up in my resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/biCzpGQcJqdY=0PNQKJAJAU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC4RL8ACgkQAVBC80lX
0GzwXQf7Bb7whZWkGGCiLC+YJ0D2/P5gl5muwbKrN1PUW8Fku84HGBKd6fyi5HZI
+/E0B9EdHcCOpQRPQrPBSYokCGyOjDQ6k8ffauGTuyvr3wgKmWFfxYgDgadded6u
10oThEErY49Fr4VqDYlTerLY0nL4QefhwtjQ5Ain2g8v1jh8nV2cWKPzsccdPQY3
gDEN2Wenu5A7mvT3Z+SLOALhXNIh22nfVOkTY88aw29Pn3jbMq2F3Ta75P5jC3oj
hmyfDMxjiXL/yVydW/aA5ZLlbueihUsA7STFUeDpkUXZnCUBrdtxnuTP06jEF1Mi
VvXVBKsOOUACWakFNrA+2iD2pHfxBg==
=lQmq
-----END PGP SIGNATURE-----

--Sig_/biCzpGQcJqdY=0PNQKJAJAU--
