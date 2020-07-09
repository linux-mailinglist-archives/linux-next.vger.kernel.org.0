Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 544C6219E0E
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 12:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgGIKjb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jul 2020 06:39:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:55404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbgGIKjb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Jul 2020 06:39:31 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B89C206DF;
        Thu,  9 Jul 2020 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594291170;
        bh=doH4/ienxKWo60sc7CSLY3f/jEyMqok61EP5wH9E/6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bYSy0rVzEnjYRPhhtZL3iWjYIjNe909qVX5/Kx3qxoG3tY0rGf0qm/Cn1GRrBwWiP
         a0t0uLd7xf5rRq7mkCkM40/yJyFGU1cgYluOFIzM25uXDXRznaNQmdgzBPpx7Lr8bv
         eTVMn+yKwJQ6O9h4+e0aCc0rQLGZT0+w7DVfotzg=
Date:   Thu, 9 Jul 2020 11:39:25 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Peng Fan <fanpeng@loongson.cn>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Re: linux-next: build warning after merge of the spi tree
Message-ID: <20200709103925.GB4960@sirena.org.uk>
References: <20200709141054.1b65be9d@canb.auug.org.au>
 <31ee871f.3cd.173320cfdfe.Coremail.fanpeng@loongson.cn>
 <7376c15b.48e.173328e36ab.Coremail.fanpeng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline
In-Reply-To: <7376c15b.48e.173328e36ab.Coremail.fanpeng@loongson.cn>
X-Cookie: You will be married within a year.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2020 at 03:50:47PM +0800, Peng Fan wrote:
> Hi, Browm, Stephen
>     Firstly, feel sorry for the problem introduced by me. I think I must =
modify my bad,but should I send another patch to delete the label "out_free=
" or=20
> re-send patch of v2(which maybe need to go back)?
>     Could you give me some advices? Sorry again.

You should send a patch on top of what's already applied but actually
Colin Ian King sent a patch for this already which I can use so no need
to do anything, thanks for staying on top of of this though.

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8G89wACgkQJNaLcl1U
h9ABjAf/cTOGCHIMImtXtt+qBaohJmn6wW2EKyp7x7HMhxQk7/1sHRCs0hh/p2xn
NCCHOU0K+aRainT/SbFh9/fSvAtiymoOgSB7eeCbwwSFiyuuxB0M/UCSzcmjUDc3
Rf8Gu7ma8AY+KKcmJZfeX9VbQklvTIOMGXBYI20hHGtLsLGYKO2vRSwG++DpPLdd
7KLcaLxkJpky1RxCQgzFY3DeVPmGDhi0aOzOTyBBr5FybBw1nMoe3tv66RnNFpXw
bKkU/xEyEboD+PuHbCSN6A8smzFvZrsmgTbJxeWgQTGUZACOIDirwgOv8C7F73cq
Wnjwx+QEA9cqLDTi60OeDEDeF2AnCA==
=qt78
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
