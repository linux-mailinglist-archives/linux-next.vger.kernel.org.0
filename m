Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85147366564
	for <lists+linux-next@lfdr.de>; Wed, 21 Apr 2021 08:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234077AbhDUG1B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 02:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235104AbhDUG07 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Apr 2021 02:26:59 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6482CC06174A;
        Tue, 20 Apr 2021 23:26:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQ9YW2kL2z9sxS;
        Wed, 21 Apr 2021 16:26:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618986383;
        bh=ZBwFvc/PjAcb9mm54KHc6/+09qjW4Rn5ZchFLh3BRGQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=h9rm8EPBJvr+9kd60RiwMgswxwWV7o2tr+a0GW6071wyNc2Qo5eyqhSvChV4EnbZQ
         OqldTKG1LpxBAJRJcmq04VFbcu7BkDGD46Qe6lGbO7v1BDBzCiAtBusdgdUiYNR7/X
         01DXx61xH+8xmlTSb4lrJzqAxjiw0QAEJcSH7O7GLrnvOjbBGG02U5Wo2fCFNkmxBC
         NF1EajZeSKLwCC0lCd1S1o5V9SAJzREDxPiXgM52gkZ1TlWD+9OtxJGtF4Wkv5YsWp
         0ECMgLh+nH4zn364VOsKJo6yh5YWvr2F/Q2lJvMK+j22pn8cZVxYgWIsiRcEeuk2YT
         +UpViReFlWb8w==
Date:   Wed, 21 Apr 2021 16:26:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Frank Rowand <frank.rowand@sony.com>,
        Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the overlayfs tree
Message-ID: <20210421162622.0c686883@canb.auug.org.au>
In-Reply-To: <20210329201426.78d4b28b@canb.auug.org.au>
References: <20210329201426.78d4b28b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VhZwGT.t=4=p=H0AfLBs4U5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VhZwGT.t=4=p=H0AfLBs4U5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 29 Mar 2021 20:14:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the overlayfs tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/devicetree/kernel-api:56: /home/sfr/next/next/drivers/of/ov=
erlay.c:1184: WARNING: Inline emphasis start-string without end-string.
>=20
> Introduced by commit
>=20
>   24789c5ce5a3 ("of: overlay: detect cases where device tree may become c=
orrupt")
>=20
> Probably exposed by commit
>=20
>   8c8239c2c1fb ("of: Add missing 'Return' section in kerneldoc comments")

I am still seeing this warning (as of next-20210420).
--=20
Cheers,
Stephen Rothwell

--Sig_/VhZwGT.t=4=p=H0AfLBs4U5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB/xY4ACgkQAVBC80lX
0GwMMAgAgZ3P0YnEFEOi1m54jac24cbmRjmcvM181N24ChFeoGfuF6Zrvc7KEh7v
STUc2DPiuALZExKZfb0KL+ZNL9Z6Z4wPajWtKfZLgakd3BsRyQoFVrr73k2VYB9f
BNgOw+OHvhZ/k15F8afN5JKBLUXrPcQCargBJjiOIIgXWAzruhLrZnOXCrjk7VDT
AvMALmAVpGUiFxuJO/3lHDAvg69XylwZj/vZzO7671SWwL5VzlKUTnARW0fL3N8z
23VJW/C21MsqD6eYcFn6BeZx8ctlplp6REorSdk26trqbbXQKgEo0DFsZVQSCaaL
oRmo77YsFdV0TEviStPVmJ4yHcJdzA==
=Up1y
-----END PGP SIGNATURE-----

--Sig_/VhZwGT.t=4=p=H0AfLBs4U5--
