Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5813AB575D
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 23:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfIQVJ6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 17:09:58 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36004 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbfIQVJ6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 17:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jld0yZEw55In5jpVaa4Qk/ndcF02e5s6HUv7kus85n8=; b=fhiHAmafa4gs1hMGjvNTl3Jjb
        X7WJ3w6LGRTu/PXz2TpOPC2rW/rcTGW1PTs/THqbV1d6DFVwdT4p1ZNlX8A7i0OrICr3q+JxaCwxl
        1IFIqq3wSO/4N+32vg9LMVAfSuTd73JHduxq1rLyvt7Dz3QVK6Ke4q8Z/3vvogw9I3/3k=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAKjL-0000eM-5a; Tue, 17 Sep 2019 21:09:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 1DD1A27428EA; Tue, 17 Sep 2019 22:09:46 +0100 (BST)
Date:   Tue, 17 Sep 2019 22:09:45 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Torvalds <torvalds@linuxfoundation.org>
Subject: Re: [alsa-devel] Build failure after merge of the sound-current
Message-ID: <20190917210945.GB47411@sirena.co.uk>
References: <20190917103858.GA3524@sirena.co.uk>
 <a71b94b7-7692-2f12-8568-488bf845742c@linux.intel.com>
 <s5h5zlqtz5c.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <s5h5zlqtz5c.wl-tiwai@suse.de>
X-Cookie: Have you locked your file cabinet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 11:02:07PM +0200, Takashi Iwai wrote:
> Pierre-Louis Bossart wrote:

> > Seems like a conflict with
> >=20
> > af239c44e3f97 ('x86/intel: Aggregate big core mobile naming')

> > maybe we can have a temporary fix in the ASoC tree along the lines of

> Ah thanks, that's the piece I've missed.  The conflict appears *after*
> the merge with tip.  I have tested only the merge result with Linus
> tree, so it didn't appear in my build tests.

> Putting Linus to Cc, so that he can see the possible conflicts
> beforehand.

FWIW -next has been carrying the patch below (it was added against the
tip tree so I didn't notice it when it blew up today after takashi moved
the merge window stuff so the new code appears earlier in the merge
process), sorry about that.  I should start carrying it again tomorrow.

=46rom 7e613e2a042c3cd7e3b69c11f52e046257ba5cbd Mon Sep 17 00:00:00 2001
=46rom: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 29 Aug 2019 16:08:49 +1000
Subject: [PATCH] ASoC: Intel: boards: merge fix for INTEL_FAM6_KABYLAKE_MOB=
ILE
 -> INTEL_FAM6_KABYLAKE_L change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mark Brown <broonie@kerenl.org>
---
 sound/soc/intel/common/soc-intel-quirks.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/co=
mmon/soc-intel-quirks.h
index e6357d306cb8..863a477d3405 100644
--- a/sound/soc/intel/common/soc-intel-quirks.h
+++ b/sound/soc/intel/common/soc-intel-quirks.h
@@ -36,7 +36,7 @@ SOC_INTEL_IS_CPU(byt, INTEL_FAM6_ATOM_SILVERMONT);
 SOC_INTEL_IS_CPU(cht, INTEL_FAM6_ATOM_AIRMONT);
 SOC_INTEL_IS_CPU(apl, INTEL_FAM6_ATOM_GOLDMONT);
 SOC_INTEL_IS_CPU(glk, INTEL_FAM6_ATOM_GOLDMONT_PLUS);
-SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
+SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_L);
=20
 static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
 {
--=20
2.20.1

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2BS5kACgkQJNaLcl1U
h9BLQAf+Jvohm9aZOiHdmqqke2SZ3GYKgp7w9R2z/D8bdo2QKl0y1/ykQQhmYST2
38GkWVhHAFpWSSKGp9gf/gAh/wVqTHL7BndBen872AXuQPkVgX2iPuuIz9Rvf0tD
1CxZ53oxo0KjgoWt+iecfvxjp85XSLOklL47c4E89sm/iuOyV0t/YcKx87ahnLH4
uFYk+p5TsXgve1NeTXsO1Khcp3cZUPepjngXhrjPJB5iHrnv+1gQlM5hsRXcJ5A2
qiJSkxF/SOaR2hMcQGqXm+tkfbsnLg2lmEXhEFSgw9bWlaeWnW6bYvMHe4jhSZBA
3EVNQWnCA9mhY8yWtNwLRQbdGXH7gQ==
=8oAQ
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
