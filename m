Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF41349BAD
	for <lists+linux-next@lfdr.de>; Thu, 25 Mar 2021 22:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbhCYVc5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Mar 2021 17:32:57 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58462 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbhCYVcj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Mar 2021 17:32:39 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F08761C0B95; Thu, 25 Mar 2021 22:32:36 +0100 (CET)
Date:   Thu, 25 Mar 2021 22:32:36 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the leds tree
Message-ID: <20210325213236.GA1589@duo.ucw.cz>
References: <20210326080600.5b707e08@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <20210326080600.5b707e08@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Commit
>=20
>   feac7685def1 ("leds: Kconfig: LEDS_CLASS is usually selected.")
>=20
> is missing a Signed-off-by from its author and committer.

Thank you, fixed.
								Pavel


--=20
http://www.livejournal.com/~pavelmachek

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYF0BdAAKCRAw5/Bqldv6
8qypAJsEU5IBffMDsPHKMfocV2eElZ0MwQCfYjfLygSU/QCcHOLMM68y1ornDEA=
=JbhL
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
