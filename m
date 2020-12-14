Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D8D2DA1AB
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502885AbgLNUfa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503407AbgLNUfT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 15:35:19 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4033C0613D6;
        Mon, 14 Dec 2020 12:34:38 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvtRG0Fm4z9sTX;
        Tue, 15 Dec 2020 07:34:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607978075;
        bh=waxEra4OB0jBkgp2UpZFjtS5vwwa3Le5uKwsry7Tocw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uTYCS27FEFbCoPqJK4BnkNPRnsSBStp6EatRvyStJzDLJ5g8qzmQO/yp1SqesMWug
         x0bgvNQEAfHUJmo7ra8xCoKuLEuAQyLAWCRou3a1CWFj1MFWh+gezMdUrT8iOD2VQv
         mKzI1ZZOwDOgK0kwLJGAesjsYHgCikaUl4QUeDsBySSB7bPLreDdl0sTgfo1SXm6/q
         NEixjx9w6j4Vhx95V7d+IdTwtYoosMnxO4X78yJXMXLez6VQe7WtYSrT/ZzAVyI8w0
         6hzJxH6hSoXNydI9DUwmO6lTHvDjLCOU4leuX6XPvO1TI0jFi4F6cDMpgMg2fs1jj1
         LTnasY9FHUyUA==
Date:   Tue, 15 Dec 2020 07:34:31 +1100
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
Subject: Re: linux-next: manual merge of the amdgpu tree with the pci tree
Message-ID: <20201215073431.37720731@canb.auug.org.au>
In-Reply-To: <20201208135620.237dbbd1@canb.auug.org.au>
References: <20201208135620.237dbbd1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LG1FIdyzQ6u729kwjG5tNhD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LG1FIdyzQ6u729kwjG5tNhD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Dec 2020 13:56:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the amdgpu tree got a conflict in:
>=20
>   drivers/pci/pcie/err.c
>=20
> between commits:
>=20
>   8f1bbfbc3596 ("PCI/ERR: Rename reset_link() to reset_subordinates()")
>   0791721d8007 ("PCI/ERR: Use "bridge" for clarity in pcie_do_recovery()")
>   05e9ae19ab83 ("PCI/ERR: Add pci_walk_bridge() to pcie_do_recovery()")
>=20
> from the pci tree and commit:
>=20
>   36a8901e900a ("PCI/ERR: Fix reset logic in pcie_do_recovery() call")
>=20
> from the amdgpu tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
>=20
> diff --cc drivers/pci/pcie/err.c
> index 510f31f0ef6d,4a2735b70fa6..000000000000
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@@ -146,61 -146,49 +146,82 @@@ out
>   	return 0;
>   }
>  =20
>  +/**
>  + * pci_walk_bridge - walk bridges potentially AER affected
>  + * @bridge:	bridge which may be a Port, an RCEC, or an RCiEP
>  + * @cb:		callback to be called for each device found
>  + * @userdata:	arbitrary pointer to be passed to callback
>  + *
>  + * If the device provided is a bridge, walk the subordinate bus, includ=
ing
>  + * any bridged devices on buses under this bus.  Call the provided call=
back
>  + * on each device found.
>  + *
>  + * If the device provided has no subordinate bus, e.g., an RCEC or RCiE=
P,
>  + * call the callback on the device itself.
>  + */
>  +static void pci_walk_bridge(struct pci_dev *bridge,
>  +			    int (*cb)(struct pci_dev *, void *),
>  +			    void *userdata)
>  +{
>  +	if (bridge->subordinate)
>  +		pci_walk_bus(bridge->subordinate, cb, userdata);
>  +	else
>  +		cb(bridge, userdata);
>  +}
>  +
>   pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  -			pci_channel_state_t state,
>  -			pci_ers_result_t (*reset_link)(struct pci_dev *pdev))
>  +		pci_channel_state_t state,
>  +		pci_ers_result_t (*reset_subordinates)(struct pci_dev *pdev))
>   {
>  +	int type =3D pci_pcie_type(dev);
>  +	struct pci_dev *bridge;
>   	pci_ers_result_t status =3D PCI_ERS_RESULT_CAN_RECOVER;
>  -	struct pci_bus *bus;
>  +	struct pci_host_bridge *host =3D pci_find_host_bridge(dev->bus);
>  =20
>   	/*
>  -	 * Error recovery runs on all subordinates of the first downstream por=
t.
>  -	 * If the downstream port detected the error, it is cleared at the end.
>  +	 * If the error was detected by a Root Port, Downstream Port, RCEC,
>  +	 * or RCiEP, recovery runs on the device itself.  For Ports, that
>  +	 * also includes any subordinate devices.
>  +	 *
>  +	 * If it was detected by another device (Endpoint, etc), recovery
>  +	 * runs on the device and anything else under the same Port, i.e.,
>  +	 * everything under "bridge".
>   	 */
>  -	if (!(pci_pcie_type(dev) =3D=3D PCI_EXP_TYPE_ROOT_PORT ||
>  -	      pci_pcie_type(dev) =3D=3D PCI_EXP_TYPE_DOWNSTREAM))
>  -		dev =3D dev->bus->self;
>  -	bus =3D dev->subordinate;
>  +	if (type =3D=3D PCI_EXP_TYPE_ROOT_PORT ||
>  +	    type =3D=3D PCI_EXP_TYPE_DOWNSTREAM ||
>  +	    type =3D=3D PCI_EXP_TYPE_RC_EC ||
>  +	    type =3D=3D PCI_EXP_TYPE_RC_END)
>  +		bridge =3D dev;
>  +	else
>  +		bridge =3D pci_upstream_bridge(dev);
>  =20
>  -	pci_dbg(dev, "broadcast error_detected message\n");
>  +	pci_dbg(bridge, "broadcast error_detected message\n");
>   	if (state =3D=3D pci_channel_io_frozen) {
>  -		pci_walk_bus(bus, report_frozen_detected, &status);
>  +		pci_walk_bridge(bridge, report_frozen_detected, &status);
> + 		/*
> + 		 * After resetting the link using reset_link() call, the
> + 		 * possible value of error status is either
> + 		 * PCI_ERS_RESULT_DISCONNECT (failure case) or
> + 		 * PCI_ERS_RESULT_NEED_RESET (success case).
> + 		 * So ignore the return value of report_error_detected()
> + 		 * call for fatal errors.
> + 		 *
> + 		 * In EDR mode, since AER and DPC Capabilities are owned by
> + 		 * firmware, reported_error_detected() will return error
> + 		 * status PCI_ERS_RESULT_NO_AER_DRIVER. Continuing
> + 		 * pcie_do_recovery() with error status as
> + 		 * PCI_ERS_RESULT_NO_AER_DRIVER will report recovery failure
> + 		 * irrespective of recovery status. But successful reset_link()
> + 		 * call usually recovers all fatal errors. So ignoring the
> + 		 * status result of report_error_detected() also helps EDR based
> + 		 * error recovery.
> + 		 */
>  -		status =3D reset_link(dev);
>  +		status =3D reset_subordinates(bridge);
> - 		if (status !=3D PCI_ERS_RESULT_RECOVERED) {
> + 		if (status =3D=3D PCI_ERS_RESULT_RECOVERED) {
> + 			status =3D PCI_ERS_RESULT_NEED_RESET;
> + 		} else {
> + 			status =3D PCI_ERS_RESULT_DISCONNECT;
>  -			pci_warn(dev, "link reset failed\n");
>  +			pci_warn(bridge, "subordinate device reset failed\n");
>   			goto failed;
>   		}
>   	} else {
> @@@ -215,13 -203,25 +236,25 @@@
>  =20
>   	if (status =3D=3D PCI_ERS_RESULT_NEED_RESET) {
>   		/*
> - 		 * TODO: Should call platform-specific
> - 		 * functions to reset slot before calling
> - 		 * drivers' slot_reset callbacks?
> + 		 * TODO: Optimize the call to pci_reset_bus()
> + 		 *
> + 		 * There are two components to pci_reset_bus().
> + 		 *
> + 		 * 1. Do platform specific slot/bus reset.
> + 		 * 2. Save/Restore all devices in the bus.
> + 		 *
> + 		 * For hotplug capable devices and fatal errors,
> + 		 * device is already in reset state due to link
> + 		 * reset. So repeating platform specific slot/bus
> + 		 * reset via pci_reset_bus() call is redundant. So
> + 		 * can optimize this logic and conditionally call
> + 		 * pci_reset_bus().
>   		 */
> + 		pci_reset_bus(dev);
> +=20
>   		status =3D PCI_ERS_RESULT_RECOVERED;
>  -		pci_dbg(dev, "broadcast slot_reset message\n");
>  -		pci_walk_bus(bus, report_slot_reset, &status);
>  +		pci_dbg(bridge, "broadcast slot_reset message\n");
>  +		pci_walk_bridge(bridge, report_slot_reset, &status);
>   	}
>  =20
>   	if (status !=3D PCI_ERS_RESULT_RECOVERED)

Just a reminder that this conflict still exists (the amdgpu tree commit
is now 400b308d388a).

--=20
Cheers,
Stephen Rothwell

--Sig_/LG1FIdyzQ6u729kwjG5tNhD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XzFcACgkQAVBC80lX
0GwHtAf9GKnDSzTG8VsJLLUXTV9LmiHGnU6NbzAaXfCspzVPjYWorJBP6HtQj2Nr
zdLZkT2Vg0VDXFdM9Wtvt4mnYf8U97mgoAcVC7pIWolTyz00eIrqruK9XwiEZWh1
0SUMIFa0WMuMWTfGB9TAjAi5ECQmZetC9lMpuaU0DcVZiDpVktJ2fsyfIG7EESg9
0ppoy1S74+1qn2FJcV5O1QlNyASn3vOehXYk52s8TVX3rCd9GXOzLu0ACTjhLxLO
bV6zOHoFcw+mGkMC0ZTKNKNjrym7CHird/Bt880ptWu7JkKSzHtmmo7JvRAM480s
wn2dFjMKcpTABQHUJ8aLZrMTDLjm1Q==
=G1LM
-----END PGP SIGNATURE-----

--Sig_/LG1FIdyzQ6u729kwjG5tNhD--
