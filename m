Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A37FED3673
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2019 02:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbfJKAms (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Oct 2019 20:42:48 -0400
Received: from ozlabs.org ([203.11.71.1]:39285 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727100AbfJKAms (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Oct 2019 20:42:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46q8LZ0hzdz9s7T;
        Fri, 11 Oct 2019 11:42:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570754566;
        bh=dkzjFR/N5K4XEgE9wFHZA5r08sFqU7VT7q7H4BUqapA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MK2ms4+g5Wu7kjY6H2dAKDxlsOqph6SmdFeNSnP4AEU5Kxr+2AdGWPs3iJmpfzZ0W
         rSFf80HNK628NTGAe48FFclovNLw+dAg+UVk107fxqFlgvtk5pID5oHNbolkrQLV8c
         G7L2i7VInu2TtklM7ejliho1FzUJUz0fGFlvpmVghdLMqaN6tjX/SNQ+X3uqu4wd6B
         FkzTkSQ5zLdIkIDviidBwva8ktgB+plgcZ8OWhcoFSdCYmL6p193C5piTBdTydJ8Ve
         1g16nBQYn+Zl9CXBVaH+hfFL66heACZHZfOa9/b8ACg0ls44bEYc2JEctEaGvVGQ4p
         CjydHfcjgSblA==
Date:   Fri, 11 Oct 2019 11:42:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20191011114244.07cf0118@canb.auug.org.au>
In-Reply-To: <9d421f2b-04f5-44dc-8a00-981b2ff09b5d@acm.org>
References: <20191008071620.5799d02a@canb.auug.org.au>
        <9d421f2b-04f5-44dc-8a00-981b2ff09b5d@acm.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a727jC+1_RbUnNp=+ZbQ3QW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a727jC+1_RbUnNp=+ZbQ3QW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bart,

On Thu, 10 Oct 2019 10:36:36 -0700 Bart Van Assche <bvanassche@acm.org> wro=
te:
>
> On 10/7/19 1:16 PM, Stephen Rothwell wrote:
> >=20
> >    Fixes: e34cbd307477 ("blk-wbt: add general throttling mechanism"; v4=
.10).
>=20
> The above fixes tag follows the recommended format except that it is=20
> followed by a kernel version number. Is there a recommended format for=20
> embedding the kernel version number in a Fixes: tag? I think that=20
> information is useful. I haven't found any recommendations for how to do=
=20
> that in Documentation/process/submitting-patches.rst.

I have not seen any recommended way to do that, but there is no
necessity to embed the version as it can easily be derived:

$ git describe --contains e34cbd307477
v4.10-rc1~153^2~94

--=20
Cheers,
Stephen Rothwell

--Sig_/a727jC+1_RbUnNp=+ZbQ3QW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2f0AQACgkQAVBC80lX
0GyRTAf/ZoZHsO4lfNEoanlXWmo1FHoJ5FdZ+YKLkBMd9VpQV3iKWX5H2vpx9Aw0
FcTAbjCnG9UfRC/xRY7ovZgDdP1qhZ4JVKtWfEq5/Ld+ykBlLP630xH/wzJkAe4R
oh58T3s+/Dr8KKYIguZoYKe9oznoEC6akOf8KOXAmGd7qttixs00sIGc7xRSKfh5
GI+gVrUpxNLq7V2KgVbkIWWZgCrUakxWjdQuB51dOkBWYvkaSxvU7FSufZuXpvnd
Nt/nYHWQG1JZtaqMvQvcnApE/f1oZ7lfv7Q6IBci+h645dWK0Ymb4lzcQoCYUD4H
++v0Kj9/xdt7jaNHYo2PZmirJkyURQ==
=wf+w
-----END PGP SIGNATURE-----

--Sig_/a727jC+1_RbUnNp=+ZbQ3QW--
