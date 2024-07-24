Return-Path: <linux-next+bounces-3121-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A5793AE2C
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 10:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CE71F23BF0
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 08:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D81C14A62F;
	Wed, 24 Jul 2024 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KmLSmkL9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE4414A636
	for <linux-next@vger.kernel.org>; Wed, 24 Jul 2024 08:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721811433; cv=none; b=Kxvub2OrJ0PZJuEfaDeNftD38VrjrRWIFOheAsv5HCKTY+0+9FiYrX/BURw+14SaxDh0+GJcS49B9if7KUvCIPO8K1//kkgAM2QQw9o8fWW4YboGqy6tdSv4czMHKNxGshKY8184FgrjcaNT1SoBAcNxTY3URgWAexUIpnhE/FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721811433; c=relaxed/simple;
	bh=it6TmeD94CbkExwTMtJXO2ImHcBqqRkhW8fJ57kF1wg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RjHspu9lCXktOWn1euoDFpPX5QNbejfmrb11ffhP+NUYEEHqnKtwyu7n6UitJxMF4HnA5jLsa9S3Jd9eTx6k8GdNKWbmoQyCR7vMgwi6nUo/C2shDj4GMqLeb8mnJbxndHPNhnedrEiwk5Oql9dXgeG2os8rv+z1TFB8BMh1KuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KmLSmkL9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-368313809a4so393979f8f.0
        for <linux-next@vger.kernel.org>; Wed, 24 Jul 2024 01:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721811430; x=1722416230; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ex2WAaEgr4Aywnu8Z6YGTbRFYH2z8IgKzkgzd617kh4=;
        b=KmLSmkL9rxd1cFtZtvHS7Z+hOofVhRiCkTU41AYB1FZgY24TED0n49SK4Tn2S1Cb+t
         MWLwTzfLXy6FKoUuWsymABHAcvj0dMMmw9DMAbM/oTNQJjRPVi7xkX91Mb6Vnq5Masgj
         Z2q50feq180VlPfED1pyZJ+V2B4S+mWIAU9O16h8u/8hdPBbRl7HaIjrG/D3k/DWeaAb
         5lTjWepO3EdKs4eKfuJRQDwh2fQE4/b41HKxPpXiBgmlWheJxjI7yd5gmNm6sRtr+/MX
         gMYmPLcPN0NSxmroRX1HrhtNuKfmQUN3sfZg/+im9CGmJXPBLmuJq2I8SYmLtwy/N3dM
         VFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721811430; x=1722416230;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ex2WAaEgr4Aywnu8Z6YGTbRFYH2z8IgKzkgzd617kh4=;
        b=Pg2DPnFhK5pM0dbSTdCvHn+RVUsIFNHS9vTCKs18ukRt/jQwT0rNzpgxpHRHZSLNqL
         Fqs3ktAPsxN3JJ4rZ5M2c7kGfbXaeZNaeYTa7ef/YdMLc2LuUPQkhqbJygGfccstzixI
         KW7tO6m9YgH8sYboPnVhqibliGk9UR4hwCTL0qvYS6vNaRXbNiAa2CnME2noXG3qVW0G
         RiOQEySNIs8mcZ9/o4RIYmhzDhR8rIWDObcg4buhjRRrVSK05Zhpi8NBfHzEYyZdUxrY
         orlyitLhhH0NawL9/rVrh2VBNIAJMC8ihE56UXv6tc8Ya2lTFBCqk5zt+1BU9mW4lnv+
         CY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmyDHgC0s0twZ/rZATghE7giVQ2C8hbqPEWDMvFgENa/eywhUQ4Epni9TiDZYLP/SHy0r6GllNUx3UdzaP+8GMcajgeEdzJlDuKg==
X-Gm-Message-State: AOJu0YxL9VBQujuuztWjFo1cMI4/y+RTQJ8HQM2kvKKK9bT5bzXGaytk
	su49VmNufm4X4e5DVMnY2cKnYfB23HFybGvam80O8hpG0lgfxqTo+W9XX4vjXEM=
X-Google-Smtp-Source: AGHT+IHT9UkzD1uO1lRT5mI9+EExnZOGwlczD2Bif9FSUePHDawxlyCapZD9VsjXCE8jdbXZOpuBgw==
X-Received: by 2002:a5d:5270:0:b0:367:8a2d:b354 with SMTP id ffacd0b85a97d-369f66cef90mr870578f8f.14.1721811429818;
        Wed, 24 Jul 2024 01:57:09 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787ced78sm13792084f8f.74.2024.07.24.01.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 01:57:09 -0700 (PDT)
Message-ID: <a1b7ce4bce1826e9c231677bb221aa44dc842e24.camel@linaro.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the
 samsung-krzk tree
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kishon Vijay Abraham I
	 <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>, Linux Kernel Mailing List
	 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	 <linux-next@vger.kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 24 Jul 2024 09:57:08 +0100
In-Reply-To: <20240724091458.3052dc6f@canb.auug.org.au>
References: <20240703141932.47e51748@canb.auug.org.au>
	 <20240724091458.3052dc6f@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Stephen,

On Wed, 2024-07-24 at 09:14 +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Wed, 3 Jul 2024 14:19:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >=20
> > Today's linux-next merge of the phy-next tree got a conflict in:
> >=20
> > =C2=A0 include/linux/soc/samsung/exynos-regs-pmu.h
> >=20
> > between commit:
> >=20
> > =C2=A0 85863cee8ce0 ("soc: samsung: exynos-pmu: add support for PMU_ALI=
VE non atomic registers")
> >=20
> > from the samsung-krzk tree and commit:
> >=20
> > =C2=A0 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 co=
mbo phy (HS & SS)")
> >=20
> > from the phy-next tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.=C2=A0 You may also want to consider cooperati=
ng
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
> >=20
> > diff --cc include/linux/soc/samsung/exynos-regs-pmu.h
> > index f411c176536d,6765160eaab2..000000000000
> > --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> > +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> > @@@ -657,8 -657,8 +657,12 @@@
> > =C2=A0 #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
> > =C2=A0 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
> > =C2=A0=20
> > =C2=A0+/* For Tensor GS101 */
> > =C2=A0+#define GS101_SYSIP_DAT0					(0x810)
> > =C2=A0+#define GS101_SYSTEM_CONFIGURATION				(0x3A00)
> > =C2=A0+
> > + /* For GS101 */
> > + #define GS101_PHY_CTRL_USB20					0x3eb0
> > + #define GS101_PHY_CTRL_USBDP					0x3eb4
> > +=20
> > =C2=A0 #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */
>=20
> This is now a conflict between he phy-next tree and Linus' tree.

What's the way to resolve this? Can I do something?

Cheers,
Andre'


