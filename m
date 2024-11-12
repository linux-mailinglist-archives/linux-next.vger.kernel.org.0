Return-Path: <linux-next+bounces-4759-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 207729C512A
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 09:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4DD1F230E2
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 08:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546F620B7FA;
	Tue, 12 Nov 2024 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In6O58hI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89DB154456;
	Tue, 12 Nov 2024 08:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731401433; cv=none; b=FSJbff/0eoIDWOHqJFSOOUvNpbY0xI1l10UZHBdV9BOmuOtL5b2hvjRcZGXkeqM1sN9+ZsVS4Sy9c2odiwvdllOPcGGQvLcWsHopz1SqLVAvp8uj26DA8cUmSGRxODi8575H1GEoYXW99wC3k0KutAY88MGwyp+zRHBo8w7B30I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731401433; c=relaxed/simple;
	bh=03q15j2Lt3IeGTt82CCDiHL9P0XgGA7sbC/p4V8tOcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FX1AgeryFNtm2AlkclPTrAlWEmaDoJ89AjWNrxgC+ayC6+ivZR6n/r1SE2VAj+maQkH2Gh8VvD0Ja4dOE0Pt4zjXXrF33ws65/fzkJq2DlhNJBg5ySOdvbxfjDJr+Up5tnerUNCehr6Mk2koaU7Yy5XpphyxABES+eeccR/22nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In6O58hI; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ea64af4bbbso372860a12.1;
        Tue, 12 Nov 2024 00:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731401431; x=1732006231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03q15j2Lt3IeGTt82CCDiHL9P0XgGA7sbC/p4V8tOcs=;
        b=In6O58hIKTMfcC3E8KPWlfuDD5kLE5lqnSekYzE0ZxOzdhQjtid2URXD99AHMjTPrt
         /fLTICikmuBVCgY0eZ3cWyTeHUGj14vkHRpci193t/soGba2PSs/JA2J/fQBGdmIb2KS
         ewf8vzzNPijEYHejtm6xtj1rJDm6T607hizaTqBGa8rMfT9f9eWck811kK3jcxVZgVlC
         uOxnK7FU3CvVp2DZA6tiMDI5UL1iOTUYr9gwXIEY4THuzEExcNdToOk78sVo6+2LTqLd
         XZtK7FpLbPdNYUxHcW7J9i8StPxlryOwYM7oRv5z119glie1FONcEkqZKe4SAWqH/IBx
         x4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731401431; x=1732006231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03q15j2Lt3IeGTt82CCDiHL9P0XgGA7sbC/p4V8tOcs=;
        b=Zaao2cQhBBohCBNH+dxhcJeG6EKb2QBBQFH9aUPtIQNsz8OcoHFCTwUDNed1pjnhX2
         JgEEfIGJ/WNUbnAV2R/a7mjWY2cotWhnTGjqMzBjOzVNkfiJTGqYAnWY8+IQqpaI2tgw
         JHly0QLiyUpcYn/7nY0/fgDRw7ldsVs03IE3h6KJxt8xvthq3MmDMOojpnmazhyQHuH0
         8K8ZyOVHk2vSZwrFvTQboTCkmtDzmODwPqftBed3cOfastegPEIlD/u+spaFdowuhj3n
         HyVh6MrhmlY/ecKJAtnn1hdx/8dn3NFZY4FAaoJNjC7bEJndGoHZNf2JKTN8MlcRUuFU
         ZDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9DxEYguJBxXJ39ieVGQ6h/K1sufmF0I5Kilu57njn0wTmbR2EqGDgRogUbyrKkP8pi84vysXwjVQAGw==@vger.kernel.org, AJvYcCVGJaalq5DlfHx/bC6SU2Le4lHhN4uGbJfCQ0nDhGx7DFFSjJTbyYBaeGcaTdoGmV0tIPrsmHgOc+kaL1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQlggMVSlm67lEq9q/68bwbnPzEwdu61+dmFPk6FrPbi6R68Ee
	bMU0MGbiGJOiRRcJpXTB0xPCFh6VtUu60vtZ9BjgveuVWk6T3dWJf/7KeztOXTqvm68iJeuyiCm
	Tg/UwWmi8GameQF2s3ySbooCyO94=
X-Google-Smtp-Source: AGHT+IFDw7PNTYCy+RAJj95O+zz3G9plt0FLhubHfcJ8mKg1/oWHQ95bYKlN8xKb+wuqb+75Owt84XotyXCroFWBDl4=
X-Received: by 2002:a17:90b:4b42:b0:2e2:e860:f69d with SMTP id
 98e67ed59e1d1-2e9b167af91mr8695106a91.7.1731401430898; Tue, 12 Nov 2024
 00:50:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111175842.550fc29d@canb.auug.org.au> <CANiq72=JhmDJJCgcG5ex2A1gvBxCg3wzzutUc3L1HLPrPsHeyA@mail.gmail.com>
 <CANiq72nyWAhyORsDij6P6U7Ww=eCp6S=LzPWZN4wxGD8JiK+RQ@mail.gmail.com>
 <CANiq72mYq-53xB9WFTH3H78WLrQuJze-nEybjwyLqnrSbv8UqA@mail.gmail.com> <20241112172920.6aedc927@canb.auug.org.au>
In-Reply-To: <20241112172920.6aedc927@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Nov 2024 09:50:18 +0100
Message-ID: <CANiq72kCYzyYQZVfXOO0u6N2aBccHtEjnAZZr6yoFa85YZVZwQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 7:30=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Its all good, no build failures and conflicts still there (but rerere
> took care of those).

Great, thanks!

Cheers,
Miguel

