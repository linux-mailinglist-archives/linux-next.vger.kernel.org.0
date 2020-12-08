Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD392D2133
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 03:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbgLHC5E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 21:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728189AbgLHC5E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 21:57:04 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB35C0613D6;
        Mon,  7 Dec 2020 18:56:24 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqlF12rsmz9sVl;
        Tue,  8 Dec 2020 13:56:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607396182;
        bh=r8+uOSzGpxl+5jLLfliEOhOhtbGEiNYgxRCcBs9RC9Y=;
        h=Date:From:To:Cc:Subject:From;
        b=UrFDK+zWIE02Kg5KLpRaKz8YaO/Xsk2hcP+QbzyUxbWl5XnEaIlZMDBg9Dg2hVzzN
         na18K4nW1vs3VNbgYp3R3hbwuvtmoyupzZHSBJveECSb7JyCY6koDg7vTnNNLQQfhm
         Om11WRufM0zym1ilFOyubfR1ihKIWW8cj758MUbWc52RguborWnQBaGayqYWXECU5F
         /en9wIijdL/KK+cxXVTzFHan972IAx401OxPt1AbG3VyIwWsM8mCylklagJ4gmlQFV
         Jfjg8uBAPtCwJtSN0x93cSxx1OsDFoEgHUV9V04wwOs5/qgDqFf67Cj3mydTvJbtae
         RE/O0C8jMIdPw==
Date:   Tue, 8 Dec 2020 13:56:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Jay Vosburgh <jay.vosburgh@canonical.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sean V Kelley <sean.v.kelley@intel.com>
Subject: linux-next: manual merge of the amdgpu tree with the pci tree
Message-ID: <20201208135620.237dbbd1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vSyjXCFW1.ut1/TKTkltAH6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vSyjXCFW1.ut1/TKTkltAH6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/pci/pcie/err.c

between commits:

  8f1bbfbc3596 ("PCI/ERR: Rename reset_link() to reset_subordinates()")
  0791721d8007 ("PCI/ERR: Use "bridge" for clarity in pcie_do_recovery()")
  05e9ae19ab83 ("PCI/ERR: Add pci_walk_bridge() to pcie_do_recovery()")

from the pci tree and commit:

  36a8901e900a ("PCI/ERR: Fix reset logic in pcie_do_recovery() call")

