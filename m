Return-Path: <linux-next+bounces-4646-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4CE9BF48C
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 18:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4AED28619B
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 17:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051842076D1;
	Wed,  6 Nov 2024 17:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BF8u8o0M"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D218817BB0F
	for <linux-next@vger.kernel.org>; Wed,  6 Nov 2024 17:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730915294; cv=none; b=ICgvgNTRQIdpRr5Sjw/ZBbr2jnOJn4FmBmrYATCovd0AONmyFOcYq/XQNERyocP1+LwJlsI9gZWbrgeup1EbHWb3U6OxyM95tw2J3rFCl2Bfhx1NhSZqSBCMFidkXDp/G5xuJOb8lFLhk8BU7+6AAUvBEHqviRyVtf94K05fD+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730915294; c=relaxed/simple;
	bh=XHGR4TbaIFA5RiOjgpvGsz6oPFk+rF9NAYjLz+uUjKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SypyPeEk/7PbDz9LNps4Zi6E2mm95uWJps8WnyfGTn+JONuGoAnB8jH+oAYkmsWC/k8Pthzxgo8/IBXox8CjsbPDaVli0gVV2Ro7ZvOt7znkD3truhM4/keOiMWNZdedswWc0MHi7LMWU0h+SPqe4AwBTYjdxZG5m9O/4SqMfng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BF8u8o0M; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9ed49edd41so5051266b.0
        for <linux-next@vger.kernel.org>; Wed, 06 Nov 2024 09:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1730915291; x=1731520091; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kSRDhdffu4e2+4oYE1K3ibBkFCx+1qf9H7kDEjsKsEc=;
        b=BF8u8o0MFRMMfkaBgmIDHAXqzXQhQO+6disO2QZey4Uvz8lSxm6aK6/0FjRr/hvQo+
         2Z95QkbIAKxNtOtZJuVA4Kj6u0X9fjLBFtvEdwh8oP6PLVRubX7J8gPxXakOanqvDDBB
         7ldOleyAlRvRP/t+S98VsJdwLCzEOc2wP0miE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730915291; x=1731520091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSRDhdffu4e2+4oYE1K3ibBkFCx+1qf9H7kDEjsKsEc=;
        b=YPuFPA+TU9mZ5YnIXAK0vbl55um2K8qe1t5JNgFb2Ir+H+LeXq2sKwxolSMaHZIAvW
         dm2bEfL3xKyYnClRbUWD9+8BAq60te6n0DOlGlEViB3P6d3CnvojDAiGhgPElutGGSV1
         6OatZN7rEVqQGJB+juS3djuFQMveWhYrX/x+wP3a/5TKzUN76aYSSjz8Bd9iVXwlTxC4
         HHPpIw8+guwHrFsz+P00O1jqB1a1VQDC+cZq9mPW5sCPz3QG++gLHHD+D3VsnjuoYEJE
         j7xmhqDLIq0WDwSDTOKdoeTn7R9iafADhRQlNH0RPcR0Pg1i026X59FvDfWmy/YN7+JR
         zm/A==
X-Forwarded-Encrypted: i=1; AJvYcCW7jpc6UmH63Sl4at3ESFLlvPuokH0thdrVjf8STboTG7Exab8YaOhUWfOkqSk8xWPfX0H3F4wob2L2@vger.kernel.org
X-Gm-Message-State: AOJu0YzzeY873Cm7vlt0WO13LKvN/AhG0WcfL+f/CpjAuZMfH2DdNU5b
	t4uaWNcSsMcQy+WO9D8bFwpB4d9sewmLA05SCKOFDf3VIs2mwzoB6h5ZIkpuBJlB9lVW0nmd8Xw
	f
X-Google-Smtp-Source: AGHT+IGVSdYSH1TPzwabxzVkzdJHupfpIRpHgK9dzSKMNqjsjwMSVQImGrs9yzF7gmuKUoi+vj18sw==
X-Received: by 2002:a17:907:7f12:b0:a9a:a96a:e280 with SMTP id a640c23a62f3a-a9de5ed3f84mr3545731766b.20.1730915290914;
        Wed, 06 Nov 2024 09:48:10 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16aecbasm309721666b.32.2024.11.06.09.48.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 09:48:09 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso2819566b.1
        for <linux-next@vger.kernel.org>; Wed, 06 Nov 2024 09:48:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUP5Y62kYC1UHJpf64LY6lYg1KfEiNppOIfa0FvPm8pH8T9UHTw2tzp6/TwjBd+0VAZIimgT1NqLbnF@vger.kernel.org
X-Received: by 2002:a17:907:9405:b0:a9a:1792:f24 with SMTP id
 a640c23a62f3a-a9de5ee19acmr4107136066b.24.1730915289172; Wed, 06 Nov 2024
 09:48:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106140414.760b502c@canb.auug.org.au> <20241106100234.189029a5@gandalf.local.home>
In-Reply-To: <20241106100234.189029a5@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 6 Nov 2024 07:47:52 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjSKCbbQHr7gm9G0z_hdjBSprCyMidi4LhYL7YECdRfqw@mail.gmail.com>
Message-ID: <CAHk-=wjSKCbbQHr7gm9G0z_hdjBSprCyMidi4LhYL7YECdRfqw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the ftrace tree
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>, 
	PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Nov 2024 at 05:02, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> This fix looks fine to me. How should we handle this when we send our pull
> requests to Linus? I may forgot about this issue, and it also matters who's
> tree goes first.

So just mention the issue in the pull request - preferably on both
sides. Particularly for something like this that won't show up as an
actual conflict, and that I won't catch in my build test because it's
ppc-specific, I'd really like both trees to note this, so that
regardless of ordering I'll be aware.

And hey, sometimes people forget, and we'll see this issue (again) in
mainline. It happens. Particularly with these kinds of semantic
conflicts that are so easy to miss.

I've seen this report, of course, but I will have lots of pull
requests the next merge window, so the likelihood of me forgetting
this detail is probably higher than the likelihood of individual
maintainers forgetting about it when they generate their one (or few)
pull request.

                  Linus

