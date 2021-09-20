Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5326B412BA7
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 04:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348584AbhIUCXp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 22:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236554AbhIUBvB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Sep 2021 21:51:01 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0572C0A0E3A;
        Mon, 20 Sep 2021 15:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632176679;
        bh=XMUqjWgyGQ2e3tTXYtDEQwx/3FIE578ukRsWrFJY3IA=;
        h=Date:From:To:Cc:Subject:From;
        b=fgCheR8kjiJ/ovOKEoyp0dJV2otwj7CGmx/u5tIwZT/JfuQMdL0GmNVIC18/22hBL
         DKP3FDjTp39h8OPuks1FSJlR4NwzTmjkURdf7jgwhMDN9BLMlueUtHySXcjsgBsi3X
         It3eZtPQsxN6t6+KDD7GzR3nCJDAYB5mz2AZUi2mTHEl6MsO+FVe7b6eMbTmgJiG6k
         LB3R1iGfK5l0U7ol3MJF9cwjvArxinhts8XfsIaEIk1iSOzqvQUKM+/jYqklSOqYFw
         K+l2y94pFc+16MtBacZ7OdAnA8km4+m9tsTe9m6n5UPDuVaKphiznGrup7QnIu/Y2Q
         2zd/u9LfJkJog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCzd33zlCz9sW5;
        Tue, 21 Sep 2021 08:24:39 +1000 (AEST)
Date:   Tue, 21 Sep 2021 08:24:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <20210921082438.26550938@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AanEt6iy8KMgYdUCkz1EGpR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AanEt6iy8KMgYdUCkz1EGpR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  33c4296d99ef ("arm64: dts: qcom: sc7280: fix display port phy reg propert=
y")

Fixes tag

  Fixes: 9886e8fd8438 ("arm64: dts: qcom: sc7280: Add USB related nodes")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: bb9efa59c665 ("arm64: dts: qcom: sc7280: Add USB related nodes")

--=20
Cheers,
Stephen Rothwell

--Sig_/AanEt6iy8KMgYdUCkz1EGpR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFJCiYACgkQAVBC80lX
0GzTEgf9GMpA6/0oLEANjaTycMU/csnakl/92kqrbrZ07RKE8NSkxtemAzRZ3l1F
W/NQicO4tH3wEqTCeiYsL62VIjTDKUc0JPkZCH6bIdy2BTi/FkHZTuN206MgJxI6
NHDUCgDu9BA+84GxlLzLrFDLPMtf6mOCz1srvuRhkuaK/IhonBCl8HEvJ4TXlYxF
E5AScGbHh/DQEEcoxCGY7GTqu6gJrxtylWYaaY6SK+uMYH4CTWByOBgTOAKGctuS
Ugf7SEStl6qRvsKa60CMu6OqtObZwTVar1sVQ6CfT906wV0DHHll6L/ukpkYqCQ9
O/p9v+CUVhM5QW3Qf/jCFyjaDAAMtg==
=8y5T
-----END PGP SIGNATURE-----

--Sig_/AanEt6iy8KMgYdUCkz1EGpR--
