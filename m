Return-Path: <linux-next+bounces-9113-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E62C73BF6
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 12:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8057C361730
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 11:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7D732D0EF;
	Thu, 20 Nov 2025 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amCVpGVv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0030276C
	for <linux-next@vger.kernel.org>; Thu, 20 Nov 2025 11:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638074; cv=none; b=j6vsOWCFhXZ7eCMLl6qxvYYp+b+qs5d4MfhGZGThCy9UiHBSx8HnYspbR2f+vC52PMWTDZi6vRoB6pal+h69LLdeMgPF7xVUNuVy9KMDVIIqBssLghQdx0fwh6Bs6zh1Xb3ohrU938/ZRFOiD6r5NmJcPQYzCGMLyL+a34Uf8tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638074; c=relaxed/simple;
	bh=ib0UIR2IzrkHGp0FmCccMgUgPPtKxUM3t6yhJjEP6XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqGtAxbdX7qkwnKIIR+h2Q4y1VQX9ddP+W/ldFUr4NywPQCpmuvbct5lO5Ba+vqK2udRbwVkuz0RhHu3Ev10Y5Q9iS4TZgO26MSXmE9zF4CxKwYkjr5MX4Dq0YEql9vxo+lEsLsewzCZHq+12DJvpNsWCfCvaMZi9tckkAVd39g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amCVpGVv; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37a3d86b773so6520581fa.0
        for <linux-next@vger.kernel.org>; Thu, 20 Nov 2025 03:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763638069; x=1764242869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZD/bC/6uIBdkFBsKDOOak4UdHbJI7vEooF746YRLAM=;
        b=amCVpGVvYUSNAnI/bLmimfBDO5eBrQHaa6IKJc5GvYv28DwJGcpN6Mur7JrfbyBlw5
         0u5/7rEOpcw6+94y4/5VnOUyAW8MBXGPI/2s6Brak2J95xYrHHDPrAkq7dF9/zafMi6z
         +0cQ5YE+iiPnGI+wywV+9JRe0MbhWpERXOdmygSZBeM+bAoEknhVLlTWLPwXFc3t6C+F
         oseF6wqvWMfzaKMvAJ4a+3KyUbRP1YyjqgGWsUEosC8czvBK0l2GahPJUp5U8lZPlmr7
         zBcMgQUnWmBNIFLpNH2lehWlHNpv3Yjc7Vm3M9NOVUA2VrHObkaO0yis5ldRYuLUlEb3
         rrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638069; x=1764242869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CZD/bC/6uIBdkFBsKDOOak4UdHbJI7vEooF746YRLAM=;
        b=eioqZYKw+tlPhA0y19THQImhLyyp/9Gkvwo/InLo3laaqKJBnQI3HNsKyXG3gVK5ij
         PDP3maRBGZa5eDhQiMw57N2u3qXpJiHrQ6KA/GUzffoZsuAJ/DWtqxVkDSqxkxnK9S0T
         koRQImpW4dI5/BXgsdd3HalPQEB60UKoNEQ80ZiMU06BQBnWQXZwWcuvVj+nQxvtitvF
         EeNtBfgxD7JJy+0wDGCa04UFz1iudjKh7B0Loyowg2KifVX0VnYeXRZGQ78+A5L6D7Wh
         UM2XEVoxIJSGcKG8EVHrIBLsAMhGankGiUXGxATowUYzajgPlDXgsXoewTmP7x4GPWai
         xZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL0+fdTDSfgHXkjCBHt9o5APkh/NfK+QzjNXv/E2CYTNeuVtAeZpcBDKrPkHZIIYSadWTA3RrSKBoM@vger.kernel.org
X-Gm-Message-State: AOJu0YybACCZFtIkDa8BN0KDiCSmX2q3cy5WdvE39yDs6lg1Fi5Ohzwn
	fdHe27bewAlgy10GGfDiwDrDPfpvhFMo1EyH5kq6lb5oRzyKhHVSeAlYwC/LUy2IwiqkBSVMMeE
	aVBAtGwAxE4eC+ONeCUt1ohGJ4QZn3qA=
