Return-Path: <linux-next+bounces-2624-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 064AF912913
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 17:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 799931F27966
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 15:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABF53987D;
	Fri, 21 Jun 2024 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myv24xD0"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E3538FA0;
	Fri, 21 Jun 2024 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982668; cv=none; b=bZNKGDH9ha48n7lJCyKWy0L8AmYHu/Wsowb2ct5UCAChftqNLbVSDllg99pvUqKcB25ke2t2L09+oHghtDmPzwH584wasB4wr763K+nPP4gH3KjQDpT+9gLSZhE0RsxFK3aWiTGl6zNKKm+aM89B+Jw2+47JdxQk+bKGceQnqpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982668; c=relaxed/simple;
	bh=dCTk55BmCkA3iwOVTek5v1rJWiFavZmayXJlwK19NIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FubSfXeM8iD/a4E07pInkX4vdg6zcRRxQdMtFKQKKw70ZuTkrUxC3scIJ+2Pc0vg66tvvRD0zI/saSdhtsgJ4VmaB0RPWGFho7OXAmNzfMFa2LQXr+AMr5sHDhLAUd9l1Ft6tGxGZlwBKvW6vpvAc+MPqb5+jVAi0PERYIefG3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=myv24xD0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3456AC3277B;
	Fri, 21 Jun 2024 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718982667;
	bh=dCTk55BmCkA3iwOVTek5v1rJWiFavZmayXJlwK19NIw=;
	h=Date:From:To:Cc:Subject:From;
	b=myv24xD0HMaBNBWIkUcphXDZANaKojQ/0h1o2rPycWf66EgRBHAL/A24G5VesVzaU
	 LQuZH7EAuOHiXvdYjtzYw4twdrcztvX/1eHV3TXSt/OrrofGS2OfLnsa4M1S/MvOOC
	 bjk6SnLhh1ANrT3mj2dDTFBLT8HFzmAwVK8GQxAAFY00AOvk69BRQ77+GX588AIPCF
	 qBHhaFZis/K/0FPX2Boc8luI+jgsLdaBfetqvePMt71v7Tzj7l9O+U6igeYdlq9vgs
	 JBhQgFbEFiXe077mzbdrcD0OeVhpJulPwdI7F5bJLfnYictTEvqv50rgM0ZXHw605X
	 MHCzh8wr025rQ==
Date: Fri, 21 Jun 2024 16:11:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Allen Pais <allen.lkml@gmail.com>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Aubin Constans <aubin.constans@microchip.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mmc tree
Message-ID: <ZnWYB5vobLZNtKHs@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b2kxj2VOMBooNmZ2"
Content-Disposition: inline


--b2kxj2VOMBooNmZ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mmc tree, today's linux-next build (arm64 defconfig)
failed like this:

In file included from /tmp/next/build/include/linux/bits.h:22,
                 from /tmp/next/build/include/linux/bitops.h:6,
                 from /tmp/next/build/drivers/mmc/host/renesas_sdhi_internal_dmac.c:10:
/tmp/next/build/drivers/mmc/host/renesas_sdhi_internal_dmac.c: In function 'renesas_sdhi_internal_dmac_complete_work_fn':
/tmp/next/build/include/linux/container_of.h:20:54: error: 'struct tmio_mmc_host' has no member named 'dma_complete'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                                                      ^~
/tmp/next/build/include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
/tmp/next/build/include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
/tmp/next/build/include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
/tmp/next/build/include/linux/workqueue.h:535:9: note: in expansion of macro 'container_of'
  535 |         container_of(callback_work, typeof(*var), work_fieldname)
      |         ^~~~~~~~~~~~
/tmp/next/build/drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:38: note: in expansion of macro 'from_work'
  489 |         struct tmio_mmc_host *host = from_work(host, t, dma_complete);
      |                                      ^~~~~~~~~
