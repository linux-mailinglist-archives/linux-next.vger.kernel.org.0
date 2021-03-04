Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86BC532DE1A
	for <lists+linux-next@lfdr.de>; Fri,  5 Mar 2021 00:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhCDXy3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 18:54:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhCDXy3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Mar 2021 18:54:29 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC8BC061574;
        Thu,  4 Mar 2021 15:54:29 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ds74y2T5Mz9sRR;
        Fri,  5 Mar 2021 10:54:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614902067;
        bh=+5JotPe5WaaeZxMFy0mD53YlEf8kABLd16TNrmH8jLE=;
        h=Date:From:To:Cc:Subject:From;
        b=IG0Hcau1ybjRhVln6rFeEc2ZXL7+LoxUAA3E7/gDobReKWi88b/EFNbuaFy09G9TE
         eRGRKCHHQFE6cBOs2P8+OHLliCALDLsXbpChZAWJoMD4V6dTSak2Lvk1/gwKnDhIyX
         B3SnkUSv2rX+t2FqWpJf0+5aqjpygUiNha/ylv2DVa/aCvsawMtwZp3FdqbLZ1X3v6
         SpTrCJCfw9Od/E7xXHNSWZM2IS0U6bJ42yA0TO0G39nMITHhNEXMR6rMqMYq5e11cG
         tmLBfvd4QcT3FGjrJz05RueSFrRbXpQNraV/dmgOo62u4HvpzYtHVSvjU4QxqikH4f
         MVkGYuy7/Usdw==
Date:   Fri, 5 Mar 2021 10:54:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Julian Einwag <jeinwag-nvme@marcapo.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20210305105425.0eac10d5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FGep7PVWPamLwNc1KYx6fQt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FGep7PVWPamLwNc1KYx6fQt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1020bfa8a80b ("nvme-pci: mark Seagate Nytro XM1440 as QUIRK_NO_NS_DESC_LI=
ST.")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/FGep7PVWPamLwNc1KYx6fQt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBBczEACgkQAVBC80lX
0GzjuwgAnITE2Zgz7v33CY8U5aLs629j2yfGhQBrFhAA03IdU1qwfj1qR/Vz/g+Z
0x/yYf1TZNffxma2vLloUcMblGD9rGTF/+bdA1Dr529iRnYN7UJa5MNySgEABqvQ
XuyNcjt+XYNBwgbRT86oLD3ScnbeP3Bn2HMDbm/5L0r4Fa2wTFFf728JDKvJOKUd
HTv9fI1aQATWyPStXo/Q3HRjG2sh6S4Bsv1x9MVp0uctAQWC515ty+CKEzPuur0s
DxhqL+m4RdHDOUPMCCClBUGYJ4GKc+U7NMa409qkDV8GuWJSIi26WlPCQceK1WaN
IweXXd+LI4hCQoDazd84RokL0jbJIg==
=KFV8
-----END PGP SIGNATURE-----

--Sig_/FGep7PVWPamLwNc1KYx6fQt--
