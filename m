Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADF21FC692
	for <lists+linux-next@lfdr.de>; Wed, 17 Jun 2020 09:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgFQHDN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Jun 2020 03:03:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43197 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgFQHDM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Jun 2020 03:03:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49mwy44sBYz9sSc;
        Wed, 17 Jun 2020 17:03:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592377391;
        bh=GrjcWt65On8ptPVGkgLJTte3NXkx9HklLRUHmriiWTE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NH8Kf57H5XFN9+75JQ4RTRnSV80r8jFNzsf1pR+WMUsjiDDl1X9ZkGZpdJ0I2npgh
         HaTtpseUxYG26zgx6KEHKl78LqI0cm2i2Ss3c/iqh7OrtReFKRCabmkk65zd9RTZZa
         OvqSuqd/yrC9XhXjtdvZ5irrABE+tny5s6jkYnb+H4L8sFMJyHBc5CQhmv3z2AdAhw
         LG12zvroCmFPk6BZE9hQtUMb8LewkSvPUVtEGvHSRIzFW4lFooPxYpvlwWiitQbkg/
         GKxxydfLszEAycBAxz0qMyoAsCGtCDSEC5mb68qYZKK5ZmpDAt8a/2KO7/A5YMAKOQ
         nDp0wGn51DWEA==
Date:   Wed, 17 Jun 2020 17:03:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20200617170307.3c87be5a@canb.auug.org.au>
In-Reply-To: <c82b9c52-d4e6-9eef-e37d-0a26ee9f1183@suse.de>
References: <20200617105929.534edd34@canb.auug.org.au>
        <c82b9c52-d4e6-9eef-e37d-0a26ee9f1183@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CFuhTYCQOJWS.N4Fev1VXiA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CFuhTYCQOJWS.N4Fev1VXiA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, 17 Jun 2020 08:33:24 +0200 Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>
> We recently dropped the _unlock() suffix from drm_gem_object_put(). This
> patch should be ok.

Yes, but what it shows is that the drm-misc tree is still based on
v5.7-rc1 and v5.8-rc1 has about 16000 more commits for you to get
conflicts against :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/CFuhTYCQOJWS.N4Fev1VXiA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7pwCsACgkQAVBC80lX
0GxDGQf8CC2+Ktdz5dyuFmZlGHbsWC27PbUpPtzHBtyTU7lyG+622BZAGyeE5LYa
kMsFA/a6lSE5IHC5z/8C+3g+MGjsLhl85AFPR1GRxCxNK4Y5UcBfxWxhKcOhM+Pd
OcOjaSc3VRr3Dt2IG3DCdo63H5IN6xrIDPKiDzIMXlBZwaGf/33lXYap/dUsJF5U
9wZwnGFpcpxkRqUHmuJjGCDZyzGryu2qiiTSclw3ys1OpIG9WVLqD5iqoxvOsnOV
KQ6IyGoHyd+0hpSIQx7Ach0AbQ0n0bAE76F0dWCRj5ujykjWIcN5Px2aksXPvOj4
fSKxyqpYyh+B3uhof+0hQ5HMyEGH5A==
=zVg0
-----END PGP SIGNATURE-----

--Sig_/CFuhTYCQOJWS.N4Fev1VXiA--
