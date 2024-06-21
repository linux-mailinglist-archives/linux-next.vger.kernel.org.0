Return-Path: <linux-next+bounces-2634-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8E9912DA6
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 21:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E98C1F218B3
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 19:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAD54644C;
	Fri, 21 Jun 2024 19:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHHiF6Hx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4210D1607A1
	for <linux-next@vger.kernel.org>; Fri, 21 Jun 2024 19:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718996576; cv=none; b=LRHItPdODk3PC97v50ouZafaql9ch2t1CBBKhhNkMgXhPZG2hUanrjmCsthmQWxAsyzODXzktOSZphwdVnzEPfmC1tQS6/b+/h1dQEsxw3d4hj0OILiZXLIfCrs5JQJad3Q3FQW0nveDYyFaOUFe0XVrq8yOY0ggcC6hICBTqHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718996576; c=relaxed/simple;
	bh=/M7imDllLETBndovreGXw3fpg7txZCyM1dpso7VC7fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNDRn/IC/JbiUtUUlho7y6qi1zllvG4rJ7+c5mECNUsd1mFROgP3pNXxeil1n8nf7ILC5poYsfs1yo2jsnnTYzqggo3cp4+u1i+Sxsz8HQCh07QZmtEwWNvyA+lkv6Gu2GDSvcSx+H/FSzPdn7BgYfoBF3FUaNP9b0Bqu/01V7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHHiF6Hx; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c31144881eso1915254a91.1
        for <linux-next@vger.kernel.org>; Fri, 21 Jun 2024 12:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718996574; x=1719601374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNtP2BXvEvUmHihzoTrCz+111C5RQKUvRKkGb1ccNI4=;
        b=mHHiF6HxiT4eCqPmojx6sja1o+GDZrGTds8DBgVG2Se7+WqnsqY/6PrdUH40U6W72R
         v7eqeqt2dRei4foNpg7cabrS0bWu5ScgN5cW1DhgS2hkwQex3EJoL5dkTnV6FIIMQY/g
         eRzlDNEgBRMa4tgIUhbkiwtDYnz/7R1vx7C/j1b6FZZ+8EvLIy5a9eC9o/zQQglykTRy
         DPU3otWH6rkY6vGBdHIE3yODi/MyX4MlCi/N0mwES18yXLH5v26TErJlsEp5ZzJZCS46
         X7fbDKynQvz+fd9EGmNYzycMoHd+1PMtqTEUeXZkeFSEHzmYLb8Hf+g15PO3f7rv8V44
         5MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718996574; x=1719601374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNtP2BXvEvUmHihzoTrCz+111C5RQKUvRKkGb1ccNI4=;
        b=MFaiofRyTIasjQ5L6JFXISpKh/MhC6e0WJvBW4yCIjG0B9smhJ0jRpEWnZDdwKtDdB
         OVuQjV5WE3ykobOI/8C1z8GXwPU8U+ToqhrnhD/7awjcsLsrkDoXbgZf5IgKLe/gIttC
         eKAAwViVEXzLE5RwP+E5PV+fsVllLirMjpPHCZi6rz7Pr0J06ewKkp/eDesMZkIRE6T0
         HmAxW94IhEocMzlbB9PAdjH1B/x2y6V5q8/178XSGKOi5KPlftVdNML791mxUPQeqchI
         RT/bPSGET4lhWSzc2dVTWaTOLGZh+B+uTNKDSW2p8ZFWQDR4T3iWZ0vX2ZC9pKO8ppk4
         IXuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEfHLqOPRDFXtYx3rNEBkrmv9lyTPHVTG8zJ2sE/uDg4QUEuINdcNDnaseioCfcKDEs+u4a059+q1fbOelq+jK3dBlQ9Jg92eJig==
X-Gm-Message-State: AOJu0YxKaB9o1Q2Cj3q6p0piFeR0gjHqeOT/Na/jsJZZlUXspycQ2g6f
	Mo6Uqab4kslpXyNYapamYe7sW465johGcBi8uoKpSPJESSTl3Sum
X-Google-Smtp-Source: AGHT+IGCstyCLM+MPMh6QKg5inNyBuNUjBBuI68nJwRLHhU9ZMluyhE4DIOpis5IuIBRlV+467SmiQ==
X-Received: by 2002:a17:90a:e50b:b0:2c7:2103:67bb with SMTP id 98e67ed59e1d1-2c7b5b68c03mr8776331a91.16.1718996574325;
        Fri, 21 Jun 2024 12:02:54 -0700 (PDT)
Received: from localhost (dhcp-141-239-159-203.hawaiiantel.net. [141.239.159.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819a76ccasm1958970a91.13.2024.06.21.12.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 12:02:53 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Fri, 21 Jun 2024 09:02:52 -1000
From: Tejun Heo <tj@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
	David Vernet <dvernet@meta.com>
Subject: Re: Please include the sched_ext:for-next branch in linux-next
Message-ID: <ZnXOXHOa2NwbTc3i@slm.duckdns.org>
References: <ZnH9aHFOl4wufXkQ@slm.duckdns.org>
 <20240621154515.53aff781@canb.auug.org.au>
 <656fdcee-dc51-4286-899d-aec4b88ab3a0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <656fdcee-dc51-4286-899d-aec4b88ab3a0@sirena.org.uk>

Hello,

On Fri, Jun 21, 2024 at 12:09:47PM +0100, Mark Brown wrote:
> On Fri, Jun 21, 2024 at 03:45:15PM +1000, Stephen Rothwell wrote:
> > Hi Mark,
> > 
> > I received the below request from Tejun.  Please add this tree (from
> > the next git repo dir) using
> > 
> > ../tools/add_repo sched-ext korg:tj/sched_ext.git for-next
> > 
> > then add this line to etc/control (just after the workqueues line):
> > 
> > Tejun Heo <tj@kernel.org>	git	sched-ext git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git	for-next	no
> > 
> > Note the TABs between fields ...
> 
> Should be there tday.

Thanks.

-- 
tejun

