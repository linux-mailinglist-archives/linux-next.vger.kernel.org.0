Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEEA1D20B1
	for <lists+linux-next@lfdr.de>; Wed, 13 May 2020 23:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgEMVND (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 May 2020 17:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgEMVND (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 May 2020 17:13:03 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3A4C061A0C;
        Wed, 13 May 2020 14:13:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49MnSq1P8pz9sPF;
        Thu, 14 May 2020 07:12:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589404379;
        bh=MENIddwpkco4KNLi9ujSul+fqmhfNKZHVurKbRzWGeI=;
        h=Date:From:To:Cc:Subject:From;
        b=l+3MKSCv7N1fyiMaQb97iG7s8ZBBHOybm5RJ456o+rNyMwDI1lw8Z0KHpx9y3prKx
         Ee8pnOHZBOF/QYYNAVj3op211Lu7sPJ6wM+9tX/wRd0X56X3qW3l5M4eCeN72CtMHQ
         oXSLnCsnG2R9MKWjy7L2ng7GzztgyVzgdyFukpCttndTZjrTXJF3W4xddnRGPlH/4V
         sEVXUI35JqOGUp1Czvc3rBu/gv3CbnovstMlRMNUXWZOrbo/YjAMYHFJJT4jFm4Ui+
         p/XYM+T6G8i/9bjZT+nULnA13IZX3O3xiM7ubFbfJz+dNDvHA1xGEe51idu7GBVX3l
         EUalvF/ytzIoQ==
Date:   Thu, 14 May 2020 07:12:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Message-ID: <20200514071257.5b1582ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UvmppJlvnmiOmCWEeNGvZhA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UvmppJlvnmiOmCWEeNGvZhA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0e36f32f6b6c ("ASoC: tlv320adcx140: Fix bias config values")

Fixes tag

  Fixes: 37bde5acf040 ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec

has these problem(s):

  - Target SHA1 does not exist

Mabe you meant

Fixes: 689c7655b50c ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec driv=
er family")

Also, it looks like the Fixes tag had been split over more than one line
(and then the latter part moved above the rest).

--=20
Cheers,
Stephen Rothwell

--Sig_/UvmppJlvnmiOmCWEeNGvZhA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl68YtkACgkQAVBC80lX
0GxBkggAn1ckEem3QzkPI+kLEPOqTyFksksL1MFYf4CUIVw9sKce88wVf3uQ3mJR
GZIIqhFcAEVC54p9sdGUE5501+w/sBls2CUohh4UtE9rww3wyyAy3SC+13BmeQx3
9ZSMv4KY9vUf8GuHtfB33guyN+A3u35QNm5NuDkgz3QM/k72h74w6jkEcoMWf/dh
J93SIafFl4AwVRo4D9iNwdrwe705hwHlAdHH8cF9kLv+3pc7asMlT5VVaKI2JWzc
bmwpvt5JCAQsr2tviFX5lkZF97OAFosuAWuHyZZTJS20PCFqbsoDgmrL1fMSjwJs
3TxMccnunqQQfYUjnUFgiRsDaWbb4A==
=Es6e
-----END PGP SIGNATURE-----

--Sig_/UvmppJlvnmiOmCWEeNGvZhA--