from the amdgpu tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/pcie/err.c
index 510f31f0ef6d,4a2735b70fa6..000000000000
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@@ -146,61 -146,49 +146,82 @@@ out
  	return 0;
  }
 =20
 +/**
 + * pci_walk_bridge - walk bridges potentially AER affected
 + * @bridge:	bridge which may be a Port, an RCEC, or an RCiEP
 + * @cb:		callback to be called for each device found
 + * @userdata:	arbitrary pointer to be passed to callback
 + *
 + * If the device provided is a bridge, walk the subordinate bus, including
 + * any bridged devices on buses under this bus.  Call the provided callba=
ck
 + * on each device found.
 + *
 + * If the device provided has no subordinate bus, e.g., an RCEC or RCiEP,
 + * call the callback on the device itself.
 + */
 +static void pci_walk_bridge(struct pci_dev *bridge,
 +			    int (*cb)(struct pci_dev *, void *),
 +			    void *userdata)
 +{
 +	if (bridge->subordinate)
 +		pci_walk_bus(bridge->subordinate, cb, userdata);
 +	else
 +		cb(bridge, userdata);
 +}
 +
  pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 -			pci_channel_state_t state,
 -			pci_ers_result_t (*reset_link)(struct pci_dev *pdev))
 +		pci_channel_state_t state,
 +		pci_ers_result_t (*reset_subordinates)(struct pci_dev *pdev))
  {
 +	int type =3D pci_pcie_type(dev);
 +	struct pci_dev *bridge;
  	pci_ers_result_t status =3D PCI_ERS_RESULT_CAN_RECOVER;
 -	struct pci_bus *bus;
 +	struct pci_host_bridge *host =3D pci_find_host_bridge(dev->bus);
 =20
  	/*
 -	 * Error recovery runs on all subordinates of the first downstream port.
 -	 * If the downstream port detected the error, it is cleared at the end.
 +	 * If the error was detected by a Root Port, Downstream Port, RCEC,
 +	 * or RCiEP, recovery runs on the device itself.  For Ports, that
 +	 * also includes any subordinate devices.
 +	 *
 +	 * If it was detected by another device (Endpoint, etc), recovery
 +	 * runs on the device and anything else under the same Port, i.e.,
 +	 * everything under "bridge".
  	 */
 -	if (!(pci_pcie_type(dev) =3D=3D PCI_EXP_TYPE_ROOT_PORT ||
 -	      pci_pcie_type(dev) =3D=3D PCI_EXP_TYPE_DOWNSTREAM))
 -		dev =3D dev->bus->self;
 -	bus =3D dev->subordinate;
 +	if (type =3D=3D PCI_EXP_TYPE_ROOT_PORT ||
 +	    type =3D=3D PCI_EXP_TYPE_DOWNSTREAM ||
 +	    type =3D=3D PCI_EXP_TYPE_RC_EC ||
 +	    type =3D=3D PCI_EXP_TYPE_RC_END)
 +		bridge =3D dev;
 +	else
 +		bridge =3D pci_upstream_bridge(dev);
 =20
 -	pci_dbg(dev, "broadcast error_detected message\n");
 +	pci_dbg(bridge, "broadcast error_detected message\n");
  	if (state =3D=3D pci_channel_io_frozen) {
 -		pci_walk_bus(bus, report_frozen_detected, &status);
 +		pci_walk_bridge(bridge, report_frozen_detected, &status);
+ 		/*
+ 		 * After resetting the link using reset_link() call, the
+ 		 * possible value of error status is either
+ 		 * PCI_ERS_RESULT_DISCONNECT (failure case) or
+ 		 * PCI_ERS_RESULT_NEED_RESET (success case).
+ 		 * So ignore the return value of report_error_detected()
+ 		 * call for fatal errors.
+ 		 *
+ 		 * In EDR mode, since AER and DPC Capabilities are owned by
+ 		 * firmware, reported_error_detected() will return error
+ 		 * status PCI_ERS_RESULT_NO_AER_DRIVER. Continuing
+ 		 * pcie_do_recovery() with error status as
+ 		 * PCI_ERS_RESULT_NO_AER_DRIVER will report recovery failure
+ 		 * irrespective of recovery status. But successful reset_link()
+ 		 * call usually recovers all fatal errors. So ignoring the
+ 		 * status result of report_error_detected() also helps EDR based
+ 		 * error recovery.
+ 		 */
 -		status =3D reset_link(dev);
 +		status =3D reset_subordinates(bridge);
- 		if (status !=3D PCI_ERS_RESULT_RECOVERED) {
+ 		if (status =3D=3D PCI_ERS_RESULT_RECOVERED) {
+ 			status =3D PCI_ERS_RESULT_NEED_RESET;
+ 		} else {
+ 			status =3D PCI_ERS_RESULT_DISCONNECT;
 -			pci_warn(dev, "link reset failed\n");
 +			pci_warn(bridge, "subordinate device reset failed\n");
  			goto failed;
  		}
  	} else {
@@@ -215,13 -203,25 +236,25 @@@
 =20
  	if (status =3D=3D PCI_ERS_RESULT_NEED_RESET) {
  		/*
- 		 * TODO: Should call platform-specific
- 		 * functions to reset slot before calling
- 		 * drivers' slot_reset callbacks?
+ 		 * TODO: Optimize the call to pci_reset_bus()
+ 		 *
+ 		 * There are two components to pci_reset_bus().
+ 		 *
+ 		 * 1. Do platform specific slot/bus reset.
+ 		 * 2. Save/Restore all devices in the bus.
+ 		 *
+ 		 * For hotplug capable devices and fatal errors,
+ 		 * device is already in reset state due to link
+ 		 * reset. So repeating platform specific slot/bus
+ 		 * reset via pci_reset_bus() call is redundant. So
+ 		 * can optimize this logic and conditionally call
+ 		 * pci_reset_bus().
  		 */
+ 		pci_reset_bus(dev);
+=20
  		status =3D PCI_ERS_RESULT_RECOVERED;
 -		pci_dbg(dev, "broadcast slot_reset message\n");
 -		pci_walk_bus(bus, report_slot_reset, &status);
 +		pci_dbg(bridge, "broadcast slot_reset message\n");
 +		pci_walk_bridge(bridge, report_slot_reset, &status);
  	}
 =20
  	if (status !=3D PCI_ERS_RESULT_RECOVERED)

--Sig_/vSyjXCFW1.ut1/TKTkltAH6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/O61QACgkQAVBC80lX
0GxS7gf6AtvsAJWfM7CDYoHHHKSrvuJrc68lEJjilsdwnuZcYrlCA2vA1C0O2sHx
dsIYV1svCF6NGuKklzNrzfrcG2O/bWX4MEt5Mla4qEHMokZrmYHheuLkV53WDiE0
jqK7ktFMtN9iFeXHLV5b6cSiiJqFAblNhN6ejzOXZQ70jAuTmpn4HNqbnHx6flQt
3/rvgOgrvemVCk0tdvA57DHvh4g7tJUlnuukzCYuTquUQihGX5VAqBz00q3nYb9f
RZbmf8KerDK2tPXQX80wRZphmWABjPT8ZW+OkcsDaSUqjfHl1sBalmBjV/Wxo+1X
DyxN4rwUQx4RHqCk/eq88PY9rRQFYg==
=ffAF
-----END PGP SIGNATURE-----

--Sig_/vSyjXCFW1.ut1/TKTkltAH6--
