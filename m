Return-Path: <linux-next+bounces-386-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0820581212D
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 23:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F5A1B20DE7
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 22:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF367FBC8;
	Wed, 13 Dec 2023 22:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="b2bjIocN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4207AC;
	Wed, 13 Dec 2023 14:06:29 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a1ec87a7631so666318766b.0;
        Wed, 13 Dec 2023 14:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1702505188; x=1703109988; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X4UuYiM1z+VjAh8ejY7MCYBHB5OZzwXVD0RCWJmFeg4=;
        b=b2bjIocNh+tOZs0bVFKRZu2BMDXOp+TymNfLaQCT6ZK8qF3mLLhhhwoixtyW6mJ60B
         eJ+M/H1cH7rFBx/pZ6ov/gI8ZT8j56q1flueSapGLRbLbZcZrgV8+HIzVK7q6ZNhIlBf
         VRt0CWsEcZzijROSmIH6dllsOYMM8y+9fcEfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702505188; x=1703109988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4UuYiM1z+VjAh8ejY7MCYBHB5OZzwXVD0RCWJmFeg4=;
        b=sllH4yyObBNdbBS4BStAJR+WIW7HXJkjjVejSrOjA5qkzclqRIfB2zlTvx/KSfEBZk
         RWmrfZ88WSZKhqQKjya85bK5UaJwG2LX7TclG4xEHFEYSLto8F5dWHHDxjO8i8h1uZnr
         eGqPuZsfAWHCZLoT8OaBgJOpMOP05BD41KZzpRIrsM9zWFE2ODSirmoHkjrDFkZW54Kw
         WqMeP5Yw45Rv6M3MeiGao5F8T6D4yrcPl6eye7ocRnJpPFohizf6WcobBQ4S0FCEm3De
         bjX/VKWq/HcOpNUG0M4njUsMXGdN+YH0qSSeaP8UjYK4odNWQdzEtRUMsSlJaBeeHEb8
         wxqw==
X-Gm-Message-State: AOJu0YwwPuvHptw77lj/89ab8a4xFxUJBoxyKX1i6fEdkScObGId7Dxd
	Y+Lz91+lvkYOOknBMBOkfbbQGDLp6f/3BFAPXULzPq7I
X-Google-Smtp-Source: AGHT+IHoi+YYTwEgJd54Iml8QHhKqqM0q3DYu6kyOXo+79ayzZ8IZpuenJXjrO1EDXLsFXizgjuZ1pZq5QndZQTwPmA=
X-Received: by 2002:a17:907:1a58:b0:a18:fa22:5df2 with SMTP id
 mf24-20020a1709071a5800b00a18fa225df2mr4282845ejc.31.1702505188172; Wed, 13
 Dec 2023 14:06:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213093044.2fc89781@canb.auug.org.au>
In-Reply-To: <20231213093044.2fc89781@canb.auug.org.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Dec 2023 08:36:15 +1030
Message-ID: <CACPK8XevBYm8q1rHm4CyyqaNb3gAcksJUUh4QcOWMx_Um++8jA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the aspeed tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Peter Yin <peteryin.openbmc@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Dec 2023 at 09:00, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the aspeed tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> make[4]: *** No rule to make target 'arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb', needed by 'arch/arm/boot/dts/aspeed/'.  Stop.
>
> Caused by commit
>
>   70fe22dd623e ("ARM: dts: aspeed: Harma: Add Meta Harma (AST2600) BMC")
>
> I have used the aspeed tree from next-20231212 for today.

Should be fixed today, sorry about that.

Cheers,

Joel

