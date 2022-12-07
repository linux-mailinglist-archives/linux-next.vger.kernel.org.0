Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9656450A4
	for <lists+linux-next@lfdr.de>; Wed,  7 Dec 2022 01:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbiLGAwA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Dec 2022 19:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiLGAvz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2022 19:51:55 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FBDCF3
        for <linux-next@vger.kernel.org>; Tue,  6 Dec 2022 16:51:53 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4NRdyt0w4gz4xGR;
        Wed,  7 Dec 2022 11:51:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1670374311;
        bh=lsWTTs3oDrMyHeN1s+XnK6RbwRPvCfqWkgAvZIUkVpI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d+IJJkvycaHZ6+AmdQIe8/uxkOXD0LQO9Z28GHQQkgsgiWqzBpnxNAm6Ih0EDT/po
         ieMzsVTpEEcofIXctHAXOcmdY+yeSRuYLoLiT4x0fXlywvFeBfWIM17iYHUp2qvOE0
         Pqo1M74NWqKZQGt4NIj5ynvx3vcFDDDybsg0PmcsrAd/k35mEGRG7K6XyiU9XhYhR/
         r1hX+yJtPja/v3owLZ2pBD5+TvKwOqR8rGzDkwJr+eDNeBnuk9kz1IuEDdOcHv7hgF
         NvbW4FEfqIgUqRmbHzAR4bQ/E6k+6bqpcSpIC3MRiF+mXugMXHU/ZgPKyT9ScnJcQM
         ahU4ltMP8yF1Q==
Date:   Wed, 7 Dec 2022 11:51:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     linux-next@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Greg KH <greg@kroah.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Expected merge conflict in iio qcom,spmi-vadc.yaml
Message-ID: <20221207115149.1bba8fd3@canb.auug.org.au>
In-Reply-To: <20221206181209.zj36eezbj2irktmo@builder.lan>
References: <20221206181209.zj36eezbj2irktmo@builder.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dHxYgDq=X.iXo5YTk664ZOB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dHxYgDq=X.iXo5YTk664ZOB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

On Tue, 6 Dec 2022 12:12:09 -0600 Bjorn Andersson <andersson@kernel.org> wr=
ote:
>
> I messed up and picked an IIO DT binding change a while ago without
> synchronizing with Jonathan and we've now ended up with a failing
> dt_binding_check because of this.
>=20
> The solution for this is:
> https://lore.kernel.org/lkml/20221117121307.264550-1-krzysztof.kozlowski@=
linaro.org/
>=20
> After considering the various solutions I've picked this up as:
> 51f7be212ae6 ("dt-bindings: iio: adc: qcom,spmi-vadc: fix PM8350 define")
>=20
> This does however cause a merge conflict between the qcom- and
> iio-trees. Could you please solve this in line with Krzysztof's patch?

No worries, done.  I got the conflict when merging the char-misc tree
(Greg and Arnd added to cc).

--=20
Cheers,
Stephen Rothwell

--Sig_/dHxYgDq=X.iXo5YTk664ZOB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmOP46UACgkQAVBC80lX
0GwcRAf/Vu0g0xUdBvq7NWLYDKspUBy2twQ+LwlMKwjTOONv4138rdZUzIoggCV7
M6bHTDLwqNJ2uQc8ppHhJja+XgPkTK/pXeFtgwAzEfG3gBiNCuCM2eDeIgkExyMh
6tjQkXe0TAO+9MFSf0VxjAvRzFVYgK8e34jWT0+0cly+CjbrmKzgJvmLGL2B++Jh
qPXt1NRA56ir6OVPR/eYBUowtLHGNsRNrwdseDF0QHWAJLClUt8gcekbW1jsE1ad
vzvy5gVfic1Za5jBOLY/85AwwrcN/RT6KEfPhx1DJlD+dz3/jEy7c7FQbsDNOr9w
MnqQVFrVthbivdfh3J6eMUKH8yys6Q==
=dtud
-----END PGP SIGNATURE-----

--Sig_/dHxYgDq=X.iXo5YTk664ZOB--
