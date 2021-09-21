Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF85413DCB
	for <lists+linux-next@lfdr.de>; Wed, 22 Sep 2021 01:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhIUXEK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Sep 2021 19:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhIUXEK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Sep 2021 19:04:10 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28AAC061574;
        Tue, 21 Sep 2021 16:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632265357;
        bh=ymkPjnU1iq2vcqk7dsvjMfR8hRZQlMoT7JF3z1PetJU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=q56ktUbwEKYtVmowgZZW/WUQHt5kLmVk3k4QybXKPLa40XrNbQI3mVN7dhPS4ROCT
         jfPyRjzd7va+wcwvE3FwcFoTQYb6nItkhs/a9qtU5eQS5S1LPnrC/qBBwAWq/QouQQ
         p/KKNzKHxkVCgDXDjpW8Rr6jM5lccKJCiqq/vCQBNrLYWDeJZDrR01Ov24riDfgvaq
         ByodyDZy+bTNMHIc4VSuqxUPixgzcn62V/ZyOaIyvQ4QZ8+51gIhFa65EHXnVBxtGR
         un5nESsCttpo4O1acrstvVohRQubiHYz5SQYEJra5KvYSp6tgQzLDriJHhm5xOhY7h
         bHvXgrDhp5QnQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HDcQP1f3Xz9sW4;
        Wed, 22 Sep 2021 09:02:37 +1000 (AEST)
Date:   Wed, 22 Sep 2021 09:02:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <20210922090235.2a626af6@canb.auug.org.au>
In-Reply-To: <20210921082438.26550938@canb.auug.org.au>
References: <20210921082438.26550938@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jHfeLy=S=8+KO_ZFx=NbscC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jHfeLy=S=8+KO_ZFx=NbscC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 21 Sep 2021 08:24:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> In commit
>=20
>   33c4296d99ef ("arm64: dts: qcom: sc7280: fix display port phy reg prope=
rty")

This is now commit 1a5968e5b7de.

> Fixes tag
>=20
>   Fixes: 9886e8fd8438 ("arm64: dts: qcom: sc7280: Add USB related nodes")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> Maybe you meant
>=20
> Fixes: bb9efa59c665 ("arm64: dts: qcom: sc7280: Add USB related nodes")

Surely if you are going to rebase the tree anyway, you can fix this up
:-(

--=20
Cheers,
Stephen Rothwell

--Sig_/jHfeLy=S=8+KO_ZFx=NbscC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFKZIsACgkQAVBC80lX
0GzE8Qf/Wl0mNabVOQia88CpnXxTk57zeHM+DKz808bvBz6WlMdzMID+pnwxG5UV
UzN+Wq/8qBIviJEQhO2WtmqmJUaegKPQMXAaGEXSBR61NPz/pfjedo61LFOQ3Cww
tpRvpfHFsPGIsy2omWrW/ZYHCXRNqLnh8RUHIebmchJ+Bf1btJWn0RhHaKoXkh72
W6dwt7q6biHKGJOnBlPQAwvweNGRTj3kUoTocq0pdz1SQ+scNFhTQT/VySNEUWE4
exsBksiAhr6w8ZqfdeBjHvRFwxNmAwMdG/GiEkrwjUWBwK1d61HKnGjUed2rJpdZ
DJhUAgpan6oeVYJRF/GJrKgrLwRpeQ==
=jCvi
-----END PGP SIGNATURE-----

--Sig_/jHfeLy=S=8+KO_ZFx=NbscC--
