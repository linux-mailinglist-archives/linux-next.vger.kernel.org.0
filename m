Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3851FC169
	for <lists+linux-next@lfdr.de>; Wed, 17 Jun 2020 00:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgFPWGX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Jun 2020 18:06:23 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59285 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725941AbgFPWGX (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Jun 2020 18:06:23 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id F1EFE5C00E1;
        Tue, 16 Jun 2020 18:06:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 16 Jun 2020 18:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=date
        :from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=z4kbQiA7fXENz+uZ3GRIQm70e5a
        yJQmVi7soJQmblS4=; b=jjazcBnAGDUnOov5LjcFA98QDaCxEg6mCDvlkh+0FSR
        rCur5LrrhmympWEZyCGhqWamzptP1IY5p83vnG19dXds4jkw5YEDxZ6/4qScJDv/
        pdHJebk6vhRs4bCQAtOPcSfVvy3RD7/P6duGH8ueubZvM6irUgovhZbVg5s91FKc
        L0+iMsjnOZnqGic+FXzvUPp08x247VpXdUsqUHL/WvjTiTjOr32jAy8ZGQpaAJkq
        ibC/RcQsfKAzkUjcPyFWkATHi5/CS/fcYL2xb8aruLzwboJHuvwzlCJ0KLi3mNE5
        b1dlXcHDD3Z/8Qm0QSqpd2jBn8xo3xgsEANKmzZ9l3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=z4kbQi
        A7fXENz+uZ3GRIQm70e5ayJQmVi7soJQmblS4=; b=If9QaZWcO7Epc3XUEDb7Y0
        AviwdUFnMKi5DeaoWbDq8TKlwyO0D4S8Eal2/pmeINtKBtfMdKdLVS6vbobJ9Bzg
        8mnDCzVaHK0G/ShowHLl+z6JghleAhQ7QCK6GblR0U7k27Vxlax8GnS7UdOmVM4T
        XSs7jyxmL7Fi1u1w4GnTd+8a8+/nrXmwJR49aK0QNf75f3RTz+W0hfjjYRcN+P0+
        ZukCkGSM0ru9AjIUTwMzmLVvbJ7gQFU49NO7/yKgs7xEpKZAerNTO0Ig2HTGJ4o5
        Ev3iHweED+Z2rCXCqgsMUdQsIPQfcEAO/dIYaun1MA4qiHWMndT02IkI/umeKSAQ
        ==
X-ME-Sender: <xms:XULpXgoVnyhEMBsZ3Dw_jQLjC3N3_TuKBvJoZnCKOyuPkdlps0CRIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejuddgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpeffhffvuffkfhggtggujgfofgesghdtreer
    ofervdenucfhrhhomhepfdfvohgsihhnucevrdcujfgrrhguihhnghdfuceomhgvsehtoh
    gsihhnrdgttgeqnecuggftrfgrthhtvghrnhephfeiuefhtdefudetteelgfffheekffdu
    feelteekleehhfdtieevkeegfeekgeehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucfkphepvddvtddrvdefhedrudegrdefgeenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesthhosghinhdrtggt
X-ME-Proxy: <xmx:XULpXmoN0ZFng3HlxLyhbgH8vonwucUv9dG6smJ8wbEkrQGPKBG4vg>
    <xmx:XULpXlNKKCkYmOaKh5SQ7426baJ99TOfd0K9h7m4hTIeGFURiVj2cw>
    <xmx:XULpXn6jVXwl1DBQ8Sr9rU9JduwRldY24qwEkHFt28O-f63lVm6hgQ>
    <xmx:XULpXoXDXdnvzqBEHTqDg9QXD85mNgAlBNZ31lq3DHmq2v-yL8Tyxg>
Received: from localhost (220-235-14-34.dyn.iinet.net.au [220.235.14.34])
        by mail.messagingengine.com (Postfix) with ESMTPA id A756A3280068;
        Tue, 16 Jun 2020 18:06:20 -0400 (EDT)
Date:   Wed, 17 Jun 2020 08:06:17 +1000
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: removal of the leaks tree
Message-ID: <20200616220617.GA25096@ares>
References: <20200616145333.40ddbce5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20200616145333.40ddbce5@canb.auug.org.au>
X-Mailer: Mutt 1.9.4 (2018-02-28)
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2020 at 02:53:33PM +1000, Stephen Rothwell wrote:
> Hi,
>
> I have removed the leaks tree
> (https://git.kernel.org/pub/scm/linux/kernel/git/tobin/leaks.git#leaks-next)
> from linux-next because it has not been updated in more than a year.
> If you would like it reinstated, please just reply and let me know.

No worries Steven, thanks for letting me know.


        Tobin
--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEc/+jpUAIMPwyplf8QL+eTCadZgcFAl7pQlQACgkQQL+eTCad
Zgcv3BAAgGIXSOHMmnitua54lQLw1uhkgeS5IvqBkZn9+fSKpGpaRPYxC4bugpgZ
LMtt+uhaKaXu3PTgzBBnzEuYy5/FCs15fWdXJIiMQG4wOs490n3V8K4aGh2Wqx7x
pE26E65oFBQp8GROZhbecKDLI77ng0xDCKutRrGXf9JnKotNgGY2dRUe8leVe5cE
OoDKpTuGro4iGf9stJ5TCyKPZNsNqRSzXCjTrrPyj7lDbKRfesVIUeQ7qfYSsgR3
+iWH5enSK+PKr2PtgNfJsSmH7UMLKwzmxqkP5O8T3t2blJ2CdP9lfvAaC83xxHyQ
+7nrPs+oxoe6eiteg0CJE5k1m86p445FXDE95asBSfdR29mF3iqwmwiNrANWtzgC
mmHxqUQ34Rcd8IIaLScO27BFJx9lL7nR2kyMVdhx/isYso1wJr7g0kyOjU81SO9o
3vc8eAif+JBn+goaUH50opmgW0cQg6Zb7SXTZNpCFDI6wsZwQvkfx1rU15fE0O4r
M/Y7wzIIRH5Ef8R5YIHXVEiZ9py0jN0vHYiYeT/8Ns388fdEk/fAnmQwr864qQAd
ECTKEHKkyTm0EQxuYHV5I1d5weOLmUDJ8EmOHTz349fDXRbLA5QCUToHp4XLrY2m
IKOX3guBL28Q81/fnvb1mCocxeHSDLYKsDOikl17tLkNp3SOR8k=
=CJCr
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
