Return-Path: <linux-next+bounces-4587-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 265FA9B9901
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 20:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 476A61C21510
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 19:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1671D1753;
	Fri,  1 Nov 2024 19:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQsuZSTx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0021D1F60;
	Fri,  1 Nov 2024 19:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730490707; cv=none; b=sNFdPRWgqFEblutSjZNbvntOPNE/WJgAhb+md9LFTSneVTxpI9ZlwrpaWJvDaiZPxTpZHnd64BZFDj9RUD8VvQ0KVUX7kI1agCMLGj3EBaLiK/25CWdFWzhndwoq6NsbsvgiLmm4KAj6aK1nsb6ZoFznIepuYyurp6AmqYjFgRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730490707; c=relaxed/simple;
	bh=NfdcIPTFkrq1CJZ3O2pc+yXXB1AVvXwj0nKZRMjuS+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdAi38LaOR++iuHzE6LneKBdyuyvG+elSNWSPx8A0jXgAdpy4bI9iYZpUkx1fCmu9TMDMTwWBXnC7fVNIZS8yfXLC3J47aXTRu46LopTkVEPmjSeFY8mFInQROG+xd3rZZu+f/t+JVbUrIZAn6N8lW/HQ50vF6/g6RK1Kn4WuRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQsuZSTx; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b14f3927ddso169473885a.3;
        Fri, 01 Nov 2024 12:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730490704; x=1731095504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Zt5Oyq2ZbDc+xfDrPzoymFKTcNzDTK9mifrrmXHggY=;
        b=bQsuZSTxZ9SizGo9CA/CW0ONTnZM4d1cCW0ESvtcIjkVaxkqO0Y6pMyD5uygTK+2bt
         f8lJ6TAB7KVJoLnIX/SAoq7TevrH2T4+bQH15oMcy4LLIt0RGMwwh8Au7KvWL4HTO1EM
         PIPutjYwkTznIFz6QlPZYl3la5s6z5f/WmVLCqyxkI88c/q8rSa/Jb+Wpa4IuE9wFJ3G
         Z5qNL/Z6Gq8Fh2nStMOmWX+9ph+fsvaxhyW391Jv3CwPbRxojAlk/aCiAOumxvipjy4n
         fPzOFebzH+yM/sqsS+rhnvcGRKJ6M5MNXzdrwXkaJgjynChX1ud+25fs38KXZAEHld77
         b0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730490704; x=1731095504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Zt5Oyq2ZbDc+xfDrPzoymFKTcNzDTK9mifrrmXHggY=;
        b=XMnNVUCIYImi35iHlKuItdXRwGcFqoxapAiUH66NAdZGXd1MfY+7knxExTCViEt/5s
         ESIbwdMgV3UVQLGrxgIN8Ue1gPHDG8VFwU+3dQdSxbJBcSG3wWGiKbRKkYNqvxUHInev
         ZFaFcQxbPOJfYrvhLvXAAJd38vN8LilK+tW7CAM5H3btvuQzl2Pc9hzQjE83WbCk8KmB
         MBkX409Cxa03akucCWdSwCny51i0JXlWl84zvSTGYqHXCkGe1dTgCnOEguD8CyY65n67
         odqLKE2KsjVGrB9YetmR1oESg5jM9m/rKpSlSZso5mcBZ4KGM/+Ji0E4B9nCFyqQV+H0
         jDzg==
X-Forwarded-Encrypted: i=1; AJvYcCVu2q4zaz+La5fudz11/OBEFkz+WLbIF3iRomwh5JpOAtc1jyFvZC6JYUm3AhzD6Ql+7TUu6KLmztXcROI=@vger.kernel.org, AJvYcCW4xXGDV+gzqRNfwFhjeVP9qhfEWfs+vEgeL24nQ8i7gNBFIHJPmL3FOuRlhIg94UHxXssl9nikNCmuSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQFwV8mbkpVwJuEjGT1OQsVRLzkY9E2qiKOowlEhOEvb63GE4
	hQG+2Ec1nKB/Yf/oPLPQvueNbMPBgD870LD7ZS7EJHQjuMjIOozj
X-Google-Smtp-Source: AGHT+IGLRucb60qWSoDzC20ZGsm0aymAio3/wRy2855/uIReTW6N0UKUogGsYjz5TRM/PQshs5hkKQ==
X-Received: by 2002:a05:620a:2410:b0:7ac:b220:309a with SMTP id af79cd13be357-7b193eea86cmr3366675785a.15.1730490704526;
        Fri, 01 Nov 2024 12:51:44 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a6fedcsm199163285a.78.2024.11.01.12.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 12:51:44 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 981A91200043;
	Fri,  1 Nov 2024 15:51:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 01 Nov 2024 15:51:43 -0400
