Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CABBA97244
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 08:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfHUGbz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Aug 2019 02:31:55 -0400
Received: from ozlabs.org ([203.11.71.1]:38697 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbfHUGby (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Aug 2019 02:31:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46CyVw01mQz9sML;
        Wed, 21 Aug 2019 16:31:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566369112;
        bh=hAJk249xrLAIaM5pUyU737RXL8NewzcUY3Q/r/1sGx4=;
        h=Date:From:To:Cc:Subject:From;
        b=PjRfProgCpXaNYIjIn/hjctcvVZHMWv19lKRITPUWUcp2OOJq18nTIvtQkSEQpjIw
         bpY8IgJsJSwgf2MsWFJMmRFgiW/Q6+DNQIm4id4ag57aV03limFKJCnXH8D75AeDpG
         rgScMRlQVcg9NPcifRGzcbECjHFkOpFeBCsg0pv8WEsNoT4W87DKtH2Pm6X7xbzjq+
         8S+eu5dhfTYVUcQuJXIp0bMEPrsN6+0fa6zlqCc0avwe77b/d/f5lO3DN6MSoqwX7Q
         I8VQl8hrsWbqxGkzb7oY03DG8v2zSVs+FaU8RDKKUTGGbESdDOFvzdE7hmy/gYM0wy
         Dr7Z0Bp5q/4Ag==
Date:   Wed, 21 Aug 2019 16:31:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the rtc tree
Message-ID: <20190821163151.6e36d092@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ARH=FhoW7pcXYymzsW6/Phr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ARH=FhoW7pcXYymzsW6/Phr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/rtc/rtc-aspeed.c: In function 'aspeed_rtc_probe':
drivers/rtc/rtc-aspeed.c:89:6: warning: unused variable 'ret' [-Wunused-var=
iable]
  int ret;
      ^~~
drivers/rtc/rtc-armada38x.c: In function 'armada38x_rtc_probe':
drivers/rtc/rtc-armada38x.c:505:6: warning: unused variable 'ret' [-Wunused=
-variable]
  int ret;
      ^~~

Introduced by commit

  5a3a2836e8bf ("rtc: remove superfluous error message")

--=20
Cheers,
Stephen Rothwell

--Sig_/ARH=FhoW7pcXYymzsW6/Phr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1c5VcACgkQAVBC80lX
0GymKgf/YX9LY2xBlTGvC27UoIXvd+0OM+uowwimikOEtWCi1eTOjWn76KxEMmg1
nohweMwRyvD0kwXNQfwH5FPhkHHd6WVV4F63DKziRp5XSto1aJ4AosifN5v32Ywj
UQgQhMZp+GI+DX2mgJauhdMmqjQvXQxxGRpuVJwCkXNQ898GugjpVQA85MK6ihn+
ZlGbLgRspriP0mTfxVS3ZZK494QHX5hJ64/KeJnTjt52kOTDaKXFEllre7um5O0e
NCVXGAXeP09n3Rd1F3WDzyCwfSRVJXVN0XqtMDMpQ8jMbi6R8ScWUe45XZVk/ROC
P9WXTn8v/PAMXNgboDHlzQNXqlPVSQ==
=E2bI
-----END PGP SIGNATURE-----

--Sig_/ARH=FhoW7pcXYymzsW6/Phr--
