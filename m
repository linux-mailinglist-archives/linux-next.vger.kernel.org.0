Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 019814A7C8A
	for <lists+linux-next@lfdr.de>; Thu,  3 Feb 2022 01:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348407AbiBCAPB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Feb 2022 19:15:01 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:44811 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242074AbiBCAPA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Feb 2022 19:15:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jpzh24y84z4xQp;
        Thu,  3 Feb 2022 11:14:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1643847299;
        bh=u8fbPciKwFuGj4n2Rl4Owe3OAhv38CDvSa1vfAmR/Yk=;
        h=Date:From:To:Cc:Subject:From;
        b=iBcLluiJrpmHOFvXyj0bVZkyKxcnzNUwdCVSYYd+uPRxL+ckAbUiq+nXjlEqAhwDo
         aXn3bcJL7xAYXTz4ESwBd6s2HZrf4nS4HO6PT3wOPXI2LxNJLXHONE0zerXcoj6sN1
         tVETfdL/PCTt52evs+iW2/p+8jv2ltYALrlNMuGq9ZbbYHg8s/+IyYa/zU+6FI16ws
         6tUn1UuSbGhaXF2+kwn0+Hg8KWB/P5brMoHyZZ2gOlPWJ+IEJWYB0c4cCLW6tKT80/
         2KPBux1k9Nhmlzmx052cRHG1Zgod6+ATWpiiWoQV+sUqd97BnTsGxEH+V3hRTJsSB1
         GGSq9xqpp8uJA==
Date:   Thu, 3 Feb 2022 11:14:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Matt Roper <matthew.d.roper@intel.com>
Subject: linux-next: manual merge of the drm-intel-gt tree with the
 drm-intel tree
Message-ID: <20220203111457.3d07043f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ypLkd865E+Pc8V6nfundl_B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ypLkd865E+Pc8V6nfundl_B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel-gt tree got a conflict in:

  drivers/gpu/drm/i915/i915_reg.h

between commit:

  0d6419e9c855 ("drm/i915: Move GT registers to their own header file")

from the drm-intel tree and commit:

  270677026261 ("drm/i915/dg2: Add Wa_14015227452")

from the drm-intel-gt tree.

I fixed it up (I used the former version and then added the following
merge fix patch) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

It would be nice if you synced up these 2 trees (by merging one into
the other) as I am carrying several merge fix patches due to the
splitting up of i915_reg.h.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 3 Feb 2022 11:09:02 +1100
Subject: [PATCH] fix up for "drm/i915: Move GT registers to their own heade=
r file"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915=
/gt/intel_gt_regs.h
index 16d98ebee687..a6f0220c2e9f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1482,6 +1482,7 @@ enum {
=20
 #define GEN9_ROW_CHICKEN4				_MMIO(0xe48c)
 #define   GEN12_DISABLE_GRF_CLEAR			REG_BIT(13)
+#define   XEHP_DIS_BBL_SYSPIPE				REG_BIT(11)
 #define   GEN12_DISABLE_TDL_PUSH			REG_BIT(9)
 #define   GEN11_DIS_PICK_2ND_EU				REG_BIT(7)
 #define   GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX	REG_BIT(4)
--=20
2.34.1

--=20
Cheers,
Stephen Rothwell

--Sig_/ypLkd865E+Pc8V6nfundl_B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmH7HoEACgkQAVBC80lX
0GzlgwgAg4MAsHpb9BK8WcXrVM8oADz9LQ8rr+U7jsWhYXKifduojy/uC8dVcOVU
3xA3+09tK6UXfIf6lvifuu8RQQzR4uzQDCDfiC6IyEaJK51lfDy7KLT4YoX0Bj5G
ROSNxhDNzHaw0NQ3XZbB+KKqKAa28ZtlPcmVokWpXUdzN7qOQFrJrqpYqhbCVjg9
iTbQOVGnbo5JcoM70wo4jf7yhhTUgMFUMbO8Bs+3jjdRlzRy2W3iXR6hkpmFMSWA
qYKIc+CZB51ysV1cx3BnFqzzvwpD2ALQYrkaQxSqPCvNNU2Wx/9RMCj7O5hV6wzk
583esL8RTLV576vyNTf3y5vB9NFc6g==
=ttY0
-----END PGP SIGNATURE-----

--Sig_/ypLkd865E+Pc8V6nfundl_B--
