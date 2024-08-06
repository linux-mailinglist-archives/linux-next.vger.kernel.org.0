Return-Path: <linux-next+bounces-3238-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E857948865
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 06:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2E50B211E3
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 04:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4838AB663;
	Tue,  6 Aug 2024 04:35:33 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37B3320C;
	Tue,  6 Aug 2024 04:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722918933; cv=none; b=u3FimjBSk02DFlDsjqjYhA/B6VqSMCBZZzF8aKFN+fgAQ7wX4fNU6GScO+ziLOCX1y5P6JPqM93TXRc50mHIAObYTbQtsV8mG0Pb9eqIoxLobMEICr+me8puiW3VKocx6uWylNpfqlMz6w6eBWQKG/5HgoIJmTpe414L23+sSq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722918933; c=relaxed/simple;
	bh=JCJScDxJ3qpay+OAKmELAf9M5ZqgFYX0wdAwue/GEcA=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJyHycuWO7umNW/XJMpdNzkCAQBfuVmlIYY5KUL5zydzAqq7lTpL//DLM9oMSr5nyuqt6Mm6NNrDHGHprMqTQGNzcpF6x/1LGvrl5SBOH7DKiwpEpTv514pschTZvTVzxUSv/mnP8sE0VtuZ51YsqY9Jqa/p3p4H0iTkj5nXULM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ff1cd07f56so1227165ad.2;
        Mon, 05 Aug 2024 21:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722918931; x=1723523731; darn=vger.kernel.org;
        h=84;0;0cto:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRyU2not9hiDPWxYvlx8jQ6bCcdJZ51HXCAvHlN+TFw=;
        b=e4mLoR7bMCE5YwBRJNtAy6OeBRbX2hKaZnPCdEjB/OWw2HBJ1OKzdEDr+zyLZcfkrx
         NnFM+YDE5AuXTgR4giYj7R2jTvo0Jwwdd8kOyjXPTnIOjEArDCIt41Esgt/IJIm6lvmp
         O3+LKbhCcfGd2nNcs7SckXgIAxKM+qvlbwGvfVi2G4JN6aYeLTTRPZu8u/bAzY08l7lL
         P/azZtesCJj8Mc9NxinzyX7zdyzdIqyOPXhdO0odejur7XTjVTPfpwWmcywwzzm9KJNk
         E08u4oluu3VJPYDy2MY8HwkKxVu120ChHCJX/rSk0KzG2Fm0kw1oqE2COJjFJP0ZWQ7V
         Pj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722918931; x=1723523731;
        h=84;0;0cto:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:from:date:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vRyU2not9hiDPWxYvlx8jQ6bCcdJZ51HXCAvHlN+TFw=;
        b=YAEX+OZtLXnUJA6OhM/zpKniXQj2O5RBUDVr8t83qthOEnFQ69W7XAII+vxz15rGIL
         dlVle72Q0iqszgzXdRzRJAn3GdvAdRvf6Y6XeMShXJVreNBxLUaJ+nagOgdH7FjRAJyP
         /1kNfNVyAeubgfdcEBw3HjQEUIWmbZD/VWM+lChxKYJPaaszRuG2Gcbt1snmws9HTQHq
         KyHPnVsNKN8T8Z5LJ/qVn6lpcjE+pp2a+YhMuWoXbWPyCRQO0wF0o21xRqN5FBql0nK/
         LbTaV6q+yJpySOTT1a7NLx+qsMe1HHD5oFXhL8xAJmbWRs6s3BW8ruI6keLDwhK0C7/i
         HCLw==
X-Forwarded-Encrypted: i=1; AJvYcCWRE7RY1BX5+FGsL0LEaec6tjDHc1zVTRwKtV6P1ieflxv5H57gMZB83k75RIZb8VoA/lk0mEGAiqcYlLw3vBHlfRX6rYvxKbIOIw==
X-Gm-Message-State: AOJu0Yx3K30RtMb1mFyeO/heLNQFqWEjMBzNNkyTVOCSnFXyFUsXbUul
	OFQtYVUrzqsK6ZtVJj46BBUFABhrZOFfv/EdPP6W2IdY9jaSikglyozJYw==
X-Google-Smtp-Source: AGHT+IHcUyUTXLJVa4/ZcG/d+S8f6gfgZAmnltLHmUMr59wcqjDF/6QexAIT2qxaf/15mAVq+hS2xw==
X-Received: by 2002:a17:903:2345:b0:1fd:6d4c:24e9 with SMTP id d9443c01a7336-1ff5722df70mr185928805ad.10.1722918930749;
        Mon, 05 Aug 2024 21:35:30 -0700 (PDT)
Received: from localhost (dhcp-72-235-129-167.hawaiiantel.net. [72.235.129.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f29fb0sm77425785ad.22.2024.08.05.21.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 21:35:30 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 5 Aug 2024 18:35:29 -1000
From: Tejun Heo <tj@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the cgroup tree
Message-ID: <ZrGoEcv5jkzwd3GY@slm.duckdns.org>
References: <20240806133935.0dc8cdaf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806133935.0dc8cdaf@canb.auug.org.au>
84;0;0cTo: Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, Aug 06, 2024 at 01:39:35PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the workqueues tree as a different commit
> (but the same patch):
> 
>   959ab6350add ("cgroup/cpuset: fix panic caused by partcmd_update")

Sorry about that. The wq tree was a bit messed up. Fixed.

Thanks.

-- 
tejun

