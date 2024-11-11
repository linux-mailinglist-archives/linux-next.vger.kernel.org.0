Return-Path: <linux-next+bounces-4748-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 300B39C4A80
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 01:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57273B31511
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 00:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744CB1CC157;
	Mon, 11 Nov 2024 23:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gryCqAiD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9371C1741;
	Mon, 11 Nov 2024 23:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731369413; cv=none; b=XnlbWM0pUYGwuylkBpojq1fj/DuPGCwf1rgploIH1LtdgTkIbHAk2JwtBMxGAiUSkCPRcd/CVGeuhWfd4EpgMrw1B5eF4h5r2Jok5SiK9GnX1vPcXXLZtXmf0RK/qKgrNZk32Kn1lei3tQTwY2TrQLQwG7kSOs6ocdEf7voCeiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731369413; c=relaxed/simple;
	bh=GylUYiMFnCDoms9rsd1G2phTIBaBxZLVclPFqUVbJeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R16IPGZQSXazDucwC2tjqs5tBAPPlBAXfiHtp3qlWrTJyKk/h1tpRL4lng+1deSxBDd+tQaOk+CJ/zZT029gjUTsxOpWnmMiVemYGn6Xl/w7FnFMej70DNjqnCtTTGVC/t6bMKD0jr/R+fQmAXVt7fnsff12UBBVMOgXnWCMduA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gryCqAiD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e2c2a17aa4so5031a91.0;
        Mon, 11 Nov 2024 15:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731369411; x=1731974211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GylUYiMFnCDoms9rsd1G2phTIBaBxZLVclPFqUVbJeo=;
        b=gryCqAiDyym5LjSx8On7YW8Dnlsy1qHrr+TUTZ2TTFoMfgvqnLd3Ffmu8G3VXJbz6O
         ND/glEG5nEyAPP7PWZNlP3K8q5l9RyjhdJT6/EmRO/M6tPz0KIGo73biX2XQf8YuOf77
         f6/R06bOa3mvD3G2/MJRcnIZH+MylSbXfU6yaWya/WqO14US8EJkEVb6Mpx/yS7dQuzg
         o47dadOlX/eZRV5UfFCFVmrsyRQOmsB+PWFVpaRsGIn0O91UNiYCg12etxfG+0+IHGCc
         iaDhuWBYZEBp+qncxmOfk27tHDeiN0Uynod9Rs1YCFaV8hFiox3dDSIa5jQmrr0VsePc
         3OiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731369411; x=1731974211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GylUYiMFnCDoms9rsd1G2phTIBaBxZLVclPFqUVbJeo=;
        b=l0uJLtr9u/HsiE6ZwSG1a0DD5MNBs9RieMcPQdr+WELmZ4Ml/RGIWWHzccwFdmJ2+M
         KJuF3eORndTOTO9pms2q3vQ6Eb+cjSvl093/IYkytkeS9fAmWiIMgA37QXdX/5ELq+C4
         LKMNDMV0zzn2QFLXwX09w8fmAckD9GeXBOfdMVEgNT0TqW3DmuL/+p3Fta3x/ILe5X7M
         CKAX4s5VqdTa6DA5OqKTIp0qF5guMZsmHyKAu6Ge9Z+WEGsmUPoV2o5DQHjpTMA9tPfd
         RZnO3mMtn8h10OiIRU8HU+iyqy2LQwMVt1hTy/p5LUp7nVQzwOir3MwkSsJ+29eT3zkJ
         CT4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPO+xbNA5vVs0jYV5ex45lQBjWLQqXpt8Tk1qgG5aHkWbElEgGHaCUbv4MZ4r6nN38pZzmVv5iyUHEqoc=@vger.kernel.org, AJvYcCX6VNzSs4HAe8eY42PXOhc6EvN9WbIk6s/A2SuggCHXPsS5kynMOjOLGYZu0uqNNb9INzGBk1Bbo0VMVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqXW11RXLtqya7NwSsqlWVDcrOF70leKqzTel0wGAVte9Wnkzn
	eO6XsDpLoAeRwymLL1naFa5Jy//584sD9lquTLj12EYIIoqTfcJU4egbtDY474dUqfImsAFEb9h
	3EBBBjvnvtTgYWG0UjahrZ7ixKsM=
X-Google-Smtp-Source: AGHT+IFsjNl59AJrpVnIcvcZJHuNtnL7USyLI6FqLcfZj4/ny4HMxxFhwqBZybSdrsKLBTi+9WQNLHwEUMrJbgJpenQ=
X-Received: by 2002:a17:90b:3ec4:b0:2e2:c423:8e16 with SMTP id
 98e67ed59e1d1-2e9b14c7c8amr7959234a91.1.1731369411249; Mon, 11 Nov 2024
 15:56:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111173459.2646d4af@canb.auug.org.au> <2024111102-baffling-budding-1d7d@gregkh>
In-Reply-To: <2024111102-baffling-budding-1d7d@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Nov 2024 00:56:38 +0100
Message-ID: <CANiq72me4dFOT8ksHHbzzw+kdD8y9VDNbH8gbxFLJTOj0x82GA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the char-misc tree
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda <ojeda@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 3:54=E2=80=AFPM Greg KH <greg@kroah.com> wrote:
>
> Looks good to me, thanks!

+1

Stephen -- you will get the conflict in the upcoming round again, but
this time without build failures, hopefully! The hash has not changed.
Thanks!

Cheers,
Miguel

