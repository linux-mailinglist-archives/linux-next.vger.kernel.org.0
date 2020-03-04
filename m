Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93674179A76
	for <lists+linux-next@lfdr.de>; Wed,  4 Mar 2020 21:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbgCDUx6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Mar 2020 15:53:58 -0500
Received: from ozlabs.org ([203.11.71.1]:40519 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727137AbgCDUx5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Mar 2020 15:53:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48XmM72rzBz9sPF;
        Thu,  5 Mar 2020 07:53:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583355235;
        bh=RqAi5CvPVw1gFc466MpgquVuPMzpy99Da1Iv73HB5AM=;
        h=Date:From:To:Cc:Subject:From;
        b=Kllkpw2mIBd+SAFoCd/7NOTfc3Y/kEBtLUEX485QLkCL6rBu5ux1Do2zYOd/U7Bul
         tkxzTjk91MIOygx7IBfzd4QsJFSlQasBwO378GN0tJ5MCNxOp2KOamQLU/YtShCVl/
         aert0XmRfPyWkfZ7bXCIJRgqoK9UfjXvN/LYKouOr/7v/rDWk0nRwcpaKWrYILCSIB
         /BxOJe7NdkIPwoxb2zQBRKxV3kCxJ8qqjbuElb6lOrFKl4m+q5Z19WdiFlU5WbetOB
         HtwNmisSa4CMEVZ+Qc1fVx71yDF6D52OoeagnttRXh4NmGGX4KOtxeIDqNP5pF0VUg
         zjmUE4N8Pwg+Q==
Date:   Thu, 5 Mar 2020 07:53:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: linux-next: Fixes tag needs some work in the pm tree
Message-ID: <20200305075346.3945ce54@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WhGlSwEtQ.4JGYVW4wtqs7K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WhGlSwEtQ.4JGYVW4wtqs7K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ea28c454067f ("docs: cpufreq: fix a broken reference")

Fixes tag

  Fixes: 78a0abeca1bd ("Documentation: cpufreq: Move legacy driver document=
ation")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 03b22496502d ("Documentation: cpufreq: Move legacy driver documentat=
ion")

--=20
Cheers,
Stephen Rothwell

--Sig_/WhGlSwEtQ.4JGYVW4wtqs7K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5gFVoACgkQAVBC80lX
0Gz5nAf/ZFSR8vurb5aN1yhfs7sLd3QgQKlt3CRvoFYBGRgDMesvOcFLQdg1i2iR
iyx6IijsOsIEG3FBlp6iSPbrwD+Sd8kgeLaHZTIMiOEuklLB+5Z5DtoVm7tBYVOG
KPdt0fxZAjYbEQqS6zBRKkZiR12U+rHcCt+Wh2PlhK8sbJxf+f83Ipvq0LHfgQOe
ABqnCQHKJ7q7njd9xoy8WOcCLChKpU2D6+dxceYscpGpqE3SV4o2H4+MLOQepgSv
+I7Dus6nXRYIi3FolfudU6GTT0rjVvuQ2ZsjnNt1d63tB3Gn1kGBFXNXbzdy81El
Wg0lQKdjVCHstQKhGqCgW2jrom8sYQ==
=06vE
-----END PGP SIGNATURE-----

--Sig_/WhGlSwEtQ.4JGYVW4wtqs7K--
