Return-Path: <linux-next+bounces-2803-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE821924116
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 16:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C61AB279A8
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 14:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE011B583A;
	Tue,  2 Jul 2024 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZqFDZos4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6580FBE7F;
	Tue,  2 Jul 2024 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719931414; cv=none; b=NC2CGjXWUD9tsfASRit8Fy1Ov5csB7zsnq+60Uy4T+/UGDFSzFVPc7JbUyMgGnLBW/AYJ7IlZb7+bUd/do+JsEpNyFxFVV63m5aJCb9sj+9YmUPtkPhkVgssF7fvsch4ZN48AOwZkiRl3TRgWixm/xM7uwD1DvRd4UUbFfEfscE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719931414; c=relaxed/simple;
	bh=Ewc+Nh03yjPZR+ueWNbFezjcHbaY+TESO4Fc3R9gE1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/YbrBI9H9kH7fe1hNr2rP/ZwLbDoo5Mh9kqGi/bwiTZVciH46crU3fAUKaM1/6m1N9XNuuR328c+EWzDCbpcHrfLhbuE9RUT1frw8Gtv3FPNSI5kN765cFBOqF16ebSa7DQGMk5N1uAzpxiXNfQTUCTFrr0lg0tyL3jnGmEk0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=ZqFDZos4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05289C4AF0E;
	Tue,  2 Jul 2024 14:43:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZqFDZos4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1719931411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zXXeFMq/nRaS9iayRn6IsvflwzLp/kF0XFNwUtC+MBQ=;
	b=ZqFDZos441mvpYJQ2HrCAPLSQFw0DaHlAIaA649IELznV2d0xJOJFkr80MloEpKUEyTnKJ
	g0zH2K5CnEhXVMssS1ftcOkVBtb+vv3rvx70zmqGkyQoQrVS0HrCtgYgLKov4kp/vMtBfZ
	qzSOX33cS57ZQ9QiQVhQYlkOz5+gsPY=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 54d48fee (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 2 Jul 2024 14:43:29 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-25c9786835eso2519713fac.3;
        Tue, 02 Jul 2024 07:43:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNSWJacyEjIrHe/HuAlnmDeildfHYDRR5nLp1peC7bsiT7RpyDU303t6Iy74pFoRU5AHWrdOUfjRmbyfWOCIENYUgMmpRyq0M4E/JQJVnsqtXE0OZC/pGsfjfOYP9yRGIhVuEDKXMT/Q==
X-Gm-Message-State: AOJu0Yx+nO4HE58vbgd1c6xcFRENeK/dbnxGJCVlKPzbMiMzIOuKmr54
	YZCPvoydcJppXWrPTDnOORDYguZY30k9DCq+DnATEMVWrE6LwuSxzeB3WtknfvnOjWf63Arqb7S
	cw0+Pw4wbVcJuPq5oE+qX1aXm0SQ=
X-Google-Smtp-Source: AGHT+IGclrLKwuVggXhaPkcX0BzCbOmf+xj1+cgZxD0rVwMU8M8iRW42aSuLffCowufW6GLjoyYsWbtg7xBfCjVAD+I=
X-Received: by 2002:a05:6870:3751:b0:254:a810:cdf with SMTP id
 586e51a60fabf-25db340a2bamr8358777fac.13.1719931408681; Tue, 02 Jul 2024
 07:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702165601.08bb4545@canb.auug.org.au>
In-Reply-To: <20240702165601.08bb4545@canb.auug.org.au>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 2 Jul 2024 16:43:17 +0200
X-Gmail-Original-Message-ID: <CAHmME9rYfTtO9CPGi1nB=ohZ_SBMFocxpB=Ga3cqA54EF8F7Og@mail.gmail.com>
Message-ID: <CAHmME9rYfTtO9CPGi1nB=ohZ_SBMFocxpB=Ga3cqA54EF8F7Og@mail.gmail.com>
Subject: Re: linux-next: manual merge of the random tree with the vfs-brauner,
 ftrace trees
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Christian Brauner <brauner@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	=?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, 
	Jiri Olsa <jolsa@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Jul 2, 2024 at 8:56=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>  +466   n32     removexattrat                   sys_removexattrat
> ++468   n32     vgetrandom_alloc                sys_vgetrandom_alloc

Wondering why 467 was skipped.

Also, any chance you can let me keep 463 and shift the others (unless
Christian objects)? Or does it not really matter anyway because Linus
is gonna merge this how he wants, separately from what you do in
-next?

Jason

