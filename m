Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0F23DB9FC
	for <lists+linux-next@lfdr.de>; Fri, 30 Jul 2021 16:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239065AbhG3OFO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Jul 2021 10:05:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:51718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239013AbhG3OFK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Jul 2021 10:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4167160F94;
        Fri, 30 Jul 2021 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627653905;
        bh=2esQo+K+opJscL8fj+PkbeVPDGTMucYGFc5Jt3XGZPw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZhudDhloVPIXVBpydnkAIT3ySux1plRzANbHng+IcJW0KlHPCtC/iZ54bJA2fF1zh
         xHqkODg2D01YF+9zISzMUmc2gXUNNrWhLMv5CM/w3d1BmF9wqZs9NXefjc3KILwtxb
         LexL5qBl4rSygu2yZANGNHNDjzhiTsnE1iduOYsGTya4iXVq/8XhFDGlMxJiqPwyo/
         GeRB7ObgEcIvJtTjX+gBlcbs+fgziRv4D+2xgcERZlk2UUC3cDFoPXoVKNNTEDaYsT
         phAL9D3Y5YNuDFeL0oi2CH1WJPvqvyYVMOc9bWxQC7zc5rMjUsL3OVQdO9froZGZxS
         EIQ5GaIIYFS9Q==
Date:   Fri, 30 Jul 2021 15:04:54 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Phillip Potter <phil@philpotter.co.uk>
Subject: Re: build failure after merge of the staging tree
Message-ID: <20210730140454.GZ4670@sirena.org.uk>
References: <20210730135340.17863-1-broonie@kernel.org>
 <YQQGgReGba/Ld40y@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KO6AnYnUdC9Z3rW+"
Content-Disposition: inline
In-Reply-To: <YQQGgReGba/Ld40y@kroah.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--KO6AnYnUdC9Z3rW+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 30, 2021 at 04:02:41PM +0200, Greg KH wrote:

> Ah, are you building with O= ?  That might be the problem here, I think
> I had to fix up that mess with the older driver in the past...

Yes, all the -next integration builds use O= to keep the working trees
between builds.

--KO6AnYnUdC9Z3rW+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEEBwUACgkQJNaLcl1U
h9ArwQf+LzDRW8YXEafaXorgmu1LfxNx6XYrfXIiv8/Uvdjmp0Xsi5PvrPKSXfUA
rCJ8R31BUwOF7REIUKd+dmHSHY+OKiQja/zXidiOdwr7a15ppVNT6k2YE0qzhGsR
UVLl3CViEACmXSKNUgxQ0iblDOs/Wi2VTCeUDQB7BKiVZXa8aFI6+ffmwngf3Mt9
+t96KpQppuPLkJbuB5QD99CzSQpHVuIzC9mKD2wOXpqTq+FYUQIpUT/hOw+Kd32b
A6JiC1+lLElN4p/fnyC+ATit2O9X5vRo+S/gNyR20Vm/seuLRGGJDij73kE0q8KN
elTFEwwgoyaRVaD+x8tJWzxbee/SXA==
=1X+h
-----END PGP SIGNATURE-----

--KO6AnYnUdC9Z3rW+--
