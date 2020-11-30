Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A36E2C8C4C
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 19:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbgK3SMj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 13:12:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:56310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726614AbgK3SMj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 13:12:39 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 062C320825;
        Mon, 30 Nov 2020 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606759918;
        bh=5lAgabL3lQVYHiwDxFWrdcgcAs0yLvdOKQWfVuG3FvY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A84XFrMcIuFGnhm19clmWM2J2Ukl6ukBi7vlhaRtLZBJsHE/jjUSL04FzhLS1qIta
         UQaC7NfEebhY6nkZtZSEIR+FRP7OcGhr3nEYYppi+NBtSWuOZIjP44lbWG7p41+d7i
         6Q8DH0/Z/qg/DLj6dz3jX+/yTtJKkYiCAZC+5GHQ=
Date:   Mon, 30 Nov 2020 18:11:29 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jack Yu <jack.yu@realtek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the regmap tree
Message-ID: <20201130181129.GE4756@sirena.org.uk>
References: <20201127182411.07c15471@canb.auug.org.au>
 <20201130175937.GA37431@sirena.org.uk>
 <6e2ff635-dfb0-b795-0519-9131df037150@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q8BnQc91gJZX4vDc"
Content-Disposition: inline
In-Reply-To: <6e2ff635-dfb0-b795-0519-9131df037150@linux.intel.com>
X-Cookie: Space is limited.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--Q8BnQc91gJZX4vDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 30, 2020 at 12:07:17PM -0600, Pierre-Louis Bossart wrote:
> On 11/30/20 11:59 AM, Mark Brown wrote:

> > I'll drop this, hopefully it can be re-added in future.

> We fixed this problem in October, must be a patch that wasn't merged while
> upstreaming. If you give me 2-3 hours I can send the fix.

I already pushed out the revert (but we can re-apply), and I'm also
about to send another mail about how I can't build any of the other
drivers separately which was why it was only this one that got applied
in the first case.

--Q8BnQc91gJZX4vDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/FNdEACgkQJNaLcl1U
h9DJUAf+I1acRnRzGR4eL75kmrJVevu6XKR5uFfUrTE18qDY4Gjhb3P78vVmRvwT
ZUENdG551EpL7VFs5vhgIRdZ/bpAq8pFES5K2pOdhocJXc6JQRzBQXSYCS2AzPd7
6fFvvWMqZa9XdXAq0SEdoDX3a3SFHs5petUp/fT6lN2BYvGOkIU0SZDsbGewLoeZ
QMcrsAg4XnQ6qqczvlTUHSZbnnWB9QTJ99vYW17a1jYDF94D9zv/njl431vDt8Kv
1kGC6tITj7Hns4NChcS3jCLekdh/rWbQPEP1bDzz4GTA66hQ9l/3OzJgcu2byY17
oO55BSKKl/+C1Mo4oVzGUbsf8/iZxw==
=WiWS
-----END PGP SIGNATURE-----

--Q8BnQc91gJZX4vDc--
