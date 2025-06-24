Return-Path: <linux-next+bounces-7236-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11DAE64E8
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 14:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF5753AE5A9
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 12:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3265284682;
	Tue, 24 Jun 2025 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vy83K9Qz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E0D27C16A;
	Tue, 24 Jun 2025 12:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767961; cv=none; b=HQ1qTST1gcWvuPJRANdH8Amg2//y1Nlbz5IV81iNvggBZ+bWZQPFqSIcUTGhWgfZZ2JF11s9P0OWjpvLsY5nIGwgZ5MKNq9kVMFJO5s7DYu0VMmKB958KT8mNshYosz2U24CN3WQa2j66GV8GxzLkBPOPTGfJc76q2Q46lFCnsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767961; c=relaxed/simple;
	bh=SHhPgRJ8ybUUhtdl7wT9fGALW5lZTJK/bcDglH/9O3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBnvaDqg0Spd8JQniYKS9/SGSRRmPyGMuieAsRcjsqWHzgPlwjjtwyvREXVgjrNUXkUB0oP1dzu1QXanyA5vl6OGqEbL/fxVQmIwBQsuzlP690hqD4FL+j4cPPS2YcTRJTIYgkPStMvCztTgVHErpZmEY6OnzXuG4vy/Sz1h6RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vy83K9Qz; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2369dd5839dso12199245ad.3;
        Tue, 24 Jun 2025 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750767959; x=1751372759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHhPgRJ8ybUUhtdl7wT9fGALW5lZTJK/bcDglH/9O3o=;
        b=Vy83K9QzirOwT7xu0nXq2O9vk5ZgSHfcwU8zp3wxlRdj/DbASpctIvo44XRescAdoo
         /Cptw8wOq+gKtXGjAykzrUK4Wsc9FPpstk70JkMfQtGiDYAyAi5XrlcDhv7rjOvx5Soe
         ns97hyso5O+OZgjPaD1p0odxgbKbFrJhXyp01Nx3auErF6+O7FU/POunBrbpNKc/plZR
         FBpEcEIgYFFCJm0yfgmkZa999E0qfHqzJGpZb1RzutlzNTJa8XDvfuYTbTV6bqt1VhwC
         Xs7U1Ux38bsOSzLpQAKI+Jtfc0Q6Fk24L/0XbU+57xhLrQKawzpPtjtk383+W/wGzvSr
         gdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767959; x=1751372759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHhPgRJ8ybUUhtdl7wT9fGALW5lZTJK/bcDglH/9O3o=;
        b=hmv4S6mR7yWGuUVPJnvZhf7jsO4RU6Q+2+SJF6SmgTqIKAMvnBcybj/8TP/OxY9rdT
         4LbL7/CNJ5Er5LgB6AFPwIxGqLpzVNxIDWd8yTraSY5tdQaVMI6myWXXsymzf4BAhPkR
         i6BvbfaSjA9CKJGLT1OcPQBgeBkV17WJHfxtmynLZ+3htQzO9piwUazwUq5JwiOIgoU8
         Xw2jTtalzD6twux2uZGoYdOm4XFWYg9ELb9nczC2CXeDEuXRfWea/sWH6HwZodLVPAQT
         GwC9YeuaOCFmR0/KhdYc/X7al9rhrACzpXy8aEBU05j4QFvdssIve2t2N6ca7f6z07QI
         hXVg==
X-Forwarded-Encrypted: i=1; AJvYcCWlG05XUnWatG1lJEfFMVUq8necHgBex0LdcwzbUARlN3725cfpf+Qd0AAIVpY4n8urHef0JHhwL7Fv7Q==@vger.kernel.org, AJvYcCX8EoZy3XvEq8d409zyX/kM+Be4aDmDQJ3z3t0B8aYIRVt6Lt+Xvzr5ZJw6wZ8hgt77J+WQ7I3hVX16AYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDFB7I+63tvVl6PoDDSIyvySr9jFMLYackFHmPg+Sad24xSUJb
	kMb71SLzJjK5vIyaDbfrOHwee5EPSSi9Qz5zQjZPSaK9ArSuNVzMtUt09nlIoAko/XkAWsOsdrp
	nbTr8aTG33+dDVqDl2e7aPavsAbObMdI=
X-Gm-Gg: ASbGnct5cgE7w59MPaDPfyRbfjwjQW2KhrLr9GmG6Ar/a6QKhIZBwthfVOAuLw1UBFA
	TO2VA6W8QUTIDJHAr/zvBceUc4888WE8TgJYtJdmYA1m+tCe9wFcAGMn4fJKLbwV4EBla51q/PZ
	vyldDFodTNog5NgwQQArCvEtSCIuAovsqKlIJN/MGZDgC9wQL9GoJYlA==
X-Google-Smtp-Source: AGHT+IEWoORFOC3y4BhjSnbOdUWcWVa4xPhlHRB+7Gx3FaBU5ar2Sr9EiPmDBlXKOv9BjYzEQYvNWcaROLqxpUURdm8=
X-Received: by 2002:a17:90b:274d:b0:312:e9d:3fff with SMTP id
 98e67ed59e1d1-3159d62a73dmr9731040a91.1.1750767959358; Tue, 24 Jun 2025
 05:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624173114.3be38990@canb.auug.org.au> <CANiq72=nLeuw030T16-vDZT4A_gNyPm7WuXoK_3nFo0h0-eKJQ@mail.gmail.com>
 <aFqTX2oDzacpDpif@pollux>
In-Reply-To: <aFqTX2oDzacpDpif@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Jun 2025 14:25:46 +0200
X-Gm-Features: Ac12FXzx6CfA8-IucSNuRwBd-UZtPwPJeQbDbKN_u1fg4uk5iGNMl4d6o0VGfGs
Message-ID: <CANiq72kgAyotY71kmcABDwXVkZKnKdR4Dd1AwbYmdjeDr+-73A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Danilo Krummrich <dakr@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alexandre Courbot <acourbot@nvidia.com>, 
	Lyude Paul <lyude@redhat.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 2:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> It's a bit annoying to implement From explicitly for all of them, but it =
seems
> to be the correct thing to do.

Yeah, agreed.

> I can implement the From traits and fix up the warnings caused by enablin=
g
> `cast_lossless` in my tree with subsequent patches, such that we do not h=
ave to
> carry all this as merge resolution.

That would be great, thanks.

Cheers,
Miguel

