Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2BF0B7927
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 14:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388585AbfISMRu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 08:17:50 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52868 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388575AbfISMRu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 08:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=npxzgMYuz7Lmn3LK2CAeoMDd5OUlrKZbXfDUSAVwL5A=; b=kPTsS/ORZ4BMR1uIXzcMkstaQ
        y+dVdTUFMhHfGXc3SGM7YRhgO8z5wGffm/eTeuCQyd3N/t9yDJQSxvNGxAYnLMvsGs7JVEPymX2yq
        hWTg5fgSMGZRqxXjWGyPObx33aOtzwfhTNy8cFyN+C0YDDE9EMhAgdMKJGCfaPjHIl9bQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAvNU-0002SP-UB; Thu, 19 Sep 2019 12:17:40 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 0F4D52742939; Thu, 19 Sep 2019 13:17:39 +0100 (BST)
Date:   Thu, 19 Sep 2019 13:17:39 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Gao Xiang <gaoxiang25@huawei.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org, linux-erofs@lists.ozlabs.org,
        LKML <linux-kernel@vger.kernel.org>,
        Chao Yu <yuchao0@huawei.com>, Miao Xie <miaoxie@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: erofs -next tree inclusion request
Message-ID: <20190919121739.GG3642@sirena.co.uk>
References: <20190919120110.GA48697@architecture4>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Content-Disposition: inline
In-Reply-To: <20190919120110.GA48697@architecture4>
X-Cookie: I'll be Grateful when they're Dead.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2019 at 08:01:10PM +0800, Gao Xiang wrote:

> Could you kindly help add the erofs -next tree to linux-next?

> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev

> This can test all erofs patches with the latest linux-next tree
> and make erofs better...

That seems like a good idea however since we're in the merge window and=20
the only things that should be being added to -next right now are fixes
I'll hold off on doing this myself.  Stephen will be back on the 30th
(just after merge window closes), I'm sure he'll be happy to add the
tree but in case this gets lost in all the mail from the time he's been
travelling you might want to remind him after that.

If you have a separate fixes branch I'd be happy to add that right now.

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2DceMACgkQJNaLcl1U
h9BUKAf+Jen0knGB2FZlvH24tHoPHbsAK0LhctKiAhTdj4BYGgSV/K1VjmZxb+lb
6Hyoh0cyemAu638LeDosBqq4gl6w2j/I4QhWPrVy/m6cJhnrJTYbXbRrL2ok29Uv
04BE/HSweGvNY3JKDsh3ownlkz4UCmY/uslUUp+ngKtmnGrxfdWRWDqnSJ6/aG7k
cr82gP+z8cgEBly0RTELrXEQWRGOI/LiFyJMKd3gSBIdmOJsiwzWDrI7snd2GxW8
bLDNM5BFIj4uyFnC8RMLiMKnAElZ6EPeRQqaG5yzmb47s32FvhVkuZvsBtx8jjL4
poSBO66Ogg227m5ZenWQSz2vrcnCaA==
=/DQ/
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
