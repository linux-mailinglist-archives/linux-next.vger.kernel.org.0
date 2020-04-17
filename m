Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271F41AD4E3
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 05:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgDQDkQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 23:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725947AbgDQDkP (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 23:40:15 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5F9C061A0C;
        Thu, 16 Apr 2020 20:40:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 493ML309Twz9sSg;
        Fri, 17 Apr 2020 13:40:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587094812;
        bh=ETWxRas2IKo2b2SIgMeDj8bjXLKaVzrJYOAZblBPLak=;
        h=Date:From:To:Cc:Subject:From;
        b=jiMwwmfgPP7Hq/Fs4TH1EJGKRgT2hcg2nJ+J/wtxVbubU+Lz6FT0zGzMBbDtVvP7l
         DEOY+0w7goH+QznufMX2ZhTmOfP2ckGL2QbGNL6+Y9LAfZ/iH5kzmreD74HNn8MzLX
         GE5u/HWGwzgVLqA7yY0G6hxovO5pU/NpLLOhyJeG5TeN2EfoQCBRlGX8dQvKMpv42Y
         0I/yQDb8iwFlPh+yIgZBh+dFstSAdVMYligiuArn+kkqNuXxXk7zy5f7RKTQdZjtYg
         5RdV2is10glz5v6PLqi3qro5D3sxNxM9rgLRiChyvNr+OZTtkUkWNRCURGXrlO39hJ
         evKkqK+P21HXA==
Date:   Fri, 17 Apr 2020 13:40:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shukun Tan <tanshukun1@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Zaibo Xu <xuzaibo@huawei.com>,
        Yang Shen <shenyang39@huawei.com>,
        Hui Tang <tanghui20@huawei.com>
Subject: linux-next: build failure after merge of the crypto tree
Message-ID: <20200417134003.318184a6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JsX0geyJhL/HJwMe4G78W2=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JsX0geyJhL/HJwMe4G78W2=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crypto tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/crypto/hisilicon/qm.c: In function 'qm_soft_reset':
drivers/crypto/hisilicon/qm.c:2915:7: error: implicit declaration of functi=
on 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=
=3Dimplicit-function-declaration]
 2915 |   s =3D acpi_evaluate_integer(ACPI_HANDLE(&pdev->dev),
      |       ^~~~~~~~~~~~~~~~~~~~~
      |       acpi_evaluate_object

Caused by commit

  6c6dd5802c2d ("crypto: hisilicon/qm - add controller reset interface")

I have reverted the following commits for today

f037fc5f93f4 crypto: hisilicon/qm - stop qp by judging sq and cq tail
141876c252a4 crypto: hisilicon/sec2 - add controller reset support for SEC2
1f5c9f34f0cc crypto: hisilicon/hpre - add controller reset support for HPRE
84c9b7802b02 crypto: hisilicon/zip - add controller reset support for zip
6c6dd5802c2d crypto: hisilicon/qm - add controller reset interface

--=20
Cheers,
Stephen Rothwell

--Sig_/JsX0geyJhL/HJwMe4G78W2=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6ZJRQACgkQAVBC80lX
0GzzrAf8C+EHicjVjIubq12sGPwrrDRgrrmpklG2kN+yKyCfKw+JBezLuea8Z5Oz
fIr4YtG9/emqsgyg/BWOyPJLdvZi4bI0mlzXQ0P3auucQrFAXTzmpp2o4C0/b5n/
0NDUEXsqR8XNXHOf7/OefEsLT7QJiVIq0gqZaWBsEPEYB+RH4yGUUWkzx8hyAJYs
Pccjl0I9PUaI9lZzdWRAlI+mLJsT83QSJqNmw8h9jxp2trK5pel5G+RWyNIlsvG1
7uZJxWap0eC8/aNoyv4ROiDKCU98+rrTQ8RnlzKI/AZ+Vi9YMapk1tZrSpr01+qw
lMGru1VA8xo25gQ0Fh1sCJvKikQePw==
=OB2W
-----END PGP SIGNATURE-----

--Sig_/JsX0geyJhL/HJwMe4G78W2=--
