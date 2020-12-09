Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540672D4CF9
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 22:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388285AbgLIVgi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 16:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729913AbgLIVgi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 16:36:38 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384D2C0613D6;
        Wed,  9 Dec 2020 13:35:58 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Crr2K6tXTz9sW8;
        Thu, 10 Dec 2020 08:35:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607549754;
        bh=jCHSCt/l7BUKin1y+UGxCyvW4Ct/hs8jC71exqNouuY=;
        h=Date:From:To:Cc:Subject:From;
        b=WF5WiIbQW7+vlyz4HVesHCrHiEvk6vg79L05q21AJNIPUwxP33x9vrR7IL3nZzHRY
         5BOopEvMehnUigP/MJ+sD435siCgzdiTj3tDjN9eLUKGovvE30LsAcDY+/82PlQrnb
         EsJygYXC11ThAXMJxinIJpbQa7GHXHE0NC43+H5nfKaoleuQtJalTpRbdXx6MmEGnW
         MOClQvyLIWdOZeFp59v+paW+OqSZ65Yibs/1NxP/zrlj+GQzkkk9lWUtW2H5i/hAMM
         zcPhywai3Ruq46L8bzSqbfLuCSefJFUjWuxDBUrNMQLYClAZdnSqzDSh3IlwHbJZTy
         Vcf1fM+lzQFZg==
Date:   Thu, 10 Dec 2020 08:35:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20201210083553.73aaf0b4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P6+ka76pXDz_JpNEH/sHZ+t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P6+ka76pXDz_JpNEH/sHZ+t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  2305d20f251d ("firmware: xilinx: Mark pm_api_features_map with static key=
word")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/P6+ka76pXDz_JpNEH/sHZ+t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/RQzkACgkQAVBC80lX
0Gw/Sgf+MDEKxPO9NuW9bBKYs4qim9XgwiC/a7dyPx0ac40yN4EUSvJpMdXYhEbg
/DCdItEaDuFUCVoa/rylLvw1DvQRS1BaoX2hLHvm/lWpklq9xQCurtPljCFsLAyB
gJ5PGwYyETvK5hTBb3Ab1qI81BfIGAQioJH+jbfnf1dqwl0N6zKBxV0Y2AX0vJHz
LC8EUlIfXkhTOvcjpUVqpDfNWMk3PDhnzmdloVtSppr84A0Ty3DYdEIIs53MwGXC
mV/oX6iOf8wwfzdUvD6pH/VTbXlDeu1f5kk2QZxZK9yENlFsUeFbszYr7J7SaWzz
OVBRDrVz9E+vzMblgB8mUCUzu3WnOQ==
=1bw4
-----END PGP SIGNATURE-----

--Sig_/P6+ka76pXDz_JpNEH/sHZ+t--
