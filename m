Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 595F34C3B9A
	for <lists+linux-next@lfdr.de>; Fri, 25 Feb 2022 03:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbiBYCXb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Feb 2022 21:23:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236265AbiBYCXb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Feb 2022 21:23:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799A31AF8FF
        for <linux-next@vger.kernel.org>; Thu, 24 Feb 2022 18:23:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 148A0615AC
        for <linux-next@vger.kernel.org>; Fri, 25 Feb 2022 02:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2806C340E9;
        Fri, 25 Feb 2022 02:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645755779;
        bh=LL1T7ORQGzK+stsZwmvlw7XD31kP4eI/da0G4FjKZ9U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CBiD5IhHv4C9WVSOtAqqG0XhTqt0Q3eAjqluifvph0TTKpz37NKkmRrDdRmdUg649
         4A7Zi3iWp4Yt74fCoRwQ4QSRBZzxKbHwt7tn+rILVMbQEdLfLySTR4DVrbHReBFqmu
         1ROJuQHaI495bAsQ+UXaNILtZOLiOteERqPVEE72Lof4b5nsEE2n9b9SH8nO6s65BW
         XW1Kn8l4hguBlXHqX6b3X1GY26cNJjAkYny/1N600bDEiY8DaSC3cMhC4nWA6qiSaw
         FW6Ui7algf161RLiLcb0wWG37XpBBVNCSj0kHl+GeNnBKFN1dVrB3gNU0oZ2LUU5Al
         Vmgj06GgqiCGg==
Date:   Fri, 25 Feb 2022 02:22:54 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: Please add for-next/execve
Message-ID: <Yhg9fkjX5s2xX2/y@sirena.org.uk>
References: <202202232131.809767F@keescook>
 <YhfoqF8nj7lQxGDe@casper.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cAABO8wycIOVfR8O"
Content-Disposition: inline
In-Reply-To: <YhfoqF8nj7lQxGDe@casper.infradead.org>
X-Cookie: I smell a wumpus.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--cAABO8wycIOVfR8O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 08:20:56PM +0000, Matthew Wilcox wrote:
> On Wed, Feb 23, 2022 at 09:37:51PM -0800, Kees Cook wrote:
> > As part of Eric and I stepping up to officially[1] be the execve and
> > binfmt maintainers, please add my for-next/execve tree to linux-next:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=
=3Dfor-next/execve
> >=20
> > This tree currently contains all the exec and binfmt patches from mmotm
> > as well as at least one newly reviewed change[2].

> Hey Kees, Stephen's on holiday this week.  Mark's stepping into his
> shoes for another couple of days.

I'll give importing this ago tomorrow for my final attempt of the week
at -next, you should make sure that Stephen picks it up when he gets
back though.

--cAABO8wycIOVfR8O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIYPX4ACgkQJNaLcl1U
h9DDtwf+Prq49rtHDtI5aAetgwZ31X9L6t5WLovPyJrN/txwox7Fns3LhpFM3ctA
AjUQBLnvbQQRXsqIT79bEJn+5WgGRLua9hOUK9uD5K4UFjPC2OSGfihrCbZA1RzD
OJ6jZZ8Yjrge4NClZOyLe58YWYtPdC13LdT0m15VxSmHhRymF5OjyJJx3Q/VRDwx
98u49g00awAH7TnTgdKB93MhSs23bRzEzbzFJIuOj/fTxPI8Ijpm0IeLyqlAypA9
gl0TgYByr2vbQ/ABOkT0wJC0UzyT3MD0xqwFcAFNKEvFOHIuE/cIYjBA17stMG2V
CiBAeIL1bsjrQSK4YUMRe8EKpd+lZw==
=D/E8
-----END PGP SIGNATURE-----

--cAABO8wycIOVfR8O--
