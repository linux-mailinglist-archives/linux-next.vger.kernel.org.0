Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6C824ACA3
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 03:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgHTBar (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 21:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgHTBap (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 21:30:45 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E56C061757;
        Wed, 19 Aug 2020 18:30:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BX6Xw68Hyz9sRN;
        Thu, 20 Aug 2020 11:30:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597887041;
        bh=TdAJ4cPSBt+M8/z0nQKPFMUV7jka8gqRD4Yx3McuvvU=;
        h=Date:From:To:Cc:Subject:From;
        b=m/yMUiiJTQhvMO9gjEi+NVWAMNVB5Bb/KFM3jnkE+Pcr0xYmU1aDpQpHxWyi8JZ6A
         F7+L3GEaLADOcWFWaFyKVyB0tLaCyHKYZeXF39MBuDSH0/Wzl2JsH6kjpXc1J0dAIv
         kiYdHA3Hbh3ROmPhNJN0B2FhMkuf8hR0Ic9RIHH+GvXSriKwfYv2ea2QeG1GRVGUPE
         NwTgTyWA8+1c0uZSsCb91SYMb/UeqVD4Spun3EQRwP7xjt+z63BlXWe/781ycw/Hk0
         UXIr3tlFiwaq0InQShy9xgp3q3QEW6av1E1KqjWRIuhXtV9EqbFKlk2x3p1hnqbk/U
         9KeYunDXdA4LQ==
Date:   Thu, 20 Aug 2020 11:30:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl-intel tree
Message-ID: <20200820113039.71120e6a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8UAI6lqCqSoD9nqaTUmXgUj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8UAI6lqCqSoD9nqaTUmXgUj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl-intel tree, today's linux-next build (x86_64
allmodconfig) failed like this:

x86_64-linux-gnu-ld: drivers/pinctrl/intel/pinctrl-baytrail.o: in function =
`byt_pinctrl_probe':
pinctrl-baytrail.c:(.text+0x12bf): undefined reference to `intel_pinctrl_ge=
t_soc_data'

Caused by commit

  2db97df9f29d ("pinctrl: baytrail: Switch to use intel_pinctrl_get_soc_dat=
a()")

CONFIG_PINCTRL_BAYTRAIL=3Dy
CONFIG_PINCTRL_INTEL=3Dm

I have ised the pinctrl-intel tree from next-20200819 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/8UAI6lqCqSoD9nqaTUmXgUj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl890j8ACgkQAVBC80lX
0GxQigf/fVhxSDZ0PgozBs+DPVQ4zRlcl+0GBUYmx8gagOoWt4DaFEpP50ZBtd++
MNFv1GbXGX2BRfPGRpMFrwZoIIGuvkW3qaLL6Z9/Tbx+8Sa8XAg7hnEvaCRZkRP+
lWWPuTDI7JSrfwps0ggfTe7Gkhvfd1VWwUJFvT/WUhGi1BCktCTVSqQxzmtYzppC
q6Ei+E7V95p5azhv8gKa2tIllq6R2b5zwLGuILom/b4brIPMrTdGjQ5cgFvhhnFQ
Wsk+jSgU5d6um/PkX14gwmCXumNley/DS74uo9EHB5/CUyH+eIo1NxFzndZZHYKY
JCTl4UU7s/ux8c9G1YVkaZYRmXFCkg==
=4SpN
-----END PGP SIGNATURE-----

--Sig_/8UAI6lqCqSoD9nqaTUmXgUj--
