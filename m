Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D072633CA4A
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 01:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbhCPAPf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Mar 2021 20:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbhCPAPV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Mar 2021 20:15:21 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B860EC06174A;
        Mon, 15 Mar 2021 17:15:16 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dzv1s3LVpz9sSC;
        Tue, 16 Mar 2021 11:15:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615853713;
        bh=m4ncbdeEQwz1oebJJUApmv6oPSUwurLTdA7shT/3K3Q=;
        h=Date:From:To:Cc:Subject:From;
        b=oSxRTpqyqLh/i5fCapcpfwyvyotzJ5n/VRqJgto7OmwLX4a/nMkaanj6xFhaTBPRY
         7yCJNx8iGwW/GrgTXKc/Zv2Zcv0cAmGdAK4mpLYEJ5Y5tdxmzSYvb/MGEzYRBvxd9+
         x4S4ffvhSMdAG6/6wcHsMTVgfcoQXp6BF+1oSQN0z+RnSjcPmK46WktMfQtyPdTB7w
         ftxHFG967cl3Bsi/4rYC2VBk3hdjab1mXZuLr2LgF3E/y4lMsnhausBNvGFTKEkRVA
         /0jIDyBeC2glOts/xK+O75k2vSfWkfiVIuyNFiyEee9UNfBZJzzwyGzf+QDid8WNI2
         hq9NbLYu85GKg==
Date:   Tue, 16 Mar 2021 11:15:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the opp tree
Message-ID: <20210316111511.64e7bf21@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AE0BKSRafLxCVTIrjf.oX2p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AE0BKSRafLxCVTIrjf.oX2p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the opp tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from include/linux/devfreq.h:15,
                 from drivers/base/power/main.c:36:
include/linux/pm_opp.h:341:1: warning: 'devm_pm_opp_register_set_opp_helper=
' defined but not used [-Wunused-function]
  341 | devm_pm_opp_register_set_opp_helper(struct device *dev,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  357b804aa0b9 ("opp: Change return type of devm_pm_opp_register_set_opp_he=
lper()")

The "inline" was removed :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/AE0BKSRafLxCVTIrjf.oX2p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBP+I8ACgkQAVBC80lX
0Gxx+gf/Q0Gecrn/a7POrv/7+f11dNA4JRxX0A9NgvA+YhW+QLwxAqRkY/sy7cQY
CYEljbwalxADI58NDBC61004TSMa/lesW6MlLfXTXUOak4HA4oDWFhWpgM4zYC8b
vSEZfONowB3p+pHQe9YjP3Sm7lnXJJSYSxFmdruNCPiT7a6ekCZN3cQMirI30GYD
6e0lCiQ3Bhip69sWsjtgAHdRRn0kk/0zXN22Fx/azvdnR1C+38m5LaEHb2WLtd/T
BjorCssZPDsKNT35SuTfWw4nDCRR2lVVYX2j6IXNp4Gcn7JYDOuitDQUvXXrzqi7
i8PCoesmSBFOD+p6U+hNnNq6xwDucA==
=l+AS
-----END PGP SIGNATURE-----

--Sig_/AE0BKSRafLxCVTIrjf.oX2p--
