Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F737438C97
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 01:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbhJXXp6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 19:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbhJXXp6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 19:45:58 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12406C061745;
        Sun, 24 Oct 2021 16:43:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HcvmQ24Bsz4xZ1;
        Mon, 25 Oct 2021 10:43:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635119015;
        bh=ePJ1v8koGm1Htm6WNZvpbfcspUcnhT7WvIrIMOyOnr4=;
        h=Date:From:To:Cc:Subject:From;
        b=RoIGiCzI3tNDhzn5kQcbYSz/3UtmeFaXPg4koQw/4+wWKm0vzMMd/dPJNGb2hpFQU
         B04St099S7AqfSJkJTrN4LH9C1zWvnSYnrjZncAoU7xisVIm6UM3MMWquaG9I63Psr
         DNkr/aOkHSahx50RSwTZW5KvzO3ndUpIsTrXAxDBH1z6mQFBqtCjL+y0LB20nUqBre
         mb538Z61anyrLPHiGCA6eCROsmGhx2nqwl7OeR58EIbfWYSByc1HN+CZdSdcxaEYOI
         qqiEAkLqGdWnkh0/BG9SN1d3gAwWl4Q5DGNtmv5YeZmyrlPeIERghPmajGU7Bbk0IU
         pjj1TMPofMVPQ==
Date:   Mon, 25 Oct 2021 10:43:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the qcom tree
Message-ID: <20211025104333.4a3dfb09@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DhgYCIpwYWaa2wlrTf8EPxD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DhgYCIpwYWaa2wlrTf8EPxD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the qcom tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/firmware/qcom_scm.c:20:10: fatal error: asm/smp_plat.h: No such fil=
e or directory
   20 | #include <asm/smp_plat.h>
      |          ^~~~~~~~~~~~~~~~

Caused by commit

  55845f46df03 ("firmware: qcom: scm: Add support for MC boot address API")

I have used the qcom tree from next-20211022 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/DhgYCIpwYWaa2wlrTf8EPxD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF176UACgkQAVBC80lX
0GyfoQgApCIr6SveswDKhyANFRK+eR4YH/AAoB8m7CoDIx8mNZSQcBKUtogAEigw
cxRDz3dfm/SCGYGsJ5zHL1AgBiMibxG9q7Nf4tADd6/HK37vAia9XUyomXj/m2fP
DqhKKZu3FF/NcUKkkgjJDVoj06Zj4zGG2x0U7fGt1KufDhMp1JSrAnesz+ye3hO5
yeElMWUUGTqiIc0OHkGcEZkRJsPA93vMvmJ1ZxaJtkZ38/vVvx/Agm/lVIAfTtxT
BOA4k/E2Eslls8KMdiFTE3rUn8BKoBp1pAiJcC6GtliiSK6YdU8d6Wz+iTeATRNw
ZAtOeipflyjFxM8v0Gfir5jwUGfcsg==
=I/e+
-----END PGP SIGNATURE-----

--Sig_/DhgYCIpwYWaa2wlrTf8EPxD--
