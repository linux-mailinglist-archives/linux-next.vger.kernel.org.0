Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCDA333348
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 03:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbhCJCtd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Mar 2021 21:49:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbhCJCt0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Mar 2021 21:49:26 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F174C06174A;
        Tue,  9 Mar 2021 18:49:24 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DwGkR4kxmz9sSC;
        Wed, 10 Mar 2021 13:49:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615344561;
        bh=U83wnt1o6g2sY398nuJhHC983wVTXkhHWKlBjrg5NNA=;
        h=Date:From:To:Cc:Subject:From;
        b=t0VVDVboa3vxeILYA2NiVJp3jjFSl58CVoVmYkivmKeTJ605mvb4H2e1LEZGubLfT
         NKSK/KQk+It8JkLvt+nXGAR5QUYFHj5jEdmunEJjo6/FlStSlco8dZlwp47SQHrQ+n
         xCmslaXHnGgz+av8pXkrP0v5tSPVNoaobMDOUVVQId0JTFw3KmTpNJWI9pXWJImv7K
         bicShT+jkK1+LTTylFlY7Qp+1Trrhz1+sm6m0fvrtOnStamEDqlvJCuQWtFL8Ec7Lu
         ttxKaDSDy4rOj7kXp66lLH25gfvSRds85PNZPDGyDf+RCuiem7fw5W55wZQXd2cF/c
         uVNAs87yneVPQ==
Date:   Wed, 10 Mar 2021 13:49:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20210310134916.367c96b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P.Q6tggEOgNdsPTQBenKwye";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P.Q6tggEOgNdsPTQBenKwye
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/usb/ch9.h:1: warning: no structured comments found

Introduced by commit

  855b35ea96c4 ("usb: common: move function's kerneldoc next to its definit=
ion")

--=20
Cheers,
Stephen Rothwell

--Sig_/P.Q6tggEOgNdsPTQBenKwye
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBIM6wACgkQAVBC80lX
0GxcIwf/b/FgUwC0MZIopo7FCPdbJQbW03Vd+ZrvP0MpNCApBt9tnIdj4XNCIsWQ
NAK4c0qxzqPvlmdC+QMxVMjlXJmIR+cSIcdp+G0KC9jDkv3P9T3fkKKokn2BYFoa
UP8WdSehb0qj/AYj9OcFs2Vkh0+/vgi35gXpXXnJXBr4Akvct5IA2pLNKJGphhhP
Ci4YfD7tG9TqjFdX+LBRLDwDDkdAt9m9a8T/X/FyjqlP6Nioha7nRaISLxWNlEmG
e26C23AuQsis7jMIfcuf+H4JQy9bdoViOfwgE98FjjY8r79OVZPv9kDkPcZY9HuP
TXEZC3wwyzklKW667zi1ERcK+uhuDg==
=Ucjn
-----END PGP SIGNATURE-----

--Sig_/P.Q6tggEOgNdsPTQBenKwye--
