Return-Path: <linux-next+bounces-9182-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4EC811EF
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 15:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F03DB3473FB
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 14:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5CC284881;
	Mon, 24 Nov 2025 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mv6hVsG7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE38A26F2AD
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 14:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763995707; cv=none; b=MFhlPywFCXxEcaHxzuKPRPdMTMZHJBvyW0i4VGIi9mIIle0Jz9cx51710XTCJpe1HAsxk5ylrNNbvZZVP5hMyhc8R8+9rtKkNuo+uU/EyfJlMc5XjH8w+Bde+Mdo7E27cAf3p99GZ0NKGM/HcLmHFAg3t3mVSFvW/k+gZFxud2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763995707; c=relaxed/simple;
	bh=c2nEutTdJgtRKCGvajKNC+M18KV56AGK6EwB0TRNEIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjr+68UucsPm8dLv+A4aRoSZk80Axy3hlud6uCpE8XrPDQApXRlF0fnAApWQoxAC9znnMnEPYa1gs+sdpWVMry42Vjme3QhjwidvVfCEseSDu3NtduoHteHtOfjPt0YN+TpjMG7Js/0o7zWUpnNN48DeWLlTscVh53xaqzu3lY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mv6hVsG7; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso359886a12.0
        for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 06:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763995705; x=1764600505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2nEutTdJgtRKCGvajKNC+M18KV56AGK6EwB0TRNEIQ=;
        b=mv6hVsG7YBN6OYoeifN0r1USyATAKOaeRPMZW3JUdFZUkLHjwPQwHAanwTrjncRdjl
         y93sjXMZKp51U7NViFxCr0QiXMlkXdlqdbyhKd+OyPAmU9yTvs3UdtDcim+Zw8wJccHz
         vl1WDphvA2ni91yQEhSznb4+NsuYb6mvjBvXp9KobNE4/7rN+VAHTK0ULkdDSRKUaNlA
         OCuMjVmE1mi0r+I8o52okIP71BDcCbapSh5l0rDOKV3M+tipYFlZFH8oV2TFEDKtbotp
         c9qew5aZNkB0CflpHfgEO8vhVuencMsuAq6kfWx8eXfc28Zc/YvjpkjG6/tMpBXi9kfw
         tNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763995705; x=1764600505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c2nEutTdJgtRKCGvajKNC+M18KV56AGK6EwB0TRNEIQ=;
        b=IVLGUp3VEacwE1Lg3PGA3RMZtJiNKbjZcduzwWswNE+QXasWPmVML8RuK/OBq/Au9b
         11bcJL+zVCWtGdVb0mMpVC/9arcrsH5qUmPabC8DurG5cJX8WyKoj3q5h7ZBH/DncH5J
         iqiGn+FEuB8fWfw1cHP8wGu85iUBLnE28tQSjugDulU6Nhhh6yBWYnb+fEj5howf2qo0
         5Mnujtk4Fw00ShIEMYcT1gdpGDGFNVVdfE5tX2/squiqzI/j5qkQ+yzkSarNwOqu5Riq
         kDqX6MtcPW46G5CHG0u28PFDtUwlnzw8acEg/rzEa7D0XCfgD6WaX5ViRuvd8/yOp9r5
         0rgw==
X-Forwarded-Encrypted: i=1; AJvYcCWG2CfMExrToCZ5BI3HOwbRjoSihJ0ns9NGeY4S61gvtgsM3rK7ZORDC3mqCOYW9ROiH9hOKbdSLRhj@vger.kernel.org
X-Gm-Message-State: AOJu0Yycv3rDNn5Oorgx50r+Zlf8N5hdql4W9uafYDSsBihXt7HfK7WY
	RpbOQSyanXO/9ZCAXwVN8BODGxZyLztB1ILbQ+oFLRwrI35d3amxZCPBXHergUF4kuMr9jrspsb
	A17NZbIaFAAhSe49w1MQ7Q1plb5Bn5mA=
X-Gm-Gg: ASbGnct2JGIz/0AQmKfPXXL+T/nDZek1uyZ8kgwezIwG5wSlZL89WHWWK98xffvp/18
	vhPKd+e+YBJWXwRhOh1A9mR0kK80AkF0wLqoyCU05EoTD8CuAo6Teyk3IqyCGDsiGCjj55bZkkF
	g4aRxKn04g2A1MvgGT7NYcu/z2+wAMBxtuFU5uSVF5eLovQ07DYGy8q2NJDMQVbp15iRxERDDl6
	YX6evbTQy+NMEiMryq0AVltEDZc7x7vcsY2u89uG5l5u+gQOjl4e6dd0iQ6vsFh2Gm/pcZTf+Dl
	ktTPU9iYxQapjakobTuadx9WvJvOl7l7Y6XhQzVeSOvcb7lWfjAdQLjOJ6+dfvuyjkzDtTnBhO8
	/bnT2I5PXupDvWw==
X-Google-Smtp-Source: AGHT+IEFkT2r28qY9k7Hcfq0YH3j+jnpaw7UuXCDZckyQqzPAJTYiWPdNPOyg1MkH5RUG8llmGoUMhrZRK1J2ioeooo=
X-Received: by 2002:a05:693c:8205:b0:2a4:3592:8624 with SMTP id
 5a478bee46e88-2a7192f501fmr4412080eec.2.1763995704715; Mon, 24 Nov 2025
 06:48:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124231644.38d0303b@canb.auug.org.au> <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <20251125010351.05b0b2d7@canb.auug.org.au> <20251124143537.GS3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20251124143537.GS3245006@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 15:48:12 +0100
X-Gm-Features: AWmQ_blKTPKfV9EhXaT1IkgewkdB7vyk_sAt5yeK0GYWdwVF5iTJIJnqzZFoK3o
Message-ID: <CANiq72kdCJS9ZDX+6B3pecAbfMqpt2XCqOfQfoKWgLaT9DtMpg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, ojeda@kernel.org, boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 3:35=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> At some point in the past... I just did again, and updated the relevant
> packages and rustavailable is still green, but allmodconfig is still not
> giving me rust.
>
> I'm on Debian Testing.

There are several `depends on` for `CONFIG_RUST` as Boqun mentions, so
it is likely one of those is blocking you.

The easiest way to know which one it is is to check what `menuconfig`
computes about the requirements (searching with the `/` command).

Happy to help if that doesn't solve it.

Cheers,
Miguel

