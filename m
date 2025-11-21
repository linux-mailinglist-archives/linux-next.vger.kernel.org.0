Return-Path: <linux-next+bounces-9142-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3058DC78FFA
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 13:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id D846F29851
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 12:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF022F9DAD;
	Fri, 21 Nov 2025 12:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5nneqP5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7774E2D4816
	for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 12:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763727449; cv=none; b=QJD8BX+r+w8Ub0vVrHvbTFJsITdYGK4tRLE7BaU85106Wom58gP3eaaE2odMTz4nkml8V8GaZajYqYuJQ2nZpc3BGRAnQQWiWGtF6M9qt7Y9uwbZt4778dkskrMIMv3dVVTv6NQ34tvuHJCoACBZiM04krNos/eSkii9XS0DYPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763727449; c=relaxed/simple;
	bh=pTtMZuxxBQGxJv3Zio+AZloYLt2PGJ0PYy9YRomJx/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKnlGcM/aNeSfPooe+PveekBCAtecsQPqZGkDtPWhb4+90Ajx/U7P4W4xkpYM0yGw24HxNooN3R+nBx6sy3pWqhsHG1IrlbMJWJAKU15EOrle6e49al/YRmn6WWcQupaaRMRG7hNsXYP/8uUIiO/VD+jsoMSu3BjVw9J0h3VVdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5nneqP5; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37a33f49018so16026271fa.2
        for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 04:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763727445; x=1764332245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0tOyzXws1Y+QHvSXf6EpbXGEyRIqpJ1n9hB+9ssiC0=;
        b=U5nneqP5QVkcXidRTXPvSjyz6YXFtzl3XTUpmjsn9K3STDSB8hEuUZIMHukfl8ZmLq
         vbKr1Wd5F50K0FMHP2SeCmkJUUvmsyGeOYWpzZXjln3aX9WgLtWPFhVpEBRZVTFddrRn
         6B9EMysoB2xanhOdbQJB86eW0SHPsSMVahzvJ7bPFOVJBhtHYeVlWqfAEFc+RquJTMtm
         x8M7PvJawQq8al0J3gn8Be17KKto9Xq43VTMJCo0LsQz4B7pNb4qGzit3n0k10Q4I6Mp
         r7+dnH/kLb5Bz8Gxdva4kFCI5kcrVEnRwgd2yvlEBMJSnOdQGXg4GxOGrYMXWg1trO4z
         Xk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763727445; x=1764332245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n0tOyzXws1Y+QHvSXf6EpbXGEyRIqpJ1n9hB+9ssiC0=;
        b=ntQ+UTb4tW5v57dsJQZJamZT/H4/p+sr5gqSR4pt7WhPtOM291rWnyQPCDgRfBoydl
         afchTbAmwvQ1eCYRedxIUfvX/gAK95G4Q+/Vo/Gc98NEuHLybQmjjow4nbGrwtVZmcHy
         W+kLh+pnpbjqQVu0sCyDHM/ZStHXAQxJRT/9Bm/1AfB8W1sOXmS3jcZjBBjroOM2u+er
         zus6IAA8JD3yADK1pzcQxMy+jZ8NxnYqX3KHEnkfqM5YbBS87Lf6e5GxjEA8Gk9+0cPH
         MBOP/dbbPL8ko4oeBLZUcznsfTp/tVyNGe+FVf2p8m6xvY+3MN6qPBgSvTCuL3jFVZMh
         +xmw==
X-Forwarded-Encrypted: i=1; AJvYcCUTeOg7Gqbj5HrdNC4ZmOv3TguAaGsCf8WcH9WJzHoUNfDIumxlpIuX3mkM0ON3NCPN3Ury+l2yDXwb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf4jrgA253Q6kwaiNPVNt4y8s028YRfnm/kxa8eIQq1fMgWTmH
	wEgfjaUFexMLGuxF2b6IITdpjLqUfpiQ8ioFmvaiKDo6eHXN/nhRSgj5HLuKvRWmmPI2pQsD+Nj
	gJbbSxiD6rac8Ar0zrwe3VlhaD9cljfU=
X-Gm-Gg: ASbGnct3cRf9YLIaZumFc+8pzJPO2VnWN5lwUOhxDFaHu2j7mhsVI+mfxu36JXfSkrm
	a3Fqe7se6ygQmu6I0mybfaKjIPaFJd2Yd3sGPRFJpj2SvgE8hrP9XHz2C0cj4xm+b0MmjMz4UPK
	LB8jR+UAcu7ln5SYlDcbcl9JcyljkxUPj5LeshYuE/N3l6/EGqay1Q0cImvDGwSdbCCrMlwS75Z
	bQ5X5YfQfUGlBaVpfCO554FFxjGwjeU/EYbURBFSBEyf1WfCCEdC0/hT3XiBmIH/WdbGol7vTzB
	rDx6ngt8ug3gihsk1/+jzPla17/fJSI7GkbmZDTDsK2eIyw89SQOXKtrzRKM1b8AVXcm+zQOn3T
	65zS53D+d5gtVeOG0kMeDZDt+R+8wqWNIKHBS+WuQ4Q==
