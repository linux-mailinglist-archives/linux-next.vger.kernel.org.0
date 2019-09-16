Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D43F4B3B95
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 15:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387580AbfIPNmK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 09:42:10 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:53238 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733054AbfIPNmK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 09:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=IhSYkleqI3JelFkIKmOLyDJ/rhb1T44sCZeTh4GOur0=; b=PfwKJr4TkGavs+jIV2Jgj/gIM
        eK9Ws2URbDzqZisVOhvBDpQri9UXhfIkby2tyCHeDNYevg+xRGlvNZ2Vfc/8iYgwYX5bcmgBwyiNd
        e7YhAYOxLULgDOSHlDg3fK5KHVrZiy0ooz07jF63eb0caakUKaWTNJ0dlTXsJ1Bg8/GYs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9rGW-0004bj-7j; Mon, 16 Sep 2019 13:42:04 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id BC1382741A0D; Mon, 16 Sep 2019 14:42:03 +0100 (BST)
Date:   Mon, 16 Sep 2019 14:42:03 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     Shuah Khan <shuah@kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Petr Vorel <pvorel@suse.cz>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kselftest tree with the tpmdd
 tree
Message-ID: <20190916134203.GG4352@sirena.co.uk>
References: <20190916014535.GU4352@sirena.co.uk>
 <CADYN=9JntrniMnmEMd9igVSovEQjLV9q006cCATLHWrtBhWWHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HbTzC+AcCowV2D6d"
Content-Disposition: inline
In-Reply-To: <CADYN=9JntrniMnmEMd9igVSovEQjLV9q006cCATLHWrtBhWWHQ@mail.gmail.com>
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--HbTzC+AcCowV2D6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 16, 2019 at 03:16:54PM +0200, Anders Roxell wrote:

> If I re-read the Documentation/dev-tools/kselftest.rst
> I think the patch from the kselftest tree should be dropped.

> I saw that I didn't send an email to the tpm maintainers or the tpm
> list when I sent the
> patch, I'm sorry.

If the change is fine that might be more trouble than it's worth, it's a
trivial add/add conflict.  Up to those concerned though.

--HbTzC+AcCowV2D6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1/kSoACgkQJNaLcl1U
h9B42Af9FCeFLU3AJ1eD9eMVeqJVdwEFFP6AMPXnrfkLGRi36tX7E4nEagJBDFOk
fahF8r2zcT2wSU5xo8ROJJw5EhJr8Wh4DNgMWj+BqSSOi5mBTEG4AKe/MkhysJyN
6WowFdahrSXF6FxnBgoCsInDEhpnvMo6Nf6QbB82itwoAEUFAld6x2U4d2JG4JUr
Ah60Yszt+tniC4OOqs9BzBHYRTb+HyKqK+INJSvrEUBlJC0VBcBC0chdces5e32n
gC5fDqUOc+n6sXyakTUtDoUmeHV82C3HZYK+X9HiTHoyljvbBhxZMkE6igj40nZx
9bV0rHfHCQG8ZdeN8T/1tvLjLHsW0Q==
=RS2A
-----END PGP SIGNATURE-----

--HbTzC+AcCowV2D6d--
