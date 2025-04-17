Return-Path: <linux-next+bounces-6291-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FF5A91795
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 11:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5511D5A5E2C
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 09:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A388226165;
	Thu, 17 Apr 2025 09:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKY5sdtA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69534225A3B;
	Thu, 17 Apr 2025 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881539; cv=none; b=iDPRQj4VrvAxiRskmM7L47Uuj0+iy8k7wo1A3Y1B8pqC1GIQfO4awzHtAREPfB6R/tkUOXSxFqpjrkIuvw10YHIG4/UoHDtYNsTPOaHGbyySVjXAn0LSAAaTQJjCfCvEW9bcqVYwwFibu2aW870JOyptdbvtjg+ri7vYA665MBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881539; c=relaxed/simple;
	bh=aknegXEf98rEXjC2Ndf2yjXBbMR/+0vD9gZhC4mdjVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rxd1wdmvkdNCic5yXaVqp0GDFUBFp/tPR78rh+PrtNPO9M5YEh5Kz9BKh7I+fPRxOPWkZsPd2bMyFQUUO5h6kYgN9XBvIChYGAhm5ONCrCSu3qlPhdLpl80PpZARAnpX/tzl6Qezhl245DLkNKC5Jch3lQk67uCTSfozLYitGbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKY5sdtA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C70CC4CEE4;
	Thu, 17 Apr 2025 09:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744881538;
	bh=aknegXEf98rEXjC2Ndf2yjXBbMR/+0vD9gZhC4mdjVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKY5sdtAnmOmvl33aEwoCgVtEYSSsSev4+VX1DQ2WI9hq49GdmuVK74G/015suRam
	 JJCtiavrobOiHjE3coN1AOk+iQC/TgVFELp40tPDVVoHtM81OBrMH1sKujfWUmSr4a
	 hw2KCDrf4AIY4viR3bXT/53IVkA41Lzbr2d8f3J5sGE5Nz489DHgskX+JIG52O/7vd
	 zgpd91JEPhiy02IMmAIjPVVzyVBdoVdQJUeQuijJ9p2Wv7RaFwN/tvTRofhcbjfz6t
	 kLF9YweRODJQ9Ud2QjBIcFvb9PLbaTAmfPMulb+tnSc6P5mPyio40S26LB8rRLr695
	 b5petkuythfQQ==
Date: Thu, 17 Apr 2025 11:18:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pwm tree
Message-ID: <bzrjh7hlofv2sgyqy77wiyads3kjxxogr7donv4tqhqolg5o26@klgeciz6jobi>
References: <20250417162700.728e14e5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="conccmqenup45jqy"
Content-Disposition: inline
In-Reply-To: <20250417162700.728e14e5@canb.auug.org.au>


--conccmqenup45jqy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build warning after merge of the pwm tree
MIME-Version: 1.0

hello,

On Thu, Apr 17, 2025 at 04:27:00PM +1000, Stephen Rothwell wrote:
> After merging the pwm tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> ocumentation/driver-api/miscellaneous:47: drivers/pwm/core.c:232: WARNING=
: Inline emphasis start-string without end-string. [docutils]
>=20
> Introduced by commit
>=20
>   bde5547f2e87 ("pwm: Better document return value of pwm_round_waveform_=
might_sleep()")

I squashed a fix into that commit:

$ git range-diff bde5547f2e87...fbf1880bada0
1:  bde5547f2e87 ! 1:  fbf1880bada0 pwm: Better document return value of pw=
m_round_waveform_might_sleep()
    @@ Commit message

         Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
         Link: https://lore.kernel.org/r/db84abf1e82e4498fc0e7c318d2673771d=
0039fe.1744120697.git.ukleinek@kernel.org
    +    [ukleinek: Fix a rst formatting issue reported by Stephen Rothwell]
         Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

      ## drivers/pwm/core.c ##
    @@ drivers/pwm/core.c: static int __pwm_write_waveform(struct pwm_chip =
*chip, struc
       *
     - * Returns 0 on success, 1 if there is no valid hardware configuratio=
n matching
     - * the input waveform under the PWM rounding rules or a negative errn=
o.
    -+ * Usually all values passed in *wf are rounded down to the nearest p=
ossible
    ++ * Usually all values passed in @wf are rounded down to the nearest p=
ossible
     + * value (in the order period_length_ns, duty_length_ns and then
     + * duty_offset_ns). Only if this isn't possible, a value might grow.
     + *

Thanks for the report (and all the work you do to notice these issues)!

Best regards
Uwe

--conccmqenup45jqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgAx30ACgkQj4D7WH0S
/k5JQAgAkXAYbewh3OX9X1zMPJdVp/PuyApZTR/NIKegpZXm7LhRETDCC1OX4E8d
SrmRwRh59UHgHmSuCJC4sPWICsIy2tR2cZN/EkgzSgKQy8GRTBWg65Z2MC2fV1Yj
0/nC0vPTPvfevKknl457G9JZ0XFMFGV4fWtYRjMox7jPC/MdCrSOCrXNuJztX930
LIFjVZgwc4hTdvqS7ZCNtZQeQhcFplaYu+7fC4a1rX3nm2+M4OtPSUrIjlxka1Eh
vTCDYuzRdQIbC6K5jm4LnDHHN+FubfHvXnrKzgx0BiHpMAMcR5LXfhZcM0YZrj3P
pFwdkeu3uIQX+0uXx4jYWUwl6pGWyQ==
=3QSp
-----END PGP SIGNATURE-----

--conccmqenup45jqy--

