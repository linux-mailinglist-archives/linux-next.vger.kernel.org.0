Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA2224CD30
	for <lists+linux-next@lfdr.de>; Fri, 21 Aug 2020 07:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgHUFTp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Aug 2020 01:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgHUFTp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Aug 2020 01:19:45 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2767CC061385;
        Thu, 20 Aug 2020 22:19:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BXqZl1vTdz9sPC;
        Fri, 21 Aug 2020 15:19:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597987183;
        bh=o32BFBqd31anf9NWNPDe6O0NS4KfnUShlSJrZCWj0ro=;
        h=Date:From:To:Cc:Subject:From;
        b=hHz4GAJeGCPU3NJColRgXCILKi8sA42CJMzZ2lfjOaxPeU8tb2x92t6uQDHzP6nnS
         gCH6+rVvf0KwxjN54mL8muT8ZLDnpgx7mdamu+t/wJp5muHpcLPmABcvPjjnUIVG3M
         Dc+Wj7NFsavBF3+xcugs47mBwhHl7IbeDv6/8qJ24LzaTN/p4pUxcejdI0OmNRWrZU
         GUuZfwl5QU4jUT2REzcoXd5OLifyWHyGOkJ8ALd1hFP141BE4heJijMYSDhoYj2bS0
         TV+pP6yL0uv9sWhImuGAys7/KROaxJ1isddMw+XMvPchPnwBQ4uWFidXXXltJGsqsi
         tKzpO3i331SpA==
Date:   Fri, 21 Aug 2020 15:19:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Subject: linux-next: Signed-off-by missing for commits in the arm-soc-fixes
 tree
Message-ID: <20200821151942.6b01dbd8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/de9oguv/rmLZS0bpTmy1zyO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/de9oguv/rmLZS0bpTmy1zyO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  8d53ecfbf231 ("arm64: dts: xilinx: Align IOMMU nodename with dtschema")
  b4b6fb8de8dc ("arm64: dts: zynqmp: Add GTR transceivers")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/de9oguv/rmLZS0bpTmy1zyO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8/WW4ACgkQAVBC80lX
0Gz+WQgApkZGkP1GP1N8UHuHlhntFCJD9vHvrHrBxls9neU/Ffns10UKW2CWWVGl
bDRwytONgaLsx/GQCT7v6q+1KpCST6cm/rXinBTHSEyy+SN5UM4WjQb1l6J5z85t
FhiX4KgHz1QM1xDDs3+uQaA6mnRG70Pmbot4WOBMC2cFB+4cy1sHkbHsWGT4+gl1
Lm7CvTJLePbU7kJYu76B/LIuLBv0cvs7IaWsouZ1bvzt5GNRFRY+1JIWEEVIS1L+
NfEYep4tDpHinfsRC8Bo+E8ctcf16byjfg3fR1s51qcJBGPK5GshR2Q7/tgWavQi
5Ojs2kzsKIJ3stI/FMIIDW1cptBqgw==
=8Iuq
-----END PGP SIGNATURE-----

--Sig_/de9oguv/rmLZS0bpTmy1zyO--
