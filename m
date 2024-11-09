Return-Path: <linux-next+bounces-4717-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EFD9C2C51
	for <lists+linux-next@lfdr.de>; Sat,  9 Nov 2024 12:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E93C02821CE
	for <lists+linux-next@lfdr.de>; Sat,  9 Nov 2024 11:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1877B15CD4A;
	Sat,  9 Nov 2024 11:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYZnHLQk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A673315443D;
	Sat,  9 Nov 2024 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731153340; cv=none; b=j1Gzbj4WMyz87Hi7kAzFZARP8V3C6GShwC/c3QSVGGasK/3bdz+cl90C/MN/rc75Yn0VIjMZBYB6T4ZyX/0ZZ/GwW7Ky1c+h+q3ohhMmFaz4W+3B+Kl/kDk5YwmVkZT8VjxuoztKl58QlqJScBJRq+6N5je14AfFDGUeXmDr9Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731153340; c=relaxed/simple;
	bh=v5DR9Y8IMp2bB9wMEKfocNElR12YTumIzSizGSc4L4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pV/EgAgR5sb2bhNky/R/CmUwkvUQMWDcXbIb3fJ8RPx9F/C00VMxzMQJtRrvUHlqIXHpOjsoJQMG59RQDXepXAYRef42qWToo2XCU7RXQbSrqYACYmTC/E3d9pC/mRsRMlZhOIgeO4r2sg4BAFXUMMdW9DOHFonugPptYCaBl0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYZnHLQk; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e2b4110341so55812a91.1;
        Sat, 09 Nov 2024 03:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731153338; x=1731758138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5DR9Y8IMp2bB9wMEKfocNElR12YTumIzSizGSc4L4A=;
        b=RYZnHLQkXgrFgj/2/cc6B7scO9t/L5UY8Iw3IwTYhIJNRlwgqQxvOI4WRPzvlOw8jL
         wpF52rjZvuKsEQV0IL4ffKEXTu7vcJqMWX0tBFphgYSJH7js/tYvgg3/ipUKoYp7rJCs
         sfDIGBv6wPJn5uOafMsX45x08K+1UHog62jMLdwXlsSLRrlrYdprP1zhLmOu1fsyNbNJ
         M2wbPOUBoyYy5Axz5R5s1giVzFVxBs+ewH7yxKvN2mnP/tkcS2L5N2L12RY2YJEffan1
         hPcCSgjBE1YOCE/NE0iyHTbveV29Da51fTtoi6kacPG88Mydf9W9+axRMdLHhbXwnFNR
         68Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731153338; x=1731758138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5DR9Y8IMp2bB9wMEKfocNElR12YTumIzSizGSc4L4A=;
        b=UGgAc/h4n1RJxihkLchkkG7ijx8c9Mmf1ll/sEF/IS2jlR65u6Tbf8Z7gLppv9eTyq
         ZulVbeNjsBhqCD5QUw7zooEkgR4sYeYKlGssuiMtDyemTJ7S7fO0+dkAnDYfpoTzinbg
         o1Gd6f+/Jg6Yqfs7qkU6Z9ApJXAp9YCz2lC5Unv1tOCOR8cjpUk6G8IzGo+c1xdha4C+
         pWQwRPcFLTcAV/fOlTalrn/rKAOrMOLygWLNgN72u5Zo3kUnl+96jqrQF3EfnmvOeBmD
         KMXagNdJfU4c5e0MtmJXzJlUZs/ntgbb8hO3d4bGSthKYsCOxxSoCUGttUDtlqnMIoCV
         4/vw==
X-Forwarded-Encrypted: i=1; AJvYcCUQJIdfHxCg3Hw0jvVGxsTP/YhvPiqX1pNbii1q1AKX4b4AcqqGrppE8ZG3ui1GJf/AWx2/cTsjzUwvCEk=@vger.kernel.org, AJvYcCUfje7iRxoV8fhr78DgF1QRPtpnzh5yIljEHU6aAd2kmf/vzRvm+jKpDRZfJCq7GBgTBkQo9rnPgzaz3Q==@vger.kernel.org, AJvYcCVKXZROzIZtlUhKE31dsTw8yL2pMPzMwRHUll1k77/xNg9J5KHG113XFiIvtIfQkXp/cbuxdsrqZOCP2leXpE8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0x6OR/uWyAsNRFP/ew6Dospz/TDMFDYdu7zbqK6ChQLOKh1L3
	63ren5p4vIAPkyqWbVRHmU1T2MI6aJqG7e+R9bY474S5IDov4GpAeL4DVzBBxs96ODIsGBfIBTJ
	Fr7zJs7KHpQZIAMtRZCyRoy/eBE8=
X-Google-Smtp-Source: AGHT+IGR6lD0E1+DClZXLbpmTWz7OZp6XMfURV7dNLe3yHzXLDf39Il2ege4gQFImQEnA6BcfXYwWR85vr9D8uu3Q/s=
X-Received: by 2002:a17:902:c94e:b0:20c:c482:1d6d with SMTP id
 d9443c01a7336-211835354ebmr34381045ad.8.1731153337830; Sat, 09 Nov 2024
 03:55:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108152149.28459a72@canb.auug.org.au> <20241108095933.72400ee1@gandalf.local.home>
 <CAH5fLgj6zSDH6Oe3oqfE7F+NQSgSLxh8x7X3ewrrDAdOHOh0YA@mail.gmail.com>
 <20241108153503.1db26d04@gandalf.local.home> <CANiq72mP15rjfR3cMZH-z9hkTDQfqgEaM4M+71B1KWLmw=3cPA@mail.gmail.com>
 <CANiq72m9T7NM33SCw=7yssTXFy=7FvD9zS26ZnBT6RMJB6ze1w@mail.gmail.com> <7B5D1CF7-0DBD-4F19-8587-32516DCE233B@goodmis.org>
In-Reply-To: <7B5D1CF7-0DBD-4F19-8587-32516DCE233B@goodmis.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 9 Nov 2024 12:55:25 +0100
Message-ID: <CANiq72kg2k6cn3J_x+DZVGgSKwVXF_bLHFYsuexPHHg6T7b7BQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the ftrace tree
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Masami Hiramatsu <mhiramat@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 12:09=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> Are you going to take this or do you want me to?

This requires the patch that it fixes, which you are carrying, so I
can't take it, no? Or am I confused?

> If you want me to take it, can you send it to linux-trace-kernel@vger.ker=
nel.org?

Sure (assuming the above is correct).

Thanks!

Cheers,
Miguel

