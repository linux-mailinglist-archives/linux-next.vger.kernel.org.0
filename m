Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8628336656E
	for <lists+linux-next@lfdr.de>; Wed, 21 Apr 2021 08:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235504AbhDUG3a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 02:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235996AbhDUG31 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Apr 2021 02:29:27 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA67C06174A;
        Tue, 20 Apr 2021 23:28:54 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQ9cM0nk6z9sxS;
        Wed, 21 Apr 2021 16:28:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618986532;
        bh=ZHru/G84QN9SBD/xoHHISggikSIxcgfogfgUuzGmeDw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jTY233VRuXRqz0LeZPJmRxWtCCdgRLFs24+O/bEZFb0fTH5AtK0qS3o0jM/nezIgt
         koYloHeTFTCfM9xcvJOi0WQ142ZjLbVlqY/T16EXRazIKjbVGLnRgXmH05tUPKpw0n
         emzj2kBjkMFyBmLFHnB6DsvHTC1P98Y7exNOpsEYpydRIp6KPJJjSGTq0sEIswPpdK
         KxmhNpp4T5YxtAaIdMsH4mscp7+Rk3ctw5EFkVPvBgNJ25tKQIlHBe3sFshLc/oMm5
         MXohUWlr3wbq/g1MFT/1X8wDVfXxuRmApPoutbwo9eGwNuQ3u7MhotfM/Py1dmO0gH
         4MuoAbU1xNxkg==
Date:   Wed, 21 Apr 2021 16:28:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20210421162850.49a31107@canb.auug.org.au>
In-Reply-To: <20210401181933.08472e2d@canb.auug.org.au>
References: <20210401181933.08472e2d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V5bviABzsYqoShe8I+VEPBk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/V5bviABzsYqoShe8I+VEPBk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 1 Apr 2021 18:19:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> After merging the drm tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:102: warning: Function param=
eter or member 'ww' not described in 'i915_gem_shrink'
>=20
> Introduced by commit
>=20
>   cf41a8f1dc1e ("drm/i915: Finally remove obj->mm.lock.")

I am still seeing this warning (as of next-20210420).
--=20
Cheers,
Stephen Rothwell

--Sig_/V5bviABzsYqoShe8I+VEPBk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB/xiIACgkQAVBC80lX
0GxLWQf/d7EgIEXtOSGvZmHk07QfSo9DsZM+9YMLButVyz4ESFshdMEcePagIfw+
Wqfo69MAcRsNczgJmj/wOP8ie86CWr3mQkiaiMBKeKWN5RIvkX9NipDLcFnIOVWG
tIYzWz/dB+w1f5xATJLYmgTU0Nc66xSe0f7YobeI6ZRXqPGPvlJSQo3lCBWp1RFS
9AjM/NfhtjEufjG60UgRHNGU9acm+JfH5uaX45QXxqhQSODj7orIWcVzgVCSY6xZ
2oZK73geSpRXg2CgIRsMbEpvNjg6FAC4RjSY8m/rspDmS/EJ9vyRYhnkoErz8xy6
sfq1XoY1fvLSSMNeHa7X/bUgmrM9XQ==
=HiqO
-----END PGP SIGNATURE-----

--Sig_/V5bviABzsYqoShe8I+VEPBk--
