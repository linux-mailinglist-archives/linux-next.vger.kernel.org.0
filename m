Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C626716B720
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2020 02:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgBYBVF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Feb 2020 20:21:05 -0500
Received: from ozlabs.org ([203.11.71.1]:57017 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728011AbgBYBVF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Feb 2020 20:21:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48RLjT4Hl5z9sP7;
        Tue, 25 Feb 2020 12:21:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582593662;
        bh=d6HO5ySeJXMzi+AidWGMjv7hJJDzyM+3Bx0nUBRpKUA=;
        h=Date:From:To:Cc:Subject:From;
        b=XahQBe57ar85xxAJnvzdYTz3eHK4JZ/JnvxmWkVzOb89HJpyKtIUwxHKMPYik4l8n
         NGOSUxd77ylWngJOWhIE6T5w7clwa0IKeGvjRw99eS/FrrC43zvg41nSPrwibBaPB7
         1gOEt0O4+5NR8PRn8LHoqTli993pI9faQBSp0Zf+2IigVmxsZKC8REMZUm7Gg0M4GW
         LKhd74IeRjk+w8b2HACEKEfAnIWR7wZuss6MXosZtnPC+jltyR9jUJmXSvUczg1OUt
         2GOtx/rwo44BfTivBmatQfVlOz6ucdiHEtkf62uiK5f+mZUnHr/7ooj5ANiea1wnBf
         IaUYgVo8xE/wg==
Date:   Tue, 25 Feb 2020 12:21:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20200225122100.34284341@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yuxPvEhu_ui62k8yKV93olQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yuxPvEhu_ui62k8yKV93olQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "gpiochip_get_desc" [drivers/pinctrl/pinctrl-da9062.ko] undefined!

Caused by commit

  56cc3af4e8c8 ("pinctrl: da9062: add driver support")

I used the pinctrl tree from next-20200224 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/yuxPvEhu_ui62k8yKV93olQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5UdnwACgkQAVBC80lX
0GzAjAf/etqeQLbmePhLNQcO/HqAoI6++KtyIk0TbMRYXo8GTl6PLU6Y7hJzc1ds
ZVtWDbHnMeZGEglOpxoFgGTsDcBTE2SOgJ07+UKbfgwVRkMYyarrp/pVDSFaE0JZ
wXj5mZHT1qOZG+W809Bld4LDo86f7VZA0UXT16kL15MktqQuqRMih3iZ+LNN4JVP
xrLiCUwiWsaQaW3KydfU3PV+lJ//JBPDRBCmsFS7obQD9C18EnEsI0ZvaJgCjxdU
9V+sywGeo4cAd+m2B8ujUqp2PJpVGcwTWPuIAvHKFSVJ8GihXXN5nl5BY7KmmhuP
W5v31/ZNFW4ueP5FEkK36mmUtwWuHg==
=RF3M
-----END PGP SIGNATURE-----

--Sig_/yuxPvEhu_ui62k8yKV93olQ--