X-Gm-Gg: ASbGncuw2iqwU/MrMrOf4bdhGx2ubBcEmDLhqleiTaQzDFsJIBOKF0tvs+CFxGAPeTG
	SJltZzURBeBSsgLRyg/gZNmcxYBinthhHbWgE/yQKHdhIZsusC6x5LFhnyRWTuUu08xkPy1EIX5
	5S4zODIpF9GRPBIrxdJnGZeq9NLZlLoB5iTYOexFQQv7tvN1CgCQxxYkFMrOYk2D9HP210fQED/
	ADUnsBTHaR5NOeczcKgNuvl3smQeeJXN0pteVUGaw2GlLtomV7VxDEOqM5BAjyjwZprA5v3FWyx
	Yq24YB0FXuiiJU6JgYczwycgmKYeiHRKxd8NbfKWlTv5URUi1sppv5uEax6MgkJ9Y9csk+j1Pk3
	oP+thb0w1MVdyB2Lm4NSx31UdntLkIsvrjvmoXtzB6w==
X-Google-Smtp-Source: AGHT+IHPG9AI6dOQf56ZC58Wydb3ZNPwDhF/R1c/6OuV/bJRYnMVq0LwhgywCZUT00I7n3i/0gHgpZbWp3qx9XELFUk=
X-Received: by 2002:a2e:9cd0:0:b0:378:ec26:bac with SMTP id
 38308e7fff4ca-37cc6752219mr6705451fa.15.1763638069193; Thu, 20 Nov 2025
 03:27:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120181111.65ce75a0@canb.auug.org.au> <CANiq72mW=zMbt2W2Omn4PnMDDJfqz3tDtrneMOFz2ysQ34T8zg@mail.gmail.com>
In-Reply-To: <CANiq72mW=zMbt2W2Omn4PnMDDJfqz3tDtrneMOFz2ysQ34T8zg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 20 Nov 2025 06:27:13 -0500
X-Gm-Features: AWmQ_bk9Euumi20gFsu7g-QUuPgE5zWo-nIbn3ormtkVN7gG379LW4nNbwHYZ_c
Message-ID: <CAJ-ks9=LxO8zTy7rQCiXrZGuwwN5d0gqVkQVE_S2QZnXTdu-Ug@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 4:15=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Nov 20, 2025 at 8:11=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
> >
> > I have applied the following (hack) merge resolution for today.
>
> Thanks a lot Stephen for taking the time to do that instead of dropping i=
t.
>
> We should be able to do the same as Tamir did in commit 657403637f7d
> ("rust: acpi: use `core::ffi::CStr` method names"), i.e. move the
> build assert below to then be able to use `len()` instead:
>
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index aea1b44d189b..f67c355c988e 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -43,11 +43,8 @@ impl DeviceId {
>      /// Create a new device id from an I2C 'id' string.
>      #[inline(always)]
>      pub const fn new(id: &'static CStr) -> Self {
> -        build_assert!(
> -            id.len_with_nul() <=3D Self::I2C_NAME_SIZE,
> -            "ID exceeds 20 bytes"
> -        );
> -        let src =3D id.as_bytes_with_nul();
> +        let src =3D id.to_bytes_with_nul();
> +        build_assert!(src.len() <=3D Self::I2C_NAME_SIZE, "ID exceeds 20=
 bytes");
>          let mut i2c: bindings::i2c_device_id =3D pin_init::zeroed();
>          let mut i =3D 0;
>          while i < src.len() {
> @@ -433,11 +430,8 @@ impl I2cBoardInfo {
>      /// Create a new [`I2cBoardInfo`] for a kernel driver.
>      #[inline(always)]
>      pub const fn new(type_: &'static CStr, addr: u16) -> Self {
> -        build_assert!(
> -            type_.len_with_nul() <=3D Self::I2C_TYPE_SIZE,
> -            "Type exceeds 20 bytes"
> -        );
> -        let src =3D type_.as_bytes_with_nul();
> +        let src =3D type_.to_bytes_with_nul();
> +        build_assert!(src.len() <=3D Self::I2C_TYPE_SIZE, "Type exceeds
> 20 bytes");
>          let mut i2c_board_info: bindings::i2c_board_info =3D pin_init::z=
eroed();
>          let mut i: usize =3D 0;
>          while i < src.len() {
>
> Igor/Tamir?

Yep, looks correct to me!