/tmp/next/build/include/linux/compiler_types.h:451:27: error: expression in static assertion is not an integer
  451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
/tmp/next/build/include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
/tmp/next/build/include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
/tmp/next/build/include/linux/workqueue.h:535:9: note: in expansion of macro 'container_of'
  535 |         container_of(callback_work, typeof(*var), work_fieldname)
      |         ^~~~~~~~~~~~
/tmp/next/build/drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:38: note: in expansion of macro 'from_work'
  489 |         struct tmio_mmc_host *host = from_work(host, t, dma_complete);
      |                                      ^~~~~~~~~
In file included from /tmp/next/build/include/uapi/linux/posix_types.h:5,
                 from /tmp/next/build/include/uapi/linux/types.h:14,
                 from /tmp/next/build/include/linux/types.h:6,
                 from /tmp/next/build/include/linux/kasan-checks.h:5,
                 from /tmp/next/build/include/asm-generic/rwonce.h:26,
                 from /tmp/next/build/arch/arm64/include/asm/rwonce.h:71,
                 from /tmp/next/build/include/linux/compiler.h:299,
                 from /tmp/next/build/include/linux/build_bug.h:5,
                 from /tmp/next/build/include/linux/bits.h:22,
                 from /tmp/next/build/include/linux/bitops.h:6,
                 from /tmp/next/build/drivers/mmc/host/renesas_sdhi_internal_dmac.c:10:
/tmp/next/build/include/linux/stddef.h:16:33: error: 'struct tmio_mmc_host' has no member named 'dma_complete'
   16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
      |                                 ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
   23 |         ((type *)(__mptr - offsetof(type, member))); })
      |                            ^~~~~~~~
/tmp/next/build/include/linux/workqueue.h:535:9: note: in expansion of macro 'container_of'
  535 |         container_of(callback_work, typeof(*var), work_fieldname)
      |         ^~~~~~~~~~~~
/tmp/next/build/drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:38: note: in expansion of macro 'from_work'
  489 |         struct tmio_mmc_host *host = from_work(host, t, dma_complete);
      |                                      ^~~~~~~~~
make[6]: *** [/tmp/next/build/scripts/Makefile.build:244: drivers/mmc/host/renesas_sdhi_internal_dmac.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [/tmp/next/build/scripts/Makefile.build:485: drivers/mmc/host] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [/tmp/next/build/scripts/Makefile.build:485: drivers/mmc] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/tmp/next/build/scripts/Makefile.build:485: drivers] Error 2
make[2]: *** [/tmp/next/build/Makefile:1934: .] Error 2
make[1]: *** [/tmp/next/build/Makefile:240: __sub-make] Error 2
make: *** [Makefile:240: __sub-make] Error 2
Command exited with non-zero status 2

Caused by commit

  74a3fe7c3784c8cae ("mmc: Convert from tasklet to BH workqueue")

I have used the tree from yesterday instead.

--b2kxj2VOMBooNmZ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1mAYACgkQJNaLcl1U
h9CECQf9EexwO4DJPgJGZ1Q94UnfOf/7tl0qH9H80WAWup45FErVFHAUB5EAlVEQ
R+pRvj9xKcf9bFSa4mWmMyodydQN387MyeRy/K1kS/9Chh81OZSLZXbo2nxyGhTf
aE89ivPuiPNpSmvGWV0rW8+6d5UcfQc0XYNoFG8skNmxRkrTgn4YaLIJaMcVPAcj
Bo+Ak14wdz0q6qA3XbAGEkT07GAHfgrErwDgP1OtVrvKq8SdNDwbGM1mrVqKMLlw
F7fk/4pfm91T2P6yieRt6JA2TEMLFIaakCWnZlh2cEzZnzx12gn98x6GBL1apbFV
8aoioA1MY0f+hq78pmWded/9YSW/+g==
=LvYz
-----END PGP SIGNATURE-----

--b2kxj2VOMBooNmZ2--

