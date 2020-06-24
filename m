Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33360206D5D
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 09:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388381AbgFXHQ3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 03:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388004AbgFXHQ3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 03:16:29 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61875C061573;
        Wed, 24 Jun 2020 00:16:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49sDw86bxfz9sQt;
        Wed, 24 Jun 2020 17:16:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592982987;
        bh=a0AtYjVpf2EtorpXtR4hjU70CprKPBAdVDu1x8znnvY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WZ4Cc8DjJInEWszhfWlmHQPiAn5X7g4nwCWrVIYOm++6j1+szwyFdqvB9BZg1x6Wh
         n5QEXYpESJLT8AdwkSHFldiaAjyusSlodPr6F+75wFEhejYfBy8+NdJTc1/j8Ptu3A
         YuC3Y8OCloiE8f4dgzSxhpZvut/b5IzvmQUfO7wa5PZzjy0XV1GnlbtMywCZ7ZAkgs
         0iDKnfASCaFXkb0j+0sPx8SiNSBf2YrqP+IpJpksgrNfHXbW0DyZuLml72gvxXXLbp
         4seurs6zaGbqWfVKd5bCQAAfmktV1YaliKnmOfc1fgEX9YX43SEd4xLy2zA2E7/PcF
         T8cEYfbAQkGGA==
Date:   Wed, 24 Jun 2020 17:16:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@gmail.com>
Cc:     Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Emil Velikov <emil.velikov@collabora.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20200624171624.0762edf5@canb.auug.org.au>
In-Reply-To: <CAPM=9tx5b1RaN5R4awqQ-BFpDrEZL1z05ZFv2MnGGS2t3mpBhQ@mail.gmail.com>
References: <20200617105929.534edd34@canb.auug.org.au>
        <20200624113452.54b72fcc@canb.auug.org.au>
        <CAPM=9tx5b1RaN5R4awqQ-BFpDrEZL1z05ZFv2MnGGS2t3mpBhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xETYpMB356nDIYf/Upbevgk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xETYpMB356nDIYf/Upbevgk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, 24 Jun 2020 15:47:49 +1000 Dave Airlie <airlied@gmail.com> wrote:
>
> My bad, my local builds passed, as I had made the change but forgot
> the commit --amend
>=20
> Pushed out a new head with it in it now.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/xETYpMB356nDIYf/Upbevgk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7y/cgACgkQAVBC80lX
0Gx2gwf7BUN/Z2HBMf+rZigkOqMDI+1NSbly4uC5QA+lQl/Ho3raWvRnlyyUNWWd
gaiLuKu0qFggDKDCygNKkpbmzRW8NxB1Xm6UDHN9ppjS/sN6+KdX5SRArJfpK/EA
awpI37mDAaTkPI/V+NZ091Hq0mTcMblwwzWmK4inR6qq1660xr+1yDXD4KozcCrE
vDUvhLA4spUWFrfQY+HxU+NzHXIWqSPKY+uj2ZxeNhSvTxxtLKr90gvqqMNdcbnc
x4Ey8qpfrtUud5oM320Y82tbFkOk2kXfBMJmmmEm/VMtb+JDNrocmS4uLOwwpAKC
YYd85duaRzXo8Z4sA+GEsJQePIkmLg==
=v8Eh
-----END PGP SIGNATURE-----

--Sig_/xETYpMB356nDIYf/Upbevgk--
