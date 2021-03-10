Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D09483333C4
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 04:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhCJDUl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Mar 2021 22:20:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbhCJDU1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Mar 2021 22:20:27 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A80BC06174A;
        Tue,  9 Mar 2021 19:20:27 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DwHQF3b7dz9sSC;
        Wed, 10 Mar 2021 14:20:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615346425;
        bh=V8h5UqnmDqjCzCb2jHZo43MixcsHyn9xAx7m6Dt9JlU=;
        h=Date:From:To:Cc:Subject:From;
        b=URl4s/thKiviog1WJz3F9GzJ7WFMe2/Mbhy8W7ts/pn1OUQsLe5PmVPZtbR1i+zPY
         RGhDLvu9sov+wtC7E2VPAxwtcQDS6Szb2k5NuFvmTxQoVa2jllFEFim5C/c3CGWfd3
         gPtQWCfWmk2Q5Oy7mW0wJg/9sCKIIIRr6IoAzRKngaAs90tpiojmli4V/kKzZVNiDb
         J6BdmJvGBK2rCzGBqp3swGKxxxQjz8HFbHmZfvVLQRwHmaCfS1Uq9u0qaPB4gtkig9
         nM8iDN+HYv8MtYRxh57jy75WV53VDYFQTv9Ct5pkm25by3yGC/9c8pF2XXuz5O8OrO
         anlF9RVHsRn9g==
Date:   Wed, 10 Mar 2021 14:20:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Wu XiangCheng <bobwxc@email.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the jc_docs tree
Message-ID: <20210310142019.27b9aa7b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2W6DTbeRBINkltDjfdKCD_r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2W6DTbeRBINkltDjfdKCD_r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/translations/zh_CN/admin-guide/README.rst:3: WARNING: undefin=
ed label: linux kernel release 5.x (if the link has no caption the label mu=
st precede a section header)
Documentation/translations/zh_CN/admin-guide/unicode.rst:3: WARNING: undefi=
ned label: documentation/admin-guide/unicode.rst (if the link has no captio=
n the label must precede a section header)

Introduced by commit

  550c8399d017 ("docs/zh_CN: Add zh_CN/admin-guide/README.rst")

--=20
Cheers,
Stephen Rothwell

--Sig_/2W6DTbeRBINkltDjfdKCD_r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBIOvMACgkQAVBC80lX
0GynhQf/RptoQUXGMyELT4VyafuUi9hS22yXfHb0gj30KKDcJpNDehjErdMiSjXx
J0j09dlvdvszekDjSWLU3XvWIOr4tgIXMJcautTPO8zw9Os5F9IMAll+3JAeCVaS
mGICW3+jbie9uB30XsDbjcbVc8AtEtYMVB3Z75vlA7S2F+7utVjR/0wOagPAwNVO
nt5HuW8dlGmLJjKfFjVik6vdN1n/KAkJQ+kipKlh/YY3CWhge3B5O36JtdGSlUZt
Njp3mHcYFo1t2xF65Bu4Icn2XLsaYv08X0YJJK/aekOsCBN8BOnBkf1gWNCtF3WS
yLGSZ1Ofy1e/6+3xxtjr2RwrMOYXbQ==
=oke6
-----END PGP SIGNATURE-----

--Sig_/2W6DTbeRBINkltDjfdKCD_r--
