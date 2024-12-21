Return-Path: <linux-next+bounces-5014-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FF09FA17A
	for <lists+linux-next@lfdr.de>; Sat, 21 Dec 2024 16:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C395188CB07
	for <lists+linux-next@lfdr.de>; Sat, 21 Dec 2024 15:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB2B13B288;
	Sat, 21 Dec 2024 15:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtNoqoIV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE17335BA;
	Sat, 21 Dec 2024 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734796511; cv=none; b=aI/H8+kk5gusi3w9nUS6wn44bpY7g4xcdy5jnIcvB/5H3jQ3TsNAEbuxl3H3HmD1i1f6l42hRmRl9eMn/BRd1jcCnYuCi2Dp9c42S39xRtU7UhF5M0yVSMPVa4CJo8nAJfgk+t1Agt3b2pDkgWu7luEZu8c1QClINlRHk2GdyRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734796511; c=relaxed/simple;
	bh=FWD71EpcID/uuPeDKwIoaJ3lx6tj03mB3PZsAvZfSag=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMgZ6CIfW4yqL3UgGX4bMnah2YV8+qAuhfSDgBG+dOCGYSVXpMSHPfNvF7M76JsX7RPazj1eSycCntNwKSQ5/RQH16+K1bQ2qa6gUOnmfXJbzghEFXryTO9UQK7Smoa69qjJRyAtYxMFg4C5yBCfCkjmB+6F/SswyPUwVkqCs+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtNoqoIV; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53f22fd6887so2666934e87.2;
        Sat, 21 Dec 2024 07:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734796507; x=1735401307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BATSSNeoJwql8qPRV4KLom5DBV69wVEq0bhk1VXVlrQ=;
        b=TtNoqoIV8a5EXvhl0falsU4dp2fzACiCp/qIHVmwm4uvF0yhRObrfTvNKsJHzoKA7k
         S2TELYhY9yYABoEY+kzxJT89+H+YVEXHHSXDjguuS2zi/vZUdo1NMyedVgUcJtZ8qiJr
         SRzHOads+OJAwQTUi261M2fSWZBDB2p0YY1AG8CWoAxNxl2AIiZU5Mro7c7ofDJObkfA
         5q2xxK28uxFpSsr24Oizi/09CEYR5Mv99rqJFeB4MFkzaEOZCHIldBlqlE53jRs+L8Rb
         j7HGJUUkqUeb/KM9y6ye79kLfd7V/6Z7uSJ4rjbWWA/HLm0AIf784FYojgaVa5nrh8+Q
         rxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734796507; x=1735401307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BATSSNeoJwql8qPRV4KLom5DBV69wVEq0bhk1VXVlrQ=;
        b=XPEHYoRXDu9Gvc6xWKlJoRB/FrgXHEfm2AVHFPcGfnAnZQ+eSsYXJmam1JbQ5KGOvQ
         IQBCwOZtcAljWk8FTISLuHTjqZKa06gaIFKSuy4d9EpzMspK/SVKZ7mntzct4Vg6zSiU
         p7A2OayPRIjnuqXGCp+90Bw5Pg5FmPNTMfxUap9eAM4HOIuAcNxDgHr/L53Ik38NSvjC
         FboBvnnskUPhQxB/rymlcG9ejuyalYWTRFdBmShi71GHkKiVroJWGbFBKK0hUq6ATX/O
         WjUkqUo1Sf1JQlDVhQ5CGB02c18/yybq+WuEM/prS3JPbN6R0rJJtdkPdUoKGzJkcpT0
         VWVw==
X-Forwarded-Encrypted: i=1; AJvYcCU4WH5pAgiTr1QQDaLkJmDoZKOkaNntigGt5aiFkkyMdUClK2mRT8HSIkFMleJh8WZXThSUfeePZyPyxvs=@vger.kernel.org, AJvYcCUcWFc8FRXPlqmet/styNnWPVyxws56IDP3w5EkmG6+oTNvSmSods+O8AoFjpqG0t7SqLrKIWSNjW43SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaKoDvRsPbLRoTZsB4Z3VBQnfudIdsCl7ldynKBKzbX4Ypeq7H
	9f45J4Ucw+a6bHGdJgg1LNb1pElv40ayH5JQY80jrNaqyb+teq28
X-Gm-Gg: ASbGncuL8wmNxJSxFdPjWo9/N1mh5dpTx7i25lM5xW1QGagruQadj6DXuhBABZUd3LB
	45UKhWm5AxsJqx1ZaNghLOJ+eTIW40SASNj862ePnWllESZIoXVOeynuTE6wYoA4fyWrpCQRH2g
	yDPJZjl3NghO1PTvt4XSptafN8fUdKex0Ji4T40BfXjaIRnxXv7VA1X0arQDzaeGzUAl2HBl7Aj
	hWNYmeaK36UR/PFRtqBnf0=
X-Google-Smtp-Source: AGHT+IFBf9Y/83JfyBULCYF7jz0G1zx6wo4DPx5Kk4VZag04k88kLq+R0IZhAG8iGfbfCtezQFLaAQ==
X-Received: by 2002:a05:6512:3049:b0:53e:385c:e86b with SMTP id 2adb3069b0e04-542295404c8mr2008552e87.27.1734796507223;
        Sat, 21 Dec 2024 07:55:07 -0800 (PST)
Received: from pc636 ([2001:9b1:d5a0:a500::800])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600099sm770844e87.78.2024.12.21.07.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 07:55:06 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Sat, 21 Dec 2024 16:55:04 +0100
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the rcu tree with the mm tree
Message-ID: <Z2bk2MlmB1g8f0e7@pc636>
References: <20241220133738.1beae531@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220133738.1beae531@canb.auug.org.au>

On Fri, Dec 20, 2024 at 01:37:38PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/rcu/tree.c
> 
> between commit:
> 
>   bf8f464ee259 ("kasan: make kasan_record_aux_stack_noalloc() the default behaviour")
> 
> from the mm tree and commit:
> 
>   049dfe96baf9 ("rcu: Report callbacks enqueued on offline CPU blind spot")
> 
> from the rcu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/rcu/tree.c
> index 3885aae5f9cb,24f1cb292a92..000000000000
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@@ -3083,9 -3083,12 +3083,12 @@@ __call_rcu_common(struct rcu_head *head
>   	}
>   	head->func = func;
>   	head->next = NULL;
>  -	kasan_record_aux_stack_noalloc(head);
>  +	kasan_record_aux_stack(head);
> + 
>   	local_irq_save(flags);
>   	rdp = this_cpu_ptr(&rcu_data);
> + 	RCU_LOCKDEP_WARN(!rcu_rdp_cpu_online(rdp), "Callback enqueued on offline CPU!");
> + 
>   	lazy = lazy_in && !rcu_async_should_hurry();
>   
>   	/* Add the callback to our list. */
>
Thank you for fixing this. The resolution looks good to me. Apart of
that i have created a new branch how to resolve this also:

remotes/rcu/merge/rcu.2024.12.21a

--
Uladzislau Rezki

