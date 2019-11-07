Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01EFAF2DAC
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 12:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387556AbfKGLqD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 06:46:03 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:33102 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfKGLqD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Nov 2019 06:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=z6Ao1AiXivPj3MfxhHYyl/DDaq+5beKZXJuch7JRGK4=; b=uVw6XDwVIWVAH1BiccKcvhrgT
        iZvhTxa2xOZ75pXBd78bvYcNXawV2ttrMHhV7Ax0+9wsJomQ3jC2vkhZvLg54iJS8iiiQP9ARDZAI
        egWInmN1v23ACOOVqRVqqxgZ4SZb1tUlaIdRx4vOdKN2U9z+gst+hf1KvEJw+S3h/bKD8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iSgEc-0004ED-6r; Thu, 07 Nov 2019 11:45:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 503A527431AF; Thu,  7 Nov 2019 11:45:53 +0000 (GMT)
Date:   Thu, 7 Nov 2019 11:45:53 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Linux-next-20191106 : arm64: Internal error: Oops: 96000007
Message-ID: <20191107114553.GA6159@sirena.co.uk>
References: <CA+G9fYvm_QEq+9e+dni1Y+bJswr9bU5=shJcC+wKjjOyiPsXXQ@mail.gmail.com>
 <bfced8c8-c64f-982e-8797-d48b5ec65291@arm.com>
 <20191106161705.GA11849@sirena.co.uk>
 <CACRpkdY5JObOobs7VW043QYGd_xufwnQDBJseKp+_QWv4kdzaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <CACRpkdY5JObOobs7VW043QYGd_xufwnQDBJseKp+_QWv4kdzaQ@mail.gmail.com>
X-Cookie: I've read SEVEN MILLION books!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 07, 2019 at 09:00:25AM +0100, Linus Walleij wrote:

> I wonder if it's worth to look at the static checkers like checkpatch
> to warn for this?

I noticed this due to the warning emitted in the build process so I'm
not sure there'd be much more chance that people would notice (though
admittedly the warning during the build doesn't suggest a boot problem).
There's hundreds of other examples in the tree that don't trigger
crashes for whatever reason, I think this one was just noticable because
it got built in.

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3EA+4ACgkQJNaLcl1U
h9CzLQf+KbYPYjkVbAJHe40TUPsnwY7KOUb26/ZeQ453ifWCAT3w6m9HQhekWyat
rcitUzd8ddkw6kZzrIiERvGJqT70xG4R2XGNCDNaS+XFNEHilcNDZszEUp14BzKb
kkDm/d+0nzYf1cXjacfvZKS6/YBSkEAAq+7vTq2y32/OgpPCz1O44Ayxsir1GlZH
mJg9899fdi0T7xJPQipLL754cwoqqjukLcyGGRrzVQavUdZVUk05vNVjG8Ce63uh
o5SbdUWJ4zUIREOa5kI2BbiZ8wYqOyLWu6c7Vm74sY4g0OtZUgOOqmW8uePAMim5
RFYG4AxId1mkVM7N8fnPs0iArsfnnA==
=jcxs
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
