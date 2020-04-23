Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8637D1B5A92
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 13:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgDWLao (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 07:30:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:49080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727911AbgDWLao (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Apr 2020 07:30:44 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCF6620736;
        Thu, 23 Apr 2020 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587641444;
        bh=kVntl4bz6GqjD14R9UNyNixCRlF7iMAYqQts9muhbvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FPZ4IFAlEYGnZE/2x7zYn77H9Zoi2M/QcUtaWjjKgPlTx+Ai3+mPKQOgEo+Ygy3gY
         RWFH8VN7CjoRL8kmjxZAmh8EVmPKzy5jM41IvwtuFdSLvNyK02lqGxHTghZiD3gyCj
         Hh1ZMfeqUUsK0Ym/dD5iZyJIfBYgMW6exKlbhzxs=
Date:   Thu, 23 Apr 2020 12:30:41 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20200423113041.GI4808@sirena.org.uk>
References: <20200423155539.4492a0cc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fmvA4kSBHQVZhkR6"
Content-Disposition: inline
In-Reply-To: <20200423155539.4492a0cc@canb.auug.org.au>
X-Cookie: This unit... must... survive.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--fmvA4kSBHQVZhkR6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2020 at 03:55:39PM +1000, Stephen Rothwell wrote:

> Presumably caused by (one of) commits

>   fe17e6cdc0fe ("ASoC: SOF: imx8: Fix randbuild error")
>   cb0312f61c3e ("ASoC: SOF: imx: fix undefined reference issue")

> I just removed the COMPILE_TEST from SND_SOC_SOF_IMX_TOPLEVEL for today.

It looks like this is triggered by PowerPC not including
drivers/firmware - there are missing dependencies but it works for other
all*configs since the dependencies all get built in those.  It would be
helpful if PowerPC were fixed to include the firmware directory to
improve coverage.

--fmvA4kSBHQVZhkR6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6hfGAACgkQJNaLcl1U
h9DRVgf+NI0QBwmID0HLQ6+7pq2Fc9/AfxVoYoCRl8W3Ip5Y9XPBBhyiSTM7iJgM
0Js5rUODxu3T7vGrFr3LB59bmltCo1h/V1sVmm5fU8Dq4/2pj3NMk7wX4L+3s5LA
l7NvVHkvSHg/G8Zf2V1T93byMfvCjK9RLOasggn19vo9OLFocruhCLCUziv2j1jh
hwpFXBuPQW66MnijGJMMs9lVcBMur6uFyg95g2GDtdN2rmK73h4M8G0le5wE9b+f
bXlkONOLMgWOoMsyTck9Wqk5Rna8G4EiSgzUTSj4TQ/gG/UYZy1UqrrHzmAPV0ET
RxtEHPdPZ9SkbqinV2qLmuEmmPTS0w==
=LHkp
-----END PGP SIGNATURE-----

--fmvA4kSBHQVZhkR6--
