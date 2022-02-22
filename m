Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54D0A4BEF32
	for <lists+linux-next@lfdr.de>; Tue, 22 Feb 2022 02:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbiBVBc6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Feb 2022 20:32:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbiBVBc6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Feb 2022 20:32:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BC124F19
        for <linux-next@vger.kernel.org>; Mon, 21 Feb 2022 17:32:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E2584614A8
        for <linux-next@vger.kernel.org>; Tue, 22 Feb 2022 01:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECA6C340E9
        for <linux-next@vger.kernel.org>; Tue, 22 Feb 2022 01:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645493553;
        bh=O8ulxs5AbJ0SzmlD9QJbpnlMWpxKlf04orF+ezv2GGQ=;
        h=Date:From:To:Subject:From;
        b=Fkq1P3dDkUyR4ZypwbvbB0NCrh5ASF/N9jljgcVic43J9RO1f9L3rc/D4lUNOuI4e
         AIs5MnHnvd3cqWzsNrHNEhnE4IMN0i7v1vMOh4c5YlWGaJPrmSixuPq98RSDAmVm7I
         pGMEycqbHShJxGi9TcWX11nytvqv+BcNJsTpAvkStvP4AVd/ACHP9LJpJ/cAhou7qV
         pMnsR9GnY9oPmrutNXLxYF/GFUoMN8R1iOFj/XiLpkIAzrESjGiHz+ZVT1xiwRNyUI
         Y5zdSfx+N7ZRNFAMxPfw7ijHhJ/VvfTEVM4sI0rw9hn2SJ+RIdsJT0jsGg9XBgJf/8
         oDoCFgK0HvgpA==
Date:   Tue, 22 Feb 2022 01:32:29 +0000
From:   Mark Brown <broonie@kernel.org>
To:     linux-next@vger.kernel.org
Subject: No tree for 21st February
Message-ID: <YhQ9LURSx0ujZbsj@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FIfM4SKSasmala5y"
Content-Disposition: inline
X-Cookie: I smell a wumpus.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--FIfM4SKSasmala5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Due to a mess up with the scripting on my part there will be no -next
release today, it's late and unwinding the mistake would take an
unreasonably long time.  Things should be fine tomorrow hopefully.
Sorry about that.

Thanks,
Mark

--FIfM4SKSasmala5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIUPS0ACgkQJNaLcl1U
h9C3mgf9GqSkTahOQ68O6H5pw2I+dShiWlAAtFEbILBmvKqMV7BfEOxe259nrhJA
5dAMzPo9ueNcHzADvMYxDWcchmIykXpyT4eWPPhhKfHWKU0C2cJNq8YIuia8yztu
KByzuCA4qla+3dH2I0HNC7qRKc+l0LHtM3aTvhusO3t++F8ZmmKcEnCb6Yv3rMDM
O8HrGrHdmJBdgnPnJkaWn6JxLxOSJpd6erAVDasSkpdpAQevS6oc3NIrgiC3qUc/
dT/iS7EaONrilmftcb9qqxWYQiHgBCTp/Nw0u9MPGTktjjsQrmsCsjDTsIF58rq7
Ra67+ixJDYqydE1B0n3PH9kHYtdPFg==
=AkTi
-----END PGP SIGNATURE-----

--FIfM4SKSasmala5y--
