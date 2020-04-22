Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0AA1B3957
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 09:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgDVHsd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 03:48:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:34746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbgDVHsb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Apr 2020 03:48:31 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A0C42070B;
        Wed, 22 Apr 2020 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587541711;
        bh=x0I5KBP+qlSUlWGHWiOS+dhq5f4tvAcCb77tNKlbUpY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lrbDGLprKUz7+PbtWm8nGsMr6BUeX2BfPzkAfdqQfAWhmzxh2xFl9UA/IHyUmHs3f
         R4d/LOWJopZft9FF6fQUyu4JaEnTQ+fbkumkjWOXpUMCKYOdTigYOEIgMWWTcZdfvE
         V/EhgdOu+agzOkCfUPGnC6r0esFeGU19+cOKdaVc=
Date:   Wed, 22 Apr 2020 08:48:28 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Daniel Baluta <daniel.baluta@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: linux-next: Fixes tags needs some work in the sound-asoc tree
Message-ID: <20200422074828.GA4898@sirena.org.uk>
References: <20200416094111.3f37623f@canb.auug.org.au>
 <CAEnQRZDb9N3jiVgHGpvv8Vn5z9LaFEymMqRCMzPUSrz8R3CXhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <CAEnQRZDb9N3jiVgHGpvv8Vn5z9LaFEymMqRCMzPUSrz8R3CXhQ@mail.gmail.com>
X-Cookie: A stitch in time saves nine.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2020 at 10:27:47AM +0300, Daniel Baluta wrote:

> Mark, how should I fix this. Should I resend the entire series?

Don't worry about this series, just try to avoid similar issues in
future.

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6f9skACgkQJNaLcl1U
h9ABTAf+IdWeF9UpvC3rMkwSWyLfDg1af5BBcGhSqEBuigBfVYWOHwG9K+baGooj
4K0JhFCDpEATME5d4q15gm1FkP1K1RBxIdpRvQrnzBoDPT6u8b4/Tdlb+APygt75
nWgB5nU4id6siJQ2+ZJEbGHQ6o8gqSZGhIqv8LYjaXCZDr4zlK3J9xSNawBfxZVK
LUCz+BHAa2VqDBoJsnhhh74wriz2BRS9JnYAXfV2Ww8Wu2WoObSj+zSV3HjsXN4w
j9iRQobc1SFG8F2KzBZ6Xdu0cPi6Ut2TSmxRNgcmmVTkykxsy3aJHVz6q3Sb6edL
N9fx5QdlvzCL4La0v8Q/fX6vDZIzkQ==
=sHKE
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
