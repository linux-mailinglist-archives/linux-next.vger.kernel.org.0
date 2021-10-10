Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3756428423
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 01:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbhJJXO5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Oct 2021 19:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232812AbhJJXO4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 Oct 2021 19:14:56 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329E6C061570;
        Sun, 10 Oct 2021 16:12:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSHlR526lz4xbX;
        Mon, 11 Oct 2021 10:12:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633907572;
        bh=r4GrcWgdPshNlgLFAN2ew38xMvBogldJEh6Jwj6T4Lo=;
        h=Date:From:To:Cc:Subject:From;
        b=plD333k2zZ919Oksf26N01S6htufeT8J3HDCkLm8P7ymey7KTvhr02P4CdtHxAWch
         pNflSwq9jbshGs95iqi3wy5o5MkbSf4gEygRqU8ahV9erh7MEJOmwqzg67mePyBPX2
         NX6iiCuMgGLcdbwTh375JwvSS4bjTEZ9E4S+jxKPT4wEP7znUGxdBkHW0dxTSYO3ZA
         j8x4l9fJZ6rgV11L4G6WC798RPx7ryFm59QfQwtaEeC6aOZvNPjXmBc+KWxZ9aASpc
         0asN71yuFSyZgJyAwiBvLDDQ3g7mM6OprhA1s9W8qkbcAUP8IfGeV9W5Y3yNxCwGQr
         u8V3uvguJgfLQ==
Date:   Mon, 11 Oct 2021 10:12:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pci tree
Message-ID: <20211011101250.11902b31@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZQ0r+/uMtE58Xit7vKdYfVj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZQ0r+/uMtE58Xit7vKdYfVj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: modpost: "dw_pcie_ep_reset_bar" [drivers/pci/controller/dwc/pcie-qco=
m-ep.ko] undefined!
ERROR: modpost: "dw_pcie_ep_raise_msi_irq" [drivers/pci/controller/dwc/pcie=
-qcom-ep.ko] undefined!
ERROR: modpost: "dw_pcie_ep_raise_legacy_irq" [drivers/pci/controller/dwc/p=
cie-qcom-ep.ko] undefined!

Caused by commit

  3872e6f0544f ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver=
")

I have used the pci tree from next-20211008 fot today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZQ0r+/uMtE58Xit7vKdYfVj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFjc3IACgkQAVBC80lX
0GyO2QgAjV4gmDCOEw+EtCFZoOfOazl7NZQ4ttI0l6Sdz/2V8lF8/fc5hDAZ2crm
3KapfaB93lHG4ai75gs0fEAZRtU7Ry9tnyICbdyenuNjoieD1LmEzM0olH6puaYV
u2vWMgR1U3UkVMEvRDpiCn/2csRd+pkBhi57Yfm5hJd2GlW0ieOuFZPanrV5x0HR
G0wnCYhNWMaqJvw1ArB/NVvOqSFyj+D7Cfwc2ebOwLRhaNNN+td6n1vKeckH8Tc1
hpNGTu6+UVQQu07rh9JvxUXEpQbyzBmgDUNWpSi+gFY5jfbmny3YATge0CoejicL
4cyJ/0asRvzvhGeEKp9w6/8GmS0DjQ==
=g/5v
-----END PGP SIGNATURE-----

--Sig_/ZQ0r+/uMtE58Xit7vKdYfVj--
