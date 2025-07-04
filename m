Return-Path: <linux-next+bounces-7362-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E9AF8D8E
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 11:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94FDC1C2017B
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 09:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1443F2E9EC7;
	Fri,  4 Jul 2025 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QXqQ86eB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940312EA477
	for <linux-next@vger.kernel.org>; Fri,  4 Jul 2025 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619667; cv=none; b=uP3z4sqpep+WFBt+Zig49QulKFXjeTDkVM9TGj5fqOEFRXjKTeVfC2fZXJ4UyLa9AbB887AjHAdtz1bj5IyMzZAFLOxAkDjjjjBk1ywdL5SE+q2S9O8C6Q+/RWNv3wXPkJUuU7SObTciMUbxzZ9fA2+bW05INZqB8ZvAdZBZuWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619667; c=relaxed/simple;
	bh=f01+/+d1XLTUFc4UC8xyL1lZLSP86t0bF3BHim2xIzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFCeI4vHic8+s79HJxhKUuxOmi8ctbxbO4DS53jCcD4LP5jeEwfCVFCiiJvDUhScVZblFM5Q1WLCRs4g/5cI3dpkWKtoJ6j/9JaBban+bbf3dLYa+pi8ClvcqHomYBs9y+WzFKJAJCBCtDGi+XC7Qy9hVe8Cvbk4jqxKTXsVr7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QXqQ86eB; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b561a861fso6259371fa.0
        for <linux-next@vger.kernel.org>; Fri, 04 Jul 2025 02:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751619661; x=1752224461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGg0wyJ8KAmIjSaK0H/nMj/AJ/mfSEWt0jqoZQ0jjqU=;
        b=QXqQ86eBmboWyCN6XgvQwWiwVMY6iFtVfzqteDuAe/CKQ2SXm2G0jO047Jg8SsvIJe
         xaBrMRZ32PoUpF803zSeiYuvp8Cy8RtCvgK1rxyf87sgW9+i2ONoIOtAEKX/NH7dTQnF
         vr7cbVy3ycQlmdhK5THoOtEndV6pV7Cd9ro53p9s6HT5xuT8A3t7IjOoez9DM1GD9yzh
         RpOXUcEpkriQrLMBTM7rZYruvVsE6ewGQHCLtL9c4NruDVp6D9NPoJ3NhpCJMx6C83FM
         9AO0AcVlXTwxqyNGqETMRNRPmY07GsKrpsfuSMm5dy2nU8AYfBZaE+bYVadLZ+tfbpEj
         rgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619661; x=1752224461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGg0wyJ8KAmIjSaK0H/nMj/AJ/mfSEWt0jqoZQ0jjqU=;
        b=vWovPwfNj4s1o8AplfyOsMhGxHASAnI33QdstbdZcixfa1S0ix2bp6kKKQHl3SaNJk
         AGmP7enn6U7juOaEnJhP0SBzOCY/auKLXXf/sV5cUDO/OX0ohf70qJzJgbWmNz3CJtn+
         MjKNPZXxQxBwoHzl8mO9JK5ABPfuC7Rq4UbaWhLtT5twc7hAa6+UaoKR0r38Gp/KeJAt
         2paNNVr9E6b3CdLB7fjgowxqwd5yAbbj/rjtc5a/CWI1/Sg5cNZ/rsMyxvyOVbCTr30o
         W5RM7qJbV86O385Iw4ysODpV8O/Kit33JHLr8E8YKEoZe0xJW8NQygDp87c2upwwpHF8
         ClDg==
X-Forwarded-Encrypted: i=1; AJvYcCVKd9TwupA/EYdi3PC7L0k+w0ss2FbKfmthno6dJCq6F4Bi+P9tmoVqP/yA70k+6uSpRJ0+b7mHmbuU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz4j/0kl1i6TspijsU1z3DNgLTuVD9nfMfZnHx7yWeyKebUxvQ
	eAFfno4tlPqMYxnNb6dR8txMqNRvf0e5cB0XuZz2sTL3NO71RJwBf+TBcW5TcGrs1bZZ41wjTxT
	LWyxDebzNeXngY/QVYVyceP6Vphs3yz9fHgh/qA9aLQ==
X-Gm-Gg: ASbGncu28AHOX9rP2IoSIEX6UDDSH3fE8Npaj6DhDz1FTCdMO5Pyk+HyBD20Wd93mDn
	Ji1kXxVMF9DaOCklrMBvc7ZxZK5y7BKHRRtItqEKGUB3uFQ0MHZP7xE/ZkopDAA+vGqn0DPMks3
	94Y8bknlgynyH9OBZdU4Mj7o6KdvDYRzhGFCJo1BEYUjvDfdNJ/s3sCTSsQBz0FdLC0UBYsx6kL
	g==
X-Google-Smtp-Source: AGHT+IE5A7Qpn2fHe3IyqjqEzjlqNYNE2mHbcn3t6AEuEEL0CMWc04hr2ZJMVVPzs0NtOe/o/dX+X5us1ObF+NrmG9A=
X-Received: by 2002:a05:6512:250f:b0:549:8b24:989d with SMTP id
 2adb3069b0e04-556d05a738amr570751e87.0.1751619660444; Fri, 04 Jul 2025
 02:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704185641.430ae617@canb.auug.org.au>
In-Reply-To: <20250704185641.430ae617@canb.auug.org.au>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 4 Jul 2025 11:00:49 +0200
X-Gm-Features: Ac12FXxCBYjNfFP1OStTgTeGYx_69fDp2ljdeAPPq9NLbDE6_W7nIeVT6KMWz8g
Message-ID: <CAMRc=Md7Znq6Lww3-i+sRW1LZMD78s7vnVYnDwVKQsjn7OMhvg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the input tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Lee Jones <lee@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 10:56=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>
>   drivers/input/keyboard/adp5589-keys.c
>
> between commit:
>
>   43a8440f3969 ("Input: adp5589 - use new GPIO line value setter callback=
s")
>
> from the input tree and commit:
>
>   3bdbd0858df6 ("Input: adp5589: remove the driver")
>
> from the gpio-brgl tree.
>
> I fixed it up (I removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>

Ah, I pulled a tag from Lee's MFD tree containing 3bdbd0858df6
("Input: adp5589: remove the driver") but I don't have 43a8440f3969
("Input: adp5589 - use new GPIO line value setter callbacks") from
Dmitry's tree. Dmitry: is it too late to get an immutable branch with
these changes? Or otherwise you can drop 43a8440f3969 from your 6.17
branch.

Bartosz

