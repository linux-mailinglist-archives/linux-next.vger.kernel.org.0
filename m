Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D1A366574
	for <lists+linux-next@lfdr.de>; Wed, 21 Apr 2021 08:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbhDUGbJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 02:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbhDUGbI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Apr 2021 02:31:08 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F139C06174A;
        Tue, 20 Apr 2021 23:30:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQ9fJ44PVz9t0Y;
        Wed, 21 Apr 2021 16:30:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618986632;
        bh=qlBGa2l8YULLNCXVp4KGUyi+W0CGzSz0nIHBmKGpQDs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=F1XTTsP0p7gNos5H+HoQQpEBp/ZhKS5+dFd0SGVhxZekAexxmbsfLbkwVreKsUJxv
         xiUCXpB4cwPIAV/T1jiqqmdRSAY7A3sv2QYRr0u3vQ/eiUWraAwpk6V3he0JnU0Ze1
         e71zphWqAvYhZr3hBT4Krahpb7YegKspFYvlp0uvGqdo5noUCth97t97P6pKRtlron
         rW6KglcwhDebYHeEbErngfbmOVqhqix7/5fEXuD1IxoHZrR+nYpjDOn1qD9rRL2D4n
         0skbX6bRmrWl6o6aiqrZoYuBiRvI61oCRcQTVTFJ+k7WwH8uO1BxR3PxlxcOty3X/c
         sjUW0J+1yB5Dw==
Date:   Wed, 21 Apr 2021 16:30:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20210421163031.10ef514b@canb.auug.org.au>
In-Reply-To: <20210401183234.11344d79@canb.auug.org.au>
References: <20210401183234.11344d79@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KsN8ik.f/vnU1V.S6DLAaTe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KsN8ik.f/vnU1V.S6DLAaTe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 1 Apr 2021 18:32:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm tree, today's linux-next build (htmldocs) produced
> these warnings:
>=20
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function par=
ameter 'trampoline' description in 'intel_engine_cmd_parser'
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter =
or member 'jump_whitelist' not described in 'intel_engine_cmd_parser'
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter =
or member 'shadow_map' not described in 'intel_engine_cmd_parser'
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter =
or member 'batch_map' not described in 'intel_engine_cmd_parser'
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function par=
ameter 'trampoline' description in 'intel_engine_cmd_parser'
>=20
> Introduced by commit
>=20
>   0edbb9ba1bfe ("drm/i915: Move cmd parser pinning to execbuffer")

I am still seeing these warnings (as of next-20210420).

--=20
Cheers,
Stephen Rothwell

--Sig_/KsN8ik.f/vnU1V.S6DLAaTe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB/xocACgkQAVBC80lX
0GzKeggAjaLM4uDBg6JGUrW8vVoLYrmfrO6/AqKftJ3Xt1zH2gwDo71sTEMXW44b
6zW1Nc16tKVDls7mZf46vWkURmNWJOuefkHgKpkaRsZ9AUcWMSC+J/oT5U5y9Ba4
hY5sYauHthqUo6OuHeuKJGVks9NayES7EAX7a4PwRt6S4WiuBlPxPhThqE0SGG+6
fOhNaae6//Tl6IeX+bzJY6CBOVl7+hkmmZUCnqBI6amfB2Qyv+NaNwuHgdDrCKVU
P2+Z5V7Kqu67J8i0qaZ6anX4GJYaVTB7HcZWHQxgkXmP9oVE1KIKkvH6gHHdnRFE
ofLfOW9yziul7ZqwRTET09xSwPzoCg==
=cESv
-----END PGP SIGNATURE-----

--Sig_/KsN8ik.f/vnU1V.S6DLAaTe--
