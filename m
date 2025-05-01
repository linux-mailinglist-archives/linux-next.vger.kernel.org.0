Return-Path: <linux-next+bounces-6490-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF44AA5D2E
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 12:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97CE54A0DAA
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 10:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792F621ABCB;
	Thu,  1 May 2025 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzjfVz8d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D7A1E5B8B
	for <linux-next@vger.kernel.org>; Thu,  1 May 2025 10:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746095056; cv=none; b=LgDIsRe/L7x//ABSptIPc6Tn7AI2RFKnNZP+eGtyXLXcDhBeq4phisCR9ipvpqyhPuDJkxMhlp7UyvU0S+9MEMFFFwTDTs5GtCymVhEVz0XMyMdL0y02g+nIW5iH1U+XyLKWauZGw+m3IdMieWv21kQkKnp7g0SaTWuVhsZq1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746095056; c=relaxed/simple;
	bh=DsPNkIC1N8o/Edk9Kwdar5GbDZ/Ys/0uF1BAmU+NY+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9pr4ztkl3ELhiVxiGcw5c5Vb9jBuHfZrtukF25mw4HnY5t/KcBdDgHPf0hJzoUx/iXcxjxY5849ngRF+5QO8QXmd0yFJ0CnLCMPWNTtgxkEqaS9DyzeA9RYlFuDkD+iceekZjQts1g66JRwD2YIUhM8EKN8imSvNdeBsD/I1rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzjfVz8d; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so138662766b.3
        for <linux-next@vger.kernel.org>; Thu, 01 May 2025 03:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746095053; x=1746699853; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DsPNkIC1N8o/Edk9Kwdar5GbDZ/Ys/0uF1BAmU+NY+o=;
        b=LzjfVz8d8FbADtmN2emcEkSldLaWHJK1uiHjEG27XiE1Hw81RBbw4yBEGIhpFUeCb+
         PUS9dtzda20/Gx4a+a71RC8kYUgwRgpyqNZI8Ckyp2L9c/qcLPJPpYCu8xzrGSuKaehS
         HmO+bDUVOQWBkzOAMh7i03voluu0867eTublW5lwlyK0sr9blFf4QObdMyk8X/X/lTY9
         9OBoffHpOLQ5xYtazuhMLMUbOFZxadnSG9gBzdJRTXqJZxhc+NeIsa/HXvIYl7pqu22b
         uc2+c+jsTS024uRi23qmYA0oVa7swkQxDYXRz9FvSAY/MifAZoXFErr2GvmSNbw0JMqn
         Xb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746095053; x=1746699853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsPNkIC1N8o/Edk9Kwdar5GbDZ/Ys/0uF1BAmU+NY+o=;
        b=gUt8SejKSRpuVWbmTkDA1jOWuiJs2aKIEGfH/hRK3lOSRg6QZnJmSwzR9LmuwWi4ZX
         Q1CiN6wtlduNjx04pMIomWO74EODrO9FfL6PnSrZppFGaUB9uvvvwxDbJaMe+CYCZiz3
         c7EqB4/cGbS/7VXHmPz7gDjmE8ZKjZ1t9X5HST1Mf4lVCQ9Z7XDU61mXNh4WjisKGKg+
         wj9grj4QSI0Pw92yfoPRF/Pt0i/5uKYLT6Rtme1v6x10OW8V63iL9pxEKjGOTMsIaA3A
         fKVLsiMfU6Aiw4LXPMCZNndIWzSicneqx6zzUD0ZqtgeBnm3UEL9pKGBzmRczP/bHIuF
         qGPw==
X-Forwarded-Encrypted: i=1; AJvYcCWsLeBfkjnEaBvjBP3HJZI+PfyMP5N6gmEvcvZySp1/f3mUZHsqliSY9Fg1klZMSwarorY6b3smULNG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3+uBlk/tZWGddwQx4d8YNYESvM5Bgsql7gx85BB74n4rjMF51
	bpZEyjfHdgEst3boCWokPOSxe4FeGHxh4IUj3LwF7uwlUTwEuIZriJEmZLzhS+4hurs73ZcyDpX
	d/alXhOVTxC8gkx30Jbi4+yPqz1eMOwf1sCypmg==
X-Gm-Gg: ASbGncvDN39+fPXw+kQ4aFIGDlj79zLgav5WAI3KgIartfiOTdxCouX9R48ys4IHixG
	KvtK3Z05/zuM/aKBXjk4NatbnytZl9x+DjyA3TMe7mtFtBz54diCfoLlCHc339okCnksf3FQyBf
	es5/B3SzKVWs5I4goKjC4BJ1YkjuzQFC00
X-Google-Smtp-Source: AGHT+IG2ekDS4CZIppjCAw/MzlXbJHvZxPVMNFXtvL8IBzq6Zf598iEdE9eaYG1Mu2EXBJJRusavtuWuCoMHMHylleE=
X-Received: by 2002:a17:907:3f1f:b0:acb:4de7:14d8 with SMTP id
 a640c23a62f3a-acee21a69b6mr631701966b.14.1746095052926; Thu, 01 May 2025
 03:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430202315.62bb1c1b@canb.auug.org.au> <2xUHqc3nyQdHW2SNbAQvQwy1mR4qz-vdR0UF8fVwFvm-rDtaJmhOUqJJvNWkneTh1XD58UlvoBT3umKbMjNlYw==@protonmail.internalid>
 <20250430104234.dmwnn5ih232kfk4z@vireshk-i7> <87selo1xdh.fsf@kernel.org>
In-Reply-To: <87selo1xdh.fsf@kernel.org>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 1 May 2025 15:54:01 +0530
X-Gm-Features: ATxdqUHjKvP1KrNdFhp4_8bQbjW0VqsOwYlAsd2KpD8LQCLT_2Dq114053VP1PI
Message-ID: <CAKohponC_E9Ah4wXNNg0YVSo0UuRn+hNq+hxjrccbjeNKWH6Rw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Tamir Duberstein <tamird@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 15:45, Andreas Hindborg <a.hindborg@kernel.org> wrote:

> I might add tags.

That won't change the SHA for the commits, so I can safely rebase over
your patches.

> But I guess now that Stephen carries the merge resolution, we should be fine?

Yes, that would work as well. I anyway have prepared a branch based on
your's, I will push that anyway to avoid merge resolution.

Thanks.

