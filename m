Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38AAB280F20
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 10:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgJBIlO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 04:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgJBIlK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 04:41:10 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5834C0613E2;
        Fri,  2 Oct 2020 01:41:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C2k3j0yjdz9sSn;
        Fri,  2 Oct 2020 18:41:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601628065;
        bh=tNP2S6ioVXYX9zJ/IZt7o6EbrSsrykUZzieTLp+1aS0=;
        h=Date:From:To:Cc:Subject:From;
        b=k+RxPZV4YYIBbLK6eSMQ3jIsepfh4xn8S3arnmuryDC2g6p2IYPCLKUIajYek2kQF
         KoQhQqjPt/QJNiERT7yN1rb64XxyGvU5IEARwywQyWfOvYk0D7HWvZ03eB7wzaSNTv
         HxU2bG0yzgXt+58nbSNeH77YGEZbgSlikzcFRhUgPzxuYHWPnYmWWBMR36CPrloECm
         P7DvfzRlduHHuU53SlZfPOto5QPb8G3XDr6Rxfp4vhDoWhAdKDFv2XGpOhyrqTHVH2
         LYsVu20P0NM8BNy09Q+4bFO//pB3hv0GmmP45t191OPDa8pO5pksmZ7SwqwI8MoKuy
         1CE2uTa4yxOjg==
Date:   Fri, 2 Oct 2020 18:41:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kvm-arm tree
Message-ID: <20201002184103.657c745d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pENtMYdd6oe/ChRyAjyq4d+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pENtMYdd6oe/ChRyAjyq4d+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm-arm tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/virt/kvm/devices/vcpu.rst:70: WARNING: Malformed table.
Text in column margin in table line 2.

=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-ENODEV: PMUv3 not supported or GIC not initialized
-ENXIO:  PMUv3 not properly configured or in-kernel irqchip not
         configured as required prior to calling this attribute
-EBUSY:  PMUv3 already initialized
-EINVAL: Invalid filter range
=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Introduced by commit

  8be86a5eec04 ("KVM: arm64: Document PMU filtering API")

--=20
Cheers,
Stephen Rothwell

--Sig_/pENtMYdd6oe/ChRyAjyq4d+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl92558ACgkQAVBC80lX
0Gy0QggAnkGjmLIGUY1GRFNuBQEEu5nve5LdRAamwSE1M+O1RQZg9qqi078+Mu7U
g8rLpiw09T6J5RmvKdNXS3VMhg+Bhiqgab2OMJNQEqDf3iT9jYBC/Xse4VrIrgIE
FeM4qxvfAzRVpDAM9yVl2B2Pe4Kci5lle7DHSFtbPN9XJ+Vr30IXNL14iJRqKFwF
ke+FPfftPCV4TQFG8kjdSs0vITVqRqXK60VwkrdSnhKwG437E4AFqxZfHDwKDZR+
2v+WjBuAdjSHj9U2T+e1C7vr2+tqImEcXSDtGaipfhw1ZxnXWQnKLY6OUgKUFr3c
WZpAnUKO0bo/hgM9jLci3qddIh/yog==
=uKUi
-----END PGP SIGNATURE-----

--Sig_/pENtMYdd6oe/ChRyAjyq4d+--