X-Google-Smtp-Source: AGHT+IFO9tCnZ69eXuNN9w1sRkDTRWzGtCW0DFx+6Ljy2GWzvlQ4N+ERBYjnz586wZFfN2+IA2v7Iqz3pbdus7hlH5E=
X-Received: by 2002:a05:651c:41c6:b0:37a:3033:16f6 with SMTP id
 38308e7fff4ca-37cd9259753mr5013701fa.35.1763727445171; Fri, 21 Nov 2025
 04:17:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120181111.65ce75a0@canb.auug.org.au> <CANiq72mW=zMbt2W2Omn4PnMDDJfqz3tDtrneMOFz2ysQ34T8zg@mail.gmail.com>
 <CAJ-ks9=LxO8zTy7rQCiXrZGuwwN5d0gqVkQVE_S2QZnXTdu-Ug@mail.gmail.com> <20251121153906.1d306ad1@canb.auug.org.au>
In-Reply-To: <20251121153906.1d306ad1@canb.auug.org.au>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 21 Nov 2025 07:16:49 -0500
X-Gm-Features: AWmQ_bllIQ4d27VqfMeE2bg8rK41vV_Czv1q1B0dzkq54H1jfJ5fxBrqoWewVZY
Message-ID: <CAJ-ks9k1=BLFCfjVrMqQ5u_ak6+g=HtQ6_TP4ZtazPhk0Z76YA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 11:39=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> On Thu, 20 Nov 2025 06:27:13 -0500 Tamir Duberstein <tamird@gmail.com> wr=
ote:
> >
> > On Thu, Nov 20, 2025 at 4:15=E2=80=AFAM Miguel Ojeda <miguel.ojeda.sand=
onis@gmail.com> wrote:
> > >
> > > On Thu, Nov 20, 2025 at 8:11=E2=80=AFAM Stephen Rothwell <sfr@canb.au=
ug.org.au> wrote:
> > > >
> > > > I have applied the following (hack) merge resolution for today.
> > >
> > > Thanks a lot Stephen for taking the time to do that instead of droppi=
ng it.
> > >
> > > We should be able to do the same as Tamir did in commit 657403637f7d
> > > ("rust: acpi: use `core::ffi::CStr` method names"), i.e. move the
> > > build assert below to then be able to use `len()` instead:
> > >
> > > diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> > > index aea1b44d189b..f67c355c988e 100644
> > > --- a/rust/kernel/i2c.rs
> > > +++ b/rust/kernel/i2c.rs
> > > @@ -43,11 +43,8 @@ impl DeviceId {
> > >      /// Create a new device id from an I2C 'id' string.
> > >      #[inline(always)]
> > >      pub const fn new(id: &'static CStr) -> Self {
> > > -        build_assert!(
> > > -            id.len_with_nul() <=3D Self::I2C_NAME_SIZE,
> > > -            "ID exceeds 20 bytes"
> > > -        );
> > > -        let src =3D id.as_bytes_with_nul();
> > > +        let src =3D id.to_bytes_with_nul();
> > > +        build_assert!(src.len() <=3D Self::I2C_NAME_SIZE, "ID exceed=
s 20 bytes");
> > >          let mut i2c: bindings::i2c_device_id =3D pin_init::zeroed();
> > >          let mut i =3D 0;
> > >          while i < src.len() {
> > > @@ -433,11 +430,8 @@ impl I2cBoardInfo {
> > >      /// Create a new [`I2cBoardInfo`] for a kernel driver.
> > >      #[inline(always)]
> > >      pub const fn new(type_: &'static CStr, addr: u16) -> Self {
> > > -        build_assert!(
> > > -            type_.len_with_nul() <=3D Self::I2C_TYPE_SIZE,
> > > -            "Type exceeds 20 bytes"
> > > -        );
> > > -        let src =3D type_.as_bytes_with_nul();
> > > +        let src =3D type_.to_bytes_with_nul();
> > > +        build_assert!(src.len() <=3D Self::I2C_TYPE_SIZE, "Type exce=
eds
> > > 20 bytes");
> > >          let mut i2c_board_info: bindings::i2c_board_info =3D pin_ini=
t::zeroed();
> > >          let mut i: usize =3D 0;
> > >          while i < src.len() {
> > >
> > > Igor/Tamir?
> >
> > Yep, looks correct to me!
>
> OK, I have used that from today.
>
> Could that fix just be applied to the driver-core tree now?  Or does it
> depend on changes in the rust tree?

I don't see why not. It does not depend on changes in the rust tree.
@Danilo Krummrich?

