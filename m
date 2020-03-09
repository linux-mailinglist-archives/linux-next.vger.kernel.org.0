Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69ADA17EC6C
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 00:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgCIXIC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 19:08:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39217 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgCIXIC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Mar 2020 19:08:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48bv5X1368z9sPF;
        Tue, 10 Mar 2020 10:08:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583795280;
        bh=Y/1vQP+6MEAUcRXqDqjNGMgG1RWqFT0/Us8Xg4YZJt4=;
        h=Date:From:To:Cc:Subject:From;
        b=O4pP+x7FIJ+aHoxCZxuaID4txbbGk4v/XdfpsuLY/gKpr1mjv4S249NYca/HtuSB1
         abGRcpNMa2Kd1+MK2G0IHjcjbL+7vgJiWoA97kAs5vbDlb8EyZzfFT990g5uJ5JhyJ
         BhZozUmDOrN/mnolsAK8lrptqUJUbfUe34rknQX5xzfx2S31yesK41bsaZKQaAk4RM
         2AKfF4JHHMWNvm9bHGy9CB8+j862UtttuVkzO1JAlM2RM8GlCbX8hLoMjGHwY3zCQq
         BzUN7TgUKKBjow+kQgVpsvJScRp4Dd8nxqtx4JInfD4CniJBs4QMLiMDwQ3c+lvgqb
         BjXs774SiVLIg==
Date:   Tue, 10 Mar 2020 10:07:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the pci tree
Message-ID: <20200310100759.221c6add@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8EQD6ymTlscBFC+C=Rgaix=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8EQD6ymTlscBFC+C=Rgaix=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "pci_speed_string" [drivers/pci/controller/pcie-brcmstb.ko] undefine=
d!
ERROR: "pcie_link_speed" [drivers/pci/controller/pcie-brcmstb.ko] undefined!

Caused by commit

  31483a35dbed ("PCI: Use pci_speed_string() for all PCI/PCI-X/PCIe strings=
")

I have used the pci tree from next-20200306 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/8EQD6ymTlscBFC+C=Rgaix=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5mzE8ACgkQAVBC80lX
0Gxnwwf/bEdPZOSkwQlHOCmwVjxxO8JmY49sU+L2Qvwgr7e4ZY1ojLVb6ZApes4R
pcXX8YUuKoDZpfBTzJ6UEYzfK7VGuFL++9PELbZZOjyY/96QrkWB3wJephqq/JL+
w3cmXILqwYucKqjmb1W/IiqvbVsT17D5Phpb3kzj4E/1pGEvqffBMYnWPj0qAXi+
7QrHs6z1tSlLXPyHK/YvjOA+nk2pOY2OUGKlx71yehbajRQR7y97SIkB/uYz+8Ve
NJ1AkNySW26mK9Y4M0+E65KzIChhPOCVACnbvMycW1nfIUsjx7MPwEeaLwtQXX+7
DYQzIPcpWVEq75V+5L+uVKxWMqaTlg==
=xVMu
-----END PGP SIGNATURE-----

--Sig_/8EQD6ymTlscBFC+C=Rgaix=--
