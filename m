Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1787E1BB9FE
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 11:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgD1JiR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 05:38:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:51738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727052AbgD1JiO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 05:38:14 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD400206C0;
        Tue, 28 Apr 2020 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588066694;
        bh=Twljy6kTtrMgFpCh7Qv6jtXx2wKv16hS05/wrUPUnGY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P7F9NnzFI4hDD5ttYp3IkD0Whph4DYR0Xh0GC+isX8gDGS6aLP0+r9CU9Rtc/KSs7
         ZwbPke9I+V8bmLmxWnUoP+S9o3t3M05/w5FFQCgv/M5Ubx9P6X6X/r6AARSe49xkiN
         HkO996lBToKh0cLpsoLODaVKswRBRuymcnUlrm6E=
Date:   Tue, 28 Apr 2020 10:38:11 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: Re: linux-next: build warning after merge of the spi tree
Message-ID: <20200428093811.GA5677@sirena.org.uk>
References: <20200428141611.0ed0969a@canb.auug.org.au>
 <2b6a132c-8659-d2ed-917e-09aef47aeac3@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <2b6a132c-8659-d2ed-917e-09aef47aeac3@amd.com>
X-Cookie: Eschew obfuscation.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2020 at 10:31:56AM +0530, Sanjay R Mehta wrote:
> Hi Stephen,
>=20
> I have just sent a fixup patch for this. Could it still reach 5.8?

Yes, it'll be fine - thanks for sending the fix.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6n+X8ACgkQJNaLcl1U
h9CPVwf/akusipJdGODVVZUKosXnjJDGuM9skyUXNpaVoDcTgEtA4UlThjSV9JeD
Br74NFKS8CbvzRhT2M6lDJpya+LVLEnxOsBq3Mgvkh0u914lAZu8jFFTFsx3X4dq
Mv0h5JW/mJ3yeh9/MvwEyPsgkT7naPLtNUSuzUTMEG9Pg4ZnEHa9nDdaZdCZHQg6
aD8VUNnN+e3Lp4s6LRy/+8Npwdq5JOy2rcJNHXQyRhMoAtdrgO66ZppDYxTZBtgk
VO5cPPWRItpx0j86fTtr47bQAMZbdAHF6s+85715rtbgtxgDlgvs9kuj3+NdCuzo
zcnhjiWhQ+R92O4dtjF3gJpDhuhMpw==
=G1j5
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
