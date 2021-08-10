Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4E33E5877
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 12:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239715AbhHJKjZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 06:39:25 -0400
Received: from ozlabs.org ([203.11.71.1]:47307 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238566AbhHJKjY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Aug 2021 06:39:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkTvl6nRZz9sRR;
        Tue, 10 Aug 2021 20:38:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628591941;
        bh=OKNXIzmcYrF54+bosmBPNPHgC8NwZvVHFBlRYj/dh38=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J+X0xroDxqKg3xDnsy38f5bl0Ve8+fHDpJfvh4TT//HO4xJnvT1hSlO/KFHlKOv9f
         keOEc+duSUqjVxEsut9mu1+/93P5KrS6d/R4RjrZUoMfHyXTClsv3HXt6naJLcml4D
         cW/YX0B8YUFyW/R07xRDSYFjaZmfxqilAbURXz+GejMjNEIPJwJR118+a0g2V6ZaGy
         3Mzb3azdF5+mpjnvmxtDXDs4V3iv749vvzIf1qxJTdxiXUYmA6mZpamP5wXgXp6PEH
         MQ7GCYcqMA572/YZrNtow4QoyyFDKklLy0LUffIr7stlOFC5KK7rw7T6TLHEVKhiY7
         eVW2Y0HwGXOWQ==
Date:   Tue, 10 Aug 2021 20:38:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Matthew Auld <matthew.auld@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20210810203859.128649fc@canb.auug.org.au>
In-Reply-To: <YRJRju/zo5YiF1EB@phenom.ffwll.local>
References: <20210603193242.1ce99344@canb.auug.org.au>
        <20210708122048.534c1c4d@canb.auug.org.au>
        <20210810192636.625220ae@canb.auug.org.au>
        <YRJRju/zo5YiF1EB@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/usJBfb3Y017NmDTWcQ5uJhD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/usJBfb3Y017NmDTWcQ5uJhD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 10 Aug 2021 12:14:38 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Matt Auld is on vacation, and the other issue is that the tree where this
> is from isn't in linux-next. So will take a bit to get sorted in
> linux-next.

Those warnings are now coming from Linus' tree (some time before
v5.14-rc1).  I first mentioned them on June 3.

--=20
Cheers,
Stephen Rothwell

--Sig_/usJBfb3Y017NmDTWcQ5uJhD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESV0MACgkQAVBC80lX
0GyfEAf/Q2pNtOXTIOduaAF7h395rNfz/1gJIcoQ1ybzGx3HTY/Saw4sf2TnncYM
RmbpdGyQL2clpgIAvCDwuhbXKUIDSIPfqNz29SRDgHjhKW5hoHa+aSTVzdaoAv9+
GQkn0ydHmMD5xR1aQZOm8M5YZPE87l8nPIodJElg0x7hxYcXAGFBY8B7F/e6NYL9
TRY2LCvwpcxQ2VGBOd4b3XnZUyhqvl28qLObMw+ROxHdy+jzTjromrpi27jjju7N
zExsHEeACJ/TwU3P03s/zKpbBcJAqfAJar06w4KkCeMD8OSm/2IndOb3INnEu3+J
e0zWbelIk+JfHlFy7Lb1VSUOqYZsfQ==
=4z7z
-----END PGP SIGNATURE-----

--Sig_/usJBfb3Y017NmDTWcQ5uJhD--
