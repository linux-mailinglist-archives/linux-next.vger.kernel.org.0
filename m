Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0081C312B
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 03:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgEDBqb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 May 2020 21:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726282AbgEDBqb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 3 May 2020 21:46:31 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F015DC061A0E;
        Sun,  3 May 2020 18:46:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Fm0z0TS2z9sRf;
        Mon,  4 May 2020 11:46:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588556787;
        bh=ZxUBL/qLwErnf8v44IGSLO1quuhJfxSBOxnciMTtAZk=;
        h=Date:From:To:Cc:Subject:From;
        b=F5cGr1LAqWQN3rNqF3WuvqPcZgXerrZAyJp1lZFlkSB1/ncyVdH1V7J9NVhc+u6lx
         swA8yLHK5u7L2TMWAiXdDqA0aVzQTpX7+evsj5bn4elxWZYQzQYq7pu1cUP0VtVTPz
         LOq5CXhfXp64rPqNIu50WhqVTP4PKA06ZfmXm4YXfngq7QaNZucliKZzWjIjCFXa3H
         L5ZHM5mnMyHBBcpQw49SgDY4J5jgtOI8hnqZjA4CbcQddWbklzwJGhGkLsUTW5ri95
         XTWDn1DiypB3V1n+nkrt8WRwRFsQxYtguNsROxoSwgWRVKanE7Y1lWBn6X3KjvLN9k
         iDccSC6IluZLw==
Date:   Mon, 4 May 2020 11:46:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
Subject: linux-next: build failure after merge of the char-misc tree
Message-ID: <20200504114625.1de2c54d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=SQxWHq3j4vo5/n=rXSYzbg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=SQxWHq3j4vo5/n=rXSYzbg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, Friday's linux-next build (arm64
allmodconfig) failed like this:

ERROR: modpost: "zynqmp_pm_fpga_get_status" [drivers/fpga/zynqmp-fpga.ko] u=
ndefined!
ERROR: modpost: "zynqmp_pm_fpga_load" [drivers/fpga/zynqmp-fpga.ko] undefin=
ed!

Presumably caused by commit

  4db8180ffe7c ("firmware: xilinx: Remove eemi ops for fpga related APIs")

Reported-by: "kernelci.org bot" <bot@kernelci.org>

--=20
Cheers,
Stephen Rothwell

--Sig_/=SQxWHq3j4vo5/n=rXSYzbg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6vc/EACgkQAVBC80lX
0GwRdwf9ERx9PIHh92T0Wli8C4JGfg6ZvgwaQhFdupeJC/zEnxWIHD/jeFDhtCY4
p+YPnE5jDaYUMPo4dvq62Hxticrym6UYKblFgpe4QYwEA4auvyfS7vtbM8pjH3bV
iyjn8+cSos5A2MM4agSpHtloEHdNWgeiPrHyDITN84gIg1wghoha0yCdnWOr2zjC
qGGPo73lASUXeFEPlO+qGB2pNW6BwyADLnyNjeOkFZ7il7FhWq+6e2lx5pJNgz3E
MTkFvJ+3Jw6hzK74/haZ9n0s4tJD5i0BUlSXQiIM8HKSdmH3HDNpRVMEaaVxO+Mb
UD5XKY7SpgWUu12rnIc0byyHP0QLkw==
=F1oZ
-----END PGP SIGNATURE-----

--Sig_/=SQxWHq3j4vo5/n=rXSYzbg--
