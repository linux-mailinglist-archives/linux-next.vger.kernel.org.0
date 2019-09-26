Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A94D8BF57F
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2019 17:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbfIZPFt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Sep 2019 11:05:49 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:56008 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbfIZPFt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Sep 2019 11:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Y7Er87ElSCnuzwnc/GQQfSdA5vXX/ZceyLnsl6YA9pg=; b=Q0AqWTrO7KSuSjN+rYFpAam+5
        tiLuFZeL5HOsE/951XP3EOmh5Cezk1573vlGrZqgw0qnASGIDi0yopwp1+EHQGu9xQyZvwn2ZnUNO
        /bDHnEMiTF4JSjEi+LV67ilQr7wi7kLAHleT1zqZFZuvKx4HEirHBp+fe2IwXlE5WonNg=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1iDVKw-0003rP-M1; Thu, 26 Sep 2019 15:05:42 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 5B0A3D02CFF; Thu, 26 Sep 2019 16:05:38 +0100 (BST)
Date:   Thu, 26 Sep 2019 08:05:38 -0700
From:   Mark Brown <broonie@kernel.org>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request to add linux-kselftest test branch
Message-ID: <20190926150538.GS2036@sirena.org.uk>
References: <8b9795d2-a384-dec8-076c-5b9d5c524eba@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xdTJfaku+U7U7swX"
Content-Disposition: inline
In-Reply-To: <8b9795d2-a384-dec8-076c-5b9d5c524eba@linuxfoundation.org>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--xdTJfaku+U7U7swX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 25, 2019 at 01:30:15PM -0600, Shuah Khan wrote:

> Please add the following linux-kselftest test branch to linux-next.

> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=test

> please let me know if you have questions.

OK, I've added that now - I did actually merge it in by hand
yesterday too.  It looks like it's for kunit so I guess Brendan
should be in the CC list for any issues too?  Hopefully Stephen
will see these mails when he gets back but it's worth checking
and following up to make sure that he picks it up after he gets
back on the 30th.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--xdTJfaku+U7U7swX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2M08EACgkQJNaLcl1U
h9DCKgf9E7Drd1EV2hVGCt5vUWKvsihs5CsiYGX7bbakncyS3MAgMDfPMNnmlhV9
c3yicY+F9jIjEbRCBt562WFO10N2qXCa54MYD7c3Qrje8p0RatkYbQiPnv6q5WdH
xm7P8ZAGhqu0BWEY/zP3L8yW0+m0IJRQnobmIorg6iZOsszuLXeMmIwfbd+Aiw8w
rdwcyLXwkFynaZON8QJzuYHOB6A2VvsRmfiTjkS+iM4BSycerLK7nyYpziQP/EOH
JVY+hWsTOfoHQW2TfjPld+v1PTUuZBcVEGLKoWdGu8OoInuMlaMqhNwvNn4AJh1n
ibk9J+gQRYM1erf6aKkUCxDaxJ/tiw==
=x3E1
-----END PGP SIGNATURE-----

--xdTJfaku+U7U7swX--
