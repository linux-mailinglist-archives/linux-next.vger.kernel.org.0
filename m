Return-Path: <linux-next+bounces-3912-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0151697C163
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 23:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F6FF1C20B13
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 21:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF281CA687;
	Wed, 18 Sep 2024 21:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ODJLLYUZ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7921C9EB9;
	Wed, 18 Sep 2024 21:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726694908; cv=none; b=gxqSbHpB+2ZE+yvcIj5toZ1Tkk95ocD0xTNUvQrxaZF0QqkvB9NnxxTeXpDTS/4WQVg3PAUIqQyYWdyR6f1dbwZh1H9KXDoY3PkN+c8wW7nObIYZHpMLDqpQH+q4fWjjfMFJcFJ6ioesq+eAyQYcCBa2o7LiYAz2ki1s52ZuOq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726694908; c=relaxed/simple;
	bh=xz7bLw5M7snoX7VitAbEua6DlM0vZE6c0FLQcKQlSDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKthZIJo7n0zU2kANr+vKdpqRTnnLsYOFzViThiTX4sB9n58QjlxkoHOLf5JLJpzNkLb9zOVtL/8EIVthPK1HrqF6lssOgjmJbfLfe8weJYhsQbhwzfYtRrqs9DjDMLCb9lsJFB3KKJCWB0JVhLNO1KTCgXBkw2NZEdubaSo4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=ODJLLYUZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3C9C4CEC2;
	Wed, 18 Sep 2024 21:28:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ODJLLYUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1726694905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DthErP7vuqX40ExDtoj9DX3paJ4bxHStbnoDJujvio4=;
	b=ODJLLYUZSQMAfgRzUoufWUyb0M6ztNHw2tXrx67UNwKLyk3ISmSBioPcU1ie/HMKwIDD2b
	0Fvf83EHwNsaYqhWbppwwCWT+9uyRS6oIOYqsnoB11FZb47gf/Rf6V0BFd+4c8jisS9SzF
	ktvbjBw+YB+DicUodC2VvQDIffruwSM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a720a265 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 18 Sep 2024 21:28:25 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-27cecdc5098so149805fac.0;
        Wed, 18 Sep 2024 14:28:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpWTBBMfMoYObo0Bjy1cY9S9D9PqAm6TZvZIIUQF9rOv6D+/NdrAaaqRTUp+x0yGXSNWD7PHEFvKrXeCo=@vger.kernel.org, AJvYcCWLWi103XCBn5iD6RyVN5PpJ8K6LsrnLbmJh5CLIa+QUJ9yP9K42YKwOHGHkwigJHTpgPeLcmUDfWOpdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmMAC1hq8RyiLHQsF0l0EqyRqPg1gqfPFQZFOQj1TJSKadcjiK
	geASL6oaZWeyIZlAjLSHw9mXg7IQ2roR4jPvFqj7fxLi+Db8j2mC/kUnt+s1UfkSOcuVccYARRD
	hlBTz8Ve6nBYqzUEy9sJyTmEtQuM=
X-Google-Smtp-Source: AGHT+IEkHXoBA4BxhqBlG5GRtdHh4BKmacQTOUEhByn6Yb5H6DjcG4bybJFlCdY+/JQ0DRcgBGKcrciyW4o3EeKG3W0=
X-Received: by 2002:a05:6870:2009:b0:278:978:9e9 with SMTP id
 586e51a60fabf-27c3f68ba1bmr14786982fac.44.1726694904217; Wed, 18 Sep 2024
 14:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919072627.2639bbe9@canb.auug.org.au>
In-Reply-To: <20240919072627.2639bbe9@canb.auug.org.au>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 18 Sep 2024 23:28:11 +0200
X-Gmail-Original-Message-ID: <CAHmME9pX5AiKHGW=+umdDW-JDpHjqomDLstrCMLqCm13ZQ_+4g@mail.gmail.com>
Message-ID: <CAHmME9pX5AiKHGW=+umdDW-JDpHjqomDLstrCMLqCm13ZQ_+4g@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the s390 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 11:26=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> The following commit is also in Linus Torvalds' tree as a different commi=
t
> (but the same patch):
>
>   0147addc4fb7 ("s390/facility: Disable compile time optimization for dec=
ompressor code")
>
> This is commit
>
>   26d4959681e3 ("s390/facility: Disable compile time optimization for dec=
ompressor code")
>
> in Linus' tree.

From [1]:

"Please note that the first patch of this series is already in linux-next
[1], but given that it is so small it seems to be the easiest to apply it
also on your tree; but I'm sure somebody will complain :)"

So I think this is to be expected.

[1] https://lore.kernel.org/all/20240913130544.2398678-1-hca@linux.ibm.com/

