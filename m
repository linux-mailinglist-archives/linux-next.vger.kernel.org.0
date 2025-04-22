Return-Path: <linux-next+bounces-6311-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25709A95FD7
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 09:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2214916D9D1
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 07:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B691EE02E;
	Tue, 22 Apr 2025 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f2QTFXIy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3547A1EDA28
	for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 07:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308125; cv=none; b=WAM9vDGiivdUUUhcPReqtq75QyyJ1AIjxHGAPHiH1IH+ALvmjdLhjD1j0njqAn/Wfsrg8bdOwRH6E4V9qfuQVOCjjKWxLoswEWCil4azJMcGVUT+qAs3Iilvcmh8PAybRuqcXMcHGT30t6ejzEIBy2RcDgTSnK6WGtNGnYJCUzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308125; c=relaxed/simple;
	bh=Vcg4jvMeyradFYFlhfceNofHBCfEYhfgLYfIni8F40E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prar8zak85WNFVx5ltJNELBD5oOQAAH6fumtVCPSLiP/YrJoSgCc32IbuRXVh3fsuLRE80oGMRQ0oWpfo7TbAxS0avHIWQGa3HkOSIPXBrU/uaeI4daU9vjNLlcCJiCLvTMO74mNBcmR9GPDs4Q3i3Ggbz92mouzhPeeIgG7Sdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f2QTFXIy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a064a3e143so76113f8f.3
        for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 00:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745308121; x=1745912921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zab4QDku25lz0nvmJrQTcIUVlTxqQeC0hgLov4LWsvo=;
        b=f2QTFXIyNHqmW5+liz6/XGdauxfJLmLhiIFH3SQWBI/eA6QoaAD0qmpgxhLg/W7t5X
         mSZMDKxmz7QIInwAdX08qkNd7OjGmWD8R3iICfByShdiSt6evzM1D75aJSadeOHOTh/I
         /loTHXsxjz3yGX4m4K7nGLGkAqXvA1ryxRsNxH2F0hS3U85/MoacKFqsKUOMeBUkwRFD
         eXSkeFh0diA/6jwKezfgl12XpRgxEDTGwRiJenuGdPORLNVIExtMXo9nyOOsK6QKiMq2
         icMj2baUjMNUX3El2hvNIUTEUh+QTGnDXcjZHmnQlezHwfZHsORFtwSajn/Rf1bFvflb
         R5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308121; x=1745912921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zab4QDku25lz0nvmJrQTcIUVlTxqQeC0hgLov4LWsvo=;
        b=fTh3nn2M0ZUK3d0g0K400DTKxlSe6I6F0MoQKCAmGTNSzVjBhQxapZ3BpGnTku0CSg
         Kvw4mVZOzkwsXJTwOnXCTQ+uCrGDJHHPil6KgKkmfOdZd/PDLmeubs0KVf6Rlyb7pinm
         5aa67TEaVPcgDtcqPPIaks/zNrZEec9exighKeAlf3RMZYQsmBxeq7NWriCTAjmj+A22
         FdWKpUIOg54s/mUBywu78kO8Mivb6WMrKa50DQnAG+IRz+NEOjFfQ0ZFmo6sODqX3tz+
         uP3tHGc+tKX4rAOyYU4S4HfN/kR1rafyc0aIY+mxRezBIcNfbkO+DrekRMtiLJOJRx5f
         aduw==
X-Forwarded-Encrypted: i=1; AJvYcCWWFpvPINCzVYGLqe1AIWe/Oy6qqWKUJI1QnUvmWDjJ2Y4vWIjM89aP2xRXAi7+/CLo8T4FOhhHGkxJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwoshBBjBcfPsND26GyO6Mr+VxYip1yo3HpH9j8j5cS5Sdh5aFg
	WAl8jnokqtHK534luf8n7lUL/FIR2KP1I5mlLX9fd+J6TFK9wu0ZJ6tazQDh73k=
X-Gm-Gg: ASbGncsRfzZdB1PmN4eIkB64bTutUCBCjOU0OjWRtkxlli6PQJom7UidNn0KGjZC/T8
	bNJOJW/yHwKxzrZnzGN2fDFMw1J5keTD7NO9UuwAfGJMSIPe1DTQdgbWUrkUdlKitFohpKYr4ok
	rOT9+LjnIYubpaNEXKlw266UxWCS50sDqopolv85+WnYtPIxjkvhVowEhOZrLd6qfhGK1LRr9iP
	rx80R2T6HMq0UI2bQ2eiagqcrFxWZ2IkjPJLQGdEpuyQQVzDkQ7+G26inQFtU6LJ70M0YULX/E6
	w2kwrJoyaKQMMFIoaCPvEgPyBVZfx8Ybc9Cr6d240+w=
X-Google-Smtp-Source: AGHT+IFz9RsgqY8Wo1mqY9SHCprX+aN93EWUqTG4SpTvycudKLfZGL978tnCqYWy4J8zVy5l7OU93g==
X-Received: by 2002:a5d:6da6:0:b0:39a:e71d:ef3f with SMTP id ffacd0b85a97d-39efba2af49mr12016351f8f.5.1745308121468;
        Tue, 22 Apr 2025 00:48:41 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c8b0ea0sm6427365e9.2.2025.04.22.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:48:41 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:48:39 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the paulmck tree
Message-ID: <aAdJ18rRHdi9y3S9@pathway.suse.cz>
References: <20250422093834.57e9e9d0@canb.auug.org.au>
 <ef907eca-3a04-461a-9c75-404d65dbaf2b@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef907eca-3a04-461a-9c75-404d65dbaf2b@paulmck-laptop>

On Mon 2025-04-21 17:00:57, Paul E. McKenney wrote:
> On Tue, Apr 22, 2025 at 09:38:34AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >   9e13e90127fb ("ratelimit: Reduce ___ratelimit() false-positive rate limiting")
> > 
> > is missing a Signed-off-by from its author.
> 
> Ah, good catch!  I need to chase down that author!
> 
> Petr, you good with this one?

Yes, it looks good. I have just approved it...

Best Regards,
Petr

