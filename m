Return-Path: <linux-next+bounces-3275-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B27E94CD22
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 11:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAF03280EC7
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 09:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AF22A8CD;
	Fri,  9 Aug 2024 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MmWhZGJw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BB8174EE7
	for <linux-next@vger.kernel.org>; Fri,  9 Aug 2024 09:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723195049; cv=none; b=CJBZfK+L8QBjsKo1RrmYOhjuOYq4BlWRNzT2pfFan97LqkRnkkN8GMvaioAtgVdJe6sj4kCOKRl9CFTnYQWc/K7GETWwT3OzJvOMtcRtZ1/+MsLXi2y8u14Pt+L4JVyaaJ9uykR+4jbSSUvelGqTF2vaDSmacKFQLLtByy/tTqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723195049; c=relaxed/simple;
	bh=igugQdRXVlIowamKTTuJc1HvGonj6sWWYikfdzHf0q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+BfI9eTn472EfPT+WdW2nngxPxHkz+RQpI3/Wvlpa06wYqu+2OpdBDwV9+r4EkCmmUv6PhjAaoUeFKOCV+CiOq5iAXyGRUijHisfKdNO9HJ5wW9CCJLthGACaI5H5Sce7wHdNNtW6ofI1rPDV3u/P2bS4WbWzLeV3deNiHrhXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MmWhZGJw; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5a10bb7bcd0so2341991a12.3
        for <linux-next@vger.kernel.org>; Fri, 09 Aug 2024 02:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723195045; x=1723799845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ryfApYxhX7PXGbTIMxg0b4RWcSid+CaUrEM5mIYRhSE=;
        b=MmWhZGJwQM2GRcmXSs1c4B3aEzhpP+pat7WKOjOu3coJfXt8CEPoY0UtufGtNCghjH
         nkFfx1NOaW+wwBHi96naijBCrmFd0AdJSQXcOyeIIws/wZAQkhxDpoaGmZNs33Il/gR5
         GgjEIu2ohOVxCBpQRFkKrhDnYMIAoUadUMk/xnBrdh9fhLS7bRWbuAKN+jGJJT6p7ps+
         10rzYRZqzb1ZKQMgQOSyxQq7Nfr+wIgtjmTJB2Yew2M4DpwynoIa83UutzSOyszrof3R
         uoY8Zch+s+MwqwYfaKzIjfc1dU8Oh3rSKeAehnzu51vkGaJhYZiXkkjHm4hOv06tg3C6
         LqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723195045; x=1723799845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryfApYxhX7PXGbTIMxg0b4RWcSid+CaUrEM5mIYRhSE=;
        b=nAhwgiW1B46s1mLO8ws+WJBZuJmvG+q5cING+9YRrThQUXKlDw5WKGVB5BJmfi5Eba
         anqoWlLwFI/wFzOk2Ht/McrowNCvqrJhg2yvie2+4QEINTtG4a0A1CTqDpjAAOr3Davr
         bD57cSRDNzcp2aVcBACdVt2nVUFAk0MHi4wk+8ORXBGyhtcOdxjT8Q7WoylpJnygUeCf
         mOyTrutiKtsCj9QubK5eUn6JdxFm8Vlyr7nrG0mXHdEx50AAWHBUkZu9lF54OoGfJpwR
         8rzcZuCMB4loNCQtmjNV0u5IIDYLIslVNE811HSAv7xSQkCHccwfTDkHSQYKG/mPnU1D
         8/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdwiotABjOfuRBDJwfKJeuSRezG1y5kjq8OHyllLVZZ6Ohh+S/keSKRZwSXElDjFzd6moEa94kTDj7MtMfm33bs5mu5DXQQrZO/Q==
X-Gm-Message-State: AOJu0YwjZ7+CyyyiTvh4lxVQirrz2PeFpH1Yx3YUZN6Zo/DhGfYriqE0
	7a4MQThzzobZONQCSgh0vWAmiYerp/sTSmSs9GHb57V9dj/F8H2loQ4ypE+US2uXDWRrNkFBKmy
	N
X-Google-Smtp-Source: AGHT+IEo3cEyPoxBA2fpRetZ9/GlKWVify2iYpIuz68wK2jXgKKKT45PlxSJNQupUzQvxtrtknhlKQ==
X-Received: by 2002:a05:6402:1913:b0:5b9:df62:15cd with SMTP id 4fb4d7f45d1cf-5bd0a6a554fmr741677a12.32.1723195045346;
        Fri, 09 Aug 2024 02:17:25 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c4d99csm1363351a12.47.2024.08.09.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 02:17:24 -0700 (PDT)
Date: Fri, 9 Aug 2024 11:17:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ryo Takakura <takakura@valinux.co.jp>
Subject: Re: linux-next: manual merge of the rcu tree with the printk tree
Message-ID: <ZrXeo7iG0bO-JeIS@pathway.suse.cz>
References: <20240809122321.5675db8f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809122321.5675db8f@canb.auug.org.au>

On Fri 2024-08-09 12:23:21, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/rcu/tree_exp.h
> 
> between commit:
> 
>   9a30ceb4d93e ("rcu: Mark emergency sections in rcu stalls")
> 
> from the printk tree and commits:
> 
>   34863005f96e ("rcu: Extract synchronize_rcu_expedited_stall() from synchronize_rcu_expedited_wait()")
>   c925e2f61399 ("rcu: Let dump_cpu_task() be used without preemption disabled")
> 
> from the rcu tree.
> 
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

I have removed the conflicting commit from the printk tree for now.
The patchset has to be reworked. And the new version won't include
nbcon_cpu_emergency_flush().

Sigh, this conflict existed already before 6.11 merge window.
At that time, Paul decided the postpone the RCU change to make the life easier,
see https://lore.kernel.org/r/20240703131820.02eb8021@canb.auug.org.au

Unfortunately, Linus did not accept the printk changes during the
merge window for 6.11, see
https://lore.kernel.org/r/CAHk-=whU_woFnFN-3Jv2hNCmwLg_fkrT42AWwxm-=Ha5BmNX4w@mail.gmail.com

I am sorry for all inconveniences.

Best Regards,
Petr

