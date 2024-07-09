Return-Path: <linux-next+bounces-2891-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBD992BAC1
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 15:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADB011F2170E
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 13:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83188154C07;
	Tue,  9 Jul 2024 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="N4UXY7m1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A23712DDAE;
	Tue,  9 Jul 2024 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530795; cv=none; b=UGNaImxErvuORRthLrbqMD7WjWJbKGZ0HUoAD7sKWaVx1EQII0DGuy29uEE5jem/aa/X7amZhbCQun47xYDz7T1B7QbIihnXKXEWXEdcm0CMPX0xZKMyQyo1UmwJjkW+w79u+bwIpPKZAq9iZpEydJ40GDpBLaFArvmvkXKYuD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530795; c=relaxed/simple;
	bh=+NkkzDfIReijGPzuxwL+h/T1OSttz4Vmw72pMiPuBQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sCsUAJ++63uD5w8SKo61wZLRMo+AFGPhasyNS7zbzSfU4dDeCMtuN/gRP/Tq9QP3VvMNWR0SY2sLMMOEq1svtonkAC47IgMR2c8x/aoZ7PvWz0D/AykJoIVCJaRAlCpgCSrAmhn5Kc02hFNDawommTTv9+72rGlEkTFiQG7lHOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=N4UXY7m1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12E7C3277B;
	Tue,  9 Jul 2024 13:13:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="N4UXY7m1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1720530792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+NkkzDfIReijGPzuxwL+h/T1OSttz4Vmw72pMiPuBQY=;
	b=N4UXY7m14aJtzBRmm72cJHSjSZJPzWpjEKshGAmExxWeaLs81RDSHq8TBIAZfSgGPmQh6I
	pmYASItEU+bsbmwwSleTkFRg5GzOLao4snnCfac+tRtWnfutu9h7yws8VD5ZMARn+TfW4E
	q6BreHWjLYueuNRrB0EmGfZLQR3ivT0=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1ebd8af4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 9 Jul 2024 13:13:11 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-250ca14422aso2846718fac.0;
        Tue, 09 Jul 2024 06:13:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfbsZsfgjPZVfFOokCYXht9MhScxodIwEImfAgERDCcDpl5SaVJn85ejrADcvz095wR+G+rtXfYNnvgEHtV89t0cWltCZOwBe+EGM8CvqimWh29xzkDVxVthLqbPBsbNU/7I3c3fgPbQ==
X-Gm-Message-State: AOJu0YzsAly/wYRNZwQoO7bD2Q7UZ7GTCs8pcaJ1KgXiYjVrzv1oon70
	y+dgjmym2n5wYJFCNN4QLEijHV+hXr9obgJqqaNlabwBiu9IpAVrZJcQ73RydvS/O40IS/edYkh
	PxEkRHwZiXLZ7qMazawtAmaq5N4c=
X-Google-Smtp-Source: AGHT+IFfBroHFgc/9lklm2E1nbfIjMeX1GavopC25W8ESAbrgeI4IIXSyVVCswhaOTjpSBtLYFfzTYM+JUDzhs8nZak=
X-Received: by 2002:a05:6870:9721:b0:254:a881:cec5 with SMTP id
 586e51a60fabf-25eaec5ffc6mr1939679fac.53.1720530790831; Tue, 09 Jul 2024
 06:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709180829.65e8967d@canb.auug.org.au>
In-Reply-To: <20240709180829.65e8967d@canb.auug.org.au>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 9 Jul 2024 15:12:59 +0200
X-Gmail-Original-Message-ID: <CAHmME9pDmEPLDznrY3v11Qy7ApGs80MuvUHEnzDwBnQT=DJrHg@mail.gmail.com>
Message-ID: <CAHmME9pDmEPLDznrY3v11Qy7ApGs80MuvUHEnzDwBnQT=DJrHg@mail.gmail.com>
Subject: Re: linux-next: duplicate patches in the random tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Sorry. I did a merge instead now.

