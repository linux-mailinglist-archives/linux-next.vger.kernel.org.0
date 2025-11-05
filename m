Return-Path: <linux-next+bounces-8845-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCEDC35AC1
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 13:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F7DE189B843
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 12:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44B7314B96;
	Wed,  5 Nov 2025 12:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="WtnbNFbt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9DE314B64
	for <linux-next@vger.kernel.org>; Wed,  5 Nov 2025 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762346140; cv=none; b=BmLjzUaaXvyE2vWEg0aZvRP6KpLbsk6nqKazP6asur4QuC9BUvjDq2j8do/Tn34a7oGUy+6conlJP8hGMv9BZWr5ccluYFjkmKGXSmqyqOQgpSMf7UtWXmXsKpD8uUzhoeRb4xRYsY9NmGv9NkzlhnND8GJJYqw6PF8N/8Pnwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762346140; c=relaxed/simple;
	bh=WwsQ6EkWs4cljDWC7/38kV6y7HlGbCP2dln03kRejso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6HmQtf+6LfbmYDzszq1O1686uTYWI/zfi8dcKFSRwdTVwUARKu7DwmyKZdSBKjcx161SOKUg15jhmsgF/Pnkzxf7T9+YaOOMJJUOlFExpFfHqDyBv+gG6k5behhmSa0hom/CLYSBYf8v6WUFNgjBbJuVkR5rCHWTIU8GgQiegY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=WtnbNFbt; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7c6da5e3353so262130a34.3
        for <linux-next@vger.kernel.org>; Wed, 05 Nov 2025 04:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1762346138; x=1762950938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbMjCqibAcNyevnxMiqt+37T6BE6BxV3ZJadO5araK4=;
        b=WtnbNFbtxGFMr6sctljz/+IjzA3dSI273dd97iZBkyUon/HjkVbg8tUySoBImY1U0J
         //TJvpOZpTb6X+qb/yxO5LoMcIG0jR3tq4IUszGqzx7gXDgha/+ymqA11N/kBnx+9RXg
         b0rMdqxxGvtXZWpAvBhrkqQxf2yxarj4CRVfTbWjVucE793kDOwMMAtEB8KEDm7RIy74
         +9clhzKnjnyBDNNk/kUE4L9cg1S699nZKYBRZBclTKg/73Oj5Z79Pg3x9w/eS8vSQO7q
         NBOSBXDBSUpDtRPZmVwk9qcYhVgykeWvCI8J82MuPNl7341XdwRO9zsIM2RxG2DI7Gli
         f/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762346138; x=1762950938;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbMjCqibAcNyevnxMiqt+37T6BE6BxV3ZJadO5araK4=;
        b=Dg+OJHOF/010IKNtE+XL3gSSINJPvo6238UnMhyFT2236Q52JxfHZTwrSFYIAorl4r
         Nkoe4w+fB9hdLgkcusGLqw/J7R1IgaGqb3/OnnqTpXqdIT1+j8PfVkz8mNBjp63cM/1f
         8/7tbCcsKPKkmw9XPyH1daIqWD5S5/C3uXveoWLSH5rqH+t97paXOPFY5jZvmEhTTDyz
         JVn8pk6XFVWIk7YUQCaJxuluunVcAeW1Y8a8noJL0INGqFJFFmPD8cM7uB0cxc79x6Xd
         ojvJTwDDXvV7QMxAo/mCY6zOk01yn1Zxzztz06vesg86yPRsEXI41sNc/WjPPL9k4zzb
         OqZg==
X-Forwarded-Encrypted: i=1; AJvYcCX+xPy4asndhbYz3NvhmfQpEYC8oUDALqdHoE5OzC0qC3yRjUTyFawxit+0kx0dFXX1oguVWe0zM3Eo@vger.kernel.org
X-Gm-Message-State: AOJu0YwFZ14q9dgcaK96EB08jvv0tTKbmovFISG4F72T8S+ognTZYFS6
	X30bNrQPnEqw2zuC6H/T/45PTvtdEdcx4YSngYIUkLh9EoSOdzEnLn/rnKVV8DN7L2M=
X-Gm-Gg: ASbGncvE/64uiKeXtVOzDjz6mLFHwWPYEPh9d0UFlXFgK6xu9U9yTBkZkma0Pub6/bj
	1Yr+f3zSdUQdbJv59g4pe0USMSEvA9J+1rflBZ94YRC1KWLP8gnzR5jGisMu9rb719NOPGQeSdE
	GnuSR7zLduAkE/B+dQ7sUgCdPfJvSoKXYbGXC198NMVY+iUKK1BvEcW3LE+LoKSeEMRibtMqSPG
	4uReCZOu1TKxPdWtXO8avOM/RTYp8EzCbs4nCoE7yO19IRzanULgEGRzBTz0E3XHKGVMDshVGXv
	uevgZ8F60xQIszdMuj3BhOT/AcaHzlnGg0fqZJXpOiKfinkN44T29i2ijBL2rFNaxTs7kX1uPVz
	tmG8NNxfmLjIShoWmmuD2q0NU78394B5QJ65pDh3/rDXjkOBJ7BLQoGkoovYam/jxlxqFdQaqhh
	ZoyZc=
X-Google-Smtp-Source: AGHT+IEcp9MuupCnO8K2Mvmog2ZmESQD2KGNS4VWQpkldDay+d6mIJ/RfVE/yald9I4p9eyN0KbYgw==
X-Received: by 2002:a05:6830:2703:b0:799:de78:29d1 with SMTP id 46e09a7af769-7c6d131e99amr1663453a34.15.1762346138314;
        Wed, 05 Nov 2025 04:35:38 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:6561:3bed:1a88:97e3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c6c251128esm1966375a34.31.2025.11.05.04.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 04:35:36 -0800 (PST)
Date: Wed, 5 Nov 2025 06:35:30 -0600
From: Corey Minyard <corey@minyard.net>
To: Lee Jones <lee@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the mfd-fixes tree
Message-ID: <aQtEkg6fin70cPVW@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20251027080835.04e0a4c2@canb.auug.org.au>
 <20251105094750.GF8064@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105094750.GF8064@google.com>

On Wed, Nov 05, 2025 at 09:47:50AM +0000, Lee Jones wrote:
> On Mon, 27 Oct 2025, Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > The following commits are also in Linus Torvalds' tree as different
> > commits (but the same patches):
> > 
> >   91a3e1f5453a ("mfd: ls2kbmc: Check for devm_mfd_add_devices() failure")
> >   fdff3cadeea9 ("mfd: ls2kbmc: Fix an IS_ERR() vs NULL check in probe()")
> > 
> > These are commits
> > 
> >   4af66c2bcab0 ("mfd: ls2kbmc: check for devm_mfd_add_devices() failure")
> >   0892507f4a0b ("mfd: ls2kbmc: Fix an IS_ERR() vs NULL check in probe()")
> > 
> > in Linus' tree.
> 
> This is because Corey applied patches that they shouldn't have done,
> despite being expressively requested not to!
> 
> https://lore.kernel.org/all/20251009095611.GC8757@google.com/

I missed this completely, I'm sorry.

If there's anything I can do to fix this, I will, but I'm not sure what
is best now.

-corey

