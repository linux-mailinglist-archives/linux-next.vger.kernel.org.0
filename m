Return-Path: <linux-next+bounces-6390-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F98A9E2D5
	for <lists+linux-next@lfdr.de>; Sun, 27 Apr 2025 13:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62C4C1895767
	for <lists+linux-next@lfdr.de>; Sun, 27 Apr 2025 11:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A3A2512E8;
	Sun, 27 Apr 2025 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKRTLH32"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DBF246335;
	Sun, 27 Apr 2025 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745754143; cv=none; b=fLeP9i9EYIJK+KV7TiSAzfhsW6UwXH+nhs7nSeJJ2h4mIzCtH7s0eZZnK5ft7qiqz9ujvN2KhhuRTgkK/xLDyizMswsLg92Ng8VqcVJWmDHLM1brT1sG0FOrN1agOGPH+IlICngz0gKBjucRjwbph8KyL5SrA+hQGpbKadoTMC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745754143; c=relaxed/simple;
	bh=KNql8FClaMyfRrcrwrmOHi+8D2b+XpXBCWkX/Sf3QwU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qMQptB57EPhquRZI4DCzWW7jvDsKA5ESdb7dzGKE8AZzGD4mZuUIa5ytL9ZhrZBcVZRKvzCFi3SkjkgqCOGBlXG/0L2GX0huQLVcNh8YG//6+cBv5cgUS8e94/AGVkcQgfXozNH/XBnSVJZfaVhwQg52RqDUUlVWRJfqXoKj53M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKRTLH32; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43690d4605dso27789865e9.0;
        Sun, 27 Apr 2025 04:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745754140; x=1746358940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwTjseUfifzEkdit9rRMTG+UVisiWfwrXNEipekLi4M=;
        b=hKRTLH320TIAC1nvno9qePhIsHjDKgcnZV/S+VQXL7SVLc8fOCLcIOqOXb3QT+Paip
         WcE+N6TD3RvWl0Vh9+13gL1XF+efygOa67c7rJQERjG7pPZ2LJNUAKgSHP5gU5S8QD56
         g/j/ADZc4A6rVKkI4N+amn2yYkeu+fqfGe1c9cs6WvpCLYlTNbkHnLbk31cpUVvPhusV
         nKl3ioqmvpzPeUHpJcOw7vgdGRZdMJrHuywX1nDZej3+ZPzeRl6zt0PfZCZEuvUe7WAD
         5CB7p6MJzAZAwL0R46DshE/w9DgjoWH+WrRgLDL2UNcbz2F1lYESAGE0a7NU5tgd8qlH
         QHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745754140; x=1746358940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwTjseUfifzEkdit9rRMTG+UVisiWfwrXNEipekLi4M=;
        b=H6u3Zrdgl4Zl1u3TtKt67LNDGnZWtMy+T2bCv2Ds3UBtM2B8k9HsFQXfPc4O65SDY/
         X8ZlmYPgyluZnTg9htVGLaZGQldUCLI87iuYEq0DoRDN8ZYeyWMRUrjAiYKUjHsYKt+g
         0CaHXTRYqpsMizPlBdrFj3lbPgie1zJLN3FwivI+RIj9AMyOeHrn9tZuH/CpgWhXVRqZ
         D0i8Q+ee24aBOAF9da7XE02c785iGPCVExovUctZ6Nw9UHSO414CeYjr4tHBZ/G4swLB
         RsyDOOvxlFiEgUb9LSca32lKic2bwo6Ln+Lpa7H9SuJt05VcZGdq8COEI0mN8/YH9SI/
         umvg==
X-Forwarded-Encrypted: i=1; AJvYcCUasQP3+r3WbVjxeXvnWvaqpVlOfLAqNTI+N8nqLxSsqPtTSGTpl35JG5hWMb5WhlvmXQlVMQD4s+UoTUA=@vger.kernel.org, AJvYcCXGa7EVU1NJGz4N3rOLxbBACBocUwDw0zlkM0e0QigatQCzcCMngWY/HMuKiAG45IbrxXdn/J94YQQefA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFQ1dcILvAhOcWx955fPEjC8IZ/PB/JIjt2zY0CNPFVlFgj/9+
	DnnCgiIybqmhx1vutYeZt0rRHHs1Q5AaXoJi07hwQeU6Ob9ir/SPMfBeLQ==
X-Gm-Gg: ASbGncuLKSf/SiYdIPysYRwxh9m70yo4ZV6VtYrt5G/YTOtHv8xZ54xWMjBo+4SPjXQ
	/2/Ju61AaMN+FFLLryeY4ocm6jtS8g3Bgj2bMq9+axvA2BMfsv92ugnJqkTo3RDdXMR+A35Buoq
	ftfw913cGeiZ7DPZzaQlr4eSITlnXVaU++4fqONr73JY7Z3TrrZOYHNSKLOnChltM0d6zvugPGp
	ba4UO5VKshJuIkoZbV2sdeHNITYOU9IirC96ORew6E5lXVuxpukeLwTXEuynos7bcl9eEOsfKrT
	YtHH+b0c8qq2cFfODu+t6OVPPDabk0AXQYbijkROKgWL8DhGyrWLreXJusXK0y6GEspZskrd53w
	8TPE=
X-Google-Smtp-Source: AGHT+IEEkM9rDMRNwkKFIOYvtpdAJIsnGntwI4wHIfD2y4WjFdqyIOLTV7WLRMG3KBTCRfPjcmP9bQ==
X-Received: by 2002:a05:6000:2283:b0:39d:6f2b:e74d with SMTP id ffacd0b85a97d-3a07ab85da1mr3982692f8f.39.1745754139569;
        Sun, 27 Apr 2025 04:42:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca543bsm8242711f8f.34.2025.04.27.04.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:42:19 -0700 (PDT)
Date: Sun, 27 Apr 2025 12:42:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>, Masahiro
 Yamada <masahiroy@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of Linus' tree
Message-ID: <20250427124217.44b83f78@pumpkin>
In-Reply-To: <CAHk-=whv79F+zTKPa3yygTWnC+z9gRtPOdj_aBegWXtWB3D9=A@mail.gmail.com>
References: <20250422204718.0b4e3f81@canb.auug.org.au>
	<CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>
	<54c5930c-4006-4af9-8870-5d887bae7ac1@t-8ch.de>
	<CAHk-=whv79F+zTKPa3yygTWnC+z9gRtPOdj_aBegWXtWB3D9=A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Apr 2025 11:20:21 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

...
> Right now cc-option uses -Werror to turn all the warnings into errors,
> and thus causes a "unrecognized compiler option" warning to be fatal.

I think that gcc only warns for unknown -Wno-xxx if there are other
error messages.
So even with -Werror they don't cause a compilations failure.

	David

