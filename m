Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB27413E85
	for <lists+linux-next@lfdr.de>; Wed, 22 Sep 2021 02:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhIVAQ5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Sep 2021 20:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbhIVAQ4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Sep 2021 20:16:56 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E0BC061574;
        Tue, 21 Sep 2021 17:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632269721;
        bh=VJMb1VlHdkDDANH+KFH3QbakZVz7f2s1AwxXpDbSDdM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mO8kyIm4zFC7GypUfFHc//0yrbGJWpe40oIwXDM2ldvLwXGBjvY2TFis1IamtCKCA
         1erLOazZeQvlnbbMPREmYBRF+6/6i+qUbSK9ElWTb5meuNhuVpZDldPlRFPb1UETYh
         jxwx7FdlfRi11tK5rkBKp5B9MwGCEW+2ySzQOq4MD7zdSZ5ri6Asx3cBU365pf45Zt
         20lIsYd2N9BM1z2zivj9FEDwF7ZmilUPaIpI9qbJH81WfuDX0Ez1J/SdCXy+eR2JGK
         jexm5rgV+xufRLbecHGK0ncTiSyUmg+lHoPS9wPMeWOpiVlN+5FduzGqZJRMMesWs/
         pn+Pceasm6zgQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HDf2K40zfz9sW4;
        Wed, 22 Sep 2021 10:15:21 +1000 (AEST)
Date:   Wed, 22 Sep 2021 10:15:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <20210922101520.14de5b4f@canb.auug.org.au>
In-Reply-To: <YUprWiZNgPt2YEUl@ripper>
References: <20210921082438.26550938@canb.auug.org.au>
        <20210922090235.2a626af6@canb.auug.org.au>
        <YUprWiZNgPt2YEUl@ripper>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HhwUSNoUM27L3rO=9j0Gh1g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HhwUSNoUM27L3rO=9j0Gh1g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

On Tue, 21 Sep 2021 16:31:38 -0700 Bjorn Andersson <bjorn.andersson@linaro.=
org> wrote:
>
> I should have double checked this before pushing out the rebased branch,
> but it looks okay to me (and checkpatch) now.

Thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/HhwUSNoUM27L3rO=9j0Gh1g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFKdZgACgkQAVBC80lX
0GwIugf9EWAi+4vxuT9wHF6zRJ41spMajq7W8Or80KCEgK6FHVFt/pjPCJFnVIku
jboCApK/ELaEnyLf/XuFSDYBzgkLuIkZ6LhEsoJnz5TL8ueaS2SaeuBolR+Bgpej
mm/6vnG4OKG0qSNARtJTjFhR3I+QrJzPAkJ8WZBy05Sy7eWiNxPdUPd386IrTuLA
WRKQ4l8qhFHNphJw+sIwqYFDwR6PD2LVBRAFUmosxwqiZeSAJ7yoWaGiwQfY3nrI
qAZ5QFFVwHi04pzffx3qRLonJZKuDFrXCsHkeVZb7OUGd/d++GAzs6sPtm+ri/BX
yYpq8sEkUYzoDYV1X6vOXQMavE+QJg==
=sOyk
-----END PGP SIGNATURE-----

--Sig_/HhwUSNoUM27L3rO=9j0Gh1g--