X-ME-Sender: <xms:TzElZ10j-eXrd7GNpv30l4_b_AVMitAXoOkCDnFULD8gWgi_RIgsEw>
    <xme:TzElZ8G4i0hnOQjyccOf5Asbt-kOIQGYAHZJOnM2Orcm-1A_nAUbIFE12O4nUq4Uz
    FPmHkfdkBWQqTJlLA>
X-ME-Received: <xmr:TzElZ15oxxK0Zrjcg731hlviLBQa4qPFHPFtrGMBIOLtBsY33E4wagy65QmUXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekledguddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepsghighgvrghshieslhhinhhuthhrohhnihigrdguvgdprhgtphht
    thhopehvsggrsghkrgesshhushgvrdgtiidprhgtphhtthhopegvlhhvvghrsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehkrghsrghnqdguvghvsehgohhoghhlvghgrhhouhhp
    shdrtghomhdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtph
    htthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruh
X-ME-Proxy: <xmx:TzElZy1QNyYU7a9rf9ekVospA4HpyM0JWbGzyFE7i6FPizV0ba1zeg>
    <xmx:TzElZ4FVVSPIiUo8miotxDfc1PRWwqUZfddrAhFzE7ra88UEcdhbzQ>
    <xmx:TzElZz_q-ed8t7TEugZbWFUoVIL_uLcRd3GI0Gxe6JlFo4tm5eVBaQ>
    <xmx:TzElZ1nojlQs2hENdw7GcQNjwE1Z4ZKj39ynW3uMy_8MwRGEgkOz5Q>
    <xmx:TzElZ8GwVc57024kIQWEePxJr6WDGBYrLUNkFqB8ed51-kRjzEFBBP57>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 15:51:43 -0400 (EDT)
Date: Fri, 1 Nov 2024 12:50:30 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Marco Elver <elver@google.com>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	sfr@canb.auug.org.au, longman@redhat.com, cl@linux.com,
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
	akpm@linux-foundation.org
Subject: Re: [BUG] -next lockdep invalid wait context
Message-ID: <ZyUxBr5Umbc9odcH@boqun-archlinux>
References: <41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop>
 <e06d69c9-f067-45c6-b604-fd340c3bd612@suse.cz>
 <ZyK0YPgtWExT4deh@elver.google.com>
 <66a745bb-d381-471c-aeee-3800a504f87d@paulmck-laptop>
 <20241031072136.JxDEfP5V@linutronix.de>
 <cca52eaa-28c2-4ed5-9870-b2531ec8b2bc@suse.cz>
 <20241031075509.hCS9Amov@linutronix.de>
 <186804c5-0ebd-4d38-b9ad-bfb74e39b353@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <186804c5-0ebd-4d38-b9ad-bfb74e39b353@paulmck-laptop>

On Thu, Oct 31, 2024 at 10:50:29AM -0700, Paul E. McKenney wrote:
> On Thu, Oct 31, 2024 at 08:55:09AM +0100, Sebastian Andrzej Siewior wrote:
> > On 2024-10-31 08:35:45 [+0100], Vlastimil Babka wrote:
> > > On 10/31/24 08:21, Sebastian Andrzej Siewior wrote:
> > > > On 2024-10-30 16:10:58 [-0700], Paul E. McKenney wrote:
> > > >> 
> > > >> So I need to avoid calling kfree() within an smp_call_function() handler?
> > > > 
> > > > Yes. No kmalloc()/ kfree() in IRQ context.
> > > 
> > > However, isn't this the case that the rule is actually about hardirq context
> > > on RT, and most of these operations that are in IRQ context on !RT become
> > > the threaded interrupt context on RT, so they are actually fine? Or is smp
> > > call callback a hardirq context on RT and thus it really can't do those
> > > operations?
> > 
> > interrupt handlers as of request_irq() are forced-threaded on RT so you
> > can do kmalloc()/ kfree() there. smp_call_function.*() on the other hand
> > are not threaded and invoked directly within the IRQ context.
> 
> OK, thank you all for the explanation!  I will fix using Boqun's
> suggestion of irq work, but avoiding the issue Boqun raises by invoking

I've tried fixing this with irq work, however, unlike normal
work_struct, irq_work will still touch the work item header after the
work function is executed (see irq_work_single()). So it needs more work
to build an "one-off free" functionality on it.

I think we can just use normal workqueue, because queue_work() uses
local_irq_save() + raw_spin_lock(), so it's irq-safe even for
non-threaded interrupts.

Sending a patch soon.

Regards,
Boqun

> the irq-work handler from the smp_call_function() handler.
> 
> It will be a few days before I get to this, so if there is a better way,
> please do not keep it a secret!
> 
> 							Thanx, Paul

