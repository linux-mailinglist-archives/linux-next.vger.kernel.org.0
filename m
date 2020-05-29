Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E19B1E7EBF
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 15:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgE2Na7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 09:30:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:57564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726629AbgE2Na7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 09:30:59 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE515208B8;
        Fri, 29 May 2020 13:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590759058;
        bh=MTMuqnr9SOwZHN7gulsfbQIWi/3bkDTeZeKYsob4QTs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BMGtLHJEeZVbkKe7ElZUUue9OEsnPJALezbOI3aeCwrdbhnTBgdkQ2wke76X0Gy+H
         jyhrEGyK6cELD00QBL2GTA2Kp3DDhNGXa1BvBxVtPpxncJOgqUBLZAIzWhBJmse4OY
         Hke/YaDy9H3oIqRUyFcA02cROK6+cXfNKkgN5Joc=
Date:   Fri, 29 May 2020 14:30:54 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20200529133054.GN4610@sirena.org.uk>
References: <20200528135717.3e2d5169@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4Y142/9l9nQlBiaj"
Content-Disposition: inline
In-Reply-To: <20200528135717.3e2d5169@canb.auug.org.au>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--4Y142/9l9nQlBiaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 01:57:17PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> sound/soc/sof/intel/byt.c:464:12: warning: 'byt_remove' defined but not u=
sed [-Wunused-function]
>   464 | static int byt_remove(struct snd_sof_dev *sdev)
>       |            ^~~~~~~~~~
> sound/soc/sof/intel/byt.c:454:12: warning: 'byt_resume' defined but not u=
sed [-Wunused-function]
>   454 | static int byt_resume(struct snd_sof_dev *sdev)
>       |            ^~~~~~~~~~
> sound/soc/sof/intel/byt.c:447:12: warning: 'byt_suspend' defined but not =
used [-Wunused-function]
>   447 | static int byt_suspend(struct snd_sof_dev *sdev, u32 target_state)
>       |            ^~~~~~~~~~~
>=20
> Introduced by commits
>=20
>   ddcccd543f5d ("ASoC: SOF: Intel: byt: Add PM callbacks")
>   c691f0c6e267 ("ASoC: SOF: Intel: BYT: add .remove op")

Ranjani, Pierre?

--4Y142/9l9nQlBiaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7RDo4ACgkQJNaLcl1U
h9A5xQf/fTPL8ZwS2HF0LdILWZ+wEupu6Hq9Ve9bC3hRoqbtOCXYnwPXVh/eg5v6
IpEvDbiDuRYE+bVWAMxH4H73VyupxWJcAC1l3PPLMYIL/mQ7Sl4WAJnu0a4Qn89d
aJQQwB2C7Qj7T+Ji8aqOC8eDiqHeKhb0dBZow1URhuEAcM/4IkEKaNrqfudFTset
ct27WhlAsh23L6j47G8lNDkgXQqQVVnelgJ+WaF8OMuPRjzeSE2re9uwfCFRB0dk
JCDvH7Lu8bo0C1tegwF4Jr4rfZO/q2QCRetPtLKtW+BFPwWRtK6Qk8451ISNX72P
Ugohy4Vl/p2X0KrEF2oYOO+UUUqFDg==
=qzGP
-----END PGP SIGNATURE-----

--4Y142/9l9nQlBiaj--
