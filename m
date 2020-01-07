Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0FF8131EFF
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 06:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgAGFRo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 00:17:44 -0500
Received: from ozlabs.org ([203.11.71.1]:36337 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbgAGFRn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jan 2020 00:17:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47sLH90KC5z9sRW;
        Tue,  7 Jan 2020 16:17:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578374262;
        bh=pTcoQe5Mf4v8GaNj8dG3LS6OS1hjdAmqQc7d5z4bEc0=;
        h=Date:From:To:Cc:Subject:From;
        b=fbiEa/m3sWvYiQackHEAN/xqfkt/+o8I5aExhh5yfWWb8m00uuREhvqB6EC9lyI0Y
         vs/dmXyGXtA8oB3iPWtoA/S8uIXX3ODcaw+3NqvygMSEL0BhxgndE1A/l7cIPLIoa9
         efRxaIdAEbgvIFwp0ZIHjFMd0VGSC2wEPajvd04yz55apgIOv6gNCJ0Mx9xj8hGrO9
         tsvkMom2BZvBrrrvCD+2QUdrBmQshHhjKL5GiqcGf4IS+qw24Sd+EqBTHwrUXcjlX4
         RldMCxQkqfcn9qpsnPaFMPz3KxQ/1DT2GWQwzYP0Vm3I7ky46r9etYjVQ7oE2LBhdr
         JGY4zJ4CVrJ2Q==
Date:   Tue, 7 Jan 2020 16:17:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: linux-next: build warning after merge of the phy-next tree
Message-ID: <20200107161733.3c70149b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r2YbW=pVUp/+.iaUk/lk=Re";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r2YbW=pVUp/+.iaUk/lk=Re
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the phy-next tree, today's linux-next build (86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/phy/intel/phy-intel-e=
mmc.o
see include/linux/module.h for more information

Introduced by commit

  95f1061f715e ("phy: intel-lgm-emmc: Add support for eMMC PHY")

--=20
Cheers,
Stephen Rothwell

--Sig_/r2YbW=pVUp/+.iaUk/lk=Re
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4UFG0ACgkQAVBC80lX
0GzAcgf/VjIlVtrKNiTQX9j5vjt1TuuyLB33fhyLNtxFDoz10cyFEaQ4D8uZLxo0
RrnWENG2RpTBPGeD0/ue2oQ12hVb6g4OSyIqf2FW6FExTuR+aOQHP//+eoGGs5sB
zWhr9+nKrNsI3+ehyJImx/BsR33++JvnpKSyS3j+2QqGc+izO2XvoOULQiTTm3lG
eCE7TkvnGql3HXkg7TZhu32qcR1AAWi0+ToZrMJS6zYK05kuCM7LZNZTRgPeVx13
EJQndE/dSXTkOhK2W2fqMujCl9BT8s6E2l6h+gq8GSRgGRdZUEVHko15yZu+oUly
VkEmhQZw0uDCAen9OJ9OeQl7DmE6PA==
=JJKu
-----END PGP SIGNATURE-----

--Sig_/r2YbW=pVUp/+.iaUk/lk=Re--
