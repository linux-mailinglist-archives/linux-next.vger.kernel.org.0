Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF7FB4C15
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 12:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbfIQKjO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 06:39:14 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:48756 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfIQKjN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 06:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=DjatoRpZQS80cf2AeRuBw0rkTnIsH9c2PxGWpLSmVqk=; b=J/odXfdl2D+zzToL2YJfLHoho
        AzYSleGt3//gqRMrhW3pSQBLh3SB7lpHQuN6jZNCelXElJLH4yZKOjKTVfTIueRSVyAQEdrRAzh9f
        5HYUSgLPIw2jKMjsisA94Eol33p0jCxTAMXKsjC046RPQh6Uy2EIAzmKbaW1bKbps6f5o=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAAsu-0007gc-JV; Tue, 17 Sep 2019 10:39:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 2E48327419E9; Tue, 17 Sep 2019 11:38:59 +0100 (BST)
Date:   Tue, 17 Sep 2019 11:38:58 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
        Mac Chiang <mac.chiang@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Build failure after merge of the sound-current
Message-ID: <20190917103858.GA3524@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
X-Cookie: Know Thy User.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After merging the sound-current tree, today's linux-next build for x86
allmodconfig failed like this:

In file included from /home/broonie/next/next/sound/soc/intel/boards/sof_rt5682.c:23:
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h: In function 'soc_intel_is_cml':
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:39:23: error: 'INTEL_FAM6_KABYLAKE_MOBILE' undeclared (first use in this function); did you mean 'INTEL_FAM6_KABYLAKE_L'?
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:18:44: note: in definition of macro 'ICPU'
 #define ICPU(model) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
                                            ^~~~~
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:39:1: note: in expansion of macro 'SOC_INTEL_IS_CPU'
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 ^~~~~~~~~~~~~~~~
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:39:23: note: each undeclared identifier is reported only once for each function it appears in
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:18:44: note: in definition of macro 'ICPU'
 #define ICPU(model) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
                                            ^~~~~
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:39:1: note: in expansion of macro 'SOC_INTEL_IS_CPU'
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 ^~~~~~~~~~~~~~~~
make[5]: *** [/home/broonie/next/next/scripts/Makefile.build:281: sound/soc/intel/boards/sof_rt5682.o] Error 1
make[4]: *** [/home/broonie/next/next/scripts/Makefile.build:497: sound/soc/intel/boards] Error 2
make[4]: *** Waiting for unfinished jobs....
In file included from /home/broonie/next/next/sound/soc/intel/atom/sst/sst_acpi.c:35:
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h: In function 'soc_intel_is_cml':
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:39:23: error: 'INTEL_FAM6_KABYLAKE_MOBILE' undeclared (first use in this function); did you mean 'INTEL_FAM6_KABYLAKE_L'?
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:18:44: note: in definition of macro 'ICPU'
 #define ICPU(model) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
                                            ^~~~~
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:39:1: note: in expansion of macro 'SOC_INTEL_IS_CPU'
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 ^~~~~~~~~~~~~~~~
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:39:23: note: each undeclared identifier is reported only once for each function it appears in
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:18:44: note: in definition of macro 'ICPU'
 #define ICPU(model) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
                                            ^~~~~
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:39:1: note: in expansion of macro 'SOC_INTEL_IS_CPU'
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 ^~~~~~~~~~~~~~~~
make[6]: *** [/home/broonie/next/next/scripts/Makefile.build:281: sound/soc/intel/atom/sst/sst_acpi.o] Error 1
make[5]: *** [/home/broonie/next/next/scripts/Makefile.build:497: sound/soc/intel/atom/sst] Error 2
make[4]: *** [/home/broonie/next/next/scripts/Makefile.build:497: sound/soc/intel/atom] Error 2
make[3]: *** [/home/broonie/next/next/scripts/Makefile.build:497: sound/soc/intel] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/home/broonie/next/next/scripts/Makefile.build:497: sound/soc] Error 2
make[1]: *** [/home/broonie/next/next/Makefile:1087: sound] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:179: sub-make] Error 2
Command exited with non-zero status 2

caused by commit

	c643c189f0fec116 (ASoC: Intel: boards: Add Cometlake machine driver support)

IIRC there was some previous discussion of a dependency on other changes
here but I thought that was resolved?  I've reverted that commit for
today.

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2At8IACgkQJNaLcl1U
h9Av7wf+NrVHx4OP1l3O3mQGsw2K8yECwIloOPyPQATIkKkZ4IlOtRggGauxZVb0
HkAFBWOKmvvVjLka1PG6yCtpnwP82oarHJYANTTvQOtMo7o8uCeWBg4EzMOO7PdH
UHuH5zPhnq9n404fwZS3pyRJeUZXfUQ4GMuR1w7yFSfjeX7d9qHXa35Y2M1J1LYd
hXukTpGu7Qwc/Ia5JBeDQEWut0iLbx8YClRLSf2X9S7JJBNU84ofuyXxZoVripF6
yn6sx5XpbC0naxRVYdSo2T9JdzNDoVqjFGvQNu3ofETscO+d7H5SOypClo1VnMt7
tcTxmsX/RiF+02viQbVh4SgvYxlTTw==
=mQFK
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
