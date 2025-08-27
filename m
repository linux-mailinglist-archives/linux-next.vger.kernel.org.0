Return-Path: <linux-next+bounces-8125-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B335B38C6A
	for <lists+linux-next@lfdr.de>; Thu, 28 Aug 2025 00:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ED473BBC07
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 22:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5ED30FC16;
	Wed, 27 Aug 2025 22:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DcIAUz2a"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EE8280324
	for <linux-next@vger.kernel.org>; Wed, 27 Aug 2025 22:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756332268; cv=none; b=TK/eJRB6OA9V8WslCyRMdlxD8e/oNpPRvSS2AWb+Bh527JEeLWusfw86rZmr2Akt/Q0fDihT1xmt1xMcvUz1X2AEAKHICmM0OLlLoR2g9P6s1ySQIswe/Bv5Pcic+zmRxn+cDWYAntgpm4lxno0dXzLl5hPyk44x5czLIKYIsGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756332268; c=relaxed/simple;
	bh=QBThy5L9kt0vy3Em05+03Bcjn8m4khcRfvF3Hb3pPIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNfnCSKIv5P5IvSOu9c2cz1vhPzjeM+IBw+fpq3MYRb9qkDjP7mIxsTafbmC5P7CGU37bQTutNwqqhqQz137pDvBVi+zuYEK5WbRdBAxx6hF9ekNUyo5v1DMMi8hEhfUVYUruNllfEcp4GoNUXXe+oxrUJHh3i7G0JkaIMNhX/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DcIAUz2a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756332266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OEFBgFIvCAQPYhXVvclPVAZs38YDchKEl12N56oJND4=;
	b=DcIAUz2afgNYgfcEKyZErW9A55b2wTndPYDq87EOKaPPhJdcD4YcMjrsO5i06UPxoVqdWc
	OLTND5NIv7A2+drQnnFKJ/Xfay4L1DWXXgPvc1Gv0XWM/gtUe4PPb6NFsBU3eu1zy5REw7
	Sn0RKX2PWL+a3TTBQ4t1lc+wuLp+Vps=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-tVF1ESJgPaCScKaaVGM6ng-1; Wed, 27 Aug 2025 18:04:24 -0400
X-MC-Unique: tVF1ESJgPaCScKaaVGM6ng-1
X-Mimecast-MFC-AGG-ID: tVF1ESJgPaCScKaaVGM6ng_1756332264
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45a1b10418aso1272165e9.3
        for <linux-next@vger.kernel.org>; Wed, 27 Aug 2025 15:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756332263; x=1756937063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEFBgFIvCAQPYhXVvclPVAZs38YDchKEl12N56oJND4=;
        b=IIphbUe6U+lqyPoEseRnf3LtX5Irn80BX/Dd4sBmYO4RmBSFGyDqJ+Zrt21OsJbQeR
         I7foyA/s7wP0yMNgAwgRFdajMW5jm6oQtfRMWuGU7MKC1cCigLkNQbT03qhwZpWYDXD1
         dsA3fllchKg9a1Kiwhwk4ebteO5MBy3bX41ztHJAPIhDXdtjybw6oT+FuK6oWrl6/0Ji
         CeGIL/5WX8283DGmDoM85KHKDK81iBh7gX9Hg5POm6QyLJ8Lmr5G9htIzICNoelDDlkJ
         i/HW6z2hy9oNh7qT3yV5MGCNvU1tIk8Q1TKzamPLWaENnsAZe/TkrmY/6B+j7IQTFzVH
         /PLw==
X-Forwarded-Encrypted: i=1; AJvYcCUwk0O2PrpDMWVMCow61xzELi8C1QYNYEybWBVdg+tYmH90QTF5DAyrpp9bsnw4PrefTgXXwUKG+B+I@vger.kernel.org
X-Gm-Message-State: AOJu0YyameXcdwKeIPQUp/bMM+B516dJWBbYrRIu/pxF8hvrsb09Vln8
	mTsw1JqzAWfZOCDgfcbG/bWQb/pVO8Iqng2fu9CPURrHPHIe+rk8EsEwDYlZNzujLebwYCdM9vT
	rmqtHubBtyHl3fKshjQGpWYNZAzPxcBdoieSXR1O0RGisH41NeYib4T/R4NWu9q4=
X-Gm-Gg: ASbGncvc45giG5IZzGt1By03y36WnW3UHtGLIRk+Y+8+H4CXpBMRQEXgjpZQ6JaExn8
	wcK2S1FbeLOGZFZ8hdAq61Q8ni1I4llYgpB6PuP0jbjq1NDj2gKztUVxyod23Lhd8Tlr3gsHXi2
	tx5CLYmFYSJNe/1RFu6IyndrxP4+pOBrgllKxTg1UfHSxHXUWrkyLlQ77N8QCNsZXHfdbrVZxBO
	J8XlKxYGDN9UdM4uS+Q/DBWJjELVYvqcFR9GO6YSo40TMvvLzgPHpVvxfFcJNeIxGEaOhcJoFQk
	aHoC0e4pmIscqzXrsp4yxSaHQIexgDHX
X-Received: by 2002:a05:600c:4a22:b0:45b:7580:6f29 with SMTP id 5b1f17b1804b1-45b75807bd4mr10021035e9.4.1756332263554;
        Wed, 27 Aug 2025 15:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeFHIWe1QwfMq5KEErvPK+Alt0w4twa0nXLb2kOIp6Er1rEDYev8pXW2qpNWVXY0MPTcVG0g==
X-Received: by 2002:a05:600c:4a22:b0:45b:7580:6f29 with SMTP id 5b1f17b1804b1-45b75807bd4mr10020935e9.4.1756332263183;
        Wed, 27 Aug 2025 15:04:23 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1515:7300:62e6:253a:2a96:5e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211b19sm22668380f8f.39.2025.08.27.15.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 15:04:22 -0700 (PDT)
Date: Wed, 27 Aug 2025 18:04:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vhost tree
Message-ID: <20250827152222-mutt-send-email-mst@kernel.org>
References: <20250827124654.78881028@canb.auug.org.au>
 <20250827062218-mutt-send-email-mst@kernel.org>
 <aK8_uOoLxLOniEbR@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aK8_uOoLxLOniEbR@google.com>

On Wed, Aug 27, 2025 at 10:26:16AM -0700, Namhyung Kim wrote:
> Hello,
> 
> On Wed, Aug 27, 2025 at 06:23:52AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Aug 27, 2025 at 12:46:54PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > The following commit is also in the perf-current tree as a different
> > > commit (but the same patch):
> > > 
> > >   c67e16d30dca ("tools headers: Sync uapi/linux/vhost.h with the kernel source"
> > > )
> > > 
> > > This is commit
> > > 
> > >   f79a62f4b3c7 ("tools headers: Sync uapi/linux/vhost.h with the kernel source")
> > > 
> > > in the perf-current tree.
> > 
> > 
> > Hmm.  I could drop mine I guess, but it only really makes sense after:
> > 
> >     vhost: Fix ioctl # for VHOST_[GS]ET_FORK_FROM_OWNER
> >     
> > 
> > which is not in the perf tree.
> 
> Yep, so I was waiting for you to send PR with the fix.
> It seems you already removed the commit in your tree.
> I'll send a PR for perf tools with this change.
> 
> Thanks,
> Namhyung

It's in my tree but I did not want to send it before we agreed what to
do. I can drop it, sure.

-- 
MST


