Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91AED2C9F17
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 11:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgLAKYl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:24:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbgLAKYk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 05:24:40 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48E1C0613CF;
        Tue,  1 Dec 2020 02:23:59 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CldVg3bTCz9s1l;
        Tue,  1 Dec 2020 21:23:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606818235;
        bh=Jzpei87lhgOAYiHlyFlOES389KM0y/qUuZ6tDKJzaNU=;
        h=Date:From:To:Cc:Subject:From;
        b=ByvIkxMGtJEQt4L/YQB7pgSISb11LwXH5xm0l57PSFHJDeR9evSksfozuMY7MbA+Z
         dQSWMPNNAp+hZ8l4+eP3UoybkRyTYAL4ZUWVASUqMpLSKFbUMX9jK4jpuYze2/M4yl
         eYelP1wTm30AcnYbyTgWxDFme8ytFGKJy+iocAi9q7CEY4zmOVgtGA1FAXTfgcoXvW
         wl9cQQnsaOQikqurarEQaLi3kWUDJ4/9aj0YI0idXN5fb1GrFGbo4SOiXIzqnJuw0y
         QJW08o+exMNSstD4razXtGJIGh84Hy6U7fbEbxftIyAkN2z1JFPYSz3vtlJQDFibh7
         QbQhlp1cNz4SQ==
Date:   Tue, 1 Dec 2020 21:23:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Greg KH <greg@kroah.com>
Subject: linux-next: Signed-off-by missing for commit in the
 usb-chipidea-next tree
