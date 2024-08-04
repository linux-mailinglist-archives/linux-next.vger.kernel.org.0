Return-Path: <linux-next+bounces-3223-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BDE94700E
	for <lists+linux-next@lfdr.de>; Sun,  4 Aug 2024 19:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 792E51F212A0
	for <lists+linux-next@lfdr.de>; Sun,  4 Aug 2024 17:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591B6132464;
	Sun,  4 Aug 2024 17:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efisQu8l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E6279C2;
	Sun,  4 Aug 2024 17:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722793361; cv=none; b=C2icMK3OBoTPP+Mc30aeL1O2CORSVguHsP7HSjKwIcGYDcDMAcmQGXTkpoQ3uiBon969f62Mr6TbWpQmp8RGxfhKA2b7g/ZOkeN1rOMoarlWlsyUA0SRu/urL5NE7SF8l6ZXpEpWGy/1o0fRvt2rMXGrzbw5btmazGDHqj6T9N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722793361; c=relaxed/simple;
	bh=u3ZQkBeEbabeOCeHQMdyTthzIZzxcyKoMrR7bw7aH2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTsB9IkEZe+objPogCjW2Qm07neI4l4LNtNw9viSDxr7yUhCXIVgJedabf4+dMNUrJno+Bd0T0yDj/LNJ6ibMXwMflwlW/XCw6sK9KfW+nNaghJExkEl/Dr/21tJxmMdC0jwdWzltLdCNv8FqCkF1lRZ5Kjngl9Y1MhOIo1DH4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efisQu8l; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d19d768c2so7294981b3a.3;
        Sun, 04 Aug 2024 10:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722793359; x=1723398159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oul6kxbQPMb4wBRXg41hasCIW/5ceUPZ7/QVb9nBL7w=;
        b=efisQu8lHMKEeJGCLSfRaotmKA8xhHAdGS4tQl4YGCvnd+0PEHwH2xBvP3ZdrYjgDZ
         aTReb2g3K3vVw+Elh86v35etOSZD4vr0vp7/Clyj14tzscG+KswoiJSAUpqAGYryZ8yb
         sJCtMkugIXUUgm/IptlQkNyYn5gdtsCUiUdR375poC9oVavf5zQIekE4Ac++8PPsy6yI
         sTV/W6yED/XaWOXFWegxizwxM7Xnjh3Ep4/W5QW//DknIcxVjV8QWu4IjX0YT5f5EVDr
         0H1A+WGAy8uW2D4VdWefXuuXpTwhuFgseoZCuJbrSI2fOX9WUqU0DeNh1M9f0IyE4Q80
         7SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722793359; x=1723398159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oul6kxbQPMb4wBRXg41hasCIW/5ceUPZ7/QVb9nBL7w=;
        b=OWSzsRQVIcQ9W+oH87xlqh1rzT3n2D8mrH2XuU86VbpeuvkYnuy5KfQNuh8PdgLaWp
         pRjc97wUkU8k4qPpX5Eu1JxR1QfS9WQkxqP0Lv/WHjWDdC5bhO6y0UnP91ulAJWdgNpW
         j1dVJDGsE+GuRzBfxFQMjSAJyeqccKbYbW1gSNnyBZKWr+y2nXxCxQ8+Trrl1+WMc8cj
         UJrjusB3yxRGpqYgrFRxdJgWnkk9rGORaC1Qvm0Qham9scTdwLZmn3hFKPoXgaodxPEH
         mfozt1pTcmC96pHN4hWpboA9lUAQ6fDCjBHYASE2ncvJLSFbKn7BzTyYc5S6Tb+Xu7QY
         Ktgg==
X-Forwarded-Encrypted: i=1; AJvYcCU/JWpWLyexMVMyY5iVABdUOONtshnZ26HoW4opUHIEoKGnTHByuJw/q404RtEhu4AQ1353RbNzAyNSOps67LvSKvlKOC9aRuGYP1+qh3YkYj/ML+eiqp7vBzynmex2mrIOme8gw7hLHQ==
X-Gm-Message-State: AOJu0YyCubB5AkttWsiY3ToyKNf80C9WzeSWUsg118I7U/aHRKdOPB14
	sUjpPnsHn1Zy+cMmETMEggC1R3JXnWrhFo347qBthhOu7Nc84r4T
X-Google-Smtp-Source: AGHT+IFfnwQp6yPEHWP193TDoqz+z0Yj04bJiz+jQ4Z2nOtAtMZoKu4A0G/9bX2wS8buvs7qFxTxmg==
X-Received: by 2002:a05:6a00:c82:b0:70d:21b4:46ca with SMTP id d2e1a72fcca58-7106cfa5f9cmr8809271b3a.11.1722793358830;
        Sun, 04 Aug 2024 10:42:38 -0700 (PDT)
Received: from localhost (dhcp-72-235-129-167.hawaiiantel.net. [72.235.129.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ece493esm4170600b3a.110.2024.08.04.10.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:42:38 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Sun, 4 Aug 2024 07:42:36 -1000
From: Tejun Heo <tj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tianchen Ding <dtcccc@linux.alibaba.com>
Subject: Re: linux-next: manual merge of the sched-ext tree with the tip tree
Message-ID: <Zq-9jLqKelS1Y6bT@slm.duckdns.org>
References: <20240801124541.3deb64b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801124541.3deb64b8@canb.auug.org.au>

Hello, Stephen.

On Thu, Aug 01, 2024 at 12:45:41PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the sched-ext tree got a conflict in:
> 
>   kernel/sched/fair.c
> 
> between commit:
> 
>   faa42d29419d ("sched/fair: Make SCHED_IDLE entity be preempted in strict hierarchy")
> 
> from the tip tree and commit:
> 
>   2c8d046d5d51 ("sched: Add normal_policy()")
> 
> from the sched-ext tree.
> 
> I fixed it up (I used the former version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This merge is a bit tricky because the former moves the test that the latter
converts and the new location doesn't show up as conflict. I merged
tip/sched/core into sched_ext/for-6.12 and resolved all the conflicts.

Thanks.

-- 
tejun

