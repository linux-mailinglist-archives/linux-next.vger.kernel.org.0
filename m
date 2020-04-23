Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E051B5DBF
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 16:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgDWO07 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 10:26:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:35806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbgDWO06 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Apr 2020 10:26:58 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C034D206ED;
        Thu, 23 Apr 2020 14:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587652018;
        bh=b+ZeOpfMOAl7P9tF//IQYcI2CeTcgmG6tUypxiwjAek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EWlU3yIm0IvfzZmy5wl4C4wg5LOpBxIgb5et9xJ1j/keq315zPSg0qzR9jrup5VwF
         zlUHwacNkctwRltWVpBErLAT34eFttfvRhVBxc8gQaEzMRh4Q9v45KDWIH31zsdSaj
         uf3EHZrGbIrPZLrhWUY35Tg4vDIsIwaPLP8li/xY=
Date:   Thu, 23 Apr 2020 15:26:55 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20200423142655.GK4808@sirena.org.uk>
References: <20200423155539.4492a0cc@canb.auug.org.au>
 <20200423113041.GI4808@sirena.org.uk>
 <00f801fc-cf1c-8ea0-3d2a-0c8e902dd1f0@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pWJxWxNlJUNgDlXi"
Content-Disposition: inline
In-Reply-To: <00f801fc-cf1c-8ea0-3d2a-0c8e902dd1f0@linux.intel.com>
X-Cookie: This unit... must... survive.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--pWJxWxNlJUNgDlXi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2020 at 07:26:32AM -0500, Pierre-Louis Bossart wrote:

> We have a fix for this, I'll send it later today. There were still unmet
> dependencies and inconsistent use of select/depends.

I've already done a fix for the immediate issue which I'm about to send
out so that it's in before Stephen starts again tomorrow but obviously
better fixes on top of that would be good.

--pWJxWxNlJUNgDlXi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6hpa4ACgkQJNaLcl1U
h9DLswf+NUHW3HB0K3q2NQmq754SLSx5hReWipvqZ8n88+WdK8d8SUx80Plz/pJ2
jhJAZNHxk+4BdT7LFtz10jOe2AqAXkLYBNYk2nBzfiaD8XgjZG3ED09fQo7oH4/O
3RjQcjF8uIVITM3/oQN4G4u2V4kj3+YbL3MajhAQDx/RIJeMVCAfEIKbDj7QgCNY
tqT2tlNgo86HXgJuRqwAbUCa8mpyVYB0jGDrekev2Jaj4Uz3b1aFliy8kNuGa4Bu
Zt9sYu3c8cVwpYPgByfZmHZ+B9jpX+D2t6bOFMExkUcgBKLJvY4AB6yQgMSgfBG4
V9UJqIJ7uYLwO4T8O7fTt+3989N1OQ==
=RjQ7
-----END PGP SIGNATURE-----

--pWJxWxNlJUNgDlXi--
