Return-Path: <linux-next+bounces-9085-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EF0C6E595
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 12:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 49B1D2E4A2
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 11:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB68352F9E;
	Wed, 19 Nov 2025 11:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkvajU73"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A10350A1E
	for <linux-next@vger.kernel.org>; Wed, 19 Nov 2025 11:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553481; cv=none; b=ZNm7Ox1G9YDqTOE7r+IOwFKW8D4EgKn5UTO1ldyLRElh5SAW3h5+wRP1AMuaGa+bho1vZubMsxDuX4qHHuR+V56D6N32jq2dEjpMTprDTRW8Sbeg8eFu1f2WWYAp5iyiPI4OIU9P1NeIFIQMXQQKTAD9OxL2+vV2Eu0shFaxvA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553481; c=relaxed/simple;
	bh=7TE/MqB3V/dXPNjowVsIZbMqlcky+yArrQOF66u4CDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KS6VN+cu4R1vp1VkaVMKpECSC7c3KWz96Msl9e34VeNXxGbaC5yvhZIIfSQpAGFZQbYYw4B7/dRYo+kZJyn7WGx8QP20cgI93TuWhA7Cs79mCgsfOWBPP2F4FwltNOs1jSWcHH9zrr8cHIIw7e/si8PVeE2E/CK9uoMyVF27RXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkvajU73; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so10474532a12.2
        for <linux-next@vger.kernel.org>; Wed, 19 Nov 2025 03:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763553478; x=1764158278; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U9i/eN4/r/M/jS2enDP1OazU+huvjvpbqLzrftzg8Sk=;
        b=zkvajU73lkmp+T94vRO7ze4bOpgp8U9JHczIRjyi5wYwVNMluFFAvT0nrqi4H4ymfc
         sJ+4qfZtj72jc8yY8mUJTnoiOHzoENbLsYXxu+B9Bs8L4tJWOMyeLCt2IjcyDwDE99Yi
         RX5JTULkcv/LuszkYKNHCvmaDkePM9jPktlsE0ltlb+mob+/pxPeMI7Okjq+ZbkFrkXF
         mbeya6XYUNq//k8C3Gu3ySEZ6BNjFSTq+wrleJZMBmTTi3uZd0J1Dlta2jmO03TSqEve
         qcL0pTtby7fI3GLuvVBKytr4HzGR2VNrDJwD9Ht+Xt70CPQjGyxH9UK+ZE1OZZxT/iGO
         8iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553478; x=1764158278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9i/eN4/r/M/jS2enDP1OazU+huvjvpbqLzrftzg8Sk=;
        b=SnRno0WedAyQmkZAeY9QodshhB5FJTZeR0IySSyB37tPiSEa5RihGyMTiaO+1q83Kt
         jzdzIAKqsKTNPMSYYYk04deVQuTUDA5IM8kys1zj3m+0AZGywdhODt1JncTmKfbtiHNE
         RIMDDqOkPpQnVSsd91e5CEZbscmEG8WuWPppJu5lO1oNPziKftrQxHyZfiY8Fg2db3MN
         4UDT9bia601PWQDebbYeIgjVFErzF+HkxHjo0SmYIS0aLv3gROgDZfBFe7pV6c1FiOqH
         614fED1xYkwd9V2XlY0Tw1WIKU50Wsl/MnLUZp+7bT1IH+Gpy5qRV25JYCVIBATI0r6p
         JbhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW9u3tEzVBWhTzN6MQeZmGPd/6oOeU6Ahh85jGpa+04Rf8cx6paGFqAdTqrqAo3IktJcGKbn8zmcvY@vger.kernel.org
X-Gm-Message-State: AOJu0YzbFz2oIVeg8RJW9oqJG1jGhSKWVJTHa5ofFdUuteykd7D9b4wB
	baIdmE6izOJJxkOe+u6N50+uYRmu+9pTztcRaHY7vNGpzltQrvA/K11oNjYq1tmDlDI6TmkNbiE
	+hj8VYvWakD+SKDL3yNSHBVzbU14OuinuIiLEuyhbJSbRMWL9ubxXWCQ=
X-Gm-Gg: ASbGncuWTZsaBVwRKREfsSr5olF+Ubd21poW4jBI0E7tqHio2lzFG6Rf738x521sTaf
	RGJMe3V7sbCMlBpKQeW3uTs6fZ3BHG9qZ0WP+QZN23MLGvvObJYv+UXGe8NwFP9akTbAW4p3mWc
	kmUuE6fPRh1xUEFRHLP0aRgXLgxlNojLkpKKgocwIs5V4XboeMcx/27HpsO6TQ65j23zU0NS4WO
	DyimZ3qxoXXwpIVhBBVM9MwOLaxnRGRFFZJpfrn+mSL3wcXwFpjBS3yY4BAzANlPn/6S1C7
X-Google-Smtp-Source: AGHT+IE5o18mkf9Vwx5bQSP67rCm4MMIwAEfZ62VkgvlnxCYxRcvH8PJhNiPrgKf332gVD6V6PCfyVxUoop5hCTKHG8=
X-Received: by 2002:a05:6402:40ce:b0:643:804a:fb63 with SMTP id
 4fb4d7f45d1cf-643804b0444mr11108204a12.9.1763553477218; Wed, 19 Nov 2025
 03:57:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114144243.05facfce@canb.auug.org.au> <20251118183319.GR1949330@google.com>
In-Reply-To: <20251118183319.GR1949330@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 19 Nov 2025 12:57:19 +0100
X-Gm-Features: AWmQ_blp8twhBc3jkosdf5oLzvBFRN50nHavnKGt_5sJ4AKmHo3YVzq1J7p0vVA
Message-ID: <CAPDyKFr70C3hXyjVeoMZ2h79yyuau5E_-pZxa2txpHFZc92oOg@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the mfd tree
To: Lee Jones <lee@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 19:33, Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 14 Nov 2025, Stephen Rothwell wrote:
>
> > Hi all,
> >
> > The following commit is also in the pmdomain tree as a different commit
> > (but the same patch):
> >
> >   30ed024fb076 ("mfd: bcm2835-pm: Add support for BCM2712")
> >
> > This is commit
> >
> >   060d111e8a56 ("mfd: bcm2835-pm: Add support for BCM2712")
> >
> > in the pmdolain tree.
>
> Why is this in the pmdomain tree, Ulf?

The corresponding dt doc patch is in my tree too, so to keep them
together, but also because Florian acked/suggested it to me [1].

I can rebase and drop it from my tree, if you prefer to take it via
your tree? The DT doc patch is however on an immutable branch just
named "dt", so you need to pull that in that case. Please let me know
and sorry for the mess!

Br
Uffe

[1]
https://lore.kernel.org/all/CAPDyKFowo7+-C4YLLw4XoWz4fU3ykEP1UVEEneCJXBuDjGTStw@mail.gmail.com/

