Return-Path: <linux-next+bounces-8556-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E91BB7F6F
	for <lists+linux-next@lfdr.de>; Fri, 03 Oct 2025 21:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E990C480A2A
	for <lists+linux-next@lfdr.de>; Fri,  3 Oct 2025 19:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB28C221F03;
	Fri,  3 Oct 2025 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gkGQ0oWh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4251F4165
	for <linux-next@vger.kernel.org>; Fri,  3 Oct 2025 19:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759518985; cv=none; b=Jsb3gaa6aPs7qBXhwwFTUHXJ0min1yDqGJHtks99l+CqmXOi1/MczDwnoslge2SqnR67AbrVClV2LkniN4F9Bk92aCloapm1FQwS+H2hfNJ30jFaIh146OXTuPnY2Lx/I9EUtykr8G5mmJfV7oCt522DK7rDzUo7yfbIrrmAmEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759518985; c=relaxed/simple;
	bh=tVL9p+nxl4y9c+ghVq3bDJ/Nc31UcENUohwqCzhd3MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9rMWLI4Ey4bseXh0anb8Dw/OPx6G1XWvIK1ljOVylVFQ/tieIEJr+Cp/6wziXwNuzVvPQbaHdeESFYK5+EWA9dxiY/EAMaJOwevIo+fmQO5/f5hs3WC2gYTCFTzy3s1XC2KbM2abpV6n5fBnJn68XfSwsQtlNsm34PqfgW0Ckg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gkGQ0oWh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so14936455e9.2
        for <linux-next@vger.kernel.org>; Fri, 03 Oct 2025 12:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759518982; x=1760123782; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CokE/k3sp2q5WMd7ECWNZXq4ObJTrjeetW4zf4kEWnA=;
        b=gkGQ0oWhqqkicVvhl/wFrNDqchmoEXRkcnXCSuEO8zVP+R7ygdOD23Ax5ujlX7iLLX
         W9lffsbkvFmc5XQvcj+1x0mArr67JqWrVRCyaHu6y0SYJbQFdthybHDyElGBBs4FJoLi
         7LKQURLzFq4DbD90hwsKwh5uYn8szWWceEKWYsbPeZtLAEddTeYPaUc2Oz9qbUZbIXJe
         FBoeGzHFvWB4zmVScg/ArFgqgESi07ulID1NemZEKAGihRU9tWsKEmJGByyxLIHTBFO6
         seou0XKxhrn8OuF07KsjyAV5a4K7HgjzV+QjG3KUvFnb/7CTbgkaYa7AVIPAo+I1qcx6
         Rbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759518982; x=1760123782;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CokE/k3sp2q5WMd7ECWNZXq4ObJTrjeetW4zf4kEWnA=;
        b=wLQjqGrZrITBx2FNMALidk4Rar+dwlv5+Mg2K/J9nHylNl3XMqcR7zZ6u08/mSKJpL
         xwmnvdGtB4so26ZaS9LBN2TvZEqD+36M50x/v7lFVksS3FekD+WtsOcFeKr6SZxPhZC8
         trPFr/SQOJPH8wNk4GdglrazyVU4J1jI6x1Ek/Vh8L98hDhz0+6Iwd2yPrnQDx2bgnM1
         oUVLyiUb/hAZ2K/TzLGjtDZnAAv1ICrgoIkDkWzF6/heRZvLGSSCGVWvWg9VEzJGvAHT
         Mfw44A34RIHbLuW985ocxy6NDTTWrKZMttgwiF8Nva+d3VjGeEoUq2SA+LbPYEMuomep
         OIIA==
X-Forwarded-Encrypted: i=1; AJvYcCWMtmsUx/StxO3jTACIA6xEqDWmV5RQ+Y6n2wxlMCL/HdtQ/jj9EbiM2gefZwF6w68T2L5WSJZd1kmM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6HLhfD1jbwJYRw8MCrXQ4RtbC6mFpzQOig+zrvEHEMrB4e0yb
	CRxJljvRSoPJBmh9nx82iu7PJiScC9mHCWekWWf6bgnr2FSxpP4qpoldgFYa/f1FI34=
