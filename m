Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4EC4412D39
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 05:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbhIUDQB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 23:16:01 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50825 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229973AbhIUCcF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Sep 2021 22:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632191435;
        bh=vTQXciGMsRDBZPI3BtUp0IkecWENffXTdzLmGGjwXEY=;
        h=Date:From:To:Cc:Subject:From;
        b=fAVuU1PJi5/E6E2oL4KQgp/Ason8H5fS60aStrxWBBbRJcjnrlVu580PUxZWFgye2
         PIOc96sKhQgGWcO5B0C2qYeCTSkpXAIVHEaEHInlVYZbXoOpEBQ3H6BfvCVqSxjtCO
         JGFeuL7pe4vP5xq2yCZCj6eJnnngKgvJvzgYSmzyj2tlLNJ35KtPjUrYxlNAzULH2H
         /azRWXoaG59ZAmTNKBqELEC7lNzvgH82XzGYQve/5S4st0Ylyig4uPgugR/r1SpsnC
         y1GNzpHVHYxTSy7PS+CopyPmyVZxVcCF2wtHj8MK3yDRQ7Godiu9GYY8qLzASouaU2
         po//ol4w2Am5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HD54n4QRQz9sW5;
        Tue, 21 Sep 2021 12:30:33 +1000 (AEST)
Date:   Tue, 21 Sep 2021 12:30:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Andy Gross <agross@kernel.org>
Cc:     Baruch Siach <baruch@tkos.co.il>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the usb tree with the qcom tree
Message-ID: <20210921123032.02cd498b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a01qS2U2KELLuIltukzra2.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a01qS2U2KELLuIltukzra2.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  arch/arm64/boot/dts/qcom/ipq6018.dtsi

between commit:

  261e8a95d9aa ("arm64: dts: qcom: ipq6018: add usb3 DT description")

from the qcom tree and commit:

  9da2c3f76164 ("arm64: qcom: ipq6018: add usb3 DT description")

from the usb tree.

Same author, same date, but the former has this committer comment:

bjorn: Changed dwc3 node name to usb, per binding

So I used that version.

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/a01qS2U2KELLuIltukzra2.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFJQ8gACgkQAVBC80lX
0GwsbAf/VxEFKaQYvUE4SCGt/iMkHoiyBRMCeoGLRHDqs5kxqbziyAmvYvwUwbL1
+PzFSDZ11YoLEsQ4G0DAv4G5wgvtYg7UUtXMt4NLykz5frQ3b72dYqin1ZdcuZI7
rFdx+7EtSl917uon2trZE/cFMGYuFNuCL7CSUxF4tpz2TUu0qxjD48TnRkZca8nm
xv7Uv1TZ1Zkb6Cuy16KocqYqQJKOkXgmnfaIRjlLNc2rg+Av3UiGH5Pm9hPv8RvB
vDo4LnjOihNc1LhY8uzRhHfvIuGIQEE9MhgLLlWAJmZMN9Rrhq5dec2VSMdfPmfA
/x7e9MrZGsrkuOWvJqmBnbC96JDNfA==
=Vymu
-----END PGP SIGNATURE-----

--Sig_/a01qS2U2KELLuIltukzra2.--
