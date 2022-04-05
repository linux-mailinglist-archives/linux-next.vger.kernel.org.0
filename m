Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 113E64F20BC
	for <lists+linux-next@lfdr.de>; Tue,  5 Apr 2022 04:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiDECAQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Apr 2022 22:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiDECAO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Apr 2022 22:00:14 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A67B44F4D2;
        Mon,  4 Apr 2022 18:16:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4KXTp36QHMz4xXg;
        Tue,  5 Apr 2022 11:00:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1649120412;
        bh=pvAjgrubqUeybT12my8JKcBFZrLk6GFs9UdVcALm1Rw=;
        h=Date:From:To:Cc:Subject:From;
        b=hYcFQ3qY5EyREHyfFG7FXCrx9OZ8bIuRRhoeY9aUcgfxzenLCQFnCM8VG+0qjUGoN
         hb7DUGklkh5WCotHIUr2HbSxOArcUo1rN8wbPoKPAkGg5YuCkAGslCX2douUNvLDiI
         g1C0BJhHnw7QQBAhjf8JODKNQOD6gN4x+xVM2sigR/2oy5lEuYJCE/2QIApYn8rPNG
         uuPANRBVcR685QdrdUPcxPvH7AXpwtP1zSDiRBMfcSQMOWsTKvEVkuAVYanDBJpBDY
         hsgH/4h/F9N+Tf4e3/Gc/zzzk4xoWgYEUD9NOtwIvrGNc4qnstZchKRzytpEKrAo+u
         aXFC3kBsQUYtA==
Date:   Tue, 5 Apr 2022 11:00:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     CQ Tang <cq.tang@intel.com>,
        Juha-Pekka =?UTF-8?B?SGVpa2tpbMOk?= 
        <juha-pekka.heikkila@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Matt Roper <matthew.d.roper@intel.com>,
        Ramalingam C <ramalingam.c@intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20220405110011.42656314@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vJGFu34SKYSA_epYaranuCs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vJGFu34SKYSA_epYaranuCs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_device_info.h

between commit:

  5e3094cfd9fb ("drm/i915/xehpsdv: Add has_flat_ccs to device info")

from Linus' tree and commit:

  072ce4164f97 ("drm/i915/dg2: Tile 4 plane format support")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/intel_device_info.h
index 291215d9da28,8026e805ff12..000000000000
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@@ -134,10 -131,9 +134,11 @@@ enum intel_ppgtt_type=20
  	/* Keep has_* in alphabetical order */ \
  	func(has_64bit_reloc); \
  	func(has_64k_pages); \
 +	func(needs_compact_pt); \
  	func(gpu_reset_clobbers_display); \
  	func(has_reset_engine); \
 +	func(has_flat_ccs); \
+ 	func(has_4tile); \
  	func(has_global_mocs); \
  	func(has_gt_uc); \
  	func(has_guc_deprivilege); \

--Sig_/vJGFu34SKYSA_epYaranuCs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJLlJsACgkQAVBC80lX
0Gy1Vwf/ai698wOFTp8iHwKVkeATYt9n7KQrbPXReJI00ygB+CGtawI0WLEx+U1e
x3dNfaeuUNE3u6NFpWfmTNl/CuUEoWfyLOXe98zoJyczE8H2cLq0wBFVTZwSMahf
7PMhEduqTFMRpjI5eVF7/zfLg2p6MnnWo8kwP0qS+9s4vP71uE1V3m8nds705pxg
MaGFdowHREd54ChblVpa3OyQvpd6XdB9hX63c3diTDx6cXL9PPZ911ipPc7K47lq
RnqMakWG7Mo4Nb9m2hdvTLmyrJurcccTMqijsWv629Y6pQ8ryX5qhAn/qc9xvfkc
TAO7jEdUPw9Owol24EyVxmLJ0TUcLg==
=eJUe
-----END PGP SIGNATURE-----

--Sig_/vJGFu34SKYSA_epYaranuCs--
