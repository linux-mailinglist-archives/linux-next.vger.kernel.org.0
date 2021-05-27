Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEA43926DC
	for <lists+linux-next@lfdr.de>; Thu, 27 May 2021 07:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbhE0F2K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 May 2021 01:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233847AbhE0F2J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 May 2021 01:28:09 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701ADC061574;
        Wed, 26 May 2021 22:26:36 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FrGWr5m4cz9sRK;
        Thu, 27 May 2021 15:26:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622093193;
        bh=nozp9T1s7TmrAi1d67+s+Oddv15pVAiTnvfERQTnIsw=;
        h=Date:From:To:Cc:Subject:From;
        b=jfOjTLTmus+ninDnUt7ugrWL6+97i5eKlVOUoEjeGnEx7kMgN23ZH61bPE7vpgcbJ
         7PgLAA75r5qaVTwJWuVT4RuVzAn2cD/VrpIkQ1Rs4gKCFydf9qm7DnNzMxI5Vqymc0
         +VOdceA+qozKDjaKgWWFH0mpfhYqh2728LV1MM93jgerW8LjL+DGZNHt3S3rVJ9mou
         pV/vXSbULCXJAWD5aAGXgNGy+xl+62Pfz60SavwFHWwz9fZp62WRej3siveD/xYlcL
         8JEqRLeSQQE7VOUuBNIiCE08lCWvUaX/26WHyH9PLb6RS4bVJwLmmYQFGz5avgEn98
         7daS86XJUamCA==
Date:   Thu, 27 May 2021 15:26:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hid tree
Message-ID: <20210527152631.1e70fba2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oj7d.dECWB/4=kZX2pqD_=A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oj7d.dECWB/4=kZX2pqD_=A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hid tree, today's linux-next build (x86_64
modules_install (on an allmodconfig build)) failed like this:

depmod: ERROR: Cycle detected: hid -> usbhid -> hid
depmod: ERROR: Found 2 modules in dependency cycles!

I could not easily figure out what caused this (it may not be the hid
tree, but probably is), so all I could do was leave it broken.

--=20
Cheers,
Stephen Rothwell

--Sig_/oj7d.dECWB/4=kZX2pqD_=A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCvLYcACgkQAVBC80lX
0GwmaQf/VK7ye0A9AbT/3cWohVg0JA4br7EA0cq1GoFbD9+jRiHz/Cmy3VWKaY58
RoEJJUQiUHwQWXAVzQVofx6+wVL8MVWKX3Aq7+/n9yjPnF5zRh7gZNH3/49uzLZu
yVrZS6mEO/c1IN7cGSMvEVGT1w3bKvJlKjWbxx3NelM28INb3p535YPWPSMbt4jj
uzMb+zzsLqLKRRtag9vYGdMtNbFGIUmvx1lAUkswB+XOl4KJE6ys0i2epWJo+Ge1
Wr56aP3IHMCRP4RiUEnhhs8NyyFHN4B8+Eer0IkITHuToFTrsMZC90ZFEjSWNzKq
/z2VRisQkAgTvI84p/BuyEFOkMWu/A==
=SkJK
-----END PGP SIGNATURE-----

--Sig_/oj7d.dECWB/4=kZX2pqD_=A--
