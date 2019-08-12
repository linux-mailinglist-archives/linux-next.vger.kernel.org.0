Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B93688A435
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 19:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfHLRZF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 13:25:05 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45694 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbfHLRZF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Aug 2019 13:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=K05134folpIhTvdy8yN5MTqWIVVYHepWQ1nOE7KUEpY=; b=a4f8i+ZycT1x2Z+xEbYSKQ43c
        TXqQGbSJcw+UP76/MIGUOvK0Ny9qiCQSZx9Pw+FpWbTg0Eju2Z9DcFJJsPnWxrfE1NM7rcXp+1k8u
        HVaIpIGV4pAMOXejtGdN1Z9uqOJfnK1Ux69LCSHtGcjiQ5CZSYCZHJB0U4sYXiXfAWnog=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hxE44-0002Pz-0r; Mon, 12 Aug 2019 17:25:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 06FE02740CBD; Mon, 12 Aug 2019 18:24:58 +0100 (BST)
Date:   Mon, 12 Aug 2019 18:24:58 +0100
From:   Mark Brown <broonie@kernel.org>
To:     khilman@baylibre.com, Heiko Stuebner <heiko@sntech.de>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        linux-rockchip@vger.kernel.org
Subject: Re: next/master boot: 285 boots: 16 failed, 264 passed with 3
 offline, 1 untried/unknown, 1 conflict (next-20190718)
Message-ID: <20190812172458.GM4592@sirena.co.uk>
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com>
 <20190718162005.GF5761@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C01fF7hLGvN0zd9s"
Content-Disposition: inline
In-Reply-To: <20190718162005.GF5761@sirena.org.uk>
X-Cookie: Decaffeinated coffee?  Just Say No.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--C01fF7hLGvN0zd9s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2019 at 05:20:05PM +0100, Mark Brown wrote:
> On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:

> Today's -next started failing to boot defconfig on rk3399-firefly:

> [   87.491881] cpufreq: __target_index: Failed to change cpu frequency: -=
22
> [   87.495335] ------------[ cut here ]------------
> [   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
> [   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP

> I'm struggling to see anything relevant in the diff from yesterday, the
> unlisted frequency warnings were there in the logs yesterday but no oops
> and I'm not seeing any changes in cpufreq, clk or anything relevant
> looking.

> Full bootlog and other info can be found here:
>=20
> 	https://kernelci.org/boot/id/5d302d8359b51498d049e983/

This is still present in -next today, though we don't have the failure
to change frequency any more - it still fails right after cpufreq
though:

	https://kernelci.org/boot/id/5d51784259b514a021f12245/
	https://kernelci.org/boot/id/5d51781559b514a007f12241/

--C01fF7hLGvN0zd9s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1RoOoACgkQJNaLcl1U
h9Dj1Af/VQopbydFY7JzTz2b3ZKRSkUlGs8iymzkvcUjsk1e/MeZ8d6cbowqTxDR
2oktFl47dC0AZq/CFs2Xq0B16AQ1XVXgq3J57Uh/IBH2XdzvUFIDAO5BJcMopKXg
eAHCcEdKOI3q/wSZgr25wzZ1jxZ/E/X9iMaIQYmtkuVkl/QE6Ip9sYx3ThsHKNwi
n1jIe7HqjD2cDWjKSsvPtk/BYYd/BbQ14NudFhvZUPptsRe0mM1Gmo2jU5ncwl2D
RX4eeInyAPUy3VhyZc/D3buwBD12aZuJV/ZRn7vOgQ2St+YiVikDyy5OiBntuT06
Ep8ayTj2EnkV6AoFECk3YAAKQ/hguQ==
=T7ph
-----END PGP SIGNATURE-----

--C01fF7hLGvN0zd9s--
