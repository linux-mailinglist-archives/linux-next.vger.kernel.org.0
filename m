Return-Path: <linux-next+bounces-7951-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A7CB2679E
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 15:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E55367AF495
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 13:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BC730101C;
	Thu, 14 Aug 2025 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dqs2LwWK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF91301016;
	Thu, 14 Aug 2025 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178437; cv=none; b=JvSfRiut15rCU2kiPEhJIQJx8/wPKjfAHcu9sTAGLTpyA9QnliCx/yconnPzSzS5Rzfm2CUQg/mFWwZxtLmoBccPjwDt/VySuIK1r3K/BQHl+CiwiQpi3UoE110dYlPnMtmOnXqkqr+m09jrrdFZ30hVKYhkvoZyA3/WgpOFYrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178437; c=relaxed/simple;
	bh=6lQwBEN6NnKvVOc4VGYaCNS1h36Oq19PKgeMm3+l0DM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQhX9Ei21MOzH/xLRCM/CdgTZAzjwtrjee+U+DvS1KtlFFHW4kAbQlQfIR5P7kvGldS+i4Vc4J4ISQtxmpuxyYFHCcF2mYXXVDUMweHOryB0KtW8ADwJluUwyoljDgYf7332qP5IW7jp/FCL1yP9O5Ps8DG9V4iBSENfQsD3e4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dqs2LwWK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F099C4CEED;
	Thu, 14 Aug 2025 13:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755178437;
	bh=6lQwBEN6NnKvVOc4VGYaCNS1h36Oq19PKgeMm3+l0DM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dqs2LwWKGnPtWmgtxdcX55BubfCaw152kCnFHquK7YKChy0fpwmLyg2ut7P0z5iBJ
	 iNLCwKWL8O7qKVE5sIUFMVbVdwDdpRr8Ctd7BKtNpTLhGAeyOJECUM5B/ET08K8Aq5
	 AHsHj/NUoQvPBwYePxjNOerCSqavnHp6zSv27yiKrwjOOgb2VM6jy0WNa9AzlsrWYR
	 f0aEZrKdVku0WrXgShPVcCKSiUiZiSpCnwdiVFvfEA22vTFyu0HxuYESMxijLlswd0
	 g9VKBxREqrIXbbhxSRxyo38pZyFmG5TtXX/Cm47i9oK8XS/KXKfawziPF7IcUdiAAt
	 CtlKhYu5/GjdA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6188b74eb30so1482669a12.3;
        Thu, 14 Aug 2025 06:33:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrgiL0e6wAriSDlMYvUT69tyn2ZZGqB6fX4lV5ZllyXH744543/rN3LokCQ3Xl4C+VCxDGE9u1Dtm+KA==@vger.kernel.org, AJvYcCWjvkbjpBa1Qo9SHDG7y2YGnNaYjn86pSNfA+XpTjeE5i/uUNgcjW120CPj0kRoE0tJOEUTcGpJ0uhMokQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyROrkPUIcbSYDULyfrq8/da65ubPmvsUBgq5hdO8xDRTqZkueR
	jpNPtFNPZLG1AJn85Z6727uIjJdHP58XgAv+jX1f6jAzycf4oNBuQrF5254FU8U9PHwXu0uNTWg
	E6r98tvacZ6GWCDNJwhRhclvHp93q+Q==
X-Google-Smtp-Source: AGHT+IEraJ/scYOqLChqQUlIniyfXQkQHLMqUYZSPPTNMjc6ZCI1Q+HLbv38H5lgSxm0haBSn5nH0MLc1O9EmgU6PfY=
X-Received: by 2002:a17:907:3f18:b0:add:fb01:c64a with SMTP id
 a640c23a62f3a-afcb98a51a3mr335748466b.43.1755178435670; Thu, 14 Aug 2025
 06:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814114214.609818aa@canb.auug.org.au> <aJ1M883eMiVCtoaO@mail.minyard.net>
In-Reply-To: <aJ1M883eMiVCtoaO@mail.minyard.net>
From: Rob Herring <robh@kernel.org>
Date: Thu, 14 Aug 2025 08:33:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKargdocdTUwqW2O4FPsFiygUJ0j+o9tshGo=J3S1Zg8g@mail.gmail.com>
X-Gm-Features: Ac12FXx8l57rXBeNRbTDZdH2ifLuVXIXl2aJgCE5WHZI9VUg-2ecu_mTCyObZ0w
Message-ID: <CAL_JsqKargdocdTUwqW2O4FPsFiygUJ0j+o9tshGo=J3S1Zg8g@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the ipmi tree
To: corey@minyard.net
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 9:42=E2=80=AFPM Corey Minyard <corey@minyard.net> w=
rote:
>
> On Thu, Aug 14, 2025 at 11:42:14AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > The following commit is also in the devicetree tree as a different comm=
it
> > (but the same patch):
>
> I think by normal rules this belongs in my tree.  I'm not sure how it
> got into the devicetree tree without my ack.  Or maybe the rules around
> device tree are different.

My mistake. I've dropped it now.

Rob

