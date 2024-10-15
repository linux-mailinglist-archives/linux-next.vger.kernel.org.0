Return-Path: <linux-next+bounces-4276-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F4B99F5AA
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 20:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E400A1C27007
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 18:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AC11F818F;
	Tue, 15 Oct 2024 18:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJQxZZh9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC811F8189;
	Tue, 15 Oct 2024 18:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729017196; cv=none; b=HUsBp/Hgso1l/4kNilb5PSdRDApRQ2XoC8g/ztJnwvdlfIeWeTsElzJCzowbJdd0m0gg66fRnOnNn3oCKuCyLnOPkALg7Zoa3Y81aTU2sVrWduFBdxe37SWnA6t6vzmUw8g898IoF4ys189XalK0ag8RDTB2/SLd9YejhB2SYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729017196; c=relaxed/simple;
	bh=DwEpV51Gw++CnaM2ntiG0KG1pqwuN9CXaowTc6tIBxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaJjwVnG08b0zHp9abFARNImAQEZ4lWwgTtyhRbexx5oLfYzKBM/SVbXu1XaGbDY63vs4IA3YsA7eodtO9w65Yw0ezOcvybRzFu38neelqq+z0SGgXFxl0rOlaa0NZt5OkGQL0CS2H20xfr+pUDDAqOzwRnwGd+OAqlkvVoqiOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJQxZZh9; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e4fa3ea7cso2830278b3a.0;
        Tue, 15 Oct 2024 11:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729017194; x=1729621994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yGPYe2MqBwMWZrJsnLJOc2LmTcid9OihZ1hAWIHTzKg=;
        b=bJQxZZh9pvdlDMd0GHVR6fhKAHkKPFIGjBDxq/rjYNjUgLVnmeDscI6u7IwAJMhokO
         gbH2ULlplE7nynKpjMQ/FXFP+56VL0zzGT8ZL3bX0kD0Rxj7+CsMtaOi595AKtLy9qUG
         NJ5/+UJClBtyL5KkvZx1leHD5OqeOXqI1w9qXgCKUfXIS8/kpuxI1CiJFBYowCBkFRQp
         wT8OB3yAI5aDED/5+Ou9rKBQxFfuXqZKx+bJmurEbLwY11KbZiQ8mxtqpgfO3avX0ejD
         6pn3KQKKE+R8XN03ZQvSFHh9Jcvnngc10SQVo3DX1hO7+F0FP9v8qV+hsKEPt2Xz/77s
         C4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729017194; x=1729621994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGPYe2MqBwMWZrJsnLJOc2LmTcid9OihZ1hAWIHTzKg=;
        b=iWzUJqJIl15/04DaXu8j4rSs82jw6JHDuegBzB61xJazD3OQfCfDMhYI1+MRIiuWP0
         60KTvXKf2VIRDafezsm+GPZCKoTgQWnNDovQLcMdIR/TurWgFY9L1NgG76PRie9i+dit
         DPJyyScD2GVYRnVg8yZQlMA/DoZPpO2qmJ+Kp3JGtIpk3udvIYyXpn3Q+dVGxjBvhsV8
         E78wnPG+ufzxfeB8LRLkOZHwCml7jQkPxJil2dS6NF7msvtoRZvpsRrrF7btnuxHW3it
         kRC53YSIEwRupxYyHlmPv6697GwgTxiXxUtLWc2SsiELrzb1LumLaAgfGryDyw6DE235
         xJyg==
X-Forwarded-Encrypted: i=1; AJvYcCVPGaDw9MIk9qYKGaUSZMdFdLmSgCXiudVfDwhgjWU7/Qjm99wlOtBRGDrkYGCM/G8MRh+H7AjIKEs/ZnyyY3JSsg==@vger.kernel.org, AJvYcCVSiYcOvDS//5K4yWGH8tbt4DXVEiQt0bS9JkRs/7OCEoYcmNkl7GmrpBPO9ai1EQHbOLNsyN9gLmHj4xA=@vger.kernel.org, AJvYcCWS99qquatjrD8p5mk3cwr4B1rZjpP4kffahGD3CbH3zDDG4s6vAq74mZcXhuDLr/6U8JwA9Csunur9nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyANCm4YMahQcs2emXHQgGLf7SpCU3lzE3fW1pMuZCfigxlKUxn
	auiwNih85vOlQkP9yfXjgzcm3U4v2DdcW4JN9O/F3N/2FqKCIAlz
X-Google-Smtp-Source: AGHT+IGx4Wpf2vecDrOHEWMdzE9PmcQPFMoV0ZbriB+gqvuGl4Z+r/mw9Bg1z8h0Gdh6QO04i+Rk3w==
X-Received: by 2002:a05:6a00:23c7:b0:71e:695:41ee with SMTP id d2e1a72fcca58-71e4c139383mr19140399b3a.5.1729017193889;
        Tue, 15 Oct 2024 11:33:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4bfb:6b8:82e3:75b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e774a41afsm1589567b3a.113.2024.10.15.11.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:33:13 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:33:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: bentiss@kernel.org, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, linux-toolchains@vger.kernel.org,
	jpoimboe@kernel.org
Subject: Re: [BUG] -next objtool build failure (bisected)
Message-ID: <Zw61Z8xBhe1oJ_-W@google.com>
References: <fe8c909e-bf02-4466-b3eb-0a4747df32e3@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe8c909e-bf02-4466-b3eb-0a4747df32e3@paulmck-laptop>

Hi Paul,

On Tue, Oct 15, 2024 at 11:10:11AM -0700, Paul E. McKenney wrote:
> Hello!
> 
> The next-20241011 release gets me build errors like the following:
> 
> 	vmlinux.o: warning: objtool: fetch_item() falls through to next function
> 
> Bisection leads me here:
> 
> 	61595012f280 ("HID: simplify code in fetch_item()")
> 
> This diff looks inoffensive to me, but I get this error on this commit
> and not on its predecessor.
> 
> This build failure happens on quite a few different kernel configurations.
> I bisected using this particular reproducer:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --buildonly --configs SRCU-T
> 
> Thoughts?

I just added you to another thread where Nathan proposed a couple of
solutions:

https://lore.kernel.org/r/20241010222451.GA3571761@thelio-3990X

Thanks.

-- 
Dmitry

