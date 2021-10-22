Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87367437742
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 14:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhJVMmc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Oct 2021 08:42:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:40942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231406AbhJVMmb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Oct 2021 08:42:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8FC06109E;
        Fri, 22 Oct 2021 12:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634906414;
        bh=2Z+o2+30mNg914LIaZtsCZnmUOKwHnVi9WzJ8Xa43Qs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WesYg691D+Y6BorwKUaX8QUZqofulZNzQw4S5xUS/KLKYC6rhVMmPw+l57nMBOvW9
         1ZVVOklCdsJiuiXBPHO8R9YyS8NHbjfpRKKzxW/wKe6NoDthhQaQFdNFG4pgkgNxYD
         PMR5dQbBiVD1fITCwvWRBlkf9eYFcqg7vcZzTY0dnMvoL4zrRILjf/JmfngAZkvbLU
         jDiTe/ilpCl+asp7gpiJ70FFq7RGPEN1bq3ONrmZ8CaK4ObsM4yUgNTVn3IX5aQhxN
         0LvqXvcsrG+PIiKbwatpkdSptELJrLbXP0R5xEM8p6mGWLmvd9h8h3K8uovhdrRurd
         iiRIYJyyFYxpw==
Date:   Fri, 22 Oct 2021 13:40:11 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Alistair <alistair@alistair23.me>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Message-ID: <YXKxKwje0evUT0hT@sirena.org.uk>
References: <20211022125323.132b950d@canb.auug.org.au>
 <bd49c44d-372e-453a-ac8e-04252b2eaba8@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="evsjRRr4aa0EOz7i"
Content-Disposition: inline
In-Reply-To: <bd49c44d-372e-453a-ac8e-04252b2eaba8@www.fastmail.com>
X-Cookie: I program, therefore I am.
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--evsjRRr4aa0EOz7i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 22, 2021 at 08:31:08PM +1000, Alistair wrote:

> This patch should probably not be applied until after:

> mfd: simple-mfd-i2c: Enable support for the silergy,sy7636a

> Or if preferred I can split adding the header file into it's own patch that can be
> applied.

Let's just add the dependency back until the MFD gets sorted out :/

--evsjRRr4aa0EOz7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFysSoACgkQJNaLcl1U
h9BIyAf5AeI7eKpfm5YR6DUHxK5x/vTOrdsDeathntLOJ4qdFQ4l7bAXi5aoAGvO
0mvmHdnokL64E37uYYG9NhDiMlDPCzgukEP2O4XCsNm9O69B3/5gNIuxP7O+GFPp
qvcw/kIehzWC7q44DPPHtGewDQUACEqMFBgF6CukJ6QhdNLfg2EswNkVRSWp3o03
bB8Twh4FE4k2R4Zoes9bmA2PSwPNSjD63GHBhNaXZshnK9P2gQFEm5OYZ2JQJ5Gs
9g+4jI1uLoKKPcm2zl06D6MlUEXGjqJ2GQg/M0Nh3dwlJRjLqQbZucelv2nlIqNK
yrGVcEGI+SJu0SeNhBg9pAFniUcjGA==
=TxHw
-----END PGP SIGNATURE-----

--evsjRRr4aa0EOz7i--
