Return-Path: <linux-next+bounces-3854-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B25978C3E
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 02:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 581E1287ED5
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 00:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98774C83;
	Sat, 14 Sep 2024 00:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nPlzuzl0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDB14C6E
	for <linux-next@vger.kernel.org>; Sat, 14 Sep 2024 00:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726274623; cv=none; b=kiJSgLgnCGSPxb1pq0QgUria3Ygfdjaa/2c+vtJw3NtSgBXulFvIQ4CrDQmoaChmgb7vAO8wII2DOKHnNNY4iDwuEOXqDVmxu7SF7mQmiLfZN/eEfIsyKYU8jZGyILFgZ9OZx1TYWzAva1Y3b4DC4+oQYl0CP3thzyI4+xHq3ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726274623; c=relaxed/simple;
	bh=TUrY80ehNCka8U/7IMHBt62KZb3yd9vuXPbLAb87cq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQJA+hqQK+S7JvLaF4PybmlLpkzyShAR/GqSuIbSJ9+UuIoclt2ar1Yv6aaI9/TJx3p+874lgcEyY5j+lT4fwEYyWk/lAUi4sRQxBkk7Hk1yiuKyrW8GP8bgIBjXuIGXFwD5m1gnR+Ufr1q8UwFyn09AIM+Ye3xOc3HaWiVFz+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nPlzuzl0; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-39d2a107aebso112265ab.0
        for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 17:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726274621; x=1726879421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUrY80ehNCka8U/7IMHBt62KZb3yd9vuXPbLAb87cq8=;
        b=nPlzuzl0Nc/X+2IaHPj1dbEl5Yce/9K8Swfnhzig9YV4I9dOASphObM/6QXZRvpTZI
         F4TM4iYbmzDoGrRZstzc0fQFf26pcESRMwct5Wj4YGECDEU7v8TEyljDBekDItSWKw3A
         gt9/l3u2ZDnS8szNqWiuiRhJTgtCUXK074P5GPQQrA7mYSRKZwaUd7mF825aSAaBA/RD
         YvMiLvOy9dtcCtZ4ltFJ7kakn1wl4WCg+beHND1VV4YqPN2oaYnlEXiuReS21xaJLwup
         c8z04yEfKemxmHhgpyo70Fl5C0eTNKthhBFyszTdXKo151Iu7cWpCmSpKbwUdB4G6nlz
         iNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726274621; x=1726879421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUrY80ehNCka8U/7IMHBt62KZb3yd9vuXPbLAb87cq8=;
        b=oZWyKrcrStPzp65jLMH9TbAew9UXbiVtxRd8Kdir+TaSHvXtKJCd30alEedZ/QDMDA
         doWCHw4Joz4AnWvIUMRDClB1CBED1Y5DnJbVVHwYAfwCtSGXSRGu072PB5BxsJalYi+l
         F1fgSqZcLliKliwPcTQLQKYSNeSxPChDBkLcKAuXiz3or4NXXIOvnmVGpS6K3O3Whx/r
         RXREN507aDpcD43aNiT6550mQGxeCMLQKPNiyt9eMQyjPolZEUn3YEzpA3C5s9JFw9nR
         MEDualYm7/6WtcEZsvKGw+alkku9FitiFooTC5NSFrRml+guJeRGe/Lvy3IJNuiCtso+
         3uUA==
X-Forwarded-Encrypted: i=1; AJvYcCX7uac2MTYu0GVbXqPwXL1P6OfSaQePTOrK3PL1ba1iXF3Yy2nWsPhYP1LsAwp+M9Mwdt8yDtCA+FGY@vger.kernel.org
X-Gm-Message-State: AOJu0YxmIjzjYKLOA66l9BO+uNteMLlH+HVgUPZkO2bjuK/mHsr0PFGq
	0uMoZXl51wr7PDkkn3YEhD4nGLBcIh4pKS1nQKaivRRepdcb7a22VbBq+h7VcpfFu4b/d7wsPfh
	CQUIY+flr/XsdGuEd04ZhvoZNCoUiopwDsPgY
X-Google-Smtp-Source: AGHT+IHSaLglF5wz9mRniAwttRxI65kTwctZxzJQBTwNtA0gsvJL1chvFzwE6pyoct9NSOfvWET8xaMujC2vxvEZXKc=
X-Received: by 2002:a05:6e02:1c41:b0:39f:3778:c896 with SMTP id
 e9e14a558f8ab-3a0856908e3mr10731525ab.5.1726274621421; Fri, 13 Sep 2024
 17:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913213351.3537411-1-almasrymina@google.com>
 <ZuS0wKBUTSWvD_FZ@casper.infradead.org> <CAHS8izMwQDQ9-JNBpvVeN+yFMzmG+UB-hJWVtz_-ty+NHUdyGA@mail.gmail.com>
 <20240913171729.6bf3de40@kernel.org>
In-Reply-To: <20240913171729.6bf3de40@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Sep 2024 17:43:29 -0700
Message-ID: <CAHS8izO+AgUQwMXQ_17bRvLetcgSUJCXhOeQre2Z49XDd8kdrQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
To: Jakub Kicinski <kuba@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 5:17=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 13 Sep 2024 15:20:13 -0700 Mina Almasry wrote:
> > I have not reported the issue to GCC yet. From the build break thread
> > it seemed a fix was urgent, so I posted the fix and was planning to
> > report the issue after. If not, no problem, I'll report the issue and
> > repost the fix with a GCC bugzilla link, waiting 24hr before reposts
> > this time.
>
> I should have clarified, the "please post ASAP" applies
> to all devmem build fixes, ignore the cool down period :)
>
> > I just need to go through the steps in https://gcc.gnu.org/bugs/,
> > shouldn't be an issue.
>
> Just post the link here, I'll add it to the commit msg when applying.

Ah, I need a GCC bugzilla account before I can file bugs there. I
don't currently have one and creating an account involves emailing
them and waiting 24hr. I've done that and am waiting for an account.
I'll file the issue as soon as I get access and post the link here.
I'm also poking to see if anyone around already has an account and can
file the issue on my behalf.

--
Thanks,
Mina

