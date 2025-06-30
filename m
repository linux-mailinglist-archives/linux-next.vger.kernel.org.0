Return-Path: <linux-next+bounces-7279-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB00AEE962
	for <lists+linux-next@lfdr.de>; Mon, 30 Jun 2025 23:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BA5F7A9E85
	for <lists+linux-next@lfdr.de>; Mon, 30 Jun 2025 21:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BA71EE035;
	Mon, 30 Jun 2025 21:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="qWgKdeSx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E6E42A80
	for <linux-next@vger.kernel.org>; Mon, 30 Jun 2025 21:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751318153; cv=none; b=r6q4UDEKB1sx2usd0fvXzV9r9FXXUPqsiFO+CTNBYLes5WB0yPqPIcbHLP5yco7dPrVXCsI0B3+TeE3WPs1n84h4el/UiWmCXQuf7DoLtwEt0OI1edzQ4DlX/8nVGdW1s2Ql3Th1rsjFgd7tyiQ8y3XectzzRDFsG7dOADREWO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751318153; c=relaxed/simple;
	bh=EGUon6c0S5wpmsyNf3auE4SlWk7SFOne67nKm/p9eaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9z5MqvPfxsobNCKE4ThhRRr1pV+WtqvlRp+k3l8mlBcSsRgRaKsQ3qNbk6WFupNI/38Do6ReMnL8hLFGbg3m+uFZFMMICD/2rRYY0fWuU6ewes2XJQUe2iOqqdEDxv1X0LA2+xckQsAkrOg1tW1DpShH39h2mH3qYG7+7jvgTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=qWgKdeSx; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234bfe37cccso58519665ad.0
        for <linux-next@vger.kernel.org>; Mon, 30 Jun 2025 14:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1751318151; x=1751922951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui5dGJRoAHrxep2bvtPWXcSrwRnwojJa521Ykl4R4a0=;
        b=qWgKdeSxtfuthwyhcRUpqhtxbJ4JVweEL6ykeugSgj1zN6lULJ+yCzKW71D5a+Bqzh
         /YssF/mH/E+mK+N3mLxVjJx6D7ZwQ+rOsTpguJFtatkdjVWh1teT4xmwZQk3TsQ2feVy
         lSJ8iczo530+IrXsqmdJft2d5zjY/WWBqmlff1h0uy8ImuWuPGJxPvqGAm5VEuAuRhm2
         nh0sZnmJa+rzTNfk78hRzebCGwTtP/a7M0ec4H/1E9CvsUoJ1Cr39hnwtWflIkT/znAT
         0iAytVWDaXjvFvbSVKVIqgTQNkGw3zfjVZKfhlW2Krc4mVBBZBhpYijO84H1BlC2UPJx
         u7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751318151; x=1751922951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ui5dGJRoAHrxep2bvtPWXcSrwRnwojJa521Ykl4R4a0=;
        b=M6hi6wwoTSqdxk5z5IrxZwh0pH+nqKgeKPrqDU8LMTc4hWFFOZMUxFE4036yAJ2xdN
         u01OQuaqdouJW5pmSMEFiYjI9f9q23oSG5tKqe/0J5CyAyWuYouiS4B/kb/8Wln8+9dO
         Wi60nnc2rZURgvqAjgoSk8FrZ/joU/v0SVTxfcjQF8urdp6WSm8rE68PPDucKshTC0Nz
         HE+lBhUv12NCbSVseePS4pssX/CgmIMp0LtC2IR90qUArBCYJRCFFcjwrcwSh18AwUzD
         zWZOYBiZv6O7k73Ro+RGme2B7oGKNFA1W4aK3W4LzIbyRS/6ox8gkX6r1MCWExoJMwe5
         t/bw==
X-Forwarded-Encrypted: i=1; AJvYcCXb33iA+ogXyuJg/JPkyoU+WSmVbRG0pwPflyYUHKbixY16tsAhNzL2lP/i3QRD7NOd+TKHATCsvVCl@vger.kernel.org
X-Gm-Message-State: AOJu0YwaVL3w9CEde67rAS7eV2pQbL2zusFTOgwBrXyr+y9Yg+TdsfqD
	ueCWQqecad3dkHtkMm0gqiz3YlU0x4slzWxdx3JbkY6vWIDtouhv/GBmGG4rBjB+zshddYpHJnv
	0suyu
X-Gm-Gg: ASbGncs9N9zrEuWnjvevUwcPenuswe0wkRO2ZdZOkcHQ5aOJu8wYuFteUNXxaS2sVMp
	ib4H6187dZf+RJDIIy7UqbaEPjhtC/Brgk4WGsnyUJRz9QsQr6+fWh99C6TxDiHHh1ZJaFQgRhv
	XzxyXRJvqoT+BKsxzPxA+lQeZXDmUXUyQiK/MSW8vFdDciN7EYBTqvqMQIlU6bsqys/SdWa09LR
	F+zEYLijFGkqyIbHTENfeLKWjHy405/99GY99bjaY2qDiyZ0e0zCEbvXhDAe68QcaMhzxA/qH2y
	aMhFdHuS/Z6mKN1QYKLyZctao2K70CIxUoUlhVn/EP0uH5hUvcQ4X1BEBkxj7e+FtFo/4Ems1w=
	=
X-Google-Smtp-Source: AGHT+IEyw7233FYYeEFBhbG1DmnWndFTQcE89Yo/ew7d0gNg3b/uX0RLSZbwsu33rmRds6xFsAeFYA==
X-Received: by 2002:a17:903:284:b0:234:8c64:7878 with SMTP id d9443c01a7336-23ac45c0f4cmr182206965ad.11.1751318151393;
        Mon, 30 Jun 2025 14:15:51 -0700 (PDT)
Received: from x1 (97-120-252-192.ptld.qwest.net. [97.120.252.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3d27dbsm87144555ad.256.2025.06.30.14.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:15:50 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:15:49 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the thead-dt tree
Message-ID: <aGL+hY7q3+R+v9PR@x1>
References: <20250630072646.23076119@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zu7H1/6luxU1XJuA"
Content-Disposition: inline
In-Reply-To: <20250630072646.23076119@canb.auug.org.au>


--Zu7H1/6luxU1XJuA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 07:26:46AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> ommits
>=20
>   66cba75806a3 ("riscv: dts: thead: Add PVT node")
>   9c2f4c0b2731 ("riscv: dts: thead: th1520: Add GPU clkgen reset to AON n=
ode")
>=20
> are missing a Signed-off-by from their committers.
>=20
> --=20
> Cheers,
> Stephen Rothwell

Sorry about that and thanks for letting me know. I've now added my=20
Signed-off-by tag to both and updated thead-dts-for-next.

Thanks,
Drew


--Zu7H1/6luxU1XJuA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaGL+hQAKCRDb7CzD2Six
DE0FAP9drjMFn2HMy1sX8aRa+8QdbEGvZBQ1GDrR/K+FqXKpHwD/SfuV0lXMb1yk
RlTPsnJEANaVl6hAf3q6y1Vl1iI7RQ0=
=Cq4Q
-----END PGP SIGNATURE-----

--Zu7H1/6luxU1XJuA--

