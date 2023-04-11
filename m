Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39F8F6DD096
	for <lists+linux-next@lfdr.de>; Tue, 11 Apr 2023 05:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjDKD7S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Apr 2023 23:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjDKD7Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Apr 2023 23:59:16 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F3F26B8;
        Mon, 10 Apr 2023 20:59:13 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PwXCL52fyz4xGq;
        Tue, 11 Apr 2023 13:59:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1681185551;
        bh=PSnq4tRQyq3JySukDjQbFoPm5z5kwIh+DBQ57ICUdtg=;
        h=Date:From:To:Cc:Subject:From;
        b=nPcZq8NBvd4BfeoqNtwk4KK8wEqzBEsJNfxjTcixOIzvivA5EmOP/0ujAdqHuz6cC
         QZAaTd/MHXZ/+c+aOgqylWtvlNvxwl90uY0kpY/3nlA+8Ha2Hs/BuUZ3KkJcdUSJF9
         kGPhnblfzQRyPNCfmR0D7ZDPXsjzn6ou0xoDJF4CjDeZcPCHnt6ZB4TRRHIdnFCTDB
         6QBfE7fsE/S1pfuPLbQiK2h/3dfBE2+BQyh9WIj5rJpKSJ6rdvvf/uA1+pNzo8useX
         zFTJoNnUYIr7nWflpwVOlZ5ncM/D2ZiRCfpXFqO8p21wXXpucieOzZQLl3eFcJ1T0X
         knKwZ8wQ6Q/LQ==
Date:   Tue, 11 Apr 2023 13:59:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Dave Airlie <airlied@redhat.com>
Cc:     DRI <dri-devel@lists.freedesktop.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
        Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: linux-next: manual merge of the tip tree with the drm tree
Message-ID: <20230411135909.140d2560@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.NNZGSTud6NfEMVRK7cv_aG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.NNZGSTud6NfEMVRK7cv_aG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/gpu/drm/i915/gt/intel_rc6.c

between commit:

  3735040978a4 ("drm/i915/mtl: Synchronize i915/BIOS on C6 enabling")

from the drm tree and commit:

  f7faedffa92c ("drm/i915/gt: use __xchg instead of internal helper")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gt/intel_rc6.c
index 8f3cd68d14f8,3d6109f1d05c..000000000000
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@@ -733,11 -710,7 +733,11 @@@ void intel_rc6_fini(struct intel_rc6 *r
 =20
  	intel_rc6_disable(rc6);
 =20
 +	/* We want the BIOS C6 state preserved across loads for MTL */
 +	if (IS_METEORLAKE(rc6_to_i915(rc6)) && rc6->bios_state_captured)
 +		set(uncore, GEN6_RC_STATE, rc6->bios_rc_state);
 +
- 	pctx =3D fetch_and_zero(&rc6->pctx);
+ 	pctx =3D __xchg(&rc6->pctx, 0);
  	if (pctx)
  		i915_gem_object_put(pctx);
 =20

--Sig_/.NNZGSTud6NfEMVRK7cv_aG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQ02w0ACgkQAVBC80lX
0Gzz6Af+Kqi6ltNLwjSVgFO/jvvYFbgsdgms1KACMQ+OHv1UUAEfkRCvWVpCs/kr
qYJErWGOYMLEo0aV/ij9wemmh6ANm80tFbk1dFZATl8XAvqnjKYUIDcprBFE5How
ic+rIc5CEhZj4xRcnlLMt68YOp/8NMI4s7kBzqCUv0B15oE2QqtxKvc0bcWXu1IK
norQvy4Zg9EnEQ+YNkLnio6oYUzmRYX6GGgFWuuJdEJLP3or5AiYKXRC1BpNmzHp
jklfoDET9DyfdAq7Sig1+MhMVkQ4gLpTQ6h0VpoUbChtqRq4hL9qoC+gwdkpbSTo
EaTNu8peSj5SOE1pqJM5YZ5VfTDWig==
=Agzv
-----END PGP SIGNATURE-----

--Sig_/.NNZGSTud6NfEMVRK7cv_aG--
