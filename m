Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F427309A3A
	for <lists+linux-next@lfdr.de>; Sun, 31 Jan 2021 05:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhAaEbP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 30 Jan 2021 23:31:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhAaEbO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 30 Jan 2021 23:31:14 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20557C061573;
        Sat, 30 Jan 2021 20:30:33 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DSymg1Xwdz9sXk;
        Sun, 31 Jan 2021 15:30:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612067428;
        bh=GU1L0Y5mBTCvPlNltpWJPLGQSUEyYGCgDEE9xYRszhs=;
        h=Date:From:To:Cc:Subject:From;
        b=fiuKrnWLayDt7+xwyWCaRi55yhFL0wTeapGIlQiSuJhPeVSrgbPAMomSmojvLDO5v
         5UT8/xQBV32GTxyYUQllIJlH1/u+kouBZN+ZlNreE6Krc4+/t+AMOonCdfqnHjb7kW
         Qnb7VK6YmqRXmQBhVn43Q+Y1SSf9sUllWweeI4GOFMgYeuPcABmsPaCZwBqj9wJnoK
         hrkGwbVzdYfJaBOmkNetXE5PWQGSzbZ7mg/HJWW5sEGqUYd1GJ6HOh8StDtd+bU+hF
         E0QL1sPDp/2kGXZkg+Gv8Id0MEsNJ4hGQy9peVKIh4ZXVag9aNXtTevylvJMPQupXR
         7j9tIyPPN11nA==
Date:   Sun, 31 Jan 2021 15:30:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the parisc-hd tree
Message-ID: <20210131153021.5febfe17@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WMdH4nh0.8TUt6Kxc4DGrIO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WMdH4nh0.8TUt6Kxc4DGrIO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ca7222dcfff4 ("parisc: Bump 64-bit IRQ stack size to 64 KB")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/WMdH4nh0.8TUt6Kxc4DGrIO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAWMl4ACgkQAVBC80lX
0GybWwf/U6WKgWyO+x5tIvpcPYearSYVwZJiLW1XwKcti4Pdc12TH+bscCVgk8ID
A22IM8rfx4LLHghXpQl/oFSY0ixXXLYMwY5ant/EN3SrMuRig4qlO3V13y3icWIl
h4BwEVUg0uS+O4jacCjo8Niiqj6ghuPRjJXtahoYoUcwrCJE2Lc/+YGpG35pc04x
LIu4JGkhH+8Q396bHvTxsZxzL0EUtahkJzKqci4sTTx3+QBBeBUGztHqfKPtXf9n
4LMxHe0rv9jHpZL4XiqGHz5me2hFTPi4QiRsFZRUsMemcSUaXG8IkCqoM6mGfT15
RpfbdJq5bp/XU1fKvvQQf0tEOy5V2g==
=z/6P
-----END PGP SIGNATURE-----

--Sig_/WMdH4nh0.8TUt6Kxc4DGrIO--
