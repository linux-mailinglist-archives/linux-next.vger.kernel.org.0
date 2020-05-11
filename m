Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF5F1CCF11
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 03:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgEKBOj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 May 2020 21:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727789AbgEKBOj (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 May 2020 21:14:39 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9B1C061A0C;
        Sun, 10 May 2020 18:14:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49L2yz1SVHz9sRf;
        Mon, 11 May 2020 11:14:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589159677;
        bh=KHwibB8jYouq/vD17bjr+6oBJR1pwMjnqgFMEWDVR4I=;
        h=Date:From:To:Cc:Subject:From;
        b=kJRUU3ihVKgsLV7QfFOXeAv+OzYIl5EnV5lTTOiS7LmfdnDl037Q+1pdXvkXhj2xd
         p2PFvvHRx7lgQQpWlWX8r5Gn/VlIATaKcTV7eK4DvO9s1gS5ARONWAy6AlvogVeZPg
         PaLQkb6Vl2KwVKKx9ZJuRJdjgFSDNkQChpKvvcjRTvNz2qh3QUV18oCxw0nvI3H031
         /yqVW5T1g27z1p1aGUV4VcOtLS2Trznsa7TuuVKfMTcpqgVW8lmDiMilPc1f4kFBPH
         PrnpLIoOTvNov7VunRdDUGATKdRTQfzzHk5JcVTEOQNQp7PZsQ4dOxcdmuGljHbB4q
         FZTl6ixkUqcMw==
Date:   Mon, 11 May 2020 11:14:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: manual merge of the vfs tree with the mips tree
Message-ID: <20200511111434.366de078@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u4gCOZ=P++QUBKRJzqaIDc_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/u4gCOZ=P++QUBKRJzqaIDc_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  arch/mips/lasat/sysctl.c

between commit:

  10760dde9be3 ("MIPS: Remove support for LASAT")

from the mips tree and commit:

  32927393dc1c ("sysctl: pass kernel pointers to ->proc_handler")

from the vfs tree.

I fixed it up (the former removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/u4gCOZ=P++QUBKRJzqaIDc_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64pvoACgkQAVBC80lX
0Gycngf9Gh/JMsqdGjHtI7VirrRrgZu6gdqz5sVjQ4NakL99L2J9S2zmhps7R6N8
54YriPGHcbRiyP7GXpM6jfgftg+ywW9STGJLMqBT/Dqomkw0dwbfC324lHg7e0kM
t+hp7T8Oj1/s6sMFrP1vAdDJ/mK3Nm7fVwY5BckKPI2ZB+cVI8Z+Ab7lV8KcO0IS
ZeiCe2IrbMqEHC2AdbdhPmYQThvW6SUriKUgozINXuizm9ePTWNk1vwsSnFi/MuR
IgyAyyzy8Kg4bJaEqk4hlVUtOgmvQpztTwMt+ORRr7R2sIffA+pgBohP2pBEI0KB
/bbQtBeoMaPwYfFR91g92XKwwkAmSg==
=mfto
-----END PGP SIGNATURE-----

--Sig_/u4gCOZ=P++QUBKRJzqaIDc_--