Message-ID: <20201201212354.3e9f09b3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BZxHp_ilKP/BEhfkLTO.P7=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BZxHp_ilKP/BEhfkLTO.P7=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  b140b354d127 ("usb: typec: Add type sysfs attribute file for partners")
  a67ad71c6468 ("usb: common: ulpi: Constify static attribute_group struct")
  61336e5db8f9 ("usb: typec: Constify static attribute_group structs")
  f18890ead25d ("USB: core: Constify static attribute_group structs")
  137bd0e04f46 ("usb: typec: tcpm: Stay in SNK_TRY_WAIT_DEBOUNCE_CHECK_VBUS=
 till Rp is seen")
  2413711487c3 ("usb: typec: tcpm: Disregard vbus off while in PR_SWAP_SNK_=
SRC_SOURCE_ON")
  38707ad78e16 ("usb: typec: Expose Product Type VDOs via sysfs")
  581140741224 ("usb: typec: Consolidate sysfs ABI documentation")
  5b63ba7f3f62 ("usb: pd: DFP product types")
  b5325e0017d7 ("usb: isp1301-omap: Convert to use GPIO descriptors")
  9e7290cb419d ("usb: Fix fall-through warnings for Clang")
  cf8314bb9f26 ("usb: typec: Fix num_altmodes kernel-doc error")
  442fa9c05cab ("usb: typec: Add plug num_altmodes sysfs attr")
  1193103c1076 ("usb: typec: tcpci_maxim: Fix the compatible string")
  13c53c00e81f ("dt-bindings: usb: Maxim type-c controller device tree bind=
ing document")
  f5a98cc36225 ("usb: typec: tcpci_maxim: Fix uninitialized return variable=
")
  203fd830a193 ("usb: typec: tcpci_maxim: Enable auto discharge disconnect")
  ebcf6c255080 ("usb: typec: tcpci: Implement Auto discharge disconnect cal=
lbacks")
  428804eed4cd ("usb: typec: tcpm: Implement enabling Auto Discharge discon=
nect support")
  cece16630a9c ("usb: typec: tcpci_maxim: Fix vbus stuck on upon diconnecti=
ng sink")
  294a8e667ad9 ("usb: typec: tcpci: frs sourcing vbus callback")
  1c109ebc0134 ("usb: typec: tcpm: frs sourcing vbus callback")
  85c16dc068ed ("usb: typec: tcpm: Refactor logic for new-source-frs-typec-=
current")
  66d004aff708 ("usb: typec: Add number of altmodes partner attr")
  259fcae90f7e ("usb: pd: Add captive Type C cable type")
  1090d1e366ea ("USB: apple-mfi-fastcharge: Fix kfree after failed kzalloc")
  44e0bf239206 ("usb/max3421: fix return error code in max3421_probe()")
  ff5e0488d7fe ("usb: typec: Remove one bit support for the Thunderbolt rou=
nded/non-rounded cable")
  bb328b790edb ("usb: typec: intel_pmc_mux: Configure Thunderbolt cable gen=
eration bits")
  235920c3c80e ("platform/chrome: cros_ec_typec: Correct the Thunderbolt ro=
unded/non-rounded cable support")
  9d11b7220dff ("usb: typec: Correct the bit values for the Thunderbolt rou=
nded/non-rounded cable support")
  dd07e75a143a ("usb: hcd.h: Remove RUN_CONTEXT")
  997d2edc58ed ("usb: host: ehci-mxc: Remove the driver")
  1261e818b439 ("usb: host: imx21-hcd: Remove the driver")
  170408f6e69a ("USB: storage: avoid use of uninitialized values in error p=
ath")
  2de743b08132 ("usb: fix a few cases of -Wfallthrough")
  69f7421c6160 ("usb: misc: brcmstb-usb-pinmap: Make sync_all_pins static")
  0f399ba93d3e ("usb: typec: ucsi: Work around PPM losing change informatio=
n")
  c1a6cb538802 ("usb: typec: ucsi: acpi: Always decode connector change inf=
ormation")
  dcb4ce0e4492 ("usb: misc: brcmstb-usb-pinmap: Fix an IS_ERR() vs NULL che=
ck")
  68d6f2bcbfd0 ("kcov, usb: only collect coverage from __usb_hcd_giveback_u=
rb in softirq")
  a7d43316e47c ("USB: host: isp1362: delete isp1362_show_regs()")
  74bfec445b03 ("dt-bindings: connector: Add property to set initial curren=
t cap for FRS")
  922a8008fe76 ("usb: xhci: Remove in_interrupt() checks")
  9b28508e2a86 ("usbip: Remove in_interrupt() check")
  b3cbc18f80c6 ("usb: gadget: pxa27x_udc: Replace in_interrupt() usage in c=
omments")
  ff6f2b42ea3a ("usb: core: Replace in_interrupt() in comments")
  b6d8ac49953b ("usb: gadget: udc: Remove in_interrupt()/in_irq() from comm=
ents")
  399452b463eb ("USB: host: ehci-pmcmsp: Cleanup usb_hcd_msp_remove()")
  87d64cb083fa ("usb: hosts: Remove in_interrupt() from comments")
  6a700d8af537 ("usb: atm: Replace in_interrupt() usage in comment")
  9573d69a7657 ("USB: sisusbvga: Make console support depend on BROKEN")
  3d30c6e0bb36 ("usb: Add driver to allow any GPIO to be used for 7211 USB =
signals")
  e7ed6422dd9c ("dt-bindings: Add support for Broadcom USB pin map driver")
  7f08972e12f0 ("usb: host: xhci-mem: remove unneeded break")
  8a508616ef64 ("usb: storage: freecom: remove unneeded break")
  597335205373 ("usb: misc: iowarrior: remove unneeded break")
  c902d58d8b24 ("usb: host: ehci-sched: add comment about find_tt() not ret=
urning error")

are missing a Signed-off-by from their committers.

It look like you have rebased (part of) Greg's usb tree into your tree :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/BZxHp_ilKP/BEhfkLTO.P7=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/GGboACgkQAVBC80lX
0Gyaxwf/dRllNSQUkxkv40hjafVIPngB/y7wbs1bWzPRdO6DH+i7xtxzwaAq5mOD
ghqK/FCShmLBrfypuYZAp9lW0Tk7ZMKuT2TEABQ0FcEvKOVVG385EuHU1YIImaVx
5Ur6WgE+pjM3/EHN4f3EW/+jfCDtK/Uh/jNe9jTH2WpCKjblvd7iFP2t5f6Ea/WB
ASgXcX30tF8HgnDnCgEdYnyHH7MCB7PFRVZpTWGHHJ+RlxfugIqrJHWDfnXxhEaF
iaK4J7VPXbK0c4f+fu3jii2eJcE0QlyjP3cWQWpmdO7c68XWXM+dJoyAJCwwfeSr
kAx/tjUVVjHz3NRE1AtWayVBRRBdEQ==
=RUP0
-----END PGP SIGNATURE-----

--Sig_/BZxHp_ilKP/BEhfkLTO.P7=--