X-Gm-Gg: ASbGncsyOt3ywRXIw2FO1Qh+EwAEIYQ46o2mMhJ9/vPbs4G+TuRyh1+pP5VjimIii8x
	vnZa9cjTacR4B4B/Z6n7Izf4ueHzt6nhM+myz8Sevq6YqEXqZqjj6k98mCKnZ6kXo+boKbf7RJQ
	35l/TeSL16aVLa5N6e927n+tda1q61y3BrzOHjQbmc2GNqau0x8r0Y14Avp4gQ/vDmS7yAzNGQv
	f08x9zpUxQhWIYAMgRdTiBa1t/gfo9ROEazBHuTZ4fVMmT4MR8/KoeTspNmIBlppGcoZYAOXkqu
	g46Q0eJvbzc4KNp3CpvyGORqmREQWBRAPQWxqoM3VeHJCqunUji/IjgMtGVw9lG75uXgI08yUdk
	O+FAvWrqysNaE0kuAZ+mrA9WI1yfb9X5RTxmcZujoE+935waSl3/WqQhN
X-Google-Smtp-Source: AGHT+IFLZ0QvjwytGIsmgaGtzccZXtbd+f+pX+ocyHIDpS87vpgHFmVAbVGZfoGdGaZFuMKKHMJw+g==
X-Received: by 2002:a05:600c:c4aa:b0:46d:ba6d:65bb with SMTP id 5b1f17b1804b1-46e71146819mr29095885e9.31.1759518982081;
        Fri, 03 Oct 2025 12:16:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e619b8507sm140813195e9.3.2025.10.03.12.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 12:16:21 -0700 (PDT)
Date: Fri, 3 Oct 2025 22:16:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Oct 2
Message-ID: <aOAhAaUQdrFjJMk9@stanley.mountain>
References: <aN6qWFc6hIcbRU1o@sirena.org.uk>
 <aN7cRUOxq-zwCoZN@stanley.mountain>
 <CANiq72mDsU3W5Qfyf=sKhbad4tAHJYF8WnY+4VPz2J0paA2gTw@mail.gmail.com>
 <aN91pwLmB_2TwK77@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aN91pwLmB_2TwK77@stanley.mountain>

On Fri, Oct 03, 2025 at 10:05:11AM +0300, Dan Carpenter wrote:
> On Thu, Oct 02, 2025 at 11:35:10PM +0200, Miguel Ojeda wrote:
> > On Thu, Oct 2, 2025 at 10:10 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > >
> > >   RUSTC L rust/core.o
> > > error: cannot find a built-in macro with name `define_opaque`
> > >     --> /usr/lib/rustlib/src/rust/library/core/src/macros/mod.rs:1757:5
> > >      |
> > > 1757 | /     pub macro define_opaque($($tt:tt)*) {
> > > 1758 | |         /* compiler built-in */
> > > 1759 | |     }
> > >      | |_____^
> > >
> > 
> > Thanks Dan.
> > 
> > Hmm... Strange, it is the `core` library, which comes with the
> > compiler and thus should always work.
> > 
> > So it sounds like a mismatch between the binary used and the sources
> > of the standard library (or perhaps other kind of mismatch, like the
> > wrong edition being passed, but from a quick look it doesn't seem like
> > it).
> > 
> > I will try to reproduce it. Did you happen to recently upgrade the
> > toolchain(s) or something like that, by chance? Are you using the
> > Debian packages?
> 
> Yes.  I am using the debian packages.  To be honest, I don't know it I
> broke it with an update.  It's possible.  I am all the way updated with
> `apt dist-upgrade`.
> 
> I'm on rustc version 1.87.0+dfsg1-1.
> 

It's fixed in today's linux-next.

I did go back and confirm that it was definitely something in the kernel
yesterday.  But it's fixed now, so no worries.

regards,
dan carpenter


