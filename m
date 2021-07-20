Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260F73CF48C
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 08:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242080AbhGTFvv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 01:51:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51047 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242010AbhGTFvm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jul 2021 01:51:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GTTQn5dDwz9sX1;
        Tue, 20 Jul 2021 16:32:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626762740;
        bh=KzjgF2y5aBYeBDObwr2SaY7dstWwB7n9nlqKcUb/nHc=;
        h=Date:From:To:Cc:Subject:From;
        b=R6W9LU1fBtB+fjh9QKteMVQDrpLvKZpWZkzXEveFkr+ieFvm140gTTRUDROpT15zp
         66vQhkIx5PNwkyReOlWDHveSymOL2sxOYPHj2d0BIRQLE7Jk2j3vkhPIdlecPtJDwp
         2lEqJ2meWzv6N5kXC3u8n8LTFC4L3RzsT8Jhnc2rGlHXQoOxJkekSeCvvkA2PraLsl
         +SXX1ZpymQCFlhwo7BBC9PngG2tEbqXxAtSnOrA1yAgSxQlFUAUA4aCnHmRb9xVtgu
         2dBZLLag2pRCPnCyXDesxNKmOQbHQzAV5uAOVdIwIzXOhp4uf+xS4IVnTTyaoIUB4G
         4nmPlJyM+zATA==
Date:   Tue, 20 Jul 2021 16:32:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Jason Ekstrand <jason@jlekstrand.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-intel-fixes tree
Message-ID: <20210720163216.2b639d0d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sgTT+lRhMW2dTzwoUP1m3pV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sgTT+lRhMW2dTzwoUP1m3pV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build
(htmldocs) produced this warning:

drivers/gpu/drm/i915/i915_cmd_parser.c:1436: warning: Excess function param=
eter 'jump_whitelist' description in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1436: warning: Excess function param=
eter 'shadow_map' description in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1436: warning: Excess function param=
eter 'batch_map' description in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1436: warning: Function parameter or=
 member 'trampoline' not described in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1436: warning: Excess function param=
eter 'jump_whitelist' description in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1436: warning: Excess function param=
eter 'shadow_map' description in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1436: warning: Excess function param=
eter 'batch_map' description in 'intel_engine_cmd_parser'

Introduced by commit

  c9d9fdbc108a ("drm/i915: Revert "drm/i915/gem: Asynchronous cmdparser"")

--=20
Cheers,
Stephen Rothwell

--Sig_/sgTT+lRhMW2dTzwoUP1m3pV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD2bfAACgkQAVBC80lX
0GzpewgAlFCUL4HwCtTIOPN7HMd1F3qrv5hX0xWcZ1wcaCD3x0Zcx148curbt7mR
OpCi1tNkPxLeqsjq9zcnnRwVokcxST2RXZNy3wWVdYYoOOaa/DO6lqZwzlNRThR7
6RKUn7bckFx1HKQAs+PLxHaXConfxaKhYf7b9u15199WGm2CLJ6JVHSvy1e8b4kU
m89OleovF8GepmH6t2gh0fWtKnm/9zFdknOIpbrI1QbUt5rbbPOA6WjpbVRzrUXA
8dHUE7V3l4FSAufBeOZ0+erP7Da8e68+q+f8suvpH5MpJvq+rquIVvCRF1GJ6ED5
dJ0ejKB2opUePOBNMddOaRMHSpq2qg==
=j8Ep
-----END PGP SIGNATURE-----

--Sig_/sgTT+lRhMW2dTzwoUP1m3pV--
