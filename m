Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2DF23C30B
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 03:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgHEBcU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 21:32:20 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40825 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725863AbgHEBcU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Aug 2020 21:32:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLvHj6z7Nz9sPB;
        Wed,  5 Aug 2020 11:32:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596591138;
        bh=f1zesDgmMKhn47H2tcFBeyS7Sjl4ojxIo32egbfV4jA=;
        h=Date:From:To:Cc:Subject:From;
        b=UqJmas/cPvzMo5De9oIG40paUF5gee0BFyeCzHATjAxHVzZfhyNjQ4o17nxsqT+jD
         qxtzdm4tWgbb1jA6Pv1Q/fI+6bhCYnTD38TCnBJDI/gqwgiz/pw7b4Sy+w4DT+7QoZ
         KJmk5ArnTomXSBi2OBHA5ON49dhHG/XwC4JNQuafZXFtRke/YQ37uwpYzsi3rbOxUi
         dE8k60g3/p0PojpX9GNBsLTMs+ny9ZHxDx0ewVG7n0Mtf/5u1WHtx1tPwpo73d2HMc
         LCk2nYJVsWdzipMXu/IniY3WFe9IqKlq8O/Ib2I6wjrN7WkYqLQlTUkgYtDJU1HdkH
         bWH6mICPMhZwA==
Date:   Wed, 5 Aug 2020 11:32:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof =?UTF-8?B?V2lsY3p5?= =?UTF-8?B?xYRza2k=?= 
        <kw@linux.com>
Subject: linux-next: build warning after merge of the pci tree
Message-ID: <20200805113216.28ddc0f2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vAB8HrQUlcnb3QRcs_/b8Is";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vAB8HrQUlcnb3QRcs_/b8Is
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/pci/controller/pcie-altera.c: In function 'altera_pcie_parse_dt':
drivers/pci/controller/pcie-altera.c:697:17: warning: unused variable 'dev'=
 [-Wunused-variable]
  697 |  struct device *dev =3D &pcie->pdev->dev;
      |                 ^~~

Introduced by commit

  caecb05c8000 ("PCI: Remove dev_err() when handing an error from platform_=
get_irq()")

--=20
Cheers,
Stephen Rothwell

--Sig_/vAB8HrQUlcnb3QRcs_/b8Is
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8qDCAACgkQAVBC80lX
0Gy3Igf/df982Mb0nzPpU+vlj7Mb7Vj3c5zEFCRk+9VYEbPjKAe3Ib9hf3rEkPbg
W1e0Qai6BowxU3UN4TYYukq2EOlgfF1brq3X2ryj48jCXUg/CVzzHuDstM4gz3Cx
uW/EgR5bDKQ9jYLoGwkqeo6SettFDrQYHx1h/qTN1nuf1UmgPJ9lWEKTx6/rgQrT
q8iO1V5YAL7s6ZDGPSt6NdS8dwz3Zbm9+KNeqlyVETKK+h2ndd4i3uhSm7C+VsKl
0+f76Md6f4NIKdnxnBzwpAFcu0k6SOo1nkEza/BfzjkN5ktcJyAVzop4ubd+udtU
pLTi77aNtLZU+IdjxcGdbj51LZFmUA==
=x40X
-----END PGP SIGNATURE-----

--Sig_/vAB8HrQUlcnb3QRcs_/b8Is--
