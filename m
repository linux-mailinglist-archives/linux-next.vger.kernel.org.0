Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112A41ACE92
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 19:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730767AbgDPRWY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 13:22:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:40818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729373AbgDPRWY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 13:22:24 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A9C12076D;
        Thu, 16 Apr 2020 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587057743;
        bh=t7y5LQKxiCKr8DRWNT37PQt/NonhVq+IuIpLAI7CGNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wpp+zpP6mhxhMOmcPCPPYkGqhwpQA/5yIVAiB3hrZWBduZauZdmRQul0Waov+B7ub
         BgdHyB364tqIRAH8myC7Bw2wehHDyzXRNFI8y2hDySwVrkAvV3CcRX4L+htZWbsM3z
         sNBirLgOuXsEd0Rohk7aoOde/9DzVNNH4MvfGJGk=
Date:   Thu, 16 Apr 2020 18:22:19 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hui Wang <hui.wang@canonical.com>,
        Rander Wang <rander.wang@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard liao <yung-chuan.liao@linux.intel.com>
Subject: Re: linux-next: build failures after merge of the sound-asoc tree
Message-ID: <20200416172219.GO5354@sirena.org.uk>
References: <20200415121521.3e40b591@canb.auug.org.au>
 <f73485eb-c0c8-c557-7491-5daabce4d3de@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1bhFRg6vL9BT9osV"
Content-Disposition: inline
In-Reply-To: <f73485eb-c0c8-c557-7491-5daabce4d3de@linux.intel.com>
X-Cookie: Tempt me with a spoon!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--1bhFRg6vL9BT9osV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2020 at 10:28:10PM -0500, Pierre-Louis Bossart wrote:
> On 4/14/20 9:15 PM, Stephen Rothwell wrote:

> > drivers/soundwire/intel.c:676:8: error: 'struct snd_soc_pcm_runtime' has no member named 'codec_dais'
> >    676 |     rtd->codec_dais[i]->name);

> Bard, can you take care of the SoundWire change - this needs to change to
> asoc_rtd_to_codec(rtd, i)

Bard?

--1bhFRg6vL9BT9osV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6YlEoACgkQJNaLcl1U
h9ASpwf/YKfh8U5CWkgqK8mGVOeRPjf4UcTyV1hxcI3CylFyvakIeaXm6aavw032
LIZ/HFTZo/wz1agTpb3dQRHE0wFr9EctnaQ6EpYguyKovvHXP058YmAMi0nxCwap
O4Yf1vXpHOKAHNQhPNf54kQykd7wxiwLEEfFLNZdWPYKWKsC3R75pKEskA/ehWZ6
HRQsKS5UYhLnRQAQzxkm9YJ72Mr8H9vtFhAzjF9crlFs7yxKogk06pIUYnQPPPg1
BWjsTFLoamtbHYQQPftd4riX2w1/omBSIfvVCzmyHAJCJqUfFpdhtqq0QBepgQRP
nJ3SeFpBKaM3lXw/vgJS42QILOOUUw==
=fr8X
-----END PGP SIGNATURE-----

--1bhFRg6vL9BT9osV--
