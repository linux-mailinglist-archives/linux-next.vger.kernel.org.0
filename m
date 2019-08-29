Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD715A2AA8
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 01:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbfH2X1p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 19:27:45 -0400
Received: from ozlabs.org ([203.11.71.1]:58907 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbfH2X1p (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 19:27:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46KJgH5xGxz9sDB;
        Fri, 30 Aug 2019 09:27:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567121263;
        bh=UfcRSwYE9spgr+2+ZF0IOHcyXNK3kyHA9hjL+z+pNAY=;
        h=Date:From:To:Cc:Subject:From;
        b=vAZ8YcgsFOf6ArBh5AOEIs8uVHHmuTCAmdkWFMPVAxxKed4anYoBJcGtPa5i1cZOS
         bLrV97zw5IP4Y/7kER2JB4Vy0yo7MghlIBmvcCXe5DDQKJa5DHDCqlKkcAiD/QU2Ms
         bsD69f9lJ4X/T3nerPzjzbHMFLSmwhUhBKWIvjDePrlTGUiFzvU6YbdYGOY8NsmFO3
         5CKYPsYSKskClcOiy8OiOpx9znHen0isBcmmeIhZYxYoO7emQfqKQManmhJCEPHR/g
         BYRA42KIGXrEXUBC5CBiaP850goWxnFwWZbiz+Nt6VcyL/etbvGJNzgcoKWaHMxq+x
         fyDxS32CTCOMQ==
Date:   Fri, 30 Aug 2019 09:27:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: linux-next: manual merge of the arm-soc tree with the arm tree
Message-ID: <20190830092738.7ea1abd0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9XIVVuQ29CllzNagSrKU5OP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9XIVVuQ29CllzNagSrKU5OP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  arch/arm/mach-iop13xx/pci.c

between commit:

  4af014984273 ("ARM: 8871/1: iop13xx: Simplify iop13xx_atu{e,x}_pci_status=
 checks")

from the arm tree and commit:

  59d3ae9a5bf6 ("ARM: remove Intel iop33x and iop13xx support")

from the arm-soc tree.

I fixed it up (the latter removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/9XIVVuQ29CllzNagSrKU5OP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1oX2oACgkQAVBC80lX
0GwbdQf/WdGTg2s+eoOku0Yr9tkKP2qfeL4WYCNXem0P4J7WZd/0dSDdWcOKXmdu
pDJVBbsE9M1BmAcGbTTNMSjfyuHuw8fMie0SGwTJ+ohQRyBhhSYgvsnsQDnqbhqM
8+ojEbBZAkpdRLJHKIbqtmrikRbLCXi2rl0qh788aKmd43dX7hlFyCPOWxr56SHx
VYS8p4qaCHdqHwBIDU0ewrSre4FD9LBZmvWslVVdL/PjwvhMT+cKO0dix3HJXXUi
4gCqzH1Dt8/B8fWMn+1XElmecjCeQbC+YqRnU1iSUGhl7Duwup2dZ44UhFv+/mK0
pDuWl5nLt2D04wpuitenhemhtE87Lg==
=ddop
-----END PGP SIGNATURE-----

--Sig_/9XIVVuQ29CllzNagSrKU5OP--
