Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73DC7170A02
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 21:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbgBZUvk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Feb 2020 15:51:40 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:32828 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727379AbgBZUvk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Feb 2020 15:51:40 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 509FF1C0371; Wed, 26 Feb 2020 21:51:38 +0100 (CET)
Date:   Wed, 26 Feb 2020 21:51:37 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the leds tree
Message-ID: <20200226205137.GA955@duo.ucw.cz>
References: <20200227072654.63bd8f28@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <20200227072654.63bd8f28@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Commits
>=20
>   111798333210 ("leds: add SGI IP30 led support")
>   0b24e7c74537 ("leds: lm3697: fix spelling mistake "To" -> "Too"")
>=20
> are missing a Signed-off-by from their committer.

Thank you; fixed and force-pushed.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlbaWQAKCRAw5/Bqldv6
8sAjAJ9S0QQZEBkrqp2HI4y06CG3iVlsuQCfe0MvlZ+WcvI3RiH18zUSIKUUVhs=
=hE2z
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
