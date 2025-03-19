Return-Path: <linux-next+bounces-5880-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44457A687C8
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 10:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96405884347
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 09:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2DE24EABA;
	Wed, 19 Mar 2025 09:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfpxFysR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B241F9A8B;
	Wed, 19 Mar 2025 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375936; cv=none; b=ikK7GY3LLXHN3oG83ejhOpS3d5+oi/Es+MnYNsvBCVzm2WxuzW8+0yCylaU/0neX9R3lg19nKPsrEv18fqlen7jxjMQDaV+de99NaShsjItzCXwmRnGckdqHOD+pkAI+7CqyVZ2aR39aRfjx4YOknraHlCHLhg0+uVVcv3yF6E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375936; c=relaxed/simple;
	bh=KM1AxHbidghPqRaUFmnkbcPrb2YE42FPjfHLnbCwyEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0UJV5SwbVTBt/ixEs+hWTD0tuXg/3RN+gzecYsFywoCsHWmKni9y0y1yk82wIyZIz1wv3Ixj352kzHEnFeK6xuYyhdMj3C+EpXlZtSn7jeiXUB8FCDpICoLAuDe+xvPMVN7q6RlMkJX/CWj7rYFIhlcEFlWWrm3USBgXW4iSMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfpxFysR; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301317939a0so1085778a91.2;
        Wed, 19 Mar 2025 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742375934; x=1742980734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KM1AxHbidghPqRaUFmnkbcPrb2YE42FPjfHLnbCwyEQ=;
        b=IfpxFysR5ADk06TCei/fKGEjcYP+63igGqUyH6mdLo/Jc1CMZCDVnDHHN6ieG1kRVC
         sCr5EeyoHyvKgIQwzNIhA4RbkqrJba489bD2wecn2v9NaBG8paipqoh2MitFVcJy8qkh
         +GGDPSDkFJMR6UC2e4SECN5puGvlZrlFM+vpwdbIZYWtVfqciwNBc85CGBmVyg/I98BD
         bFTmiOuYTY/VRhxju+pEO8RR8dBDCGeaGyi28drODKeb+W1tSKg1ZDgZHVYxbp3Um8iX
         DNt/xZjaci7Iz9UAEwCKEO7LDp/rHWZvwqwDgBCCiVpD5WCi6hrPoWLsSAexU1YelqJZ
         LyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375934; x=1742980734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KM1AxHbidghPqRaUFmnkbcPrb2YE42FPjfHLnbCwyEQ=;
        b=XFM7+YUgU9afQTPzAf55O3nwZxmqzY9SIy2gkP2oknY4A3xPwv3cpmhUgbxzZrcUgz
         a+K5D5SismvLwx/g0kLQZ4Ecufxx0dzrzasfa9fgaRyzrjkWYvX5h2gTOFimmKNwgFj7
         xMc3Ahx84hbVIKcuHpmGLMWSZH01VGWn4tN4ZZhHoMa6SLZN3aPiyAsvss6O2LDGLARE
         S9u+bRvpQqQ1xh0PdrwKDa0qnEVW4z+wivf6MwTCykIMAMvZ5HiW08ZEWt2YVa9OWq2L
         o0iAC7exers3BltNhqXm9DHjBkFUwdHOUpDCgLkJpYs8+G2kDma9urmVqa3mdWquu9Kt
         1YUg==
X-Forwarded-Encrypted: i=1; AJvYcCUOt4p2su5cpQHHOc4wKwa7WW3nSIBdisycscQqeWzKgXGWVr4in9EG0GYj8i9QQNhKmbaX1gSqF89tag==@vger.kernel.org, AJvYcCW39ypMsay/Lf2cKrEqbGEv2D0RUKAbPtiOBwRKewgZ5uumY1m1a4qUKTH6X3Apf6l9R4VUuTFkkJU5OnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfqFZ+kZvB5MlbsvO0pQyswuB0qyxx+zOjXTahm4xNqYJDUQEy
	0hs62qFzW778U5k7KsQhrRm0f39PnZmt/c18I6g6R6PvFqH8YFjAZob3ks2ohymWI/CJq4QqG1V
	/VHUmDiurlR8K78hH9Ws7BG8MHfB9z2z8
X-Gm-Gg: ASbGncuuReojWzcKoKRdqDoaSiFigC/CDi5inH6m0Mt4d6LENl9sSw8DsNfuWdjiLJ5
	6r1qHzZb2O3oXRg18y+NCsY9q3TgyZvvlEtjWLyGCXkYWIl9BKWwfEXYxy3P35Kub6mzcmNA4sH
	uOZwr0Yv86FL0rQbW8XcQzbfs5nw==
X-Google-Smtp-Source: AGHT+IFnt8uA9es7r6lYwd9oimpAlUZnHzxDyksRBXShpZ+oXB9iJLOfPFINcQ+VNCruwVVQL4sHX/e6w54Lh24gouw=
X-Received: by 2002:a17:90b:1e11:b0:2ff:5540:bb48 with SMTP id
 98e67ed59e1d1-301bfd3b33emr817665a91.8.1742375933933; Wed, 19 Mar 2025
 02:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317215757.2412aef1@canb.auug.org.au> <CANiq72n05i322FfpSjFX=Wz3-9AgVRKLkKs1CHa-LxzWQ7-pew@mail.gmail.com>
 <20250318103504.4cbfe7e1@canb.auug.org.au> <20250318223706.604bc4c5@canb.auug.org.au>
 <CANiq72=mC67W_O9u6-HpAnqmy5L_A+-t9fW0YYR_0UR+hFvopQ@mail.gmail.com> <20250319200642.05825b39@canb.auug.org.au>
In-Reply-To: <20250319200642.05825b39@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Mar 2025 10:18:41 +0100
X-Gm-Features: AQ5f1JrGKWGBw09fST4dQGGrtPWmYf6MNOiXFvMYiHJQGZ35kEAiinuJ6fXNLyw
Message-ID: <CANiq72mFUA+1Ez7jL7ND9SE7SgH9zzicGGTEmgStagEgnnHX-w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Benno Lossin <benno.lossin@proton.me>, 
	Boqun Feng <boqun.feng@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 10:07=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Thanks for checking it out.
>
> I have a look into it.
>
> I added all three to my resolution today.

Thanks a lot!

Cheers,
Miguel

