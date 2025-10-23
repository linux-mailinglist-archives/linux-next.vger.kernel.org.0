Return-Path: <linux-next+bounces-8696-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8862C00735
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 12:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 39030500B8D
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 10:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F9A30BB82;
	Thu, 23 Oct 2025 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgjSj7YL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2460F30B536
	for <linux-next@vger.kernel.org>; Thu, 23 Oct 2025 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215069; cv=none; b=Ar2E9IEoEbE9EjhuZydlRf2FcsqJ7lN9R+TQKzX1t25Y1oR2Q2Q89jBiGXpeCD180/9mbX+gKhYT0Xa3K2ffxbNd/tP3fGduwh6B/+d3uJaPCutgkxwKzY8Q06c6sG9sU4l0CA9ugAObxmv5pygpDz/GvLvwPYswS2f3BExn4m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215069; c=relaxed/simple;
	bh=TWqoNj5YdoeJ9asRq6lMhjfB3nhbhwLuJ+gEtX0Kgu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jh9dYNyR7RypdkU/EfDH3tZrg6SM+QHpT9yLKPvcXmn8mhZhfq/pXG309f5jPnxXWeJuG+ks7rAdR6GyMzblmU6++fQDjBers80Hg5UOLUYM9NTax80I1aBU6wtkq1g1G+3nOiyG0WOUYN/CfOL+zlcbCAqdJJDsmz/GZkpyxhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgjSj7YL; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b5509894ee9so32476a12.2
        for <linux-next@vger.kernel.org>; Thu, 23 Oct 2025 03:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761215066; x=1761819866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWqoNj5YdoeJ9asRq6lMhjfB3nhbhwLuJ+gEtX0Kgu0=;
        b=dgjSj7YLkHRsdLp9SLAZD38kP6hxEwPLvahw3f6f9+sPnyQPOzuFYJWNWnt1r46Lw8
         uzQMWdXknRhEayElUKCjCbePA9n0i6gX+SOlUD/zPOvekhdlz5QA0XshmA9/grglK2C4
         uSyRoKHunayOhjT/Dmcf+qP4SUEeV9Z7/9ZVeIh2XW/y8yoktthY44yE4EShtUGGDqi5
         5aC+KtfpmueJMhLUWPHcTgVI33cBjCPh01feSOAsfmMz+C6va0Cvg9O3fL5AuFP8V+Ut
         UDftB8ezbwrUbJvLt4tSGs19kyxlppydFFsYdb3nfSRnaJ/y24wm7PE3iHEQ4s7PXo2i
         T1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215066; x=1761819866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWqoNj5YdoeJ9asRq6lMhjfB3nhbhwLuJ+gEtX0Kgu0=;
        b=aNdQiKG1WDL1pMiDJ/GWJsIpBtY/nvvO6PmL6w976Oj51hE20PHnuuIFjn0Y9o7R6A
         TIQbpokQUp5XlfJDAAkxa/qj4A60lJ4qGmUiRgCSjfzM9syXDfhOMW7sSZh1wwc1aUkd
         aJ++ynCQUDovJPjaxtSLQ0zhSpRZ0DJ2fQ47IsxO/4dJ0jwi86spBzJkFJoOi/JQXsqw
         s/T7kBS7Igmc4cbivSYgW5sUXpJjhqTYMG1vbhgLbUTttI6I1qdvj3YTpy5H5doBRxI7
         2IKkGZIXrJoKwHPUgUAikSe9l3lWGvARKjQAldK0O5L0Jnc62LUH7VjEnQmD7z/iP2h2
         eUdg==
X-Forwarded-Encrypted: i=1; AJvYcCU+7Ho2VvhxmWgwOT0+I/wwIbOkdBgogmC5FDjW9JiyfZYN8sesgxCf3GfDyLoJ+CoCvO03sz+md5PM@vger.kernel.org
X-Gm-Message-State: AOJu0YzqvMDIEdJuUrfvmkEHyDAALy7P30JktcR05VJY2F2C0PhAc8Jh
	xhLBm5AEZoEI4295RYbsIIFDKvFMUSVjBmJvzJheBSfQaqBmSQsnmFo/qx92ygDtqUgw4fnMWWd
	1AkzWHyHUu/hN+0juySOzOZi20DuzQsqUF32k
X-Gm-Gg: ASbGnctUVeSkSUdnV/iHaFWgzJy835u/y2nrtQ4YGDlt/czSQshGX5wCBG6eZGAIj8I
	1loXC4U99CVKukAdLjEAt/kDQAswoTLt0mkQvsHpKoJUQ12lDJ4Dgd91iVaSL8MoB5qD9lBFUqd
	IUCyZ1Mxxv13jjOR6XDHnNEwpAzJR7on3ogTbnd9UEFGVKKDkr4qOjRoAUAQX/6CpHVSHQjrstw
	9iBrITzQ4s4R5y2tNOuSJAtddIEyHv1W13sDcj70uox5SrP8xEj7BdheiWYDNxhu5XGV+Ppx4eY
	1CvfdcK9UpbSNzVFj14Amws6HTqbam/momn+zhbb/roPEPyBrY1UlZrxIYAOvkysq7bzPyhXT6V
	lpJs=
X-Google-Smtp-Source: AGHT+IHL/NOfl30TWfKU/BaCMVnjssdI5BFI0bm1pxWmrt4ppzKzR8Akyjxfr+nN3dvIwG3o1qnBpfOu4tjDcZC532E=
X-Received: by 2002:a17:902:ef08:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-292d3fad068mr69723455ad.6.1761215066415; Thu, 23 Oct 2025
 03:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023124926.35a9ded0@canb.auug.org.au>
In-Reply-To: <20251023124926.35a9ded0@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Oct 2025 12:24:13 +0200
X-Gm-Features: AWmQ_bnsu34G0TQ6Z1JJkqPuJ6rfaooZhtnhvtFcP91QXFBKiKlSmqUmS8utRp4
Message-ID: <CANiq72kwsk8NYUR+8Sia86YSUhYyvLXWD8kJCR8fD+_Hv6qz8A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the opp tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 3:49=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, thanks!

Cheers,
Miguel

