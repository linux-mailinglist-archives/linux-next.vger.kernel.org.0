Return-Path: <linux-next+bounces-4677-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E30899C08EC
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 15:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A82DD284681
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 14:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AA321216A;
	Thu,  7 Nov 2024 14:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8XANMet"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C528E168BD;
	Thu,  7 Nov 2024 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730989902; cv=none; b=am8NoJfu+z6R94eIUqGX7HAs+OML5mCdFKGYCwle5EXEm+9cZOGaERxO+MEq8B4BG+OLC8jO7GcGsX56mQCPfmrCQJYAQBeD/WCWoq44tjBZV1OUeUfDpuh6YfpNf4Niw6u5N/4KsHYoZ70aPRvWPmdfMf4dT2RvzwX7VU6o34Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730989902; c=relaxed/simple;
	bh=Ek0EJDP9PHjwQQaqfhHm96VEoeJggzdZuE9i0svJpsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLMNh5RMxBQMIUraQCUS7K6ci6U7ix5tjDdyW8J01f5LsN+lfJ1UzILP7IPRDMdtXEqBtjUEb7U9gqh5UdYj2/w1Z1xXRgVgE3pGADoX6sPieSh/UTRRKqNABaLuByZ1R3onDc8qbeAyD9TbuX4q+Zi+1QROB9N3eGRg3CVdzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8XANMet; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e2d1b7bd57so92227a91.1;
        Thu, 07 Nov 2024 06:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730989900; x=1731594700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek0EJDP9PHjwQQaqfhHm96VEoeJggzdZuE9i0svJpsA=;
        b=f8XANMetChqe9WgyxEWtvZ6YmxMd56mXf9eRclplyouGrdHxkASGXa/uSjCvKX2J/+
         FMSNrVQ9zg1rZh+KtctRB9YPuzOl0tmDJ8TyMhFxNzzCfun1yZri5/bZTNdb/qr9rcMp
         VIMV4baFmYXeTRyIkoqQjQpnsMqJd3+54Id+YbF8aKKHOFY7gwEbKUmUPfNIKSvtuBbf
         t3Ac135aXQsZ4RbZoDGgu3tGQVDynwbeOo1ikr+6lbanaGv4duUNZ5FRHu54i2u8jZ3L
         wRP/uiDLmZmODEOgeVflax7BRlI9jadIiNyTaRkDgnGQh3G9MFOiC+6ZULCjc/A7o+4Q
         308w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730989900; x=1731594700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek0EJDP9PHjwQQaqfhHm96VEoeJggzdZuE9i0svJpsA=;
        b=lKrFZ1pzfMQAw8f5Sl8RPVvYuFDIIdsblQPqXCg4zmy8sYbwAHOZl9WZWc/Q6fh2+U
         hmcmbQ3+38GvHDAZpf0unAjcuoLv7y4Awa3u5eweW44xtGtm7t74MT03VRDVxMTSLeJN
         kx1CyxDkwLCjWkORP8fNJcJ1bG8R7bSXXJaIFswuOZ/JoQJ+iDRRQ5L72YNCICPGSbBA
         9DXeBt0DcjPPmDIXagF+BHM/wH6sLuI3p1K2RWxMur3nidv/VUW3bzXsl/Q8StQJcqGy
         AwHIU0uZL4jq2Vn8bmpV6m4kVAUD/HDMpm+wAKXyrbG4OFnKdqD/3oYG1Q/TAWFOmPYE
         TtIg==
X-Forwarded-Encrypted: i=1; AJvYcCUEJByS8V8pSMZQaXMOX3sDHb/Vqui2EZM7ySgfIz9ZC+XTyLKhaxdiw7BpLkqFz96U8mszgP90ApRsBQ==@vger.kernel.org, AJvYcCUl6veXcc6rg+aN5DEyDwN7n5TL7o4ycOM7aCqdNuEskMmYiRZ6Wqf/gNU+aaniDeDCqAeaF9y9GCL/M/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRlyxPW67TNh6/weS8RLmKh4CZZwMktlX+TrwRWodg47UniQUn
	nl8soqMpxavZQrv9Y9Z/dWE6SdSWE7bsPufQ6PzRpkgIrEM3KxI2DwJpOH6GX7YntUt99bfGWAj
	X+LNKI7Dhlbn9ozV+MxrkBN1OHj8=
X-Google-Smtp-Source: AGHT+IGZdOJDk4fZZ2ZKGbiwvgZpInqg3zx+v+B59S7HLyY4fGDGERIs/IJK9qQzFn3i3apVhYDLvprqmd7gYVU4Lv0=
X-Received: by 2002:a17:90b:1810:b0:2e2:da8c:3fb8 with SMTP id
 98e67ed59e1d1-2e9afae97d6mr94432a91.6.1730989899924; Thu, 07 Nov 2024
 06:31:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107182411.57e2b418@canb.auug.org.au> <20241107103414.GT10375@noisy.programming.kicks-ass.net>
In-Reply-To: <20241107103414.GT10375@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 7 Nov 2024 15:31:27 +0100
Message-ID: <CANiq72kkiwaMpeKgNLYiCSMX_VK7a+6Xu4iQrDiB_cpnXpokxg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, bigeasy@linutronix.de, boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 11:34=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> So I can't get RUST=3Dy, even though make rustavailable is happy.

If you get the chance, please check in e.g. `menuconfig` the unmet `depends=
 on`.

It could be e.g. the `!CALL_PADDING` one if you have an older `rustc`
than Stephen.

Cheers,
Miguel

