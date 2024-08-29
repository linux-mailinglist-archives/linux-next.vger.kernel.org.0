Return-Path: <linux-next+bounces-3504-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0EF96503F
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 21:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 776FC28B2B1
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 19:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA701BD51B;
	Thu, 29 Aug 2024 19:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qXpHSobj"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263FD1BA289
	for <linux-next@vger.kernel.org>; Thu, 29 Aug 2024 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960861; cv=none; b=KwqjqUL1eDEwFipflYsPOtMJmq0EPWpI/pGPqOvRMXsbVpncJObxUvHIMR7FlkhcSa0eg0bmGF8fc/rv9Si0GZrx9rJVqicW4YaoEMmBvq4St5ULuqTdtEHlCPRxXdtLCYnypNghmBLFkM+bTChw1l5J6hkkoB+qBciH+kWQXfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960861; c=relaxed/simple;
	bh=ndgQPlr6pXsgW11j1egF9EDZRMetcs88ZtDWRqtwbek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBbrcP+nIZ9GznVwCmNi0DgH2SP1iNdXaGZhdl2zuOmdmfbHdvdVjZRxdANpXuRQpfxFkD693LqX6vihBOe04OgKqQXfiSEYtrlP/wCNhtz7unb8m3D38oSYCGkrBNS+nwgT0T71wSuuaM66zo6kl29ZDfoXY+vHxt+rJynsUyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qXpHSobj; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jTjFvzn4Ho0scLgC2Khpq7+5GNekXS/YOin+x/d9cp8=; b=qXpHSobjOpr7xS8xCe1OqBoWeP
	ggWj+rHAIACfILSL4O28O/mW3a3Z9iWy4IELE63mJlJ/BUl67YdvDJZTfjGFMqAxZMaxao7552m2/
	/0po5BF13hEM0BKyTsZkpdkfI0ZCDhogMrlac4GwxDe+NGz5qFVFOleA45HJxSVuxf1p6zpmq48Cs
	LIKdBXENRjfHTHN41FafNvlgAsbiMtetLJ1oyVKtAaLw+JOSETLvtftAApUTRhzCMO4JK3avArBnH
	4NafejSWsU6mNcoR6ubsd8nQHbGMCrFmf4r6D6F2zPBzKOFTAABmY/C+q+OWi19E5EjBrhDl6TjBA
	zvaB/q4g==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sjl7C-00000002SVU-12ud;
	Thu, 29 Aug 2024 19:47:30 +0000
Date: Thu, 29 Aug 2024 20:47:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: "Aithal, Srikanth" <sraithal@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm <linux-mm@kvack.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next20240827 onwards: KVM guest crash BUG: Bad page state
 in process ksmd
Message-ID: <ZtDQUiv6cFBkIAA3@casper.infradead.org>
References: <83847d6b-9533-4a5e-a2e1-763021a32b9b@amd.com>
 <a444ffd2-ffb8-4825-bb24-426bee819331@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a444ffd2-ffb8-4825-bb24-426bee819331@redhat.com>

On Thu, Aug 29, 2024 at 04:36:21PM +0200, David Hildenbrand wrote:
> On 29.08.24 13:28, Aithal, Srikanth wrote:
> > Hello,
> > 
> > Starting linux-next20240827 build, running QEMU KVM instance with option
> > to freeze the CPU at the very beginning and then continue results in
> > below guest crash. Disabling CONFIG_KSM will make this issue go away.
> > Same issue exists with todays linux-next as well.
> > 
> > /SecCoreStartupWithStack(0xFFFCC000, 0x820000)
> > error: kvm run failed Bad address
> > RAX=0000000000232000 RBX=00000000fffdb101 RCX=000000000081fab0
> > RDX=00000000fffd7b03
> > RSI=0000000000807000 RDI=00000000fffd262b RBP=000000000081fc00
> > RSP=000000000081faa0
> > R8 =00000000fffd7af7 R9 =0000000000000071 R10=0000000000400000
> > R11=0000000000000000
> > R12=00000000fffcc094 R13=00000000fffcc000 R14=00000000ffdce000
> > R15=0000000000000600
> > RIP=00000000fffd1cb5 RFL=00000087 [--S--PC] CPL=0 II=0 A20=1 SMM=0 HLT=0
> > ES =0018 0000000000000000 ffffffff 00c09300 DPL=0 DS   [-WA]
> > CS =0038 0000000000000000 ffffffff 00a09b00 DPL=0 CS64 [-RA]
> > SS =0018 0000000000000000 ffffffff 00c09300 DPL=0 DS   [-WA]
> > DS =0018 0000000000000000 ffffffff 00c09300 DPL=0 DS   [-WA]
> > FS =0018 0000000000000000 ffffffff 00c09300 DPL=0 DS   [-WA]
> > GS =0018 0000000000000000 ffffffff 00c09300 DPL=0 DS   [-WA]
> > LDT=0000 0000000000000000 0000ffff 00008200 DPL=0 LDT
> > TR =0000 0000000000000000 0000ffff 00008b00 DPL=0 TSS64-busy
> > GDT=     00000000fffffed0 0000003f
> > IDT=     000000000081fd70 0000021f
> > CR0=80000033 CR2=0000000000000000 CR3=0000000000800000 CR4=00000660
> > DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000
> > DR3=0000000000000000
> > DR6=00000000ffff0ff0 DR7=0000000000000400
> > EFER=0000000000000500
> > Code=05 00 10 00 00 49 81 ee 00 10 00 00 48 3d 00 00 00 02 77 12 <41> 81
> > 7e 28 5f 46 56 48 75 e1 49 3b 46 20 73 05 eb d9 4d 89 ee 48 8d 8d 10 ff
> > ff ff ba 02
> > /
> > 
> > _Host dmesg throws:_
> > 
> > /[  232.158038] BUG: Bad page state in process ksmd pfn:404740a
> > [  232.164393] page: refcount:0 mapcount:1 mapping:0000000000000000
> > index:0x7f8687c0a pfn:0x404740a
> > [  232.164401] flags: 0x17ffffc0020819(locked|uptodate|dirty|owner_2|swapbacked|node=0|zone=2|lastcpupid=0x1fffff)
> > [  232.164412] raw: 0017ffffc0020819 dead000000000100 dead000000000122
> > 0000000000000000
> > [  232.164417] raw: 00000007f8687c0a 0000000000000000 0000000000000000
> > 0000000000000000
> > [  232.164420] page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
> 
> Might be related to Willy's page flag rework. Not 100% sure, though, what's
> happening here.
> 
> Is there a way to revert the recent changes from Willy to
> include/linux/page-flags.h and see if the problem goes away?

Looks like the same signature as
https://lore.kernel.org/linux-mm/yt9dttf3r49e.fsf@linux.ibm.com/


