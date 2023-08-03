Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8604976E772
	for <lists+linux-next@lfdr.de>; Thu,  3 Aug 2023 13:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbjHCLzL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Aug 2023 07:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjHCLzK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Aug 2023 07:55:10 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6453273B
        for <linux-next@vger.kernel.org>; Thu,  3 Aug 2023 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691063709; x=1722599709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ORCQm6hO1yy9hUEf5xvh8qAG/1JUjzRIMrApHVK0xLM=;
  b=YEHlkS1+vyzLyD37IrXzoMdK8b0dyxQ8c5Puj59LiM4PiXCgujFJ69Tx
   KU/fTOivFf92vXyW2xoNBUGFklnMFJuLWKL6G45sfS7WNz9GwtnjGpYWA
   5pskGYJeUBLaMfO3EswSFIaDSbdBL5ocQPb0a09Msia385zCnrbKr1B4u
   4rKcbGJN5sYn24AzoN0noyuV1gv4+RHOa+8ZZ6HqggRgee26DoUci12BU
   93/ki9a5T4cOwvqVtz5l5cGMyplD2TLT7GUCnWKvbjDn+9RNB/AyZPoXD
   dQfTR2Pp2rFnzWsmAlA7BEyxEij5DWUVNsk3P4qPWBhL6n2E7E5D9IzOB
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="asc'?scan'208";a="239571143"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Aug 2023 04:55:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 3 Aug 2023 04:55:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 3 Aug 2023 04:55:07 -0700
Date:   Thu, 3 Aug 2023 12:54:31 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     "Aithal, Srikanth" <sraithal@amd.com>
CC:     <linux-next@vger.kernel.org>
Subject: Re: next-20230803: boot hang with serial console enabled
Message-ID: <20230803-resisting-crayon-fb965e542698@wendy>
References: <e0dbf903-b122-4e81-0568-a27e1daa0fb4@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EAEAvetKjuS2FDdF"
Content-Disposition: inline
In-Reply-To: <e0dbf903-b122-4e81-0568-a27e1daa0fb4@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--EAEAvetKjuS2FDdF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 04:43:30PM +0530, Aithal, Srikanth wrote:
> Hello all,
>=20
> linux-next build 20230802 onwards seeing host hang issue when booting with
> serial console enabled.

Should be fixed by
https://lore.kernel.org/all/20230803071034.25571-1-tony@atomide.com/
which Greg seems to have picked up.

>=20
>=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Recreation steps
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. Enable serial console by appending following parameters in grub:
>=20
> GRUB_CMDLINE_LINUX append with "console=3DttyS0,115200n8 earlyprintk"
> GRUB_TERMINAL_OUTPUT=3D"console serial"
> Update grub.
>=20
> 2. Then try to boot into next-20230802/next-20230803
>=20
>=20
> Below is the error seeing when the host kernel boots and then host hangs.
>=20
> Memory KASLR using RDRAND RDTSC...
> Poking KASLR using RDRAND RDTSC...
> [    0.004421] __common_interrupt: 96.55 No irq handler for vector
> [    2.552117] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.564770] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.577606] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.590765] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.606677] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.635828] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.650669] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.666176] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.682027] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.714415] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.737626] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.768368] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.802555] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.828769] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.849776] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.870973] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.893790] pstore: zlib_inflate() failed, ret =3D -5!
> [    2.913867] pstore: zlib_inflate() failed, ret =3D -5!
>=20

--EAEAvetKjuS2FDdF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMuVdwAKCRB4tDGHoIJi
0iGPAPsELC8h6q21i7rO8amYYTHWAwC8x0sWlqj0Q0n3ZFRPYQEA/MGIZmrs+gTo
rw9UvOOT/kug/vd29SrdcJE2ZxF5oAg=
=rusj
-----END PGP SIGNATURE-----

--EAEAvetKjuS2FDdF--
