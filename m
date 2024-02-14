Return-Path: <linux-next+bounces-1153-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 264198540C1
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 01:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B98A31F246B9
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 00:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2842664A;
	Wed, 14 Feb 2024 00:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DQR/6kvK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947847F
	for <linux-next@vger.kernel.org>; Wed, 14 Feb 2024 00:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707869798; cv=none; b=aMTjIkKszA4Pj7/lkacYvYsSHFjqRaFrWcr0pv+j58N60H5m7nfEVAjjBGEQsDiLFwNt2LLkTTX1e0fTJoymk9j3OZ0BDp3I4FmrC3xrWPXMIEUV5u6PHCTnI4in9W1N82orZLG/kpaButqLTOTvOxJa1QdU0m790sht2u41I18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707869798; c=relaxed/simple;
	bh=Jj2mI4+z893fkI7KcAWGdICx7F+XHBksLBKFmFLUy3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0u0qtqp0LhJNZv+fWGrmI20jIU8iE6BbJDLspr/gmaLit7hskHy49cDiB5UpZm9REOx+ihwGK/YebuB2ky/+iXYWZYKW0MU0XMrF0PkhyhF/dMJU5yToHhGhe0qJDYKnCe6bbiBeuhbJg0saMU/FYfY8r6Ti7yOaIXAyNDs6qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DQR/6kvK; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so3326873a12.0
        for <linux-next@vger.kernel.org>; Tue, 13 Feb 2024 16:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707869796; x=1708474596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dE2UETRpvF16U4f37LAirje/SMvTyMmWDk49s8xZgAg=;
        b=DQR/6kvKRhG3VOKSsna9gIdKQwZ5q4nmS9eTt3+7pPuN5gBOV7mD7V9i8qDqKxvwGv
         YdUaj3H+7rDOGaQO5ngKJoTNC/eTyWwlPZdn4z83ahZ86d52OQ3+fQg0PDeOrRfx66CB
         U7WaxlRie7K50nqt4D7odNIzlCS9XdHds5BKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707869796; x=1708474596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE2UETRpvF16U4f37LAirje/SMvTyMmWDk49s8xZgAg=;
        b=l+qMFptHNn9cWGNCSS4Cm+EpmlPjkLEq4OnPZDrPahuVof05qiLTYRZQZ/owwPiW1G
         fPyaEb1MJ1fF1liqb2+Cd8Y2MDIwHxFeJQphnC9CFHwTR8dd8DWKDZRFlx3b2b3Ju4Ev
         qEfyRVo/H+rKKdeoy+PwyiPxE9S6awN0MswcohrROugUQgfXvstBXGVupko9an1WlRYF
         nKNURZLO9sY0AcoB4kBoiUALk+F5WsHOeqYYTh7qAHaatTNujgEa2ru1fP/7SAukw3Ci
         2hX49XtalU97qcyKUkbMX3ev2qUv0rgkD/3OUVer/VVXLNCCHvaM11JPDZ6vH6E6ypG2
         tfxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJnNNYCVB5AnyMjQh74hHaylpZ9/naccgGv1GwSoAE8oxhlTJLXb6A+HwMMgq0j88SBU5nBi0AhjCxhGO+dDRfHuWa0KSh8P5ZcQ==
X-Gm-Message-State: AOJu0YzzBpJrazIExeFWx5ehYw0KNbkFIRPfZWYDIx+lb8Shm2v1P2Hm
	3FB8sWA75SqySwBhTgJjiLqfr03Qo+CGIatOyrcyzzcJiGZL2Vk6P+qgdvEPJk8wzJMDNpXP1HU
	=
X-Google-Smtp-Source: AGHT+IHJ3aKj7O5FlP5mKnfwqC79okKRRwEuTt+rqMdH8uJz0AMpS6OJQxYmzpXh58S4wjq5eJmd6A==
X-Received: by 2002:a05:6a21:3a82:b0:19c:b3ea:27ba with SMTP id zv2-20020a056a213a8200b0019cb3ea27bamr1504063pzb.52.1707869795891;
        Tue, 13 Feb 2024 16:16:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW64+jpFz5kXUa2KhvOrCzbDEq5uznF5TpVCY2bOmO8UHb2gn6CiMR/L7UFPMxYd9IitCIRuFYuR7pbFjS5bGbXXcn8wstyaVxFXAZLO3FcpZ+l/4BJh4TZmt8k+x8DxT4Y0P0vOQ==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g15-20020a056a0023cf00b006e08f07f0d1sm8011934pfc.169.2024.02.13.16.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 16:16:35 -0800 (PST)
Date: Tue, 13 Feb 2024 16:16:34 -0800
From: Kees Cook <keescook@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bcachefs tree
Message-ID: <202402131606.A70D5347F3@keescook>
References: <20240212105456.65194f29@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212105456.65194f29@canb.auug.org.au>

On Mon, Feb 12, 2024 at 10:54:56AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bcachefs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: modpost: missing MODULE_LICENSE() in lib/thread_with_file.o
> ERROR: modpost: "stdio_redirect_vprintf" [fs/bcachefs/bcachefs.ko] undefined!
> ERROR: modpost: "thread_with_file_exit" [fs/bcachefs/bcachefs.ko] undefined!
> ERROR: modpost: "run_thread_with_stdio" [fs/bcachefs/bcachefs.ko] undefined!
> ERROR: modpost: "__darray_resize_slowpath" [fs/bcachefs/bcachefs.ko] undefined!
> ERROR: modpost: "stdio_redirect_readline" [fs/bcachefs/bcachefs.ko] undefined!
> ERROR: modpost: "run_thread_with_file" [fs/bcachefs/bcachefs.ko] undefined!
> ERROR: modpost: "__darray_resize_slowpath" [lib/thread_with_file.ko] undefined!
> 
> Caused by commit
> 
>   f894f9e5f0ad ("thread_with_file: Lift from bcachefs")
> 
> I have used the version of bcachefs from next-20240206 again.

I've mentioned this before, but this patch (and I assume others) was not
posted to any mailing list before it appeared in -next. This process
failure really needs to be fixed. Please post _everything_ going into
your tree to at least linux-bcachefs mailing list, and for things that
toss stuff into lib/ it really needs to go to lkml too and CCed to some
subset of people who have touched lib/Kconfig, etc last.

And, as mentioned before, checkpatch.pl absolutely screams about this
commit. Lots of code style issues (unnamed arguments in declarations,
variables defined in the middle of function bodies, etc). Please adjust
these things so it's easier for other maintainers to work with and on
this code. :)

-Kees

-- 
Kees Cook

