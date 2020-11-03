Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5F72A5A27
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 23:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729744AbgKCWhN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 17:37:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50927 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729484AbgKCWhN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Nov 2020 17:37:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQl5c0h9Vz9sRR;
        Wed,  4 Nov 2020 09:37:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604443030;
        bh=zyuBzGI6wd0PS9+p1C1lIj6ckJI72B+AqhdrSNRcwpA=;
        h=Date:From:To:Cc:Subject:From;
        b=ozDKFJN1mTL1fwO4NdsFwOryGA3H0WvMGj/xFdpmt2YJvDT0AhIc4lMUQp3Of/hHk
         Cn9xbWQ6+I05ZtY4G2Z1wJTORazPTIMYcltqaSAwgxfhoV60zsi9bCHg+lFsdAOHbv
         tfSrVm83CqA4fU8DB3BQIzP2PXWMUSrMmHD6uJKDyJZuNMd7eSP1HYMKatnCIQKbHG
         gVSVkrMKc6iuWzvFr2wNmaiA4Z6yx/wRY0z4D/X3MUOSuSm0WaK6jxDaypt+DSdlq+
         kGrbSjs69e4bsi8+1O0XZeAD9DlJMVjraQRCNzhCf1GRWmanIKQhW6k6yVqEORJXRC
         zXXRVO9//6Wlw==
Date:   Wed, 4 Nov 2020 09:37:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-intel-fixes tree
Message-ID: <20201104093705.10b43959@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=+PXjQnJcRmD.Zl2Rk8QD2e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=+PXjQnJcRmD.Zl2Rk8QD2e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/i915/gt/intel_lrc.c: In function 'gen12_emit_fini_breadcrum=
b':
drivers/gpu/drm/i915/gt/intel_lrc.c:4998:31: error: implicit declaration of=
 function '__gen8_emit_flush_dw'; did you mean 'gen8_emit_flush'? [-Werror=
=3Dimplicit-function-declaration]
 4998 |  cs =3D emit_xcs_breadcrumb(rq, __gen8_emit_flush_dw(cs, 0, 0, 0));
      |                               ^~~~~~~~~~~~~~~~~~~~
      |                               gen8_emit_flush
drivers/gpu/drm/i915/gt/intel_lrc.c:4998:31: warning: passing argument 2 of=
 'emit_xcs_breadcrumb' makes pointer from integer without a cast [-Wint-con=
version]
 4998 |  cs =3D emit_xcs_breadcrumb(rq, __gen8_emit_flush_dw(cs, 0, 0, 0));
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               |
      |                               int
drivers/gpu/drm/i915/gt/intel_lrc.c:4902:63: note: expected 'u32 *' {aka 'u=
nsigned int *'} but argument is of type 'int'
 4902 | static u32 *emit_xcs_breadcrumb(struct i915_request *rq, u32 *cs)
      |                                                          ~~~~~^~

Caused by commit

  c94d65d2ff6d ("drm/i915/gt: Flush xcs before tgl breadcrumbs")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/=+PXjQnJcRmD.Zl2Rk8QD2e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+h25IACgkQAVBC80lX
0GyMsQf/RCsRAOQ9A52R3h4SZS+xYkKoVQ74aszg/PgkSwiVUhV3meyofFhs6+Fb
M+UAp98QtfxQsO+k71ocWvvqHG+LUO4/24VEXWjuONrqo3nSpjMsao71UKyeHXC+
LkS35BJ3vtz3iArTQWUSdGiZc5fj23M7rsaaL3K0e8tX+u60aRwbOu2+2zYxGqm8
5LF8RPgEQK1PjydCcIEgxKeoMTqvdwZLtAzLG9vBR9QQcGOmiA+eeO03siBhbHrZ
xkBt2fofMjaX/ZvvaSFrzXfI/2N12zNLjQG3EF1UM+ypF/zlMXKQT6ori0ndnxhA
TY5tSXzsg/45QirLrJHoGHQb104aFg==
=7CiJ
-----END PGP SIGNATURE-----

--Sig_/=+PXjQnJcRmD.Zl2Rk8QD2e--
