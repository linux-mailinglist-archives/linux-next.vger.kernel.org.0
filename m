Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD1C359318
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 05:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhDIDgf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 23:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232941AbhDIDgf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 23:36:35 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E08C061760;
        Thu,  8 Apr 2021 20:36:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGkLr2qD6z9sW1;
        Fri,  9 Apr 2021 13:36:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617939381;
        bh=IwQxss0MPfAy2uX0dCdAtFxmafidWn5oWAKM3E+z3Ic=;
        h=Date:From:To:Cc:Subject:From;
        b=Cbx0IJH1B3345SvFVnj0qL7KPAMaLiMOGlwUwwFkt2qwE90DW0vGtaQPkzRuyC/j2
         OVr3ORFzm7SVqfA+is1IEi4TuiEtnqmsBGlpNG1nQuCDufDtJvt2K9NysoydwN0GFz
         0/bhpxgzqYX+09CfeJZumGNe1y1J6JCBiBy66YDJif3H3uxGYlWyeJ3dhKi3Qean/V
         KW52Frpm7wc4exN5vRLmq7sZpGxbdiXjbTzPDz5L0tzlCs8p1xprNDK+L2h5DiAZjP
         dLWOVMfHKonSJJXudsxIQMut13qrSg488RP3wjchNR+nGw0PwhILsKNHJNlHx7rzO0
         rxtPDUlnCK+mg==
Date:   Fri, 9 Apr 2021 13:36:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Imre Deak <imre.deak@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20210409133619.69c135ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6fkHv07WnvS/lravUEQ/Ire";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6fkHv07WnvS/lravUEQ/Ire
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/i915/display/intel_dp_link_training.c:43:13: error: redefin=
ition of 'intel_dp_reset_lttpr_common_caps'
   43 | static void intel_dp_reset_lttpr_common_caps(struct intel_dp *intel=
_dp)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_dp_link_training.c:38:13: note: previous=
 definition of 'intel_dp_reset_lttpr_common_caps' was here
   38 | static void intel_dp_reset_lttpr_common_caps(struct intel_dp *intel=
_dp)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_dp_link_training.c:38:13: warning: 'inte=
l_dp_reset_lttpr_common_caps' defined but not used [-Wunused-function]

Caused by commit

  9976ff61f045 ("Merge remote-tracking branch 'drm/drm-next'")

Because commit

  7dffbdedb96a ("drm/i915: Disable LTTPR support when the DPCD rev < 1.4")

from Linus' tree and commit

  264613b406eb ("drm/i915: Disable LTTPR support when the DPCD rev < 1.4")

from the drm tree are the same patch, git added the funtion twice :-(

I have applied a merge fix patch removing the second copy.

--=20
Cheers,
Stephen Rothwell

--Sig_/6fkHv07WnvS/lravUEQ/Ire
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBvy7MACgkQAVBC80lX
0Gy5yAf/U42Uq/AB7igWzd8a6NJkb/jaBLQE0Ee2eptP56lOYXjo+dcpgzctYZg6
vbNSzWBbCqfeBT4f/W5M/HTvJDs4f+/yKYrCR+T8iITMlDfSh/dDt+XqMTz4bt9A
ZQKnnRnyvf+ZPFmtca33XXhGiQ1RquTBQuReeGLki0xPnq3ukhyxJdBHuKUYU+QN
3X+cts3DRnzIAG9uqXpFpxuSPx65gl5tMvewM6X1OdQfYW4q7u8bMUNWUcqTiZsi
VrLlqmR4JX+ZlQgM4kVaJFpkCmZAUF/X0lZp5+YAHd3fYnmb3Q+EUmUcnsyJ3TPT
11n+haswRp7TtOzmxv4IvnqA92Ykew==
=jTb1
-----END PGP SIGNATURE-----

--Sig_/6fkHv07WnvS/lravUEQ/Ire--
