Return-Path: <linux-next+bounces-8234-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A426B48F0D
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 15:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 611471C2236D
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 13:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F29D2F4A16;
	Mon,  8 Sep 2025 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="WMRZQabd"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232962E92D9;
	Mon,  8 Sep 2025 13:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757337204; cv=pass; b=rfL3OKIldQ4Znfq91J9VCTrgGNHCmFDUPvHAx5usXAxTHJroSNxxwdnyt02DPDZhW0yrS1meKWZMwKOGOo9JoH5DveGCQ/gRBCC0Im+ssmRJN25A6HPazqYUlNfrT7qi61g4PmPDEaVi4MY3NxMiCEX0k5Tw0xBOoldoZqbiZyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757337204; c=relaxed/simple;
	bh=jZdcpw5nwcKubQJyFjk30zbbrfimNOb1S8HG5D2I9Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBoNEVjoEq/P4msy/vdh/GfSWKggCMefxI1GxeGcvjnwX6VIStk0Sbc5iYMMx8wK1fpFVtRppdqvkIMcYLgyn2CLSoOFgdqmI9KLNRkxMd4Y5Or4QmweJFYRCWK/qgHQCX3r8vnA3vSgZ6czfTlopu8/cJeC+iVd51ub9CWc4dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=WMRZQabd; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757337196; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BjqigCDh8q8zmedFYaqNSpyFjzTVjF7wFZFCnI4Am0mEiq+h9911BcKii5hbCdJNZW7fgcE32/K1xhWr8N0ETZUfCTLwUSdublejmjv1EdZjlK2lrK0kAoVxNE21JrFKfN3Hx6rs7a+Q+0ubnTiNbZr57piXYK0T/FrCXohMBNw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757337196; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3kaZfiY/f1MQhsfCNbEtRvEPc3aQHd3j1LIaIhu8/Ho=; 
	b=DR292OKN5TH3m7u/pCW97nIoHf90cutTbkTZbuLQ+3BaS/GZzl4bV65XC/rVLToEW8JR1LlVmfM/PJhPDizxzmr9Ph+mWZSXf8PwLbCA8WajOKGc81qyYUsz21ld7mO/QiEvkBMQgnY2Q+nEWpCT2hqp6XWq8N8FsWPyXKXvKf4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757337195;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=3kaZfiY/f1MQhsfCNbEtRvEPc3aQHd3j1LIaIhu8/Ho=;
	b=WMRZQabdYRmcqz/m3I/b95D5+pkkdCBaGLj3niY/6XcLxiv0IR7t+jud0mPrZT0U
	Zelof05M0ZJ26+HohrydsOu85JUFx4NMDvv6Df1DECQdZO8lxdeqzvPI3As8L5Nm61V
	lXlSprbAyR039ANI7C+uXNdg9YOFu9Uob/glRnho=
Received: by mx.zohomail.com with SMTPS id 1757337192790113.93888448090684;
	Mon, 8 Sep 2025 06:13:12 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 9BA3818081B; Mon, 08 Sep 2025 15:13:09 +0200 (CEST)
Date: Mon, 8 Sep 2025 15:13:09 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Fabien Proriol <fabien.proriol@viavisolutions.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, fabien.proriol@kazoe.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the battery tree
Message-ID: <3zg7kxnpnqcovgfdqwjmkpqyq4t7cxupmjqhsstx7fie2t2cu3@4b5d22kg7sfn>
References: <20250908080739.5f33c79f@canb.auug.org.au>
 <cc37b088-696f-4f91-9159-30e839b7ffb9@viavisolutions.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mi65rnaaaqpd6qli"
Content-Disposition: inline
In-Reply-To: <cc37b088-696f-4f91-9159-30e839b7ffb9@viavisolutions.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/257.291.27
X-ZohoMailClient: External


--mi65rnaaaqpd6qli
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: Signed-off-by missing for commit in the battery tree
MIME-Version: 1.0

Hello Fabien,

Please do not top-top :)

>Le 08/09/2025 =E0 00:07, Stephen Rothwell a =E9crit=A0:
>> Commit
>>    8543d1c462e2 ("power: supply: sbs-charger: Support multiple devices")
>> is missing a Signed-off-by from its author.
>
> In fact, <fabien.proriol@viavisolutions.com> is the email of my companies,
> unfortunately, the email server broke the indentation of my patch.
> This why I used my own personal address to re-send the same commit
> (<fabien.proriol@kazoe.org>).

Actually your second patch was also broken and I had to fix it up
while applying. You should have a look at 'b4', which helps you a
lot with these kind of issues:

https://b4.docs.kernel.org/en/latest/

> For me, we can use either one without any problem, so, if you can change =
to
> use the same in the signed-off and the commit, it's OK for me.
>=20
> How to process ? can you change it or, should I re-transmit the message
> again ?

The first patch was send by your work mail and signed off by it.
I've used that to fix things up.

Please have a look at fixing your mail setup before sending more
patches - be it with b4 or via some other setup :)

Greetings,

-- Sebastian

--mi65rnaaaqpd6qli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmi+1l0ACgkQ2O7X88g7
+prV9w//bhjnW1GYtZBIL8dEb5AN0y1bcAel+aYbMLVUtYH1hq2ar0H29jZ7O4Yd
qDCgGlvYdWWkwa0TixkuK1o3GiM1z3hkTiX63REec1hmzwol+ul9pGl9oZHNiGRS
tBOQ0P1OaNgD8uUsWJbX9zrv8DJ8I7d+aAWVY9EsV4Ib2UH5c/uHrRMd6+2gEcvK
+0Z0itj/63NdZIymB2Frwf7NFEgtJg12DIgQxDemPBCXelaHyCUlnorL1E0hPh5A
Eg0WGnLJn+aBECk4GtNqs59xWHV3aKVIAo0vsmVQOaw64ZUI/DAkonrAf60HrqST
+evFpOUWfOrJJWMBHyRKOe1/Vnsb3nyVNPeh32DyiZRFX0n1OvL0ibPAaEKiVS0u
7xarRSp/9HE9EvZ1X0Cr2rdTzSm3ii8HRid0pqr57hRoM1UlwuNrK4zGD4r6HdGr
D3/KzQgUMKfYX1FEgM1eaxwRsMoEpHBUWmwvUTq/Y7n4cjg16sbBAa5FiGUq1G05
1lLuyGWhtj0OGbQHbQimgCzh0xc9DZ5HAGbsEP5DF4cSpU0i4nVi4C05ZXViqvoq
HmFW/gy3cWF9oR0F/qs5J3es0Q0IPAHpKuIandj3LC9lnp00ZDvABkRTgf60vUc1
cOpR2GETCrpnLJAv1662VUkQXhHq81Y0iKFx7JgjsMZ/zkdA+V4=
=vlIy
-----END PGP SIGNATURE-----

--mi65rnaaaqpd6qli--

