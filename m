Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317BC43583D
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 03:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbhJUBb1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 21:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhJUBb1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Oct 2021 21:31:27 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CB7C06161C;
        Wed, 20 Oct 2021 18:29:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZVJ61kzWz4xbL;
        Thu, 21 Oct 2021 12:29:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634779750;
        bh=6kdKUtppb6ffxiViUEsS1ZchJpylMBfk+uPH/K941Wk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ka7WIFL5KqsYQCCIqr0aYRT2FlQ3PlaYKNRx3pWa2S55ZdL/b+JG6rGxwvrcuRu9Y
         IEJUV/JznHu3nDgW4FKbQf4fGWw2PLNueZK35/qRQ5BRvU07nb5/sYCzI2RnEFv09e
         W9Sy0/peVp8CYoNVMNvt5H6Gmapgyt606KescZgPjX830pOzKSIvfXbkjA2VrDM2th
         PXgUX7dBExjZ+b2n/yMRH/KfukO89cCo7uT+KRIeeovmRmx0swa4CeQq+IHE7h3pAQ
         G2XLxMHKclUiNgTzW4UfbsfhxVM8dPea+DtWB2X73AHr7Ltq/OXThQFjSSXkmFSTiH
         L1UZTwR3U3img==
Date:   Thu, 21 Oct 2021 12:29:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the fscache tree
Message-ID: <20211021122909.0346c093@canb.auug.org.au>
In-Reply-To: <20211005204613.53cbdfb9@canb.auug.org.au>
References: <20211005204613.53cbdfb9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2FEpR+.SrjCb+FxpUQ0aD1i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2FEpR+.SrjCb+FxpUQ0aD1i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 5 Oct 2021 20:46:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the fscache tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/filesystems/caching/backend-api.rst:402: WARNING: Inline em=
phasis start-string without end-string.
>=20
> Introduced by commit
>=20
>   9c74b32d892e ("fscache: Update the documentation to reflect I/O API cha=
nges")

I am still seeing this warning.
--=20
Cheers,
Stephen Rothwell

--Sig_/2FEpR+.SrjCb+FxpUQ0aD1i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFwwmUACgkQAVBC80lX
0Gyk3wgAhJ/0wMVJGxLH6qZQDYLQ9fmuySPIhpxQJj7IK8FYTvmra/2B7hsGp0gE
IY3Ww1Xd/4lJ+yiphydAHTdgC3gTqpS3M4GHWgsFOKJbsntN6yQrGfm8/JZTZ1x+
Om9UV5ACrWyN9c721EFA5BIViHOfUUrXJ+Zr2s1Vch6r8/BMgqQvM0tTRQxhr1Co
loRfVW3jZAeo7f9ZZApEXAXN7f+9NhWs7bNidaSmjQDRlCF8XhTpkyE25XfPp0i/
7yCA4JKOrffQw4r0VRBzcTmexDcaOpzpdRJNYuFzi4cq2/Ru5B3eFT24lSf6aLmt
yeH2MWMrUZKeM3C6tmZtiBHBt3pluQ==
=ylo1
-----END PGP SIGNATURE-----

--Sig_/2FEpR+.SrjCb+FxpUQ0aD1i--
